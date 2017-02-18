package wyopcl.translator.bound.constraint;

import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.Domain;
/**
 * Implements the propagation rule for constraint  
 * <code>
 * x > y
 * </code> 
 * 
 * 
 * Rules are:
 * 1. x:=x intersect [y.min+1 ... inf]
 * 2. y:=y intersect [-inf ... x.max-1]
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public class GreaterThan extends Constraint {
	private BigInteger max_x, min_x, max_y, min_y;
	private final String x, y;	
	public GreaterThan(String x, String y){
		this.x = x;
		this.y = y;
	}

	@Override
	/**
	 * Propagate rule of inequality 'x > y'.
	 */
	public void inferBound(Bounds bnd) {
		//bnd.isChanged = false;
		min_x = bnd.getLower(x);
		max_x = bnd.getUpper(x);
		min_y = bnd.getLower(y);
		max_y = bnd.getUpper(y);

		// Update x domain
		if(min_y != null){
			Domain x_domain = new Domain(x, min_y.add(BigInteger.ONE), null);
			bnd.getDomain(x).intersect(x_domain);
		}

		// Update y domain
		if(max_x != null){
			Domain y_domain = new Domain(y, null, max_x.subtract(BigInteger.ONE));
			bnd.getDomain(y).intersect(y_domain);
		}

		//return bnd.isChanged;

	}

	@Override
	public String toString() {
		return  x + ">" + y ;
	}
}
