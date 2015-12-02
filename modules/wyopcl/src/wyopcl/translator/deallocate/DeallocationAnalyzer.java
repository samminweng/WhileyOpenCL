package wyopcl.translator.deallocate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.IntStream;

import wybs.lang.Builder;
import wyil.attributes.VariableDeclarations;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.Analyzer;


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
	 * Initialize the 'ownership' set for a given function
	 * 
	 * @param function
	 */
	private void initializeOwnership(FunctionOrMethod function){
		// Intialize the ownership variables
		if(this.ownerships.getOrDefault(function, null)== null){
			this.ownerships.put(function,  new OwnershipVariables());
		}
		
		// Set the starting register, excluding function input parameters.
		int startingIndex = 0;
		if(!function.name().equals("main")){
			// Skip the input parameters
			startingIndex = function.type().params().size();
		}
		
		// Get variable declaration
		VariableDeclarations var_declarations = function.attribute(VariableDeclarations.class);
		
		for(int register=startingIndex;register<var_declarations.size();register++){
			Type var_type = var_declarations.get(register).type();
			if(var_type instanceof Type.Array){
				addOwnership(register, function);
			}else if(var_type instanceof Type.Record){
				Type.Record r = (Type.Record)var_type;
				// Check if the variable contains 'printf' field. 
				long nonePrintFields = r.fields().keySet().stream()
				.filter(f -> !f.contains("print") && !f.contains("println") && !f.contains("print_s") && !f.contains("println_s") )
				.count();
				
				// If NOT a printf field, then add ownership.
				if(nonePrintFields>0){
					addOwnership(register, function);
				}
			}else{
				// Do nothing
			}
		}
	}
	
	
	/**
	 * Returns the ownership set
	 * @param function
	 * @return
	 */
	public List<Integer> getOwnerships(FunctionOrMethod function){
		return this.ownerships.getOrDefault(function, new OwnershipVariables())
		.getOwnership();
		
	}
	
	
	/**
	 * Adds 'reg' to 'ownership' set 
	 * @param reg
	 * @param f
	 */
	private void addOwnership(int reg, FunctionOrMethod function){
		this.ownerships.get(function).addOwnership(reg);
	}
	/**
	 * Takes out 'reg' from 'ownership' set
	 * @param reg
	 * @param function
	 */
	private void transferOwnership(int reg, FunctionOrMethod function){
		this.ownerships.get(function).transferOwnership(reg);
	}

	/**
	 * Returns the variable name of ownership flag
	 * @param var
	 * @param type
	 * @return
	 */
	/*private String getOwnershipFlag(String var){
		if(var.startsWith("%")){
			var = var.replace("%", "_");
		}
		
		return var+"_has_ownership";
	}*/
	/**
	 * Iterate each code and compute the ownership set.
	 * @param code
	 * @param function
	 */
	private void iterateCode(Code code, FunctionOrMethod function){
		if(code instanceof Codes.Return){
			// For Return code, transfer out the ownership of return value.
			Codes.Return r = (Codes.Return)code;
			this.transferOwnership(r.operand, function);
		}else{
			// Do nothing
		}
		
	}

	
	@Override
	public void apply(WyilFile module) {
		// Compute ownership set for each function.
		for(FunctionOrMethod function: module.functionOrMethods()){
			// Initialize the 'ownership' set with each of true value.
			this.initializeOwnership(function);
			// Compute 'ownership' set
			for(Code code: function.body().bytecodes()){
				this.iterateCode(code, function);
			}
		}
		
		super.apply(module);
	}
	
	

}
