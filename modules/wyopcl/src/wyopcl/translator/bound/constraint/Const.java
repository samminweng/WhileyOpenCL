package wyopcl.translator.bound.constraint;

import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.Domain;

/***
 * Implements the propagation rule for the constant value assignment (e.g. x = 20 )
 * @author Min-Hsien Weng
 *
 */
public class Const extends Constraint{
	private final String x;
	private final BigInteger constant;
	public Const(String x, BigInteger constant){
		this.x = x;
		this.constant = constant;
	}	

	@Override
	public void inferBound(Bounds bnd) {
		//Assign the lower and upper bounds with constant value
		Domain new_domain = new Domain(x, constant, constant);
		bnd.getDomain(x).set(new_domain);
	}
	
	@Override
	public String toString() {
		return x + ":=" + constant;
	}
}
