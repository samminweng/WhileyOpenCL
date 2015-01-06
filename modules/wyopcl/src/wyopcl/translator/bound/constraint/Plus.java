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
			if(min_x!= null && min.compareTo(min_x)<0){
				bnd.isChanged |= bnd.widenLowerBound(x, min);
			}else{
				bnd.isChanged |= bnd.addLowerBound(x, min);
			}
		}
		// Add the upper bound of x variable.
		if (max_y != null && max_z != null) {
			//min (max_x, max_y + max_z)
			BigInteger max = max_y.add(max_z);
			if(max_x!= null && max.compareTo(max_x)>0){
				bnd.isChanged |= bnd.widenUpperBound(x, max);				
			}else{
				bnd.isChanged |= bnd.addUpperBound(x, max);
			}			
		}

		return bnd.isChanged;
	}
	@Override
	public String toString() {
		return x + "=" + y + "+" + z;
	}

}
