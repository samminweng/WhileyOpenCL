package wyopcl.translator.bound.constraint;

import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.Domain;
/**
 * Implements the propagation rule for constraint 
 * <code>x >= y</code> 
 * 
 * Rules are:
 * 1. x:=x intersect [y.min ... inf]
 * 2. y:=y intersect [-inf ... x.max]
 * </code></p>
 * @author Min-Hsien Weng
 *
 */
public class GreaterThanEquals extends Constraint {

	private BigInteger min_x, max_x, min_y, max_y;
	private String x, y;
	public GreaterThanEquals(String x, String y){
		this.x = x;
		this.y = y;
	}


	@Override
	public void inferBound(Bounds bnd) {
		//bnd.isChanged = false;

		min_x = bnd.getLower(x);
		max_x = bnd.getUpper(x);
		min_y = bnd.getLower(y);
		max_y = bnd.getUpper(y);

		// Update x domain
		if(min_y != null){
			Domain x_domain = new Domain(x, min_y, null);
			bnd.getDomain(x).intersect(x_domain);
		}

		// Update y domain
		if(max_x != null){
			Domain y_domain = new Domain(y, null, max_x);
			bnd.getDomain(y).intersect(y_domain);
		}



		/*	// Update 'x' domain
		if(min_y != null){
			Domain new_x = new Domain(x, min_y, null);
			bnd.getDomain(x).intersect(new_x);
		}

		// Update 'y' domain
		if(max_x != null){
			Domain new_y = new Domain(y, null, max_x);
			bnd.getDomain(x).intersect(new_y);
		}


		//return bnd.isChanged;
		 */	}


	@Override
	public String toString() {
		return x + ">=" + y;
	}



}
