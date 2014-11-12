package wyopcl.bound.constraint;

import java.math.BigInteger;

import wyopcl.bound.Bounds;
/**
 * Implements the propagation rule for the constraint 'x = x \cup y'
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
		max_x = bnd.getUpper(x);
		min_y = bnd.getLower(y);
		max_y = bnd.getUpper(y);

		//Propagate the lower bounds to x
		if(min_y != null){
			//Get the smaller lower bounds of x and y and add that lower bound to x.
			bnd.isChanged |= bnd.widenLowerBound(x, min_y);			
		}

		//Propagate the upper bounds to x.
		if(max_y != null){
			bnd.isChanged |= bnd.widenUpperBound(x, max_y);
		}

		return bnd.isChanged;
	}


	@Override
	public String toString() {
		return x + "=" + x + "cup" + y;
	}



}
