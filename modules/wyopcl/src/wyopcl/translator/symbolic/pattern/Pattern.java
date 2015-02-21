package wyopcl.translator.symbolic.pattern;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.Optional;
import java.util.stream.IntStream;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.expression.Expr;
import wyopcl.translator.symbolic.expression.ExprFactory;
import wyopcl.translator.symbolic.expression.LinearExpr;

/**
 * The abstract class for all pattern classes. This class is implemented with
 * <a href="http://www.tutorialspoint.com/design_pattern/null_object_pattern.htm">null object pattern</a>
 * @author Min-Hsien Weng
 *
 */
public abstract class Pattern {
	protected final String prefix = "%";
	protected final Configuration config;
	
	protected String type;//The pattern type
	protected boolean isNil;//The flag indicates whether this pattern is matched with the given loop (True: not matched False: Matched).
	protected LinearExpr numberOfIterations;// the number of loop iterations in affine form.
	protected String label_AssertOrAssume;//The flag to store the label for an assertion or assumption.	

	//Store the list of code for each part of the pattern.
	protected int line;//keep track of the current line number.
	public List<List<Code>> parts;//The collection of all parts in the pattern.
	protected HashMap<Integer, String> part_names;//Store the relation between part index and part name.
	
	public final ExprFactory factory;
	
	//The variable (loop variable or list variable).
	public String V;
	//The list of parameter types
	public List<Type> params;
	
	public Pattern(List<Type> params, List<Code> blk, Configuration config){
		this.config = config;
		this.params = params;
		this.factory = new ExprFactory(config);
		//Add the input parameters to the expression table.
		for(Type param: params){
			factory.putExpr(param);
		}
		//The flag to store the label for an assertion or assumption.	
		this.label_AssertOrAssume = null;

		//The list of code in each pattern part.
		this.parts = new ArrayList<List<Code>>();
		this.part_names = new HashMap<Integer, String>();
	}

	public abstract LinearExpr getNumberOfIterations();

	/**
	 * Check if the pattern is null.
	 * @return true if the pattern is null. Return false if the pattern is successfully constructed.
	 */
	public boolean isNil() {
		return this.isNil;
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
	 * Get the pattern type.
	 * @return the pattern type. 
	 */
	public String getType(){
		return this.type;
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
