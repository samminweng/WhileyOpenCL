package wyopcl.translator.bound.constraint;
import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.Domain;


/**
 * Implemented the Propagation rule for constraint (X+Y=Z) 
 * Assign the lower/upper bounds of Z with the addition results (X+Y). 
 * 
 * 
 * Rules are x+y = z
 * 1. z := [min(x)+min(y) ... max(x)+max(y)]
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public class LeftPlus extends Constraint {
	private BigInteger min_x, max_x, min_y, max_y, min_z, max_z;
	private final String x, y, z;

	public LeftPlus(String x, String y, String z) {
		this.x = x;
		this.y = y;
		this.z = z;
	}

	@Override
	public boolean inferBound(Bounds bnd) {
		bnd.isChanged = false;
		//Before propagation.
		min_x = bnd.getLower(x);
		max_x = bnd.getUpper(x);	
		min_y = bnd.getLower(y);
		max_y = bnd.getUpper(y);
		min_z = bnd.getLower(z);
		max_z = bnd.getUpper(z);
		
		// X+Y = Z
		Domain x_domain = bnd.getDomain(x);
		Domain y_domain = bnd.getDomain(y);
		
		if (x_domain.isEmpty() || y_domain.isEmpty()) {
			bnd.getDomain(z).setEmpty();
		} else {
			BigInteger lower = Domain.plus(min_x, min_y);
			BigInteger upper = Domain.plus(max_x, max_y);
		
			bnd.getDomain(z).set(lower, upper);
		}

		
		/*// Z = X + Y
		// Assign the lower bound of z variable with lower bound of x + y
		if (init_lower_x == false && 
				min_x != null && min_y != null) {
			BigInteger add = min_x.add(min_y);			
			bnd.isChanged |= bnd.setLowerBound(z, add);
		}
		// Assign the upper bound of z variable with upper bound of x + y 
		if (max_x != null && max_y != null) {
			BigInteger add = max_x.add(max_y);	
			bnd.isChanged |= bnd.setUpperBound(z, add);
		}*/

		return bnd.isChanged;
	}

	@Override
	public String toString() {
		return  x + "+" + y + "=" + z;
	}

}
