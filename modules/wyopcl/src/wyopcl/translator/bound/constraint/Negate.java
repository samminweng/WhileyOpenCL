package wyopcl.translator.bound.constraint;

import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.Domain;
/**
 * Implements the propagation rule for constraint 'Y := !X'
 * 
 * Rules are:
 * y:= [!max_x ... !min_x]
 * 
 * @author Min-Hsien Weng
 *
 */
public class Negate extends Constraint{
	private BigInteger min_x, max_x, min_y, max_y;
	private String x, y;
	public Negate(String x, String y){
		this.x = x;
		this.y = y;
	}


	@Override
	public void inferBound(Bounds bnd) {			
		//bnd.isChanged = false;
		//Before propagation
		min_x = bnd.getLower(x);
		max_x = bnd.getUpper(x);
		min_y = bnd.getLower(y);
		max_y = bnd.getUpper(y);

		// Y = !X
		BigInteger min = null;
		if(max_x != null){
			min = max_x.negate();
		}
		
		BigInteger max = null;
		if(min_x != null){
			max = min_x.negate();
		}
		
		// [!max_x .. !min_x]
		Domain y_domain = new Domain("y", min, max);
		bnd.getDomain(y).set(y_domain);
		
	}


	@Override
	public String toString() {
		return "!" + x + "=" + y;
	}



}
