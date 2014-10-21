package wyopcl.bound.constraint;

import java.math.BigInteger;

import wyopcl.bound.Bounds;

/**
 * Implements the propagation rule for constraint 'x = y'
 * @author Min-Hsien Weng
 *
 */
public class Assign extends Constraint {
	
	private BigInteger x_min, x_max, y_min, y_max;
	private final String x, y;

	public Assign(String x, String y) {
		this.x = x;
		this.y = y;
	}

	/**
	 * Infer the bounds from y to x.
	 */
	@Override
	public boolean inferBound(Bounds bnd) {

		bnd.isChanged = false;
		x_min = bnd.getLower(x);
		x_max = bnd.getLower(x);
		y_min = bnd.getLower(y);
		y_max = bnd.getUpper(y);

		// Propagating the bounds from y to x.
		if (y_min != null) {
			if(x_min != null){
				//If the bounds of x and y are not null, then the
				//widen operator is used to widen the bound. 
				bnd.isChanged |= bnd.widenLowerBound(x, y_min); 
			}else{
				bnd.isChanged |= bnd.addLowerBound(x, y_min);
			}
			
		}

		if (y_max != null) {
			if(x_max != null){
				bnd.isChanged |= bnd.widenUpperBound(x, y_max);
			}else{
				bnd.isChanged |= bnd.addUpperBound(x, y_max);
			}			
		}

		return bnd.isChanged;

	}

	@Override
	public String toString() {
		return "Assignment [ x=" + x + ", y=" + y + "]";
	}
	

}
