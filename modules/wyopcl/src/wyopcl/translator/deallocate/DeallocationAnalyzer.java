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
	 * Returns the ownership set
	 * @param function
	 * @return
	 */
	private List<Integer> getOwnerships(FunctionOrMethod function){
		List<Integer> ownership = this.ownerships.get(function).getOwnership();
		
		if(config.isVerbose()){
			System.out.println("Ownership = " +
			ownership.stream()
			.map(i -> i.toString())
			.collect(Collectors.joining(", ")));
		}
		
		return ownership;
	}
	
	private List<String> freeAllMemory(String indent, FunctionOrMethod function, CodeStores stores){
		List<String> statements = new ArrayList<String>();
		// Get a list of ownership variables.
		getOwnerships(function).stream()
		.forEach(register ->{
			// Get variable name and type to generate 'deallocated' code.
			Type var_type = stores.getRawType(register, function);
			String var = stores.getVar(register, function);
			statements.add(indent + CodeGeneratorHelper.addDeallocatedCode(var, var_type, stores));
		});

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
		}else if(code instanceof Codes.Return){
			Codes.Return r = (Codes.Return)code;
			if(r.operand>=0){
				// Transfer out the return value's ownership
				this.ownerships.get(function).transferOwnership(r.operand);
			}
			statements.addAll(freeAllMemory(indent, function, stores));
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
	 * Return ownership to a function. If deallocation is enabled, then pass the ownership to a function. 
	 * The ownership value are based on based on the following rules, e.g. a function call 'a=f(b)', 
	 * 
	 * <table>
	 * <thead>
	 * <tr><th colspan="2"> f mutates b?</th><th>F</th><th>F</th><th>T</th><th>T</th></tr>
	 * <tr><th colspan="2"> f returns b?</th><th>F</th><th>T</th><th>T</th><th>F</th></tr>
	 * </thead>
	 * <tbody>
	 * <tr><td rowspan="2"> b is live?</td><td rowspan="2">T</td><td>No copy </td><td>No copy </td><td>Copy</td><td>Copy</td></tr>
	 * <tr><td>b_own=T</td><td>b_own=F</td><td>b_own=T</td><td>b_own=T</td><td></td></tr>
	 * <tr><td rowspan="2"> b is live?</td><td rowspan="2">F</td><td>No copy </td><td>No copy </td><td>No copy</td><td>No copy</td></tr>
	 * <tr><td>b_own=T</td><td>b_own=F</td><td>b_own=F</td><td>b_own=F</td><td></td></tr>
	 * </tbody>
	 * </table>
	 * @param type
	 * @param copyAnalyzer
	 * @return 
	 */
	public Optional<Boolean> computeOwnershipFunctionCallParameter(int register, Codes.Invoke code, FunctionOrMethod function, CodeStores stores, Optional<CopyEliminationAnalyzer> copyAnalyzer){
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
		Optional<Boolean> ownership;
		if(!isMutated){
			if(!isReturned){				
				ownership = Optional.of(true);
			}else{
				ownership = Optional.of(false);
			}
		}else{
			if(isReturned){
				// 'b' is alive
				if(isLive){
					ownership = Optional.of(true);
				}else{
					ownership = Optional.of(false);
				}
			}else{
				if(isLive){
					ownership = Optional.of(true);
				}else{
					ownership = Optional.of(false);
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
