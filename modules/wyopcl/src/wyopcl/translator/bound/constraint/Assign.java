package wyopcl.translator.bound.constraint;

import java.math.BigInteger;

import wyopcl.translator.bound.Bounds;

/**
 * Propagates the bounds for the constraint 'x:=y'.
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
	public boolean inferBound(Bounds bnd) {
		bnd.isChanged = false;
		max_x = bnd.getUpper(x);
		min_x = bnd.getLower(x);
		max_y = bnd.getUpper(y);
		min_y = bnd.getLower(y);
		
		//Assign the lower and upper bounds.
		if((min_x == null) || (min_x != null && (min_y==null || min_y != null && min_x.compareTo(min_y)>0))){
			bnd.isChanged |= bnd.setLowerBound(x, min_y);
			//bnd.isChanged |= bnd.addLowerBound(x, min_y);
		}
		
		if((max_x == null) || (max_x != null && (max_y == null || max_y != null && max_x.compareTo(max_y)<0))){
			bnd.isChanged |= bnd.setUpperBound(x, max_y);
			//bnd.isChanged |= bnd.addUpperBound(x, max_y);
		}
		
		return bnd.isChanged;
	}
	@Override
	public String toString() {
		return x + ":=" + y;
	}
}
