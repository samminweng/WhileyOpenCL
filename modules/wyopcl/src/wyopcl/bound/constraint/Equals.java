package wyopcl.bound.constraint;

import java.math.BigInteger;

import wyopcl.bound.Bounds;

/**
 * Implementing the propagation rule for the equality ( x = y )
 * @author mw169
 *
 */
public class Equals implements Constraint{
	private BigInteger min_x, max_x, min_y, max_y;
	private String x, y;
	public Equals(String x, String y){
		this.x = x;
		this.y = y;
	}
	@Override
	public boolean inferBound(Bounds bnd) {
		try{
			min_x = bnd.getLower(x);
			max_x = bnd.getUpper(x);
			min_y = bnd.getLower(y);
			max_y = bnd.getUpper(y);
			
			//Check if the lower and upper bounds of x have the value.
			//If not, then assign the bounds of y (i.e. propagating the bounds from y to x).
			if(min_y != null){
				bnd.addLowerBound(x, min_y);
			}
			
			if(max_y != null){
				bnd.addUpperBound(x, max_y);
			}
			//Propagating the bounds from x to y
			if(min_x != null){
				bnd.addLowerBound(y, min_x);
			}
			
			if(max_x != null){
				bnd.addUpperBound(y, max_x);
			}		
			
		}catch(Exception ex){
			return false;
		}
		

		return true;
	}
}
