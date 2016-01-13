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
				//Transfer out rhs ownership set
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
		}else if(code instanceof Codes.Const){
			Codes.Const c = (Codes.Const)code;
			// Add lhs to ownership set
			statements.add(addOwnership(c.target(), function, stores));
		} else{
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
	private String addOwnership(int register, FunctionOrMethod function, CodeStores stores){
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
	private String transferOwnership(int register, FunctionOrMethod function, CodeStores stores){
		Type type = stores.getRawType(register, function);
		if(stores.isCompoundType(type)){
			String var = stores.getVar(register, function);
			this.ownerships.get(function).transferOwnership(register);
			return "_REMOVE_OWNERSHIP("+var+");";
		}
		return "";
	}

	
	
	
	/**
	 * Iterate each code and compute the ownership set.
	 * @param code
	 * @param function
	 */
	/*private void iterateCode(Code code, FunctionOrMethod function){
		if(code instanceof Codes.FieldLoad){
			this.addOwnership(((Codes.FieldLoad)code).target(), function);
		}else if(code instanceof Codes.Loop){
			((Codes.Loop)code).bytecodes().stream()
			.forEach(c -> iterateCode(c, function));
		}else if(code instanceof Codes.Return){
			// For Return code, transfer out the ownership of return value.
			this.transferOwnership(((Codes.Return)code).operand, function);
		}else if (code instanceof Codes.Assign){
			this.addOwnership(((Codes.Assign)code).target(), function);
		}else if (code instanceof Codes.Assert){
			// Iterate the list of code inside an assertion.
			((Codes.Assert)code).bytecodes().stream()
			.forEach(c -> iterateCode(c, function));
		}else if(code instanceof Codes.NewList){
			// lhs of NewList code is assigned with ownership.
			this.addOwnership(((Codes.NewList)code).target(), function);
		}else if(code instanceof Codes.Invoke){
			this.addOwnership(((Codes.Invoke)code).target(), function);
		}else if (code instanceof Codes.Const){
			this.addOwnership(((Codes.Const)code).target(), function);
		}else if(code instanceof Codes.ListGenerator){
			this.addOwnership(((Codes.ListGenerator)code).target(), function);
		} else{
			// Do nothing
		}
		
	}*/

	/**
	 * Print out ownership
	 */
	private void printOwnership(FunctionOrMethod function){
		List<Integer> ownership = this.getOwnerships(function);
		// Print out ownership variables (comma-separated string).
		System.out.println("Ownerships = {"+
				ownership.stream()
				.map(o -> this.getActualVarName(o, function))
				.collect(Collectors.joining(", ")) + "}"
				);
		
	}
	
	
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
