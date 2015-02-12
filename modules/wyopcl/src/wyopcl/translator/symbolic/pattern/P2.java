package wyopcl.translator.symbolic.pattern;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.Comparator;
import wyopcl.translator.symbolic.Expr;
/**
 * Implemented the while-loop patterns, as follows:
 * <ul>
 * <li>while_loop && loop_var(V)  && incr(V,+1) && init(V,Init) && while_cond(V, "<", UpperExpr) => loop_iters(V, UpperExpr - Init)
 * <li>while_loop && loop_var(V)  && incr(V,+1) && init(V,Init) && while_cond(V, "<=", UpperExpr) => loop_iters(V, UpperExpr - Init +1 )
 * </ul>
 * @author Min-Hsien Weng
 *
 */
public class P2 extends Pattern{
	private final String V;
	private final Expr initExpr;
	private final BigInteger incr;
	private String comparatorOp;
	private final Expr upperExpr;
	
	public P2(List<Code> blk, HashMap<String, Expr> expressiontable) {
		super(blk, expressiontable);
		this.type = "P2";		
		this.V = loop_var();
		this.initExpr = init(this.V);
		this.incr = incr(this.V);
		this.upperExpr = while_cond(this.V);
		if(this.V!=null&&this.initExpr!=null&&this.incr!=null&&this.upperExpr!=null){
			this.isNil = false;
		}else{
			this.isNil = true;
		}	
	}


	/**
	 * Get the value from expression table.
	 * @param op
	 * @return value(Expr). If not found, return null.
	 */
	private Expr getExpr(String op){
		if(expressiontable.containsKey(op)){
			return expressiontable.get(op);						
		}		
		return null;
	}

	/**
	 * Get the lower or upper bound of loop condition.
	 * @param V the loop variable
	 * @param compareOp the type of comparator 
	 * @return the expression of bound.
	 */
	private Expr while_cond(String V){
		Expr expr = null;
		if(V != null){
			for(Code code: blk){
				if(code instanceof Codes.If){
					Codes.If if_code = (Codes.If)code;
					//Check if the loop var occurs in the condition
					if(V.equals(prefix+if_code.leftOperand)){
						if(if_code.op.equals(Comparator.GTEQ) ){
							comparatorOp = "<";
							//Get the expression 
							return getExpr(prefix+if_code.rightOperand);
						}else if(if_code.op.equals(Comparator.GT)){
							comparatorOp = "<=";
							//Get the expression
							return getExpr(prefix+if_code.rightOperand);
						}else{
							comparatorOp = null;
						}
					}
				}		
			}		
		}
		return expr;
	}


	@Override
	public String toString() {
		return type + ":while_loop && loop_var("+V+") && incr("+V+", "+incr+")"
				+ " && init("+V+", "+initExpr+") &&  while_cond("+V+", "+comparatorOp+", "+upperExpr+")"
				+ "\n=>loop_iters("+V+", " + getNumberOfIterations()+")";
	}

	@Override
	public boolean isNil() {
		return this.isNil;
	}

	@Override
	public Expr getNumberOfIterations() {
		if(numberOfIterations==null){
			Expr result = (Expr)upperExpr.clone();
			if(comparatorOp.equals("<")){
				numberOfIterations = result.subtract(initExpr);
			}else{
				numberOfIterations = result.subtract(initExpr).add(new Expr(BigInteger.ONE));
			}			
		}		
		return numberOfIterations;
	}


	/**
	 * Given a input expression, recursively replace the element with the expression retrieved from the expression table.
	 * @param var the name of variable
	 * @param expr the input expression 
	 * @return the updated expression.
	 */
	private Expr replaceExpr(String var, Expr expr){
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
	 * Get the initial value of loop variable from expression table.
	 * @param V the loop variable
	 * @return initial value (Expr). If not found, return null.
	 */
	private Expr init(String V){
		Expr init = getExpr(V);
		String[] vars = init.getVars();
		for(String var: vars){
			init= replaceExpr(var, init);  
		}		
		return init;
	}

	/**
	 * Get the incremental value for the given loop variable. The conditions are
	 * <ul>
	 * 	<li>reassign the value of loop variable
	 *  <li>increment the value by the constant ONE
	 * </ul>
	 * For example, the loop variable is assigned to a temporary variable (%3 = %14)  
	 * which performs the subtraction on the loop variable (%14 = %3 + %13 and %13 = 1) 
	 * 
	 * @return increment value (Expr). If not matched, return null;
	 */
	private BigInteger incr(String V){
		if(V!= null){
			for(Code code: blk){							
				if(code instanceof Codes.Assign){
					//Check if the assignment bytecode is to over-write the value of loop variable.
					Codes.Assign assign = (Codes.Assign)code;
					String target = prefix+assign.target();
					//V  = %3
					if(target.equals(V)){
						//Get the temporary variable, e.g. %16
						Expr expr = getExpr(prefix+assign.operand(0));
						//Check if the loop variable is used in the expression for the tmp variable.
						String[] vars = expr.getVars();
						if(expr.getVarIndex(V) == 0 && vars.length == 2){
							String incr_op = vars[1];
							//Find the coefficient of the decremental variable in the expr 
							BigInteger coefficient = expr.getCoefficient(incr_op);
							//Check if the op kind is a addition
							if(coefficient.signum()>0){
								Expr increment = getExpr(incr_op);
								return increment.getConstant();
							}
						}
					}
				}
			}
		}
		return null;
	}
	
	
}
