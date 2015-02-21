package wyopcl.translator.symbolic.pattern;

import java.util.List;

import wyil.lang.Code;
import wyil.lang.Type;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.expression.LinearExpr;
/**
 * The 'null' object for pattern class.
 * @author Min-Hsien Weng
 *
 */
public class NullPattern extends Pattern {

	public NullPattern(List<Type> params, List<Code> blk, Configuration config) {
		super(params, blk, config);
		this.type = "NullPattern";
		this.isNil = true;
	}

	@Override
	public LinearExpr getNumberOfIterations() {
		return null;
	}

	@Override
	public String toString() {
		return "Undecidable Pattern";
	}

	@Override
	public List<Code> getPartByName(String name) {
		return null;
	}
}
