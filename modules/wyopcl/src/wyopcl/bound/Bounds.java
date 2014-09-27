package wyopcl.bound;

import java.math.BigInteger;
import java.util.HashMap;

public class Bounds {
	//Every subclass shares the 'bounds' variable;
	protected static HashMap<String, Domain> bounds; 
	public Bounds(){
		bounds = new HashMap<String, Domain>();
	}
	
	public void updateDomain(String name, Domain domain){
		bounds.put(name, domain);
	}
	/**
	 * Get the domain by name
	 * @param name
	 * @return
	 */
	public Domain getDomain(String name){
		if(!bounds.containsKey(name)){
			Domain d = new Domain(name, null, null);
			bounds.put(name, d);
		}
		return bounds.get(name);
	}
	
	public BigInteger getLower(String name){
		return getDomain(name).getMin();
	}
	
	public BigInteger getUpper(String name){
		return getDomain(name).getMax();
	}
	
	public void addLowerBound(String name, BigInteger new_min){
		try{
			Domain domain = getDomain(name);			
			//Check the lower bound and update the lower bound
			//When the existing bound in '-infinity' Or the new lower bound is 'larger'.
			if(domain.getMin() == null || new_min.compareTo(domain.getMin())>0){
				domain.setMin(new_min);
			}
			updateDomain(name, domain);
						
		}catch(Exception ex){
			throw ex;
		}
		
	}
	
	public void addUpperBound(String name, BigInteger new_bound){
		try{
			Domain domain = getDomain(name);	
			//Check the upper bound and update the upper bound
			//when the existing upper bound is infinity (null) or the new upper bound is 'smaller'.
			if(domain.getMax()== null || new_bound.compareTo(domain.getMax())<0){
				domain.setMax(new_bound);
			}
			//Update the domain.
			updateDomain(name, domain);
		}catch(Exception ex){
			throw ex;
		}
		
	}
	
	
	
	
	
}
