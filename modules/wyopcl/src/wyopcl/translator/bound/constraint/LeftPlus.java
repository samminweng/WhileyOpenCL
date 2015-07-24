package wyopcl.translator.bound.constraint;
import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;


/**
 * Implemented the Propagation rule for constraint (X+Y=Z) 
 * Assign the lower/upper bounds of Z with the addition results (X+Y). 
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

		
		// Z = X + Y
		// Assign the lower bound of z variable with lower bound of x + y
		if (min_x != null && min_y != null) {
			BigInteger add = min_x.add(min_y);			
			bnd.isChanged |= bnd.setLowerBound(z, add);
		}
		// Assign the upper bound of z variable with upper bound of x + y 
		if (max_x != null && max_y != null) {
			BigInteger add = max_x.add(max_y);	
			bnd.isChanged |= bnd.setUpperBound(z, add);
		}

		return bnd.isChanged;
	}

	@Override
	public String toString() {
		return  x + "+" + y + "=" + z;
	}

}
