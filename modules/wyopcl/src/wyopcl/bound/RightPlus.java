package wyopcl.bound;

import java.math.BigInteger;

/**
 * Implements the propagation rule for the primitive constraint (e.g. x = y +
 * z).
 * 
 * @author mw169
 *
 */
public class RightPlus extends Bounds{
	private BigInteger min_x, max_x, min_y, max_y, min_z, max_z;
	public RightPlus() {
		
	}

	public boolean inferBound(String x, String y, String z) {
		try{			
			
			min_x = getLower(x);
			max_x = getUpper(x);
			
			min_y = getLower(y);
			max_y = getUpper(y);
			
			min_z = getLower(z);
			max_z = getUpper(z);

			// Apply the propagation rule on x variable.
			// Add the lower bound of x variable.
			if (min_y != null && min_z != null) {
				//max (min_x, min_y + min_z)
				this.addLowerBound(x, min_y.add(min_z));
			}
			// Add the upper bound of x variable.
			if (max_y != null && max_z != null) {
				//min (max_x, max_y + max_z)
				this.addUpperBound(x, max_y.add(max_z));
			}

			// Apply the propagate rule on y variable.
			// Set the lower bound of y variable.
			if (min_x != null && min_z != null) {
				//max(y_min, min_x - max_z)
				this.addLowerBound(y, min_x.subtract(max_z));
			}
			//Add the upper bound of y variable.
			if (min_x != null && max_z != null) {
				//min(y_max, max_x - min_z)
				this.addUpperBound(y, max_x.subtract(min_z));
			}

			// Apply the propagate rule on z variable.
			// Add the lower bound of z variable.
			if (min_x != null && min_y != null) {
				// max (min_z, min_x - max_y)
				this.addLowerBound(z, min_x.subtract(max_y));
			}

			if (min_x != null && max_y != null) {
				// min (max_z, max_x - min_y)
				this.addUpperBound(z, max_x.subtract(min_y));
			}

			return true;
		}catch(Exception ex){
			return false;
		}
		

	}

}
