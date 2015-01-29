package wyopcl.translator.symbolic.pattern;

import java.math.BigInteger;

public class NullPattern extends Pattern {

	public NullPattern() {
		super(null, null, null, null, null);
	}

	@Override
	public BigInteger getNumberOfIterations() {
		return null;
	}

	@Override
	public boolean isNil() {
		return true;
	}
}
