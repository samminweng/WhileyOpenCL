package wyopcl.bound.constraint;

import java.math.BigInteger;

import wyopcl.bound.Bounds;
/**
 * Implements the propagation rule for constraint 'x >= y'
 * 
 * @author Min-Hsien Wemg
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
	public boolean inferBound(Bounds bnd) {
		bnd.isChanged = false;
		//Propagate the lower bound from y to x.
		min_x = bnd.getLower(x);
		max_x = bnd.getUpper(x);
		min_y = bnd.getLower(y);
		max_y = bnd.getUpper(y);
		if(min_y != null){
			bnd.isChanged |= bnd.addLowerBound(x, min_y);
		}		

		//Propagate the upper bound from x to y.
		if (max_x != null){
			bnd.isChanged |= bnd.addUpperBound(y, max_x);
		}

		return bnd.isChanged;
	}


	@Override
	public String toString() {
		return "GreatThanEquals[ " + x + ">=" + y + " ]";
	}
	
	

}
