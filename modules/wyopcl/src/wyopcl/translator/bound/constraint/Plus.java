package wyopcl.translator.bound.constraint;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.Domain;

/**
 * Implements the propagation rule for the primitive constraint (e.g. x + y = z).
 * 
 * The rules are based on Page 100, 'Programming with Constraints' Book
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
@Deprecated
public class Plus extends Constraint{
	private BigInteger min_x, max_x, min_y, max_y, min_z, max_z;
	private String x, y, z;
	public Plus(String x, String y, String z) {
		this.x = x;
		this.y = y;
		this.z = z;
	}
	@Override
	public void inferBound(Bounds bnd) {

		// X + Y = Z
		Domain x_domain = bnd.getDomain(x);
		Domain y_domain = bnd.getDomain(y);
		Domain z_domain = bnd.getDomain(z);
		//Before propagation.
		min_x = x_domain.getLower();
		max_x = x_domain.getUpper();	
		min_y = y_domain.getLower();
		max_y = y_domain.getUpper();
		min_z = z_domain.getLower();
		max_z = z_domain.getUpper();

		if (x_domain.isEmpty() || y_domain.isEmpty()) {
			bnd.getDomain(z).setEmpty();
		} else {
			if (z_domain.isEmpty()){
				// Update the 'z' domain 
				BigInteger lower = Domain.plus(min_x, min_y);
				BigInteger upper = Domain.plus(max_x, max_y);
			
				bnd.getDomain(z).set(lower, upper);
				
			}else{
				
				// New z domain (z = x + y)
				// z_lower = max(min_z, min_x + min_y)
				// z_upper = min(max_z, max_x + max_y)
				BigInteger z_lower = Domain.plus(min_x, min_y);
				BigInteger z_upper = Domain.plus(max_x, max_y);
				z_lower = z_lower.max(min_z);
				z_upper = z_upper.min(max_z);
				// Update 'z' domain
				bnd.getDomain(z).set(z_lower, z_upper);

				// New x domain (x = z - y)
				// x_lower = max(min_x, min_z - max_y)
				// x_upper = min(max_x, max_z - min_y)
				BigInteger x_lower = Domain.substract(min_z, max_y);
				BigInteger x_upper = Domain.substract(max_z, min_y);
				x_lower = x_lower.max(min_x); // max(x_lower, min_x);
				x_upper = x_upper.min(max_x); 
				// Update x 'domain
				bnd.getDomain(x).set(x_lower, x_upper);


				// New y domain (y = z - x)
				// y_lower = max(min_y, min_z - max_x)
				// y_upper = min(max_y, max_z - min_x)
				BigInteger y_lower = Domain.substract(min_z, max_x);
				BigInteger y_upper = Domain.substract(max_z, min_x);
				y_lower = y_lower.max(min_y);
				y_upper = y_upper.min(max_y);
				// Update 'y' domain
				bnd.getDomain(y).set(y_lower, y_upper);

			}
		}

	}
	@Override
	public String toString() {
		return x + "+" + y + "=" + z;
	}

}
