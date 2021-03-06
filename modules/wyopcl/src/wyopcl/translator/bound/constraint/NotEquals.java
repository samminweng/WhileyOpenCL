package wyopcl.translator.bound.constraint;

import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.Domain;
/**
 * The rule of NOT equal (' x != y ')
 * This rule has not been implemented yet.
 * 
 * @author Min-Hsien Weng
 *
 */
public class NotEquals extends Constraint {
	private BigInteger x_min, x_max, y_min, y_max;
	private final String x, y;

	public NotEquals(String x, String y) {
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
		
		//Domain x_domain = new Domain(x, y_min, y_max);
		//bnd.getDomain(x).intersect(x_domain);
		
		// Update y domain
		//Domain y_domain = new Domain(y, x_min, x_max);
		//bnd.getDomain(y).intersect(y_domain);
	
	}

	@Override
	public String toString() {
		return x + "!=" + y;
	}

}
