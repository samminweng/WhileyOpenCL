package wyopcl.translator.symbolic.pattern;

import wyopcl.translator.symbolic.Expr;
/**
 * The 'null' object for pattern class.
 * @author Min-Hsien Weng
 *
 */
public class NullPattern extends Pattern {

	public NullPattern() {
		super();
	}

	@Override
	public Expr getNumberOfIterations() {
		return null;
	}

	@Override
	public boolean isNil() {
		return true;
	}

	@Override
	public String toString() {
		return "Undecidable Pattern";
	}
}
