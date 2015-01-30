package wyopcl.translator.symbolic.pattern;

import java.math.BigInteger;

import wyopcl.translator.symbolic.Expr;
/**
 * while_loop && loop_var(V)  && incr(V,+1) && init(V,Init) && while_cond(V, "<=", UpperExpr) => loop_iters(V, UpperExpr - Init + 1)
 * @author Min-Hsien Weng
 *
 */
public class P4 extends Pattern{
	private final Expr upperExpr;
	public P4(String V, Expr initExpr, Expr decr, Expr incr, Expr upperExpr) {
		super(V, initExpr, decr, incr);
		this.upperExpr = upperExpr;
	}


	@Override
	public String toString() {
		return "while_loop && loop_var("+V+") && incr("+V+", "+incr+")"
				+ " && init("+V+", "+initExpr+") &&  while_cond("+V+", <= , "+upperExpr+")"
				+ "\n=> loop_iters("+V+", "+getNumberOfIterations()+")";
				//+ "loop_iters("+V+", "+upperExpr+" - "+initExpr+"+1)";
	}
	
	@Override
	public boolean isNil() {
		if(V!=null&&initExpr!=null&&incr!=null&&upperExpr!=null){
			return false;
		}
		return true;
	}

	@Override
	public Expr getNumberOfIterations() {
		Expr result = (Expr) upperExpr.clone();
		return result.subtract(initExpr).add(new Expr(BigInteger.ONE));
	}
	
}
