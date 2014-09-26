package wyopcl.bound;

import java.math.BigInteger;
import java.util.HashMap;

public class Bounds {
	//Every subclass shares the 'bounds' variable;
	
	protected static HashMap<String, Domain> bounds; 
	public Bounds(){
		bounds = new HashMap<String, Domain>();
	}
	
	public Domain getDomain(String name){
		if(bounds.containsKey(name)){
			return bounds.get(name);
		}
		return null;
	}
	
	public BigInteger getLower(String name){
		if(bounds.containsKey(name)){
			return bounds.get(name).getLower_bound();
		}
		return null;
	}
	
	public BigInteger getUpper(String name){
		if(bounds.containsKey(name)){
			return bounds.get(name).getUpper_bound();
		}
		return null;
	}
	
	public boolean addLowerBound(String name, BigInteger new_Lower_bound){
		try{
			Domain domain = bounds.get(name);
			if(domain == null){
				domain = new Domain(name, null, null);
			}
			//Check if the lower bound has the value. If not, then update the lower bound. 
			if(domain.getLower_bound() == null){
				domain.setLower_bound(new_Lower_bound);
			}else{
				//Otherwise, compare the new lower bound with existing one.
				//If the new bound is smaller, then update the lower bound.
				if(new_Lower_bound.compareTo(domain.getLower_bound())>0){
					domain.setLower_bound(new_Lower_bound);
				}
			}
			bounds.put(name, domain);
			return true;
		}catch(Exception ex){
			return false;
		}
		
	}
	
	public boolean addUpperBound(String name, BigInteger new_Upper_Bound){
		try{
			Domain domain = bounds.get(name);
			if(domain == null){
				domain = new Domain(name, null, null);			
			}
			
			if(domain.getUpper_bound()== null){
				domain.setUpper_bound(new_Upper_Bound);
			}else{
				//If the upper_bound is larger
				if(new_Upper_Bound.compareTo(domain.getUpper_bound())<0){
					domain.setUpper_bound(new_Upper_Bound);
				}
			}
			//Update the domain.
			bounds.put(name, domain);
			return true;
		}catch(Exception ex){
			return false;
		}
		
	}
	
	
	
	
	
}
