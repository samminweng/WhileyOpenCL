package wyopcl.translator.bound.constraint;

import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.Domain;
/**
 * Implements the propagation rule for constraint 'Y := !X'
 * 
 * Rules are:
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public class Negate extends Constraint{
	private BigInteger min_x, max_x, min_y, max_y;
	private String x, y;
	public Negate(String x, String y){
		this.x = x;
		this.y = y;
	}


	@Override
	public void inferBound(Bounds bnd) {			
		//bnd.isChanged = false;
		//Before propagation
		min_x = bnd.getLower(x);
		max_x = bnd.getUpper(x);
		min_y = bnd.getLower(y);
		max_y = bnd.getUpper(y);


		// Y = !X
		// Add the lower bound of y variable.
		if (max_x != null) {
			//max (min_y, !min_x)
			bnd.setLowerBound(y, max_x.negate());
		}
		// Add the upper bound of y variable.
		if (min_x != null) {
			//min (max_y, !min_x)
			bnd.setUpperBound(y, min_x.negate());
		}

		//return bnd.isChanged;
	}


	@Override
	public String toString() {
		return "!" + x + "=" + y;
	}



}
