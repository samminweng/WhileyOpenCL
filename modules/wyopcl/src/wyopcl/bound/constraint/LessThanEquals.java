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

public class LessThanEquals implements Constraint {
	private BigInteger min_x, max_y;
	private String x, y;	
	public LessThanEquals(String x, String y){
		this.x = x;
		this.y = y;
	}
	@Override
	public boolean inferBound(Bounds bnd) {
		
		try{
			Domain original_x = (Domain) bnd.getDomain(x).clone();
			Domain original_y = (Domain) bnd.getDomain(y).clone();
			//Propagate the lower bound from x to y.
			min_x = bnd.getLower(x);			
			if(min_x != null){
				bnd.addLowerBound(y, min_x);
			}		
			
			//Propagate the upper bound from y to x.			
			max_y = bnd.getUpper(y);
			if (max_y != null){
				bnd.addUpperBound(x, max_y);
			}
			
			Domain updated_x = bnd.getDomain(x);
			Domain updated_y = bnd.getDomain(y);
			// Check whether the bounds has changed.
			if (original_x.equals(updated_x) && original_y.equals(updated_y)) {
				return true;
			}
			
		}catch(Exception ex){
			internalFailure(ex.getMessage(),"LessThanEquals.java",null);
		}
		
		return false;
	}
	
}
