package wyopcl.translator.bound.constraint;

import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;
/**
 * Implements the propagation rule for constraint <code>x > y</code> 
 * 
 * It gets the lower bound from 'y' and increments the bound by '1'. 
 * And then it adds the new lower bound to 'x' without making any change to 'y'. 
 * 
 * For example, the following bounds and constraints:
 * <p><code> 
 * D(x) = [1..11], D(y)=[10..10], x > y
 * 
 * </code></p> 
 * can be inferred as below:
 * <p><code>
 * D(x) = [11..11], D(y)=[10..10]
 * </code></p>
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
		max_x = bnd.getUpper(x);
		min_x = bnd.getLower(x);
		max_y = bnd.getUpper(y);
		min_y = bnd.getLower(y);
		
		//Propagate 'min_y + 1' to lower bound of x 
		if(min_y != null){
			bnd.isChanged |= bnd.addLowerBound(x, min_y.add(BigInteger.ONE));
		}
		
//		//Propagate the upper bound from y to x.
//		if(max_y != null){
//			bnd.isChanged |= bnd.addUpperBound(x, max_y.add(BigInteger.ONE));
//		}

		//return bnd.isChanged;

	}

	@Override
	public String toString() {
		return  x + ">" + y ;
	}
}
