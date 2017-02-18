package wyopcl.translator.bound.constraint;

import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;

/**
 * Propagates the bounds for the constraint 'x:=y'.
 * 
 * Copy the bounds of 'y' to 'x'
 * 
 * Rules are to copy the bounds of 'y' to 'x'
 * x:=y
 * 
 * 
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public class Assign extends Constraint{
	private final String x,y;
	private BigInteger max_x, min_x, max_y, min_y;
	public Assign(String x, String y){
		this.x = x;
		this.y = y;
	}
	

	@Override
	public void inferBound(Bounds bnd) {
		//bnd.isChanged = false;
		max_x = bnd.getUpper(x);
		min_x = bnd.getLower(x);
		max_y = bnd.getUpper(y);
		min_y = bnd.getLower(y);
		
		bnd.getDomain(x).set(bnd.getDomain(y));
		//return bnd.isChanged;
	}
	@Override
	public String toString() {
		return x + ":=" + y;
	}
}
