package wyopcl.translator.bound.constraint;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.Domain;


/**
 * Implements the propagation rule for constraint <code>x <= y</code> from 'y' to 'x'. It adds the upper bound  from 'y' to 'x' without making any change to 'y'.
 * For example, the following bounds and constraints:
 * <p><code> D(x) = [1..11], D(y)=[10..10], x < y</code></p> 
 * can be inferred as below:
 * <p><code>D(x) = [1..10], D(y)=[10..10]</code></p>
 * @author Min-Hsien Weng
 *
 */

public class LessThanEquals extends Constraint {
	private BigInteger min_x, max_x, min_y, max_y;
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
		max_x = bnd.getUpper(x);
		min_y = bnd.getLower(y);
		max_y = bnd.getUpper(y);
		//Propagate the upper bound from y to x.
		if (max_y != null){
			bnd.isChanged |= bnd.addUpperBound(x, max_y);
		}	
		/*
		if(min_x != null){
			bnd.isChanged |= bnd.addLowerBound(y, min_x);
		}*/		
		

		return bnd.isChanged;
	}
	@Override
	public String toString() {
		return x +"<=" + y;
	}

}
