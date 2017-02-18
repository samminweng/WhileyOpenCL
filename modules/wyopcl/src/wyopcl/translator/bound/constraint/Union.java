package wyopcl.translator.bound.constraint;

import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;
/**
 * Implements the propagation rule for the constraint 'x = x \cup y'
 * @author Min-Hsien Weng
 *
 */
@Deprecated
public class Union extends Constraint {
	private BigInteger min_x, max_x, min_y, max_y;
	private String x, y;
	public Union(String x, String y){
		this.x = x;
		this.y = y;
	}


	@Override
	public void inferBound(Bounds bnd) {
		/*//bnd.isChanged = false;
		min_x = bnd.getLower(x);
		max_x = bnd.getUpper(x);
		min_y = bnd.getLower(y);
		max_y = bnd.getUpper(y);

		//Propagate the lower bounds to x
		if(min_y != null){
			if(min_x == null){
				bnd.isChanged |= bnd.addLowerBound(x, min_y);
			}else{
				//If the min_x > min_y, then widen the lower bound of x 
				if(min_x.compareTo(min_y)>0){
					bnd.isChanged |= bnd.widenLowerBound(x, min_y);	
				}				
			}				
		}

		//Propagate the upper bounds to x.
		if(max_y != null){
			if(max_x == null){
				bnd.isChanged |= bnd.addUpperBound(x, max_y);
			}else{
				//If the max_x < max_y, then widen the upper bound of x.
				if(max_x.compareTo(max_y)<0){
					bnd.isChanged |= bnd.widenUpperBound(x, max_y);
				}				
			}			
		}

		//return bnd.isChanged;
*/	}


	@Override
	public String toString() {
		return x + "=" + x + "cup" + y;
	}



}
