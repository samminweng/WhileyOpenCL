package wyopcl.bound.constraint;
import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;

import wyopcl.bound.Bounds;
import wyopcl.bound.Domain;
/**
 * Implements the propagation rule for constraint 'X = -Y'
 * 
 * @author Min-Hsien Weng
 *
 */
public class Negate extends Constraint{
	private BigInteger min_x, max_x, min_y, max_y;
	private String x, y;
	public Negate(String x, String y){
		this.x = x;
		this.y = y;
	}


	@Override
	public boolean inferBound(Bounds bnd) {			
			bnd.isChanged = false;
			//Before propagation
			min_x = bnd.getLower(x);
			max_x = bnd.getUpper(x);
			min_y = bnd.getLower(y);
			max_y = bnd.getUpper(y);


			// !X = Y
			// Add the lower bound of y variable.
			if (max_x != null) {
				//max (min_y, !min_x)
				bnd.isChanged |= bnd.addLowerBound(y, max_x.negate());
			}
			// Add the upper bound of y variable.
			if (min_x != null) {
				//min (max_y, !min_x)
				bnd.isChanged |= bnd.addUpperBound(y, min_x.negate());
			}


			// Add the lower bound of x variable.
			if (max_y != null) {
				//max (min_y, !min_x)
				bnd.isChanged |= bnd.addLowerBound(x, max_y.negate());
			}
			// Add the upper bound of x variable.
			if (min_y != null) {
				//min (max_y, !min_x)
				bnd.isChanged |= bnd.addUpperBound(x, min_y.negate());
			}

		return bnd.isChanged;
	}


	@Override
	public String toString() {
		return "Negate [x=" + x + ", y=" + y + "]";
	}



}
