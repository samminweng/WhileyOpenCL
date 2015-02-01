package wyopcl.translator.symbolic.pattern;

import java.math.BigInteger;

import wyopcl.translator.symbolic.Expr;
/**
 * while_loop && loop_var(V) && decr(V, 1) && init(V, Init) &&  while_cond(V, ">=", LowerExpr) => loop_iters(V, Init - LowerExpr + 1)
 * @author Min-Hsien Weng
 *
 */
public class P2 extends Pattern{
	private final Expr lowerExpr;
	public P2(String V, Expr initExpr, Expr decr, Expr incr, Expr lowerExpr) {
		super(V, initExpr, decr, incr);
		this.lowerExpr = lowerExpr;
	}

	

	@Override
	public String toString() {
		return "while_loop && loop_var("+V+") && decr("+V+", "+decr+")"
				+ " && init("+V+", "+initExpr+") &&  while_cond("+V+", >= , "+lowerExpr+")"
				+ "\n=>loop_iters("+V+", "+getNumberOfIterations()+")";
				//+ "loop_iters("+V+", "+initExpr+" - "+lowerExpr+"+1)";
	}
	
	@Override
	public boolean isNil() {
		if(V!=null&&initExpr!=null&&decr!=null&&lowerExpr!=null){
			return false;
		}
		return true;
	}



	@Override
	public Expr getNumberOfIterations() {
		if(numberOfIterations == null){
			numberOfIterations = (Expr)initExpr.clone();
			numberOfIterations.subtract(lowerExpr);
			numberOfIterations.add(new Expr(BigInteger.ONE));
		}				
		return numberOfIterations;
	}

	
	
}
