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
	public P4(String V, Expr initExpr, Expr decr, Expr incr, String comparator, Expr upperExpr) {
		super(V, initExpr, decr, incr, comparator);
		this.upperExpr = upperExpr;
	}


	@Override
	public String toString() {
		return "while_loop && loop_var("+V+") && incr("+V+", "+decr+")"
				+ " && init("+V+", "+initExpr+") &&  while_cond("+V+", < , "+upperExpr+") =>"
				+ "loop_iters("+V+", "+upperExpr+" - "+initExpr+"+1)";
	}
	
	@Override
	public boolean isNil() {
		if(V!=null&&initExpr!=null&&incr!=null&&comparator.equals("lt")&&upperExpr!=null){
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
