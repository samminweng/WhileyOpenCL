package wyopcl.translator.bound.constraint;

import java.math.BigInteger;
import java.util.ArrayList;

import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.Domain;

/**
 * Propagate the bounds of multiply (z := x * y)
 * 
 * Rules are 
 * p1 := x_min * y_min
 * p2 := x_min * y_max
 * p3 := x_max * y_min
 * p4 := x_max * y_max
 * 
 * 
 * 1. min_z := min(p1, p2, p3, p4) 
 * 2. max_z := max(p1, p2, p3, p4)
 * 
 * Refer to Page.103, Marriott, Kim, and Peter J. Stuckey. 
 * Programming with constraints: an introduction. MIT press, 1998.
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public class LeftMultiply extends Constraint {
	private BigInteger min_x, max_x, min_y, max_y, min_z, max_z;
	private String x, y, z;
	public LeftMultiply(String x, String y, String z) {
		this.x = x;
		this.y = y;
		this.z = z;
	}
	
	@Override
	public void inferBound(Bounds bnd) {
		//bnd.isChanged = false;
		
		//Before propagation.
		min_x = bnd.getLower(x);
		max_x = bnd.getUpper(x);
		min_y = bnd.getLower(y);
		max_y = bnd.getUpper(y);
		min_z = bnd.getLower(z);
		max_z = bnd.getUpper(z);
		
		
		// x * y = z
		// Try all combination of x * y
		ArrayList<BigInteger> p = new ArrayList<BigInteger>();
		
		boolean isUpperInf = false;
		boolean isLowerInf = false; 
		// Check 
		if(min_x != null){
			// p1 = min_x * min_y;
			if(min_y != null){
				p.add(min_x.multiply(min_y));
			}else{
				// Lower bound is -infy
				isLowerInf = true;
			}
			// p2 = min_x * max_y
			if(max_y != null){
				p.add(min_x.multiply(max_y));
			}else{
				// Upper bound is inf
				isUpperInf = true;
			}
		}else{
			// Lower bound is -inf
			isLowerInf = true;
		}
		
		if(max_x != null){
			// p3 = min_x * min_y;
			if(min_y != null){
				p.add(max_x.multiply(min_y));
			}else{
				// lower bound is -inf
				isLowerInf = true;
			}
			// p4 = min_x * max_y
			if(max_y != null){
				p.add(max_x.multiply(max_y));
			}else{
				// Upper bound is inf
				isUpperInf = true;
			}
		}else{
			// Upper bound is inf
			isUpperInf = true;
		}
		
		// The new D(z) domain
		BigInteger min = null;
		BigInteger max = null;
		
		// Upper bound is Not inf (max := max(p1,p2,p3,p4)) 
		if(isUpperInf == false){
			// Find the maximum of 'p' array
			max = p.get(0);
			for(int i=1;i<p.size();i++){
				BigInteger product = p.get(i);
				if(product.compareTo(max)>0 ){
					max = product;
				}
			}			
		}
		// Lower bound is NOT -inf ( min := min(p1,p2,p3,p4)) 
		if(isLowerInf == false){
			// Find the maximum of 'p' array
			min = p.get(0);
			for(int i=1;i<p.size();i++){
				BigInteger product = p.get(i);
				if(product.compareTo(min)<0 ){
					min = product;
				}
			}			
		}
		
		// D(z)' = [min .. max]
		bnd.getDomain(z).set(new Domain(z, min, max));
		
		//return bnd.isChanged;
	}

	@Override
	public String toString() {
		return z + " = " + x + " * " + y;
		//return  x + " * " + y + "=" + z;
	}
	
	
}
