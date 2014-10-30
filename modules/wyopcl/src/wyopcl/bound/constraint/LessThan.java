package wyopcl.bound.constraint;

import java.math.BigInteger;
import wyopcl.bound.Bounds;


public class LessThan extends Constraint {
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

		bnd.isChanged = false;
		//Propagate 'lower bound of x + 1' to lower bound of y 
		min_x = bnd.getLower(x);
		max_y = bnd.getUpper(y);

		if(min_x != null){
			bnd.isChanged |= bnd.addLowerBound(y, min_x.add(BigInteger.ONE));
		}		

		//Propagate 'upper bound of y - 1' to lower bound of x.
		if (max_y != null){
			bnd.isChanged |= bnd.addUpperBound(x, max_y.subtract(BigInteger.ONE));
		}

		return bnd.isChanged;

	}

	@Override
	public String toString() {
		return "LessThan [ "+ x +"<"+ y + " ]";
	}



}
