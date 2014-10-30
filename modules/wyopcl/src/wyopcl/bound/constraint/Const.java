package wyopcl.bound.constraint;

import java.math.BigInteger;

import wyopcl.bound.Bounds;

/***
 * Implements the propagation rule for the constant value assignment (e.g. x = 20 )
 * @author Min-Hsien Weng
 *
 */
public class Const extends Constraint{
	private final String x;
	private final BigInteger constant_value;
	public Const(String x, BigInteger constant_value){
		this.x = x;
		this.constant_value = constant_value;
	}
	

	@Override
	public boolean inferBound(Bounds bnd) {
		bnd.isChanged = false;	
		//Assign the lower and upper bounds.
		//Using the bitwise inclusive OR to disjunct the results of adding upper or lower bounds.
		//If one operation has changed the bounds, then return true;
		bnd.isChanged |= bnd.addLowerBound(x, constant_value);
		bnd.isChanged |= bnd.addUpperBound(x, constant_value);
		return bnd.isChanged;
	}
	@Override
	public String toString() {
		return "Const [ " + x + "=" + constant_value + " ]";
	}
}
