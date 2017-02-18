package wyopcl.translator.bound.constraint;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.Domain;


/**
 * Implements the propagation rule for constraint 
 * <code>
 * x <= y
 * </code> 
 * 
 * Rules are:
 * 1. x:=x intersect [-inf... y.max]
 * 2. y:=y intersect [x.min ... +inf]
 * 
 * 
 * </code>
 * </p>
 * @author Min-Hsien Weng
 *
 */

public class LessThanEquals extends Constraint {
	private BigInteger min_x, max_x, min_y, max_y;
	private String x, y;	
	public LessThanEquals(String x, String y){
		this.x = x;
		this.y = y;
	}
	@Override
	public void inferBound(Bounds bnd) {

		//Propagate the lower bound from x to y.
		min_x = bnd.getLower(x);
		max_x = bnd.getUpper(x);
		min_y = bnd.getLower(y);
		max_y = bnd.getUpper(y);
		
		// Update x domain
		if(max_y != null){
			Domain x_domain = new Domain(x, null, max_y);
			bnd.getDomain(x).intersect(x_domain);
		}

		// Update y domain
		if(min_x != null){
			Domain y_domain = new Domain(y, min_x, null);
			bnd.getDomain(y).intersect(y_domain);
		}
		

		//return true;
	}
	@Override
	public String toString() {
		return x +"<=" + y;
	}

}
