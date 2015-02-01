package wyopcl.translator.symbolic.pattern;

import wyopcl.translator.symbolic.Expr;

/**
 * The abstract class for all pattern classes. This class is implemented with
 * <a href="http://www.tutorialspoint.com/design_pattern/null_object_pattern.htm">null object pattern</a>
 * @author Min-Hsien Weng
 *
 */
public abstract class Pattern {
	protected final String V;
	protected final Expr initExpr;
	protected final Expr incr;
	protected final Expr decr;
	protected Expr numberOfIterations;// the number of loop iterations in affine form. 
	
	public Pattern(String V, Expr initExpr, Expr decr, Expr incr){
			this.V = V;
			this.initExpr = initExpr;
			this.decr = decr;
			this.incr = incr;
	}
	
	public abstract boolean isNil();
	public abstract Expr getNumberOfIterations();
	
}
