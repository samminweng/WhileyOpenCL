package wyopcl.translator.deallocate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import wybs.lang.Builder;
import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.Analyzer;
import wyopcl.translator.copy.CopyEliminationAnalyzer;
import wyopcl.translator.generator.CodeGeneratorHelper;
import wyopcl.translator.generator.CodeStores;


/**
 * 
 * @author Min-Hsien Weng
 *
 */
public class DeallocationAnalyzer extends Analyzer {
	private HashMap<FunctionOrMethod, OwnershipVariables> ownerships;
	public DeallocationAnalyzer(Configuration config){
		super(config);
		this.ownerships = new HashMap<FunctionOrMethod, OwnershipVariables>();
	}
	
	/**
	 * Get a list of ownership variables and generate the code to free all of them
	 * Note that the deallocation of function input parameters are skipped by default.
	 * Thus, the deallocation releases all the local variables, excluding input parameters. 
	 *
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 *
	 */
	public List<String> freeAllMemory(Codes.Return code, FunctionOrMethod function, CodeStores stores){
		List<String> statements = new ArrayList<String>();
		
		// Get all registers
		List<Integer> registers = stores.getAllVars(function);
			
		// Skip the return values
		int ret = -1;
		if(code.operands().length >0){
			ret = code.operand(0);
		}
		
		String indent = stores.getIndent(function);
		// Skip the deallocation of function parameters.
		for(int r : registers){
			// Skip the deallocation for return value.
			if(r != ret){
				Type var_type = stores.getRawType(r, function);
				if(var_type != null){
					String var = stores.getVar(r, function);
					statements.add(indent + CodeGeneratorHelper.addDeallocatedCode(var, var_type, stores));
				}
			}
		}

		return statements;
		
	}
	
	
	/**
	 * Given a code, compute the ownerships and return the generated C code. 
	 * 
	 * Note the lhs variable in an assignment is not always added with ownership.
	 * 
	 * If the lhs variable points to an array element, then its ownership is transferred out. 
	 * Because the array variable owns the ownership, other variables that point to the array 
	 * lost the ownership. For example, 
	 * <pre><code>
	 * 		a = b[i]; // Access the array element 
	 * 		a_has_ownership = false; // Transfer lhs ownership 
	 * 
	 * 		c = a;
	 * 		a_has_ownership = false;
	 * 		c_has_ownership = false; // Transfer lhs ownership
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> computeOwnership(String indent, boolean isCopyEliminated, Code code, FunctionOrMethod function, CodeStores stores){
		List<String> statements = new ArrayList<String>();
		if(code instanceof Codes.Assign){			
			Codes.Assign assign = (Codes.Assign)code;
			int lhs = assign.target(0);
			int rhs = assign.operand(0);
			
			// Check rhs register is an array variable.
			if(stores.isArrayVar(assign.operand(0), function)){
				// Adds lhs register to the list of array variable
				stores.addArrayVar(lhs, function);
				// Transfer lhs ownership due to non-transferable array ownership 
				statements.add(indent + transferOwnership(lhs, function, stores));
			}else{
				// Add lhs to ownership set
				statements.add(indent + addOwnership(lhs, function, stores));
			}
			
			if(isCopyEliminated){
				// Transfer out rhs ownership set
				statements.add(indent + transferOwnership(rhs, function, stores));
			}else{
				// Add rhs to ownership set
				statements.add(indent + addOwnership(rhs, function, stores));
			}
		}else if (code instanceof Codes.IndexOf){
			Codes.IndexOf indexof = (Codes.IndexOf)code;
			int lhs = indexof.target(0);
			// Add lhs register to array variable
			stores.addArrayVar(lhs, function);
			// Transfer lhs ownership due to non-transferable array ownership 
			statements.add(indent + transferOwnership(lhs, function, stores));
			
		}else{
			throw new RuntimeException("Not implemented");
		}
		
		return statements;
	}
	
	
	/**
	 * Adds the register to ownership and generate the code
	 * 
	 * <pre><code>
	 * bool a_has_ownership = true;
	 * </code></pre>
	 * @param var
	 * @return
	 */
	public String addOwnership(int register, FunctionOrMethod function, CodeStores stores){
		Type type = stores.getRawType(register, function);
		if(stores.isCompoundType(type)){
			String var = stores.getVar(register, function);
			this.ownerships.get(function).addOwnership(register);
			return "_ADD_OWNERSHIP("+var+");";
		}
		return "";
	}

