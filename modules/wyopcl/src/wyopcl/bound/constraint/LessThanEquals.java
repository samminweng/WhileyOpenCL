package wyopcl.bound.constraint;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;

import wyopcl.bound.Bounds;
import wyopcl.bound.Domain;


/**
 * Implemented for the propagation rule of constraint 'x<=y' 
 * @author mw169
 *
 */

public class LessThanEquals extends Constraint {
	private BigInteger min_x, max_y;
	private String x, y;	
	public LessThanEquals(String x, String y){
		this.x = x;
		this.y = y;
	}
	@Override
	public boolean inferBound(Bounds bnd) {

		bnd.isChanged = false;
		//Propagate the lower bound from x to y.
		min_x = bnd.getLower(x);
		max_y = bnd.getUpper(y);
		if(min_x != null){
			bnd.isChanged |= bnd.addLowerBound(y, min_x);
		}		

		//Propagate the upper bound from y to x.
		if (max_y != null){
			bnd.isChanged |= bnd.addUpperBound(x, max_y);
		}

		return bnd.isChanged;
	}
	@Override
	public String toString() {
		return "LessThanEquals [x=" + x + ", y=" + y + "]";
	}

}
