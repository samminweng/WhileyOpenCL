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
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> freeAllMemory(Codes.Return code, FunctionOrMethod function, CodeStores stores){
		List<String> statements = new ArrayList<String>();
		
		// Get all registers
		List<Integer> registers = stores.getAllVars(function);
		
		if(code.operand>=0){
			// Transfer out the return value's register
			registers.remove(registers.indexOf(code.operand));
		}
		
		
		String indent = stores.getIndent(function);
		
		for(int register: registers){
			Type var_type = stores.getRawType(register, function);
			if(var_type != null){
				String var = stores.getVar(register, function);
				statements.add(indent + CodeGeneratorHelper.addDeallocatedCode(var, var_type, stores));
			}
		}

		return statements;
		
	}
	
	
	/**
	 * Given a code, compute the ownerships and return the generated C code. 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> computeOwnership(String indent, boolean isCopyEliminated, Code code, FunctionOrMethod function, CodeStores stores){
		List<String> statements = new ArrayList<String>();
		if(code instanceof Codes.Assign){			
			Codes.Assign assign = (Codes.Assign)code;
			// Add lhs to ownership set
			statements.add(indent + addOwnership(assign.target(), function, stores));
			if(isCopyEliminated){
				// Transfer out rhs ownership set
				statements.add(indent + transferOwnership(assign.operand(0), function, stores));
			}else{
				// Add rhs to ownership set
				statements.add(indent + addOwnership(assign.operand(0), function, stores));
			}
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
		FunctionOrMethod f = this.getFunction(code.name.name(), code.type());
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
