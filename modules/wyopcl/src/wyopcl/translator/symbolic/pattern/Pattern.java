package wyopcl.translator.symbolic.pattern;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.Comparator;
import wyopcl.translator.symbolic.Expr;

/**
 * The abstract class for all pattern classes. This class is implemented with
 * <a href="http://www.tutorialspoint.com/design_pattern/null_object_pattern.htm">null object pattern</a>
 * @author Min-Hsien Weng
 *
 */
public abstract class Pattern {
	protected final String prefix = "%";	
	protected final HashMap<String, Expr> expressiontable;
	protected final List<Code> blk;
	protected String type;//The pattern type
	protected boolean isNil;
	protected Expr numberOfIterations;// the number of loop iterations in affine form.
	//Expressions of loop
	protected final String V;
	protected final Expr initExpr;
	//Store the list of code for each part of the pattern.
	protected HashMap<String, List<Code>> pattern_parts;
	protected int line;
	
	public Pattern(List<Code> blk, HashMap<String, Expr> expressiontable){
		this.blk = blk;
		this.expressiontable = expressiontable;
		this.pattern_parts = new HashMap<String, List<Code>>();
		this.V = loop_var();
		this.line = 0;
		this.initExpr = init(this.V, new ArrayList<Code>(), new ArrayList<Code>(), line);
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
	 * Find the loop variable
	 * @return the variable (string). If not found, return null.
	 */
	protected String loop_var() {
		String var = null;		
		for(int i=0; i<blk.size(); i++){
			//Get the loop bytecode	
			Code code = blk.get(i);
			//Loop header
			if(code instanceof Codes.Loop){
				Codes.Loop loop = (Codes.Loop)code;
				//The loop variable is the first modified operands.
				var = prefix+loop.modifiedOperands[0];
				for(int j=i;j<blk.size();j++){
					Code next_code = blk.get(j);
					//Get the following code to see if the loop variable is used in the loop condition
					if(next_code!= null && next_code instanceof Codes.If){
						Codes.If if_code = (Codes.If)next_code;
						//Check if the var is left-handed operand. If so, then this is the loop variable.
						if(var.equals(prefix+if_code.leftOperand) || var.equals(prefix+if_code.rightOperand)){
							return var;
						}
					}
				}
			}			
		}
		return null;
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

	/**
	 * Get the initial value of loop variable from expression table.
	 * @param V the loop variable
	 * @return initial value (Expr). If not found, return null.
	 */
	protected Expr init(String V, List<Code> init_pre, List<Code> init, int line) {
		//Put the code to init_pre, init and init_post parts.
		for(int index = line; index<blk.size(); index++){
			Code code = blk.get(index);
			//Check if this code assigns the value to the loop variable. 
			if(code instanceof Codes.Assign){
				Codes.Assign assignment = (Codes.Assign)code;
				String target = prefix+assignment.target();
				if(target.equals(V)){
					//Add the code to 'init' part.
					init.add(code);
					line = index;
					break;
				}
			}
			//Otherwise, add the code to the 'init_pre' part
			init_pre.add(code);
		}
		
		//Add the 'init_pre' and 'init' parts into the pattern part table
		pattern_parts.put("init_pre", init_pre);
		pattern_parts.put("init", init);
		
		//Get the expression for loop variable.	
		Expr init_expr = getExpr(V);
		String[] vars = init_expr.getVars();
		for(String var: vars){
			init_expr= replaceExpr(var, init_expr);  
		}		
		return init_expr;
	}

	/**
	 * Given a input expression, recursively replace the element with the expression retrieved from the expression table.
	 * @param var the name of variable
	 * @param expr the input expression 
	 * @return the updated expression.
	 */
	Expr replaceExpr(String var, Expr expr) {
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
