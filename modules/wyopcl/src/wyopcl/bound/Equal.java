package wyopcl.bound;

import java.math.BigInteger;

/**
 * Implementing the propagation rule for the equality ( x = y )
 * @author mw169
 *
 */
public class Equal extends Bounds{
	private BigInteger min_x, max_x, min_y, max_y;
	public Equal(){
		
	}
	
	public boolean inferBound(String x, String y) {
		try{
			min_x = getLower(x);
			max_x = getUpper(x);
			min_y = getLower(y);
			max_y = getUpper(y);
			
			//Check if the lower and upper bounds of x have the value.
			//If not, then assign the bounds of y (i.e. propagating the bounds from y to x).
			if(min_x == null){
				this.addLowerBound(x, min_y);
			}
			
			if(max_x == null){
				this.addUpperBound(x, max_y);
			}
			//Propagating the bounds from x to y
			if(min_y == null){
				this.addLowerBound(y, min_x);
			}
			
			if(max_y == null){
				this.addUpperBound(y, max_x);
			}
			
			
			return true;
		}catch(Exception ex){
			return false;
		}
		
		
	}
}
