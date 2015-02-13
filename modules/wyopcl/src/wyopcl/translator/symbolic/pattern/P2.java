package wyopcl.translator.symbolic.pattern;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
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
	private final BigInteger incr;
	
	
	public P2(List<Code> blk, HashMap<String, Expr> expressiontable) {
		super(blk, expressiontable);
		this.type = "P2";
		this.incr = incr(blk, this.V);		
		if(this.incr!=null){
			this.isNil &= false;
		}	
	}


	@Override
	public String toString() {
		return type + ":while_loop && loop_var("+V+") && incr("+V+", "+incr+")"
				+ " && init("+V+", "+initExpr+") &&  while_cond("+V+", "+comparatorOp+", "+loop_boundExpr+")"
				+ "\n=>loop_iters("+V+", " + getNumberOfIterations()+")";
	}

	@Override
	public Expr getNumberOfIterations() {
		if(numberOfIterations==null){
			Expr result = (Expr)loop_boundExpr.clone();
			if(comparatorOp.equals("<")){
				numberOfIterations = result.subtract(initExpr);
			}else{
				numberOfIterations = result.subtract(initExpr).add(new Expr(BigInteger.ONE));
			}			
		}		
		return numberOfIterations;
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
	private BigInteger incr(List<Code> code_blk, String V){
		if(V!= null){
			for(Code code: code_blk){							
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
