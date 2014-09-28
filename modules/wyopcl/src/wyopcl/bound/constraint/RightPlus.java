package wyopcl.bound.constraint;

import static wycc.lang.SyntaxError.internalFailure;
import java.math.BigInteger;

import wyopcl.bound.Bounds;
import wyopcl.bound.Domain;

/**
 * Implements the propagation rule for the primitive constraint (e.g. x = y +
 * z).
 * 
 * @author mw169
 *
 */
public class RightPlus implements Constraint{
	private BigInteger min_x, max_x, min_y, max_y, min_z, max_z;
	private String x, y, z;
	public RightPlus(String x, String y, String z) {
		this.x = x;
		this.y = y;
		this.z = z;
	}
	@Override
	public boolean inferBound(Bounds bnd) {
		try{			
			Domain original_x = (Domain) bnd.getDomain(x).clone();
			Domain original_y = (Domain) bnd.getDomain(y).clone();
			Domain original_z = (Domain) bnd.getDomain(z).clone();
			
			min_x = bnd.getLower(x);
			max_x = bnd.getUpper(x);

			min_y = bnd.getLower(y);
			max_y = bnd.getUpper(y);

			min_z = bnd.getLower(z);
			max_z = bnd.getUpper(z);

			// Apply the propagation rule on x variable.
			// Add the lower bound of x variable.
			if (min_y != null && min_z != null) {
				//max (min_x, min_y + min_z)
				bnd.addLowerBound(x, min_y.add(min_z));
			}
			// Add the upper bound of x variable.
			if (max_y != null && max_z != null) {
				//min (max_x, max_y + max_z)
				bnd.addUpperBound(x, max_y.add(max_z));
			}

			// Apply the propagate rule on y variable.
			// Set the lower bound of y variable.
			if (min_x != null && min_z != null) {
				//max(y_min, min_x - max_z)
				bnd.addLowerBound(y, min_x.subtract(max_z));
			}
			//Add the upper bound of y variable.
			if (min_x != null && max_z != null) {
				//min(y_max, max_x - min_z)
				bnd.addUpperBound(y, max_x.subtract(min_z));
			}

			// Apply the propagate rule on z variable.
			// Add the lower bound of z variable.
			if (min_x != null && min_y != null) {
				// max (min_z, min_x - max_y)
				bnd.addLowerBound(z, min_x.subtract(max_y));
			}

			if (min_x != null && max_y != null) {
				// min (max_z, max_x - min_y)
				bnd.addUpperBound(z, max_x.subtract(min_y));
			}
			
			Domain updated_x = bnd.getDomain(x);
			Domain updated_y = bnd.getDomain(y);
			Domain updated_z = bnd.getDomain(z);
			// Check whether the bounds has changed.
			if (original_x.compareTo(updated_x) == 0 && original_y.compareTo(updated_y) == 0 && original_z.compareTo(updated_z)==0) {
				return true;
			}

		}catch(Exception ex){
			internalFailure(ex.getMessage(),"RightPlus.java",null);
		}

		return false;
	}

}
