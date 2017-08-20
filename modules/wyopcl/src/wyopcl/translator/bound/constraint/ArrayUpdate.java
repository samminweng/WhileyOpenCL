package wyopcl.translator.bound.constraint;

import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.Domain;
/**
 * Implements the propagation rule for the array update constraint 'x[i] = y'
 * 
 * The rule gets the smaller lower bounds of 'x and y'
 * and higher upper bounds of 'x and y', and update the bound of 'x'
 * 
 * For example, D(x)=[-10..10] D(y)=[0..5]. The resulting domains are
 * D(x)=[-10..10] D(y)=[0..5] 
 * 
 * Rules are :
 * x:= x union [y.min ... y.max]
 * y:= y 
 * 
 * @author Min-Hsien Weng
 *
 */
//@Deprecated
public class ArrayUpdate extends Constraint {
	private BigInteger x_min, x_max, y_min, y_max;
	private String x, y;
	public ArrayUpdate(String x, String y){
		this.x = x;
		this.y = y;
	}

	@Override
	public void inferBound(Bounds bnd) {

		x_min = bnd.getLower(x);
		x_max = bnd.getUpper(x);
		y_min = bnd.getLower(y);
		y_max = bnd.getUpper(y);

		// Update x domain
		Domain x_domain = new Domain(x, y_min, y_max);
		bnd.getDomain(x).union(x_domain);
				
		// Update y domain
		//Domain y_domain = new Domain(y, x_min, x_max);
		//bnd.getDomain(y).intersect(y_domain);

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

	// Return the left op
	public String getLeftOp(){
		return this.x;
	}
	// Return the right op
	public String getRightOp(){
		return this.y;
	}

	@Override
	public String toString() {
		return x + "=" + x + "cup" + y;
	}



}
