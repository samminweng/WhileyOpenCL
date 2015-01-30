package wyopcl.translator.symbolic.pattern;

import java.math.BigInteger;

import wyopcl.translator.symbolic.Expr;

public class NullPattern extends Pattern {

	public NullPattern() {
		super(null, null, null, null);
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
