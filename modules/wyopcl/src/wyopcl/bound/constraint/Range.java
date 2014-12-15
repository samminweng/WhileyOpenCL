package wyopcl.bound.constraint;

import java.math.BigInteger;

import wyopcl.bound.Bounds;
/**
 * Implements the propagation rule for the constraint 'x := y' which set both lower and upper bounds. 
 * @author Min-Hsien Weng
 *
 */
public class Range extends Constraint {
	private BigInteger min_x, max_x, min_y, max_y;
	private String x, y;
	
	/*public Range(String x, String y){
		this.x = x;
		this.y = y;
	}*/
	
	public Range(String x, BigInteger min, BigInteger max){
		this.x = x;
		this.min_y = min;
		this.max_y = max;
	}
	

	@Override
	public boolean inferBound(Bounds bnd) {
		
		bnd.isChanged = false;
		min_x = bnd.getLower(x);
		max_x = bnd.getUpper(x);			
		if(min_x != min_y){
			bnd.getDomain(x).setLowerBound(min_y);
			bnd.isChanged |= true;
		}
		if(max_x != max_y){
			bnd.getDomain(x).setUpperBound(max_y);
			bnd.isChanged |= true;
		}
		
		return bnd.isChanged;
	}

	@Override
	public String toString() {
		if(y!=null){
			return x + ":="+ y;
		}else{
			return x+":=["+min_y+".."+max_y+"]";
		}
		
	}

}
