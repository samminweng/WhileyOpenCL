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
		
		min_x = bnd.getLower(x);
		max_x = bnd.getUpper(x);
		min_y = bnd.getLower(y);
		max_y = bnd.getUpper(y);
		
		//The bounds of x
		//Propagate the lower bound from y to x.
		if(min_y != null){
			bnd.isChanged |= bnd.addLowerBound(x, min_y);
		}
		//Propagate the upper bound from y to x using the widening operator
		if(max_y != null){
			bnd.isChanged |= bnd.widenUpperBound(x, max_y);
		}
		

		return bnd.isChanged;
	}


	@Override
	public String toString() {
		return x + ">=" + y;
	}
	
	

}
