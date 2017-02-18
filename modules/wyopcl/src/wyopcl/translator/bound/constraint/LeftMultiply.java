package wyopcl.translator.bound.constraint;

import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;

/**
 * Propagate the bounds of multiply (x * y = z)
 * 
 * If min(x) and min(y) is 0, min(z) is 0. 
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public class LeftMultiply extends Constraint {
	private BigInteger min_x, max_x, min_y, max_y, min_z, max_z;
	private String x, y, z;
	public LeftMultiply(String x, String y, String z) {
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
		
		
		// x * y = z
	    // When x or y is 0, the minimum of z is also inferred as zero
		if((min_x != null && min_x.equals(BigInteger.ZERO)) 
				&& (min_y != null && min_y.equals(BigInteger.ZERO))){
			bnd.isChanged |= bnd.setLowerBound(z, BigInteger.valueOf(0));
		}
		
		/*if((max_x != null && max_x.equals(BigInteger.ZERO))
				|| (max_y != null && max_y.equals(BigInteger.ZERO))){
			bnd.isChanged |= bnd.setUpperBound(z, BigInteger.valueOf(0));
		}*/
		
		//return bnd.isChanged;
	}

	@Override
	public String toString() {
		return  x + " * " + y + "=" + z;
	}
	
	
}
