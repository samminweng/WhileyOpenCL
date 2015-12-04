package wyopcl.translator.deallocate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import wybs.lang.Builder;
import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
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
		// Initialize the ownership variables
		if(this.ownerships.getOrDefault(function, null)== null){
			this.ownerships.put(function,  new OwnershipVariables());
		}

		// Add function input parameters to ownership set.
		//IntStream.range(0, function.type().params().size())
		//.forEach(register -> this.addOwnership(register, function));
	}
	
	
	/**
	 * Returns the ownership set
	 * @param function
	 * @return
	 */
	public List<Integer> getOwnerships(FunctionOrMethod function){
		List<Integer> ownership = this.ownerships.get(function).getOwnership();
		
		if(config.isVerbose()){
			
		}
		
		return ownership;
	}
	
	/**
	 * Check if the type of given register is an array or record (excluding 'print' fields)
	 * 
	 * @param register
	 * @param function
	 * @return
	 */
	private boolean isCompoundType(int register, FunctionOrMethod function){
		VariableDeclarations declarations = function.attribute(VariableDeclarations.class);
		Type type = declarations.get(register).type();
		
		if(type instanceof Type.Array){
			return true;
		}else if(type instanceof Type.Record){
			Type.Record record = (Type.Record)type;
			// Check if the variable contains 'printf' field. 
			long nonePrintFields = record.fields().keySet().stream()
			.filter(f -> !f.contains("print") && !f.contains("println") && !f.contains("print_s") && !f.contains("println_s") )
			.count();
			
			// If NOT a printf field, then add ownership.
			if(nonePrintFields>0){
				return true;
			}
		}
		
		return false;
	}
	
	
	/**
	 * Adds 'reg' to 'ownership' set 
	 * @param reg
	 * @param f
	 */
	private void addOwnership(int register, FunctionOrMethod function){
		// Check if the type is an array
		if(isCompoundType(register, function)){
			this.ownerships.get(function).addOwnership(register);
		}
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
	 * Iterate each code and compute the ownership set.
	 * @param code
	 * @param function
	 */
	private void iterateCode(Code code, FunctionOrMethod function){
		if(code instanceof Codes.Return){
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
		} else{
			// Do nothing
		}
		
	}

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
		
		// Compute ownership set for each function.
		for(FunctionOrMethod function: module.functionOrMethods()){
			// Initialize the 'ownership' set with each of true value.
			this.initializeOwnership(function);
			// Compute 'ownership' set
			for(Code code: function.body().bytecodes()){
				this.iterateCode(code, function);
			}
			if(config.isVerbose()){
				this.printOwnership(function);
			}
		}
	}
	
	

}
