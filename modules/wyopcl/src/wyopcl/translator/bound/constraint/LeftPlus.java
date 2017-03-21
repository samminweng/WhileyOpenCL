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
	public void inferBound(Bounds bnd) {
		//bnd.isChanged = false;
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

		//return true;
	}

	@Override
	public String toString() {
		//return  x + "+" + y + "=" + z;
		return z + " = " + x + "+" + y ;
	}

}
