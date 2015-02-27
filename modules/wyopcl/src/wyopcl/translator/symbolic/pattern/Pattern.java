package wyopcl.translator.symbolic.pattern;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.expression.ExprFactory;
/**
 * The abstract base class to define all the commonly used fields and methods for all its subclass, including the assert_label, data-driven storage and
 * the expression factory
 * @author Min-Hsien Weng
 *
 */
public class Pattern extends Object{
	public final String prefix = "%";
	public final Configuration config;
	public String type;//The pattern type
	public boolean isNil;//The flag indicates whether this pattern is matched with the given loop (True: not matched False: Matched).
	
	public ExprFactory factory;
	public List<Type> params;//The list of parameter types
	
	//Store the list of code for each part of the pattern.
	public int line;//keep track of the current line number.
	public List<List<Code>> parts;//The collection of all parts in the pattern.
	public HashMap<Integer, String> part_names;//Store the relation between part index and part name.
	public String label_AssertOrAssume;//The flag to store the label for an assertion or assumption.
	
	/**
	 * Base constructor
	 * @param config
	 */
	public Pattern(Configuration config){
		this.config = config;
		this.isNil = true;//By default.
	}
	/**
	 * Multiple constructor
	 * @param config
	 * @param params
	 */
	public Pattern(Configuration config, List<Type> params){
		this(config);
		//The flag to store the label for an assertion or assumption.	
		this.label_AssertOrAssume = null;
		//The list of code in each pattern part.
		this.parts = new ArrayList<List<Code>>();
		this.part_names = new HashMap<Integer, String>();	
		this.factory = new ExprFactory(config);//Create an expression factory to record all the extracted expressions.
		
		//Add the input parameters to the expression table.
		this.params = params;
		for(Type param: params){
			factory.putExpr(param);
		}	
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
	public String getType(){
		return this.type;
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
	}

	
	/**
	 * Check if the code is inside an assertion or assumption.
	 * @param code the code.
	 * @return true if the code belongs to the assertion or assumption. Otherwise, return false.
	 */
	protected boolean checkAssertOrAssume(Code code){
		if(label_AssertOrAssume == null){
			if(code instanceof Codes.AssertOrAssume){
				Codes.AssertOrAssume assertOrAssume = (Codes.AssertOrAssume)code;
				label_AssertOrAssume = assertOrAssume.target;
				return true;
			}		
		}else{			
			if(code instanceof Codes.Label){
				Codes.Label label = (Codes.Label)code;
				if(label_AssertOrAssume.equals(label.label)){
					//Nullify the label of an assertion or assumption. 
					label_AssertOrAssume = null;
					return true;
				}					
			}
		}
		//In other cases, if the label is not null, then the code is inside the assertion or assumption.
		return (label_AssertOrAssume != null)? true: false;
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
