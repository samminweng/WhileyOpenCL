package wyopcl.translator.bound;



import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;

/***
 * adds the upper or lower bounds and keeps track of the bounds for all
 * variables.
 * 
 * @author Min-Hsien Weng
 *
 */
public class Bounds implements Cloneable{
	// Every subclass shares the 'bounds' variable;
	private HashMap<String, Domain> bounds;
	public boolean isChanged = false;
	
	public enum Threshold{
		_I64_MIN(){
			public BigInteger getValue(){
				return  new BigInteger("-9223372036854775808");	
			}
		}, INT_MIN(){
			public BigInteger getValue(){
				return new BigInteger("-2147483648");
			}
		}, SHRT_MIN(){
			public BigInteger getValue(){
				return new BigInteger("-32768");
			}
		}, SHRT_MAX(){
			public BigInteger getValue(){
				return new BigInteger("32767");
			}
		}, INT_MAX(){
			public BigInteger getValue(){
				return new BigInteger("2147483647");
			}
		}, _I64_MAX(){
			public BigInteger getValue(){
				return new BigInteger("9223372036854775807");
			}
		};
		
		public abstract BigInteger getValue();
		private Threshold(){
			
		}
	}

	public Bounds() {
		bounds = new HashMap<String, Domain>();
	}

	/**
	 * Get the domain by name
	 * 
	 * @param name
	 * @return
	 */
	public Domain getDomain(String name) {
		if (!bounds.containsKey(name)) {
			Domain d = new Domain(name, null, null);
			bounds.put(name, d);
		}
		return bounds.get(name);
	}
	/**
	 * Check if variable has been existed in bounds HashMap.
	 * @param name
	 * @return
	 */
	public boolean isExisting(String name){
		return bounds.containsKey(name);
	}

	public BigInteger getLower(String name) {
		return getDomain(name).getLowerBound();
	}
	
	public boolean setLowerBound(String name, BigInteger lower_bound){
		BigInteger existing_bound = getLower(name);
		//Check if existing bound == lower_bound
		if(existing_bound == null && lower_bound == null){
			return false;			
		}
		if(existing_bound != null && lower_bound != null && existing_bound.compareTo(lower_bound)==0){
			return false;			
		}		
		getDomain(name).setLowerBound(lower_bound);
		return true;
	}
	
	public BigInteger getUpper(String name) {
		return getDomain(name).getUpperBound();
	}
	
	public boolean setUpperBound(String name, BigInteger upper_bound){
		BigInteger existing_bound = getUpper(name);
		//Check if existing bound == upper_bound
		if(existing_bound == null && upper_bound == null){
			return false;			
		}
		if(existing_bound != null && upper_bound != null && existing_bound.compareTo(upper_bound)==0){
			return false;			
		}		
		getDomain(name).setUpperBound(upper_bound);
		return true;
	}
	
	
	/**
	 * 
	 * Widens the lower bound if existing lower bound > the new lower bound or 
	 * existing lower bound is -infinity.
	 * @param name the variable name
	 * @param new_min the new lower bound
	 * @return true if the lower bound is changed.
	 */
	public boolean widenLowerBound(String name, BigInteger new_min) {
		try {
			Domain existing_domain = getDomain(name);
			Domain new_domain = (Domain) existing_domain.clone();
			new_domain.setLowerBound(new_min);
			// Check if the new domain is smaller than existing domain.
			if(!existing_domain.equals(new_domain)){
				if (existing_domain.getLowerBound() != null || existing_domain.compareTo(new_domain) > 0) {
					bounds.put(name, new_domain);
					return true;
				}
			}
		} catch (Exception ex) {
			throw new RuntimeException(ex.getMessage());
		}
		return false;
	}
	/**
	 * Widens the upper bound if existing upper bound is < the new bound or
	 * existing upper bound is infinity 
	 * @param name
	 * @param new_max
	 * @return
	 */
	public boolean widenUpperBound(String name, BigInteger new_max) {
		try {
			Domain existing_domain = getDomain(name);
			Domain new_domain = (Domain) existing_domain.clone();
			new_domain.setUpperBound(new_max);			
			// Check if new domain is stronger than existing one.
			if(!existing_domain.equals(new_domain)){
				//if (existing_domain.getUpperBound() != null || existing_domain.compareTo(new_domain) < 0) {
					bounds.put(name, new_domain);
					return true;
				//}
			}
		} catch (Exception ex) {
			throw new RuntimeException(ex.getMessage());
		}
		return false;
	}
	
	
	
	/**
	 * Adds the lower bounds of a variable.
	 * @param name
	 * @param new_min
	 * @return true if bounds change. Otherwise, return false.
	 */
	public boolean addLowerBound(String name, BigInteger new_min) {
		Domain existing_domain = getDomain(name);
		Domain new_domain = null;
		try {
			new_domain = (Domain) existing_domain.clone();
			new_domain.setLowerBound(new_min);
			if(!existing_domain.equals(new_domain)){
				// Check the lower bound and update the lower bound
				// When the existing bound in '-infinity' Or the new lower bound is
				// 'larger'.
				if (new_domain.compareTo(existing_domain) > 0) {
					// new_domain.setMin(new_min);
					bounds.put(name, new_domain);				
					return true;
				}
			}

		} catch (Exception ex) {
			throw new RuntimeException(ex.getMessage());
		}
		return false;
	}
	
	
	/**
	 * Adds the upper bounds
	 * @param name
	 * @param new_max
	 * @return true if bounds change. Otherwise, return false.
	 */
	public boolean addUpperBound(String name, BigInteger new_max) {
		Domain existing_domain = getDomain(name);
		Domain new_domain = null;
		try {
			new_domain = (Domain) existing_domain.clone();
			new_domain.setUpperBound(new_max);
			if(!existing_domain.equals(new_domain)){
				// Check new domain is smaller (stronger) than existing one.
				if (new_domain.compareTo(existing_domain) < 0) {
					bounds.put(name, new_domain);
					return true;
				}
			}			
		} catch (Exception ex) {
			throw new RuntimeException(ex.getMessage());
		}
		return false;
	}


