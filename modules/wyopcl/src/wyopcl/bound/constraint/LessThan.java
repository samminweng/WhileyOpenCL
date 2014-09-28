package wyopcl.bound.constraint;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;

import wyopcl.bound.Bounds;
import wyopcl.bound.Domain;

public class LessThan implements Constraint {
	private BigInteger min_x, max_y;
	private final String x, y;	
	public LessThan(String x, String y){
		this.x = x;
		this.y = y;
	}

	@Override
	/**
	 * Propagate rule of inequality 'x < y'.
	 */
	public boolean inferBound(Bounds bnd) {

		try{
			Domain original_x = (Domain)bnd.getDomain(x).clone();
			Domain original_y = (Domain)bnd.getDomain(y).clone();
			//Propagate 'lower bound of x + 1' to lower bound of y 
			min_x = bnd.getLower(x);			
			if(min_x != null){
				bnd.addLowerBound(y, min_x.add(BigInteger.ONE));
			}		

			//Propagate 'upper bound of y - 1' to lower bound of x.			
			max_y = bnd.getUpper(y);
			if (max_y != null){
				bnd.addUpperBound(x, max_y.subtract(BigInteger.ONE));
			}
			Domain updated_x = bnd.getDomain(x);
			Domain updated_y = bnd.getDomain(y);
			// Check whether the bounds has changed.
			if (original_x.equals(updated_x) && original_y.equals(updated_y)) {
				return true;
			}

		}catch(Exception ex){
			internalFailure(ex.getMessage(),"LessThan.java",null);
		}

		return false;
		
	}



}