	/**
	 * Takes out 'register' from 'ownership' set
	 * @param reg
	 * @param function
	 */
	public String transferOwnership(int register, FunctionOrMethod function, CodeStores stores){
		Type type = stores.getRawType(register, function);
		if(stores.isCompoundType(type)){
			String var = stores.getVar(register, function);
			this.ownerships.get(function).transferOwnership(register);
			return "_REMOVE_OWNERSHIP("+var+");";
		}
		return "";
	}

	
	
	
	/**
	 * Return parameter ownership in the caller. If deallocation is enabled, then pass the ownership to a function. 
	 * The ownership value are based on based on the following rules, e.g. a function call 'a = f(b, b_own_f)', 
	 * 
	 * <table>
	 * <thead>
	 * <tr><th colspan="2"> f mutates b?</th><th>F</th><th>F</th><th>T</th><th>T</th></tr>
	 * <tr><th colspan="2"> f returns b?</th><th>F</th><th>T</th><th>T</th><th>F</th></tr>
	 * </thead>
	 * <tbody>
	 * <tr><td rowspan="3"> b is live?</td><td rowspan="3">T</td><td>No copy </td><td>No copy </td><td>Copy</td><td>Copy</td></tr>
	 * <tr><td>b_own=T</td><td>b_own=F</td><td>b_own=T</td><td>b_own=T</td><td></td></tr>
	 * <tr><td>b_own_f=F</td><td>b_own_f=T</td><td>b_own_f=T</td><td>b_own_f=T</td><td></td></tr>
	 * <tr><td rowspan="3"> b is live?</td><td rowspan="3">F</td><td>No copy </td><td>No copy </td><td>No copy</td><td>No copy</td></tr>
	 * <tr><td>b_own=T</td><td>b_own=F</td><td>b_own=F</td><td>b_own=F</td><td></td></tr>
	 * <tr><td>b_own_f=F</td><td>b_own_f=T</td><td>b_own_f=T</td><td>b_own_f=T</td><td></td></tr>
	 * </tbody>
	 * </table>
	 * @param type
	 * @param copyAnalyzer
	 * @return a hashmap that contains caller's ownership and callee's ownership for a parameter. 
	 */
	public Optional<HashMap<String, Boolean>> computeCallParameterOwnership(int register, Codes.Invoke code, FunctionOrMethod function, CodeStores stores, Optional<CopyEliminationAnalyzer> copyAnalyzer){
		Type type = stores.getRawType(register, function);
		if(!stores.isCompoundType(type)){
			return Optional.empty();
		}
		
		boolean isLive = true;
		if(copyAnalyzer.isPresent()){
			isLive = copyAnalyzer.get().isLive(register, code, function);
		}
		
		String var = this.mapToFunctionParameters(register, code);
		FunctionOrMethod f = this.getFunction(code.name.name(), code.type(0));
		boolean isMutated = this.isMutated(var, f);
		boolean isReturned = this.isReturned(var, f);
		
		Optional<HashMap<String, Boolean>> ownership = Optional.of(new HashMap<String, Boolean>());
		if(!isMutated){
			if(!isReturned){
				// Caller ownership
				ownership.get().put("caller", true);
				ownership.get().put("callee", false);
			}else{
				ownership.get().put("caller", false);
				ownership.get().put("callee", true);
			}
		}else{
			if(isReturned){
				// 'b' is alive
				if(isLive){
					ownership.get().put("caller", true);
					ownership.get().put("callee", true);
				}else{
					ownership.get().put("caller", false);
					ownership.get().put("callee", true);
				}
			}else{
				if(isLive){
					ownership.get().put("caller", true);
					ownership.get().put("callee", true);
				}else{
					ownership.get().put("caller", false);
					ownership.get().put("callee", true);
				}
			}
		}
		
		return ownership;
	}

	
	
	
	/**
	 * Print out ownership
	 */
	/*private void printOwnership(FunctionOrMethod function){
		List<Integer> ownership = this.getOwnerships(function);
		// Print out ownership variables (comma-separated string).
		System.out.println("Ownerships = {"+
				ownership.stream()
				.map(o -> this.getActualVarName(o, function))
				.collect(Collectors.joining(", ")) + "}"
				);
		
	}
	*/
	
	@Override
	public void apply(WyilFile module) {
		super.apply(module);
		
		for(FunctionOrMethod function: module.functionOrMethods()){
			if(!this.ownerships.containsKey(function)){
				this.ownerships.put(function, new OwnershipVariables());
			}
		}
		
		// Compute ownership set for each function.
		/*for(FunctionOrMethod function: module.functionOrMethods()){
			// Initialize the 'ownership' set with each of true value.
			this.initializeOwnership(function);
			// Compute 'ownership' set
			for(Code code: function.body().bytecodes()){
				this.iterateCode(code, function);
			}
			if(config.isVerbose()){
				this.printOwnership(function);
			}
		}*/
	}
	
	

}
