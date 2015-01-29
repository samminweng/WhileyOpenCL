package wyopcl.translator.symbolic.pattern;

import java.math.BigInteger;

import wyopcl.translator.symbolic.Expr;
/**
 * while_loop && loop_var(V) && decr(V, 1) && init(V, Init) &&  while_cond(V, "> ", LowerExpr) => loop_iters(V, Init - LowerExpr)
 * @author Min-Hsien Weng
 *
 */
public class P1 extends Pattern{
	private final Expr lowerExpr;
	public P1(String V, Expr initExpr, Expr decr, Expr incr, String comparator, Expr lowerExpr) {
		super(V, initExpr, decr, incr, comparator);
		this.lowerExpr = lowerExpr;
	}

	

	@Override
	public String toString() {
		return "while_loop && loop_var("+V+") && decr("+V+", "+decr+")"
				+ " && init("+V+", "+initExpr+") &&  while_cond("+V+", > , "+lowerExpr+") =>"
				+ "loop_iters("+V+", "+initExpr+" - "+lowerExpr+")";
	}

	@Override
	public boolean isNil() {
		if(V!=null&&initExpr!=null&&decr!=null&&comparator.equals("gt")&&lowerExpr!=null){
			return false;
		}
		return true;
	}



	@Override
	public BigInteger getNumberOfIterations() {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
