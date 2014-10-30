package wyopcl.bound.constraint;

import java.math.BigInteger;
import wyopcl.bound.Bounds;

/**
 * Implementing the propagation rule for the equality ( x == y )
 * 
 * @author mw169
 *
 */
public class Equals extends Constraint {
	private BigInteger x_min, x_max, y_min, y_max;
	private final String x, y;

	public Equals(String x, String y) {
		this.x = x;
		this.y = y;
	}

	/**
	 * Infer the bounds from x to y and from y to x.
	 */
	@Override
	public boolean inferBound(Bounds bnd) {

		bnd.isChanged = false;
		x_min = bnd.getLower(x);
		x_max = bnd.getUpper(x);
		y_min = bnd.getLower(y);
		y_max = bnd.getUpper(y);

		// Check if the lower and upper bounds is infinity.
		// If not, then propagating the bounds from x to y
		if (x_min != null) {
			bnd.isChanged |= bnd.addLowerBound(y, x_min);
		}

		if (x_max != null) {
			bnd.isChanged |= bnd.addUpperBound(y, x_max);
		}

		// Propagating the bounds from y to x.
		if (y_min != null) {
			bnd.isChanged |= bnd.addLowerBound(x, y_min);
		}

		if (y_max != null) {
			bnd.isChanged |= bnd.addUpperBound(x, y_max);
		}

		return bnd.isChanged;

	}

	@Override
	public String toString() {
		return "Equals [ " + x + "==" + y + " ]";
	}



}
