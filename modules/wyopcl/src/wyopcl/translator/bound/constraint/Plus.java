package wyopcl.translator.bound.constraint;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.Domain;

/**
 * Implements the propagation rule for the primitive constraint (e.g. x = y +
 * z).
 * 
 * @author Min-Hsien Weng
 *
 */
public class Plus extends Constraint{
	private BigInteger min_x, max_x, min_y, max_y, min_z, max_z;
	private String x, y, z;
	public Plus(String x, String y, String z) {
		this.x = x;
		this.y = y;
		this.z = z;
	}
	@Override
	public boolean inferBound(Bounds bnd) {		
		bnd.isChanged = false;
		//Before propagation
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
			BigInteger min = min_y.add(min_z);
			/*if(min_x != null){
				min = min_x.max(min);
			}*/			
			bnd.isChanged |= bnd.addLowerBound(x, min);
		}
		// Add the upper bound of x variable.
		if (max_y != null && max_z != null) {
			//min (max_x, max_y + max_z)
			BigInteger max = max_y.add(max_z);
			/*if(max_x != null){
				max = max_x.min(max);
			}*/
			bnd.isChanged |= bnd.addUpperBound(x, max);
		}

		// Apply the propagate rule on y variable.
		// Set the lower bound of y variable.
		if (min_x != null && max_z != null) {
			//max(y_min, min_x - max_z)
			BigInteger max = min_x.subtract(max_z);
			/*if(min_y != null){
				 max =  min_y.max(max);
			}*/			
			bnd.isChanged |= bnd.addLowerBound(y, max);
		}
		//Add the upper bound of y variable.
		if (max_x != null && min_z != null) {
			//min(y_max, max_x - min_z)
			BigInteger min = max_x.subtract(min_z);
			/*if(max_y != null){
				 min = max_y.min(min); 
			}*/			
			bnd.isChanged |= bnd.addUpperBound(y, min);
		}

		// Apply the propagate rule on z variable.
		// Add the lower bound of z variable.
		if (min_x != null && max_y != null) {
			// max (min_z, min_x - max_y)
			BigInteger max = min_x.subtract(max_y);
			/*if(min_z != null){
				max = min_z.max(max);
			}*/			 
			bnd.isChanged |= bnd.addLowerBound(z, max);
		}

		if (max_x != null && min_y != null) {
			// min (max_z, max_x - min_y)
			BigInteger min = max_x.subtract(min_y);
			/*if(max_z != null){
				min = max_z.min(min);
			}*/			
			bnd.isChanged |= bnd.addUpperBound(z, min);
		}


		return bnd.isChanged;
	}
	@Override
	public String toString() {
		return x + "=" + y + "+" + z;
	}

}