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
			
		//Assign the lower and upper bounds.
		bnd.addLowerBound(x, constant_value);
		bnd.addUpperBound(x, constant_value);
		return false;
	}
	

}
