package wyopcl.bound.constraint;

import java.math.BigInteger;

import wyopcl.bound.Bounds;


/**
 * Implemented for the propagation rule of constraint 'x<=y' 
 * @author mw169
 *
 */

public class LessThanEquals implements Constraint {
	private BigInteger min_x, max_x, min_y, max_y;
	private String x, y;	
	public LessThanEquals(String x, String y){
		this.x = x;
		this.y = y;
	}
	@Override
	public boolean inferBound(Bounds bnd) {
		try{
			//Propagate the lower bound from x to y.
			min_x = bnd.getLower(x);
			min_y = bnd.getLower(y);
			if(min_x != null){
				bnd.addLowerBound(y, min_x);
			}		
			
			//Propagate the upper bound from y to x.
			max_x = bnd.getUpper(x);
			max_y = bnd.getUpper(y);
			if (max_y != null){
				bnd.addUpperBound(x, max_y);
			}						
			
			return true;
		}catch(Exception ex){
			return false;
		}
		
		
	}
	
}
