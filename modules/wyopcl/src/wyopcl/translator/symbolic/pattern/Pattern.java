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
	protected HashMap<String, Expr> expressiontable;
	protected String type;//The pattern type
	protected boolean isNil;
	protected Expr numberOfIterations;// the number of loop iterations in affine form.
	//Expressions related to the loop variable.
	protected String V;
	protected Expr initExpr;
	protected String comparatorOp;
	protected Expr loop_boundExpr;

	//Store the list of code for each part of the pattern.
	protected int line;//keep track of the current line number.
	protected List<Code> init_pre;
	protected List<Code> init;
	protected List<Code> init_post;
	protected List<Code> loop_header;
	protected List<Code> loopbody_pre;
	protected List<Code> loopbody_decr;
	protected List<Code> loopbody_incr;
	protected List<Code> loopbody_post;
	protected List<Code> loopexit;


	public Pattern(List<Code> blk, HashMap<String, Expr> expressiontable){
		this.expressiontable = expressiontable;
		//The list of code in each part of the pattern.
		this.init_pre = new ArrayList<Code>();
		this.init = new ArrayList<Code>();
		this.init_post = new ArrayList<Code>();
		this.loop_header = new ArrayList<Code>();
		//Construct each part in the pattern.
		this.line = 0;
		this.V = loop_var(blk);
		this.line = init(blk, this.V, init_pre, init, this.line);
		this.line = while_cond(blk, this.V, init_post, loop_header, line);		
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
	protected String loop_var(List<Code> code_blk) {
		String var = null;		
		for(int i=0; i<code_blk.size(); i++){
			//Get the loop bytecode	
			Code code = code_blk.get(i);
			//Loop header
			if(code instanceof Codes.Loop){
				Codes.Loop loop = (Codes.Loop)code;
				//The loop variable is the first modified operands.
				var = prefix+loop.modifiedOperands[0];
				for(int j=i;j<code_blk.size();j++){
					Code next_code = code_blk.get(j);
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
	 * Get the expression of assigning the initial value to the loop variable. 
	 * @param loop_var the loop variable.
	 * @return the expression. If not found, return null.
	 */
	private Expr getInitExpr(String loop_var){
		//Get the expression for loop variable.	
		Expr expr = getExpr(loop_var);
		String[] vars = expr.getVars();
		for(String var: vars){
			expr= replaceExpr(var, expr);  
		}
		return expr;
	}


	/**
	 * Get the expression that assigns the initial value the loop variable and record the list of code in 'init_pre' and 'init' part.
	 * @param loop_var the loop variable
	 * @param init_pre the list of code in the 'init_pre' part. Passing an array list parameter allows the called function to modify 
	 * 		  the context of the array list. 
	 * @param init the list of code in the 'init' part that assigns the initial values to the loop variable.
	 * @param line the starting line of code
	 * @return the ending line of code of 'init' part.
	 */
	protected int init(List<Code> code_blk, String loop_var, List<Code> init_pre, List<Code> init, int line) {
		//No loop variables
		if(loop_var == null) return line;

		//Put the code to init_pre, init and init_post parts.
		for(int index = line; index<code_blk.size(); index++){
			Code code = code_blk.get(index);
			//Check if this code assigns the value to the loop variable. 
			if(code instanceof Codes.Assign){
				//check if the loop variable is used in the assignment.
				if(loop_var.equals(prefix+((Codes.Assign)code).target())){
					//Add the code to 'init' part.
					init.add(code);
					//Get the expression for loop variable.	
					initExpr = getInitExpr(loop_var);
					return index;
				}
			}
			//Otherwise, add the code to the 'init_pre' part
			init_pre.add(code);
		}			
		return line;
	}

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

	/**
	 * Get the expression of loop bound from the loop condition bytecode.
	 * @param if_code
	 * @param loop_var
	 * @return
	 */
	private Expr getLoopBoundExpr(Code code, String loop_var){
		String op = null;
		if(code instanceof Codes.If){
			Codes.If if_code = (Codes.If)code;
			//Check if the loop var exists in the condition
			if(loop_var.equals(prefix+if_code.leftOperand)){
				if(if_code.op.equals(Comparator.LTEQ) ){
					comparatorOp = ">";													
				}else if(if_code.op.equals(Comparator.LT)){
					comparatorOp = ">=";
				}else if(if_code.op.equals(Comparator.GTEQ)){
					comparatorOp = "<";
				}else if(if_code.op.equals(Comparator.GT)){
					comparatorOp = "<=";
				}else{
					return null;
				}
				op = prefix+if_code.rightOperand;								
			}

			if(loop_var.equals(prefix+if_code.rightOperand)){						
				if(if_code.op.equals(Comparator.LTEQ) ){
					comparatorOp = "<";													
				}else if(if_code.op.equals(Comparator.LT)){
					comparatorOp = "<=";
				}else if(if_code.op.equals(Comparator.GTEQ)){
					comparatorOp = ">";
				}else if(if_code.op.equals(Comparator.GT)){
					comparatorOp = ">=";
				}else{
					return null;
				}			
				op = prefix+if_code.leftOperand;						
			}

			if(op != null){
				//Get the expression 
				return getExpr(op);
			}
		}
		return null;
	}



	/**
	 * Get the lower or upper bound of loop condition.
	 * @param V the loop variable
	 * @param compareOp the type of comparator 
	 * @return the expression of bound.
	 */
	protected int while_cond(List<Code> code_blk, String loop_var, List<Code> init_post, List<Code> loop_header, int line) {
		if(loop_var == null) return line;

		//Search for the loop condition
		for(int i=line; i< code_blk.size(); i++){
			Code code = code_blk.get(i);
			//Search for loop bytecode
			if(code instanceof Codes.Loop){								
				//Search for the loop condition
				for(int j=i;j<code_blk.size(); j++){
					code = code_blk.get(j);
					//Add the code to loop header
					loop_header.add(code);
					this.loop_boundExpr = getLoopBoundExpr(code, loop_var);
					if(this.loop_boundExpr!=null){
						return j;
					}
				}//End of the loop condition check
			}else{
				init_post.add(code);
			}// End of the loop bytecode check
		}
		return line;
	}

}
