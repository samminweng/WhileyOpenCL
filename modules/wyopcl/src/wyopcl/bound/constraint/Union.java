package wyopcl.bound.constraint;

import java.math.BigInteger;

import wyopcl.bound.Bounds;
/**
 * Implements the propagation rule for the constraint 'x \cup y = x'
 * @author Min-Hsien Weng
 *
 */
public class Union extends Constraint {
	private BigInteger min_x, max_x, min_y, max_y;
	private String x, y;
	public Union(String x, String y){
		this.x = x;
		this.y = y;
	}
	
	
	@Override
	public boolean inferBound(Bounds bnd) {
		bnd.isChanged = false;
		min_x = bnd.getLower(x);
		min_y = bnd.getLower(y);
		max_x = bnd.getUpper(x);
		max_y = bnd.getUpper(y);
		
		//Propagate the lower bounds to z
		if(min_x != null){
			//Get the smaller lower bounds of x and y and add that lower bound to z.
			if(min_y != null){				
				bnd.isChanged |= bnd.widenLowerBound(x, min_x.min(max_y));
				 
			}else{
				bnd.isChanged |= bnd.widenLowerBound(x, min_x);
			}			
		}else{
			if(min_y != null){
				bnd.isChanged |= bnd.widenLowerBound(x, min_y);
			}else{
				//Do nothing because both of lower bounds are -inf. 
			}
		}
		
		
		//Propagate the upper bounds to z.
		if(max_x != null){
			if(max_y != null){
				bnd.isChanged |= bnd.widenUpperBound(x, max_x.max(max_y));
			}else{
				bnd.isChanged |= bnd.widenUpperBound(x, max_x);
			}
			
		}else{
			if(max_y != null){
				bnd.isChanged |= bnd.widenUpperBound(x, max_y);
			}
		}
		
		
		return bnd.isChanged;
	}

}
