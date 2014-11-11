package wyopcl.bound.constraint;

import java.math.BigInteger;

import wyopcl.bound.Bounds;
/**
 * Implements the propagation rule for the constraint 'x = [low..up]',
 * which both lower and upper bounds are constants. 
 * @author Min-Hsien Weng
 *
 */
public class Range extends Constraint {
	private BigInteger min_x, max_x;
	private String x;
	public Range(String x, BigInteger low, BigInteger up){
		this.x = x;
		this.min_x = low;
		this.max_x = up;
	}	

	@Override
	public boolean inferBound(Bounds bnd) {
		
		bnd.isChanged = false;
		
		if(min_x != null){
			bnd.isChanged = bnd.addLowerBound(x, min_x);
		}
		
		if(max_x != null){
			bnd.isChanged = bnd.addUpperBound(x, max_x);
		}		
		
		return bnd.isChanged;
	}

	@Override
	public String toString() {
		return x + "= ["+ min_x + ".." + max_x + "]";
	}

}