	/**
	 * Take the union of current bounds and the new bounds
	 * to produce a new bounds which contains all the bounds in current or new or both bounds.
	 * @param bnd the new bounds
	 */
	public void union(Bounds bnd){		
		for(String name: bnd.bounds.keySet()){
			if(bnd.isExisting(name)){
				//Lower bounds
				BigInteger new_min = bnd.getLower(name);
				//Upper bounds
				BigInteger new_max = bnd.getUpper(name);
				if(this.isExisting(name)){
					BigInteger min_current = this.getLower(name);
					//Find the min (this, parent)
					if(min_current != null && new_min!=null){
						new_min = new_min.min(min_current);
					}
					
					BigInteger max_current = this.getUpper(name);
					//Find the max (this, parent)
					if(max_current != null && new_max!=null){
						new_max = new_max.max(max_current);
					}					
				}
				this.getDomain(name).setLowerBound(new_min);					
				this.getDomain(name).setUpperBound(new_max);
			}						
		}		
	}
	
	/**
	 * Widens the upper bounds against a list of max values of integer types.
	 * (i.e. short, int and long long).
	 * @param name
	 * @return
	 */
	public boolean widenUpperBoundsAgainstThresholds(String name){
		BigInteger max = getUpper(name);
		if(max!= null){
			//Check the max values and widen the upper bound
			BigInteger threshold = Threshold.SHRT_MAX.getValue();
			if(max.compareTo(threshold)<0){
				return widenUpperBound(name, threshold);
			}else{
				threshold = Threshold.INT_MAX.getValue();
				if(max.compareTo(threshold)<0){
					return widenUpperBound(name, threshold);
				}else{
					threshold = Threshold._I64_MAX.getValue();
					if(max.compareTo(threshold)<0){
						return widenUpperBound(name, threshold);
					}else{
						//Widen the upper bound to inf
						return widenUpperBound(name, null);
					}
				}
			}
		}
		
		return false;
	}	

	/**
	 * Widens the lower bounds against a list of min values of integer types.
	 * (i.e. short, int and long long).
	 * @param name
	 * @return
	 */
	public boolean widenLowerBoundsAgainstThresholds(String name){
		BigInteger min = getLower(name);
		if(min!= null){
			//Check the max values and widen the upper bound
			BigInteger threshold = Threshold.SHRT_MIN.getValue();
			if(min.compareTo(threshold)<0){
				return widenLowerBound(name, threshold);
			}else{
				threshold = Threshold.INT_MIN.getValue();
				if(min.compareTo(threshold)<0){
					return widenLowerBound(name, threshold);
				}else{
					threshold = Threshold._I64_MIN.getValue();
					if(min.compareTo(threshold)<0){
						return widenLowerBound(name, threshold);
					}else{
						//Widen the upper bound to inf
						return widenLowerBound(name, null);
					}
				}
			}
		}
		
		return false;
	}
	
	
	/**
	 * Widen the upper bounds to + infinity (null)
	 * @param name
	 * @return
	 */
	public boolean widenUpperBoundsToInf(String name){
		BigInteger max = getUpper(name);
		if(max != null){			
			this.getDomain(name).setUpperBound(null);
			return true;
		}		
		return false;
	}
	
	/**
	 * Widen the lower bounds to - infinity (null)
	 * @param name
	 * @return
	 */
	public boolean widenLowerBoundsToInf(String name){
		BigInteger min = getLower(name);
		if(min != null){			
			this.getDomain(name).setLowerBound(null);
			return true;
		}		
		return false;
	}
	

	/**
	 * Check if all the bounds are consistent (lower bound <= upper bound)
	 * 
	 * @return true if bounds are consistent. Otherwise, return false.
	 */
	public boolean checkBoundConsistency() {
		boolean isConsistent = true;
		Iterator<Entry<String, Domain>> iterator = bounds.entrySet().iterator();
		while (iterator.hasNext()) {
			Entry<String, Domain> bnd = iterator.next();
			Domain d = bnd.getValue();
			// Check upper bound < lower bound. If so, return false;			
			isConsistent &= d.isConsistent();
		}
		return isConsistent;
	}

	@Override
	/**
	 * Prints out all the bounds. 
	 */
	public String toString() {
		String str = "";
		// Sort all the domains
		List<Domain> domains = new ArrayList<Domain>(bounds.values());
		//All the domains are sorted by names.
		Collections.sort(domains);
		for (Domain d : domains) {
			str += "\n\t"+ d.toString();
		}		
		domains = null;
		return str;
	}
	
	@Override
	public Object clone() {
		Bounds bnd = new Bounds();
		Iterator<Entry<String, Domain>> iterator = this.bounds.entrySet().iterator();
		while(iterator.hasNext()){
			Entry<String, Domain> entry = iterator.next();
			try {
				bnd.bounds.put(entry.getKey(), (Domain) entry.getValue().clone());
			} catch (CloneNotSupportedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return bnd;
	}

	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Bounds){
			Bounds bnd = (Bounds)obj;
			//Test the key set
			if(this.bounds.keySet().equals(bnd.bounds.keySet())){
				if(this.bounds.values().containsAll(bnd.bounds.values())){
					return true;
				}
			}
		}
		return false;
	}

}
