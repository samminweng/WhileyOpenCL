package wyopcl.translator.symbolic.pattern;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import wyil.attributes.VariableDeclarations;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.symbolic.pattern.expression.ExprFactory;
/**
 * The abstract base class to define all the commonly used fields and methods for all its subclass, including the assert_label, data-driven storage and
 * the expression factory
 * @author Min-Hsien Weng
 *
 */
public class Pattern extends Object {
	protected final String prefix = "%";
	protected Configuration config;
	public String pattern_name;//The pattern name
	public boolean isNil;//The flag indicates whether this pattern is matched with any given pattern (True: not matched False: Matched).

	public ExprFactory factory;
	public List<Type> params;//The list of parameter types
	//public VariableDeclarations vars;
	public FunctionOrMethod functionOrMethod;

	//Store the list of code for each part of the pattern.
	public int line;//keep track of the current line number.
	public List<List<Code>> parts;//The collection of all parts in the pattern.
	public HashMap<Integer, String> part_names;//Store the relation between part index and part name.

	public Pattern(){
		this.isNil = true;//By default.
	}
	
	/**
	 * Base constructor
	 * @param config
	 * @param FunctionOrMethod the function or method declaration, including input parameters type,
	 * a list of code block inside the function body and variable declarations.
	 */
	protected Pattern(Configuration config, FunctionOrMethod functionOrMethod){
		this();
		this.config = config;
		this.factory = new ExprFactory(config);//Create an expression factory to record all the extracted expressions.
		//Add the input parameters to the expression table.
		this.params = functionOrMethod.type().params();
		for(Type param: params){
			factory.putExpr(param);
		}
		//Pass the variable declaraions to the pattern
		this.functionOrMethod = functionOrMethod;
		//The list of code in each pattern part.
		this.parts = new ArrayList<List<Code>>();
		this.part_names = new HashMap<Integer, String>();
		this.line = 0;
		
	}	
	
	

	/**
	 * Check if the pattern is null.
	 * @return true if the pattern is null. Return false if the pattern is successfully constructed.
	 */
	public boolean isNil() {
		return this.isNil;
	}

	/**
	 * Get the pattern type.
	 * @return the pattern type. 
	 */
	public String getPatternName(){
		return this.pattern_name;
	}

	/**
	 * Get the list of code by using the part name. If the part name is new, then add the new pattern part and the list of code.
	 * This method is a data-driven design rather than using a fixed-sized enum list.  
	 *   
	 * @param part_name the name of pattern part.
	 * @return the list of code. 
	 */
	public List<Code> getPartByName(String part_name){
		//Check if the part_name contains 
		if(part_names.containsValue(part_name)){
			for(Entry<Integer, String> entry : part_names.entrySet()){
				if(entry.getValue().equals(part_name)){
					return parts.get(entry.getKey());
				}
			}	
		}else{
			int index = part_names.size();
			//Add the new part name into the 'part_names' hashmap
			part_names.put(index, part_name);
			//Add the new list to the list of parts
			parts.add(new ArrayList<Code>());
			return parts.get(index);
		}
		return null;
	}

	/**
	 * Print out each byte-code. If the byte-code contains a list of byte-code, then recursively print out each of them. 
	 * @param code
	 */
	private void printOutBytecode(Code code){
		System.out.println("\t\t"+code);
		if(code instanceof Codes.Invariant){
			for(Code inv:((Codes.Invariant)code).bytecodes()){
				printOutBytecode(inv);
			}
		}else if(code instanceof Codes.Assert){
			for(Code assertion:((Codes.Assert)code).bytecodes()){
				printOutBytecode(assertion);
			}
		}else if(code instanceof Codes.Loop){
			for(Code loop_code:((Codes.Loop)code).bytecodes()){
				printOutBytecode(loop_code);
			}
		}
	}
	
	
	/**
	 * Add the code to the specific pattern part.
	 * @param code
	 * @param part_name
	 */
	protected void AddCodeToPatternPart(Code code, String part_name){
		//Create an expression with the expression and put it to the table.
		factory.putExpr(code);
		//Create the expression and put it into the table.
		List<Code> blk = getPartByName(part_name);
		blk.add(code);
		if(config.isVerbose()){
			System.out.println(part_name+":");
			printOutBytecode(code);			
		}
	}


	/**
	 * Check if the code is inside an assertion or assumption.
	 * @param code the code.
	 * @return true if the code belongs to the assertion or assumption. Otherwise, return false.
	 */
	protected boolean isInvariant(Code code){
		if(code instanceof Codes.Invariant){
			return true;
		}
		return false;
	}

	@Override
	public String toString() {
		String result = "";
		result += "{";
		//Print out all the bytecode
		int index = 0;
		for(List<Code> part_code: this.parts){
			result += "\n"+this.part_names.get(index)+":";
			for(Code code: part_code){
				result += "\n\t"+code;
			}
			index++;
		}
		result += "\n}";
		return result;
	}




}
