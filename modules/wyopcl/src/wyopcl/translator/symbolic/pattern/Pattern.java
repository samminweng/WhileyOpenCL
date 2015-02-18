package wyopcl.translator.symbolic.pattern;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.Optional;
import java.util.stream.IntStream;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyopcl.translator.symbolic.Expr;

/**
 * The abstract class for all pattern classes. This class is implemented with
 * <a href="http://www.tutorialspoint.com/design_pattern/null_object_pattern.htm">null object pattern</a>
 * @author Min-Hsien Weng
 *
 */
public abstract class Pattern {
	protected final String prefix = "%";	
	protected HashMap<String, Expr> expressiontable;//Store the register along with the corresponding expression.
	protected String type;//The pattern type
	protected boolean isNil;//The flag indicates whether this pattern is matched with the given loop (True: not matched False: Matched).
	protected Expr numberOfIterations;// the number of loop iterations in affine form.
	protected String label_AssertOrAssume;//The flag to store the label for an assertion or assumption.	

	//Store the list of code for each part of the pattern.
	protected int line;//keep track of the current line number.
	public List<List<Code>> parts;//The collection of all parts in the pattern.
	protected HashMap<Integer, String> part_names;//Store the relation between part index and part name.
	public int param_size;//the number of input parameters.
	public Pattern(int param_size, List<Code> blk){
		this.param_size = param_size;		
		
		this.expressiontable = new HashMap<String, Expr>();
		//Add the input parameters to the expression table.
		for(int index=0;index<param_size;index++){
			putExpr(new Expr(prefix+index));
		}
		//The flag to store the label for an assertion or assumption.	
		this.label_AssertOrAssume = null;

		//The list of code in each pattern part.
		this.parts = new ArrayList<List<Code>>();
		this.part_names = new HashMap<Integer, String>();
	}

	public abstract Expr getNumberOfIterations();

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
		//Create the expression and put it into the table.
		putExpr(new Expr(code));
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
	
	/**
	 * Check if the code is a constant assignment and put the symbol and value into the symbol table. 
	 *
	 * @param code
	 */
	protected void putExpr(Expr expr){
		if(expr.getTarget()!=null){
			//Check if the target exists in the expression table.
			if(!expressiontable.containsKey(expr.getTarget())){
				System.out.println(expr.getTarget() + " = "+ expr);
				//Add to the expression table.
				expressiontable.put(expr.getTarget(), expr);
			}			
		}else{
			//Nullify the expr object.
			expr = null;
		}
	}

	/**
	 * Get the value from expression table.
	 * @param op
	 * @return value(Expr). If not found, return null.
	 */
	protected Expr getExpr(String op) {
		if(expressiontable.containsKey(op)){
			return expressiontable.get(op);						
		}		
		return null;
	}

	/*protected void AddCodeToPatternPart(Code code, List<Code> blk){
		//Create the expression and put it into the table.
		putExpr(new Expr(code));
		blk.add(code);	
	}*/	

	/**
	 * Given a input expression, recursively replace the element with the expression retrieved from the expression table.
	 * @param var the name of variable
	 * @param expr the input expression 
	 * @return the updated expression.
	 */
	protected Expr replaceExpr(String var, Expr expr) {
		Expr var_expr = getExpr(var);
		if(var_expr == null) return expr;

		expr = expr.merge(var, var_expr);
		String[] vars = expr.getVars();
		for(String new_var: vars){
			if(new_var != null && !new_var.equals(var)){
				//check if the new var is not the existing var
				expr = replaceExpr(new_var, expr);				
			}			
		}		
		return expr;
	}

}
