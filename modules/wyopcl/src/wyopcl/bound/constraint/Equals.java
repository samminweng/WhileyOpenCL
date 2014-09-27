package wyopcl.bound.constraint;

import java.math.BigInteger;

import wyopcl.bound.Bounds;
import wyopcl.bound.Domain;

/**
 * Implementing the propagation rule for the equality ( x == y )
 * 
 * @author mw169
 *
 */
public class Equals implements Constraint {
	private BigInteger x_min, x_max, y_min, y_max;
	private final String x, y;

	public Equals(String x, String y) {
		this.x = x;
		this.y = y;
	}
	
	/**
	 * Infer the bounds
	 */
	@Override
	public boolean inferBound(Bounds bnd) {
		
		Domain original_x = bnd.getDomain(x);
		Domain original_y = bnd.getDomain(y);
		
		
		try {
			x_min = bnd.getLower(x);
			x_max = bnd.getUpper(x);
			y_min = bnd.getLower(y);
			y_max = bnd.getUpper(y);
			
			// Check if the lower and upper bounds is infinity.
			// If not, then propagating the bounds from x to y
			if (x_min != null) {
				bnd.addLowerBound(y, x_min);
			}

			if (x_max != null) {
				bnd.addUpperBound(y, x_max);
			}

			// Propagating the bounds from y to x.
			if (y_min != null) {
				bnd.addLowerBound(x, y_min);
			}

			if (y_max != null) {
				bnd.addUpperBound(x, y_max);
			}
			
		} catch (Exception ex) {
			throw ex;
		}
		
		
		Domain updated_x = bnd.getDomain(x);
		Domain updated_y = bnd.getDomain(y);
		// Check whether the bounds has changed.
		if (original_x.compareTo(updated_x) == 0 && original_y.compareTo(updated_y) == 0) {
			return true;
		}

		return false;
		
	}



}
