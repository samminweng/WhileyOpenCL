package wyopcl.translator.symbolic.pattern;

import java.util.HashMap;
import java.util.List;

import wyil.lang.Code;
import wyopcl.translator.symbolic.Expr;
/**
 * The 'null' object for pattern class.
 * @author Min-Hsien Weng
 *
 */
public class NullPattern extends Pattern {

	public NullPattern(List<Code> blk, HashMap<String, Expr> expressiontable) {
		super(blk, expressiontable);
		this.isNil = true;
	}

	@Override
	public Expr getNumberOfIterations() {
		return null;
	}

	@Override
	public String toString() {
		return "Undecidable Pattern";
	}
}
