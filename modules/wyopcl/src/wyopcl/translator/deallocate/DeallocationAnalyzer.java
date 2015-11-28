package wyopcl.translator.deallocate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.IntStream;

import wybs.lang.Builder;
import wyil.attributes.VariableDeclarations;
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
		
		// Get variable declaration
		VariableDeclarations var_declarations = function.attribute(VariableDeclarations.class);
		
		IntStream.range(0, var_declarations.size())
		// Get array reference type
		.filter(register -> var_declarations.get(register).type() instanceof Type.Array)
		// Add 'register' to ownership 
		.forEach(register -> addOwnership(register, function));
	}
	
	
	
	public List<String> getOwnerships(FunctionOrMethod function){
		List<String> array_variables = new ArrayList<String>();
		
		this.ownerships.getOrDefault(function, new OwnershipVariables())
		.getOwnership()
		.forEach(register -> array_variables.add(this.getActualVarName(register, function)));
		
		return array_variables;
	}
	
	
	/**
	 * Adds 'reg' to 'ownership' set 
	 * @param reg
	 * @param f
	 */
	public void addOwnership(int reg, FunctionOrMethod function){
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
	public String getOwnershipFlag(String var){
		if(var.startsWith("%")){
			var = var.replace("%", "_");
		}
		
		return var+"_has_ownership";
	}




	@Override
	public void apply(WyilFile module) {
		for(FunctionOrMethod function: module.functionOrMethods()){
			this.initializeOwnership(function);
			
			function.body().bytecodes().stream()
			.filter(c -> c instanceof Codes.Return)
			.forEach(c -> transferOwnership(((Codes.Return)c).operand, function));
			
		}
		
	}
	
	

}
