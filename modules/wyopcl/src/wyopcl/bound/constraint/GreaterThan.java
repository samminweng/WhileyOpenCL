package wyopcl.bound.constraint;

import java.math.BigInteger;

import wyopcl.bound.Bounds;
/**
 * Implements the propagation rule for 'x > y'
 * @author Min-Hsien Weng
 *
 */
public class GreaterThan extends Constraint {

	private BigInteger max_x, min_y;
	private final String x, y;	
	public GreaterThan(String x, String y){
		this.x = x;
		this.y = y;
	}

	@Override
	/**
	 * Propagate rule of inequality 'x > y'.
	 */
	public boolean inferBound(Bounds bnd) {
		bnd.isChanged = false;

		max_x = bnd.getUpper(x);
		min_y = bnd.getLower(y);

		//Propagate 'max_x - 1' to Upper bound of y.
		if (max_x != null){
			bnd.isChanged |= bnd.addUpperBound(y, max_x.subtract(BigInteger.ONE));
		}

		//Propagate 'min_y + 1' to lower bound of x 
		if(min_y != null){
			bnd.isChanged |= bnd.addLowerBound(x, min_y.add(BigInteger.ONE));
		}		

		return bnd.isChanged;

	}

	@Override
	public String toString() {
		return "GreaterThan [ " + x + ">" + y + " ]";
	}
}
