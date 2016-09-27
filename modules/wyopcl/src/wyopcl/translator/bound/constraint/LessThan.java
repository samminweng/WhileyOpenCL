package wyopcl.translator.bound.constraint;

import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;

/**
 * Implements the propagation rule for constraint <code>x < y</code> from 'y' to 'x'. It gets the upper bound from 'y'
 * and decrements the bound by '1'. And then it adds the new upper bound to 'x' without making any change to 'y'.
 * </p>For example, the following bounds and constraints:
 * <p><code> D(x) = [1..11], D(y)=[10..10], x < y</code></p> 
 * can be inferred as below:
 * <p><code>D(x) = [1..9], D(y)=[10..10]</code></p>
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

		//Propagate 'upper bound of y - 1' to upper bound of x.
		if (max_y != null){
			bnd.isChanged |= bnd.addUpperBound(x, max_y.subtract(BigInteger.ONE));
		}
		
		//Propagate the 'lower bound of y -1'  to  lower bound of x
		if(min_y != null){
			bnd.isChanged |= bnd.addLowerBound(x, min_y.subtract(BigInteger.ONE));
		}

		return bnd.isChanged;

	}

	@Override
	public String toString() {
		return x +"<"+ y;
	}



}
