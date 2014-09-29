package wyopcl.bound.constraint;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;

import wyopcl.bound.Bounds;
import wyopcl.bound.Domain;

/**
 * Implemented the Propagation rule for constraint (X+Y=Z)
 * 
 * @author Min-Hsien Weng
 *
 */
public class LeftPlus implements Constraint {
	private BigInteger min_x, max_x, min_y, max_y, min_z, max_z;
	private final String x, y, z;

	public LeftPlus(String x, String y, String z) {
		this.x = x;
		this.y = y;
		this.z = z;
	}

	@Override
	public boolean inferBound(Bounds bnd) {
		try {
			//Before propagation.
			Domain original_x = (Domain) bnd.getDomain(x).clone();
			Domain original_y = (Domain) bnd.getDomain(y).clone();
			Domain original_z = (Domain) bnd.getDomain(z).clone();

			min_x = bnd.getLower(x);
			max_x = bnd.getUpper(x);
			min_y = bnd.getLower(y);
			max_y = bnd.getUpper(y);
			min_z = bnd.getLower(z);
			max_z = bnd.getUpper(z);

			// X = Z - Y 
			// Add the lower bound of y variable.
			if (min_z != null && max_y != null) {
				// max(min_x, min_z - max_y)
				bnd.addLowerBound(x, min_z.subtract(max_y));
			}
			// Add the upper bound of y variable.
			if (max_z != null && min_y != null) {
				// min(max_x, max_z - min_y)
				bnd.addUpperBound(x, max_z.subtract(min_y));
			}

			// Y = Z - X
			// Add the lower bound of z variable.
			if (min_z != null && max_x != null) {
				// max (min_y, min_z - max_x)
				bnd.addLowerBound(y, min_z.subtract(max_x));
			}

			if (max_z != null && min_x != null) {
				// min (max_y, max_z - min_x)
				bnd.addUpperBound(y, max_z.subtract(min_x));
			}

			// Z = X + Y
			// Propagate the lower bound of z variable. 
			if (min_x != null && min_y != null) {
				// max (min_z, min_x + min_y)
				bnd.addLowerBound(z, min_x.add(min_y));
			}
			// Add the upper bound of z variable.
			if (max_x != null && max_y != null) {
				// min (max_z, max_x + max_y)
				bnd.addUpperBound(z, max_x.add(max_y));
			}

			//After the propagation rule.
			Domain updated_x = bnd.getDomain(x);
			Domain updated_y = bnd.getDomain(y);
			Domain updated_z = bnd.getDomain(z);
			// Check whether the bounds has changed.
			if (original_x.equals(updated_x) && original_y.equals(updated_y)
					&& original_z.equals(updated_z)) {
				return true;
			}

		} catch (Exception ex) {
			internalFailure(ex.getMessage(), "RightPlus.java", null);
		}

		return false;
	}

}
