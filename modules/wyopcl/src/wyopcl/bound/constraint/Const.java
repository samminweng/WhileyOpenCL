package wyopcl.bound.constraint;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;

import wyopcl.bound.Bounds;
import wyopcl.bound.Domain;

/***
 *  Implementing the propagation rule for the constant value assignment (e.g. x = 20 )
 * @author mw169
 *
 */
public class Const implements Constraint{
	private final String x;
	private final BigInteger constant_value;
	public Const(String x, BigInteger constant_value){
		this.x = x;
		this.constant_value = constant_value;
	}
	

	@Override
	public boolean inferBound(Bounds bnd) {
		
		try {
			Domain original_x = (Domain)bnd.getDomain(x).clone();
			//Assign the lower and upper bounds.
			bnd.addLowerBound(x, constant_value);
			bnd.addUpperBound(x, constant_value);
			Domain updated_x = bnd.getDomain(x);	
			// Check whether the bounds has changed.
			if (original_x.equals(updated_x)) {
				return true;
			}
		} catch (Exception ex) {
			internalFailure(ex.getMessage(),"Const.java",null);;
		}

		return false;
	}
	

}
