package wyopcl.translator.bound.constraint;

import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.Domain;

/**
 * Implements the propagation rule for constraint
 * <code>
 * x < y
 * </code> 
 * 
 * 
 * Rules are:
 * 1. x:=x intersect [-inf... y.max -1]
 * 2. y:=y intersect [x.min+1 ... +inf]
 * 
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public class LessThan extends Constraint {
	private BigInteger min_x, max_x, min_y, max_y;
	private final String x, y;	
	public LessThan(String x, String y){
		this.x = x;
		this.y = y;
	}

	@Override
	/**
	 * Propagate rule of inequality 'x < y'.
	 */
	public boolean inferBound(Bounds bnd) {
		bnd.isChanged = false;
		min_x = bnd.getLower(x);
		max_x = bnd.getUpper(x);
		min_y = bnd.getLower(y);
		max_y = bnd.getUpper(y);
		
		// Update x domain
		if(max_y != null){
			Domain x_domain = new Domain(y, null, max_y.subtract(BigInteger.ONE));
			bnd.getDomain(x).intersect(x_domain);
		}
		
		
		// Update y domain
		if(min_x != null){
			Domain y_domain = new Domain(y, min_x.add(BigInteger.ONE), null);
			bnd.getDomain(y).intersect(y_domain);
		}
		
		
		

	/*	// Propagate 'upper bound of y - 1' to upper bound of x.
		if (max_y != null) {
			bnd.isChanged |= bnd.addUpperBound(x, max_y.subtract(BigInteger.ONE));
		}
		
	*/

		return bnd.isChanged;

	}

	@Override
	public String toString() {
		return x +"<"+ y;
	}



}
