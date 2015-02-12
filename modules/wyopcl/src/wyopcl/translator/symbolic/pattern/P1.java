package wyopcl.translator.symbolic.pattern;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.Comparator;
import wyopcl.translator.symbolic.Expr;
/**
 * Implemented the while-loop pattens, as follows:
 * <ul>
 * <li>while_loop && loop_var(V) && decr(V, 1) && init(V, Init) &&  while_cond(V, ">", LowerExpr) => loop_iters(V, Init - LowerExpr)
 * <li>while_loop && loop_var(V) && decr(V, 1) && init(V, Init) &&  while_cond(V, ">=", LowerExpr) => loop_iters(V, Init - LowerExpr + 1)
 * </ul>
 * <p>
 * This class takes the loop block and expression table as input and, if the block is matched the conditions, then produce the pattern as output.
 * 
 * @author Min-Hsien Weng
 *
 */
public class P1 extends Pattern{	
	private final BigInteger decr;
	private String comparatorOp;
	private final Expr lowerExpr;
	public P1(List<Code> blk, HashMap<String, Expr> expressiontable) {
		super(blk, expressiontable);
		this.type = "P1";		
		this.decr = decr(this.V);
		this.lowerExpr = while_cond(this.V);
		if(this.V!=null&&this.initExpr!=null&&this.decr!=null&&this.lowerExpr!=null){
			this.isNil = false;
		}else{
			this.isNil = true;
		}	
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
						if(if_code.op.equals(Comparator.LTEQ) ){
							comparatorOp = ">";
							//Get the expression 
							return getExpr(prefix+if_code.rightOperand);							
						}else if(if_code.op.equals(Comparator.LT)){
							comparatorOp = ">=";
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
		return type + ":while_loop && loop_var("+V+") && decr("+V+", "+decr+")"
				+ " && init("+V+", "+initExpr+") &&  while_cond("+V+", "+comparatorOp+", "+lowerExpr+")"
				+ "\n=>loop_iters("+V+", " + getNumberOfIterations()+")";
	}

	@Override
	public boolean isNil() {
		return this.isNil;
	}

	@Override
	public Expr getNumberOfIterations() {
		if(numberOfIterations==null){
			Expr result = (Expr)initExpr.clone();
			if(comparatorOp.equals(">")){
				numberOfIterations = result.subtract(lowerExpr);
			}else{
				numberOfIterations = result.subtract(lowerExpr).add(new Expr(BigInteger.ONE));
			}			
		}		
		return numberOfIterations;
	}


	/**
	 * Get the decremental value for the given loop variable. The conditions are
	 * <ul>
	 * 	<li>reassigned the value of loop variable
	 *  <li>decrement the value by the constant ONE
	 * </ul>
	 * For example, the loop variable is assigned to a temporary variable (%3 = %16)  
	 * which performs the subtraction on the loop variable (%16 = %3 - %15 and %15 = 1) 
	 * 
	 * @return decrement value (Expr). If not matched, return null;
	 */
	private BigInteger decr(String V){
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
							String decr_op = vars[1];
							//Find the coefficient of the decremental variable in the expr 
							BigInteger coefficient = expr.getCoefficient(decr_op);
							//Check if the op kind is a subtraction
							if(coefficient.signum()<0){
								Expr decrement = getExpr(decr_op);
								return decrement.getConstant();
							}
						}
					}
				}
			}
		}
		return null;
	}



}
