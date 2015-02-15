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
	protected HashMap<String, Expr> expressiontable;//Store the register along with the corresponding expression.
	protected String type;//The pattern type
	protected boolean isNil;//The flag indicates whether this pattern is matched with the given loop (True: not matched False: Matched).
	protected Expr numberOfIterations;// the number of loop iterations in affine form.
	protected String label_AssertOrAssume;//The flag to store the label for an assertion or assumption.	

	//Expressions related to the loop variable.
	public int param_size;
	public String V;
	public Expr initExpr;
	public String comparatorOp;
	public Expr loop_boundExpr;

	//Store the list of code for each part of the pattern.
	protected int line;//keep track of the current line number.
	public List<List<Code>> parts;//The collection of all parts in the pattern.
	//Define the sequence of pattern parts and use 'index()' method to get the index.
	public enum PART{
		INIT_PRE 		(0),
		INIT	 		(1),
		INIT_POST		(2),
		LOOP_HEADER		(3),
		LOOPBODY_PRE	(4),
		LOOPBODY_DECR	(5),//the same order
		LOOPBODY_INCR	(5),//the same order
		LOOPBODY_POST	(6),
		LOOP_EXIT		(7);		
		private int index;
		PART(int index){
			this.index = index;
		}
		public int index() { return index;}
	}

	public Pattern(int param_size, List<Code> blk){
		this.expressiontable = new HashMap<String, Expr>();
		this.param_size = param_size;
		//Add the input parameters to the expression table.
		for(int index=0;index<param_size;index++){
			putExpr(new Expr(prefix+index));
		}
		//The flag to store the label for an assertion or assumption.	
		this.label_AssertOrAssume = null;

		//The list of code in each part of the pattern.
		this.parts = new ArrayList<List<Code>>();
		//Add each list of code into the list of pattern parts
		//Use 'values().length' to get the number of parts.
		for(int index=0;index<PART.values().length;index++){
			//Initialize the each part.
			this.parts.add(new ArrayList<Code>());			
		}
		
		//Construct each part in the pattern.
		this.line = 0;
		this.V = loop_var(blk);
		this.line = init(blk, this.V,
						 this.parts.get(PART.INIT_PRE.index()),
						 this.parts.get(PART.INIT.index()),
						 this.line);
		this.line = while_cond(blk, this.V,
							   this.parts.get(PART.INIT_POST.index()),
							   this.parts.get(PART.LOOP_HEADER.index()),
							   line);		
	}

	public abstract Expr getNumberOfIterations();

	/**
	 * Check if the pattern is null.
	 * @return true if the pattern is null. Return false if the pattern is successfully constructed.
	 */
	public boolean isNil() {
		return this.isNil;
	}
	
	public List<Code> getPart(int index){
		return this.parts.get(index);
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
	
	protected void AddCodeToPatternPart(Code code, List<Code> blk){
		//Create the expression and put it into the table.
		putExpr(new Expr(code));
		blk.add(code);	
	}
	
	
	
	/**
	 * Get the expression of assigning the initial value to the loop variable. 
	 * @param loop_var the loop variable.
	 * @return the expression. If not found, return null.
	 */
	private Expr getInitExpr(Codes.Assign assign, String loop_var){
		//check if the loop variable is used in the assignment.
		if(loop_var.equals(prefix+(assign.target()))){
			//Get the expression for loop variable.	
			Expr expr = getExpr(loop_var);
			if(expr == null){
				expr = new Expr(assign);
			}			
			String[] vars = expr.getVars();
			for(String var: vars){
				expr= replaceExpr(var, expr);  
			}
			return expr;
		}
		return null;
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
		int index;
		for(index = line; index<code_blk.size(); index++){
			Code code = code_blk.get(index);			
			//Check if this code assigns the value to the loop variable. 
			if(!checkAssertOrAssume(code)&& code instanceof Codes.Assign){
				//Get the expression for loop variable.	
				initExpr = getInitExpr((Codes.Assign)code, loop_var);
				if(initExpr != null){
					//Add the code to 'init' part.
					AddCodeToPatternPart(code, init);
					return ++index;
				}
			}
			//Otherwise, add the code to the 'init_pre' part
			AddCodeToPatternPart(code, init_pre);
		}			
		return index;
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
		int index;
		for(index=line; index< code_blk.size(); index++){
			Code code = code_blk.get(index);
			//Search for loop bytecode
			if(!checkAssertOrAssume(code)&&code instanceof Codes.Loop){
				//Check if the loop variable is used in the loop
				Codes.Loop loop = (Codes.Loop)code;
				if(loop_var.equals(prefix+loop.modifiedOperands[0])){
					//Stop the iteration.
					break;
				}
			}
			AddCodeToPatternPart(code, init_post);
		}

		//Search for the loop condition
		for(; index< code_blk.size(); index++){
			Code code = code_blk.get(index);
			//Add the code to loop header	
			AddCodeToPatternPart(code, loop_header);
			if(!checkAssertOrAssume(code)&&code instanceof Codes.If){
				this.loop_boundExpr = getLoopBoundExpr(code, loop_var);
				if(this.loop_boundExpr!=null){
					return ++index;					
				}
			}
		}
		return index;
	}

}
