package wyopcl.translator.bound.constraint;

import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.Domain;

/**
 * Implementing the propagation rule for the equality ( x == y )
 * The rule gets the lower bounds of 'x and y'
 * and higher upper bounds of 'x and y'
 * 
 * For example, D(x)=[-10..10] D(y)=[0..5]. The resulting domains are
 * D(x)=[0..5] D(y)=[0..5] 
 * 
 * Rules are :
 * x:= x intersect [y.min ... y.max]
 * y:= y intersect [x.min ... x.max]
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public class Equals extends Constraint {
	private BigInteger x_min, x_max, y_min, y_max;
	private final String x, y;

	public Equals(String x, String y) {
		this.x = x;
		this.y = y;
	}

	/**
	 * Infer the bounds from x to y and from y to x.
	 */
	@Override
	public void inferBound(Bounds bnd) {
		x_min = bnd.getLower(x);
		x_max = bnd.getUpper(x);
		y_min = bnd.getLower(y);
		y_max = bnd.getUpper(y);

		// Update x domain
		Domain x_domain = new Domain(x, y_min, y_max);
		bnd.getDomain(x).intersect(x_domain);
				
		// Update y domain
		Domain y_domain = new Domain(y, x_min, x_max);
		bnd.getDomain(y).intersect(y_domain);
		
		/*
		if (x_min != null) {
			bnd.isChanged |= bnd.addLowerBound(y, x_min);
		}

		if (x_max != null) {
			bnd.isChanged |= bnd.addUpperBound(y, x_max);
		}

		// Propagating the bounds from y to x.
		if (y_min != null) {
			bnd.isChanged |= bnd.addLowerBound(x, y_min);
		}

		if (y_max != null) {
			bnd.isChanged |= bnd.addUpperBound(x, y_max);
		}*/

		//return bnd.isChanged;
	}

	@Override
	public String toString() {
		return x + "==" + y;
	}



}
