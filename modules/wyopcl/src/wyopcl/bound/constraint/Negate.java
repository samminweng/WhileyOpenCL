package wyopcl.bound.constraint;
import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;

import wyopcl.bound.Bounds;
import wyopcl.bound.Domain;
/**
 * Implements the propagation rule for constraint '!X = Y'
 * 
 * @author Min-Hsien Weng
 *
 */
public class Negate implements Constraint{
	private BigInteger min_x, max_x, min_y, max_y;
	private String x, y;
	public Negate(String x, String y){
		this.x = x;
		this.y = y;
	}
	
	
	@Override
	public boolean inferBound(Bounds bnd) {
		try{			
			Domain original_x = (Domain) bnd.getDomain(x).clone();
			Domain original_y = (Domain) bnd.getDomain(y).clone();
			
			min_x = bnd.getLower(x);
			max_x = bnd.getUpper(x);
			min_y = bnd.getLower(y);
			max_y = bnd.getUpper(y);


			// !X = Y
			// Add the lower bound of y variable.
			if (max_x != null) {
				//max (min_y, !min_x)
				bnd.addLowerBound(y, max_x.negate());
			}
			// Add the upper bound of x variable.
			if (min_x != null) {
				//min (max_y, !min_x)
				bnd.addUpperBound(y, min_x.negate());
			}
			
			Domain updated_x = bnd.getDomain(x);
			Domain updated_y = bnd.getDomain(y);
			// Check whether the bounds has changed.
			if (original_x.equals(updated_x) && original_y.equals(updated_y)) {
				return true;
			}

		}catch(Exception ex){
			internalFailure(ex.getMessage(),"RightPlus.java",null);
		}

		return false;
	}
	
	

}
