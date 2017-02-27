package wyopcl.translator.bound.constraint;

import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.Domain;
/**
 * Implements the propagation rule for the constraint 'x := [min .. max]' 
 * 
 * Rule are used to propagate the input bounds/output bounds to/from the calling function
 * 
 * @author Min-Hsien Weng
 *
 */
public class Range extends Constraint {
	private BigInteger min_x, max_x;
	private String x;
	

	public Range(String x, BigInteger min, BigInteger max){
		this.x = x;
		this.min_x = min;
		this.max_x = max;
	}
	

	@Override
	public void inferBound(Bounds bnd) {
		Domain x_domain = new Domain(x, min_x, max_x);
		// Set D(x) with given domain
		bnd.getDomain(x).set(x_domain);
		
	}

	@Override
	public String toString() {
		return x+":=["+min_x+".."+max_x+"]";
	}

}
