package wyopcl.bound.constraint;

import java.math.BigInteger;

import wyopcl.bound.Bounds;

public class LessThan implements Constraint {
	private BigInteger min_x, max_x, min_y, max_y;
	private String x, y;	
	public LessThan(String x, String y){
		this.x = x;
		this.y = y;
	}
	
	@Override
	/**
	 * Propagate rule of inequality 'x < y'.
	 */
	public boolean inferBound(Bounds bnd) {
		try{
			//Propagate 'lower bound of x + 1' to lower bound of y 
			min_x = bnd.getLower(x);
			min_y = bnd.getLower(y);
			if(min_x != null){
				bnd.addLowerBound(y, min_x.add(BigInteger.ONE));
			}		
			
			//Propagate 'upper bound of y - 1' to lower bound of x.
			max_x = bnd.getUpper(x);
			max_y = bnd.getUpper(y);
			if (max_y != null){
				bnd.addUpperBound(x, max_y.subtract(BigInteger.ONE));
			}						
			
		}catch(Exception ex){
			return false;
		}
		return true;
	}
	
	
	
}
