package wyopcl.bound;

import static wycc.lang.SyntaxError.internalFailure;

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
public class Bounds {
	// Every subclass shares the 'bounds' variable;
	//protected static HashMap<String, Domain> bounds;
	private HashMap<String, Domain> bounds;
	public boolean isChanged = false;
	
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

	public BigInteger getLower(String name) {
		return getDomain(name).getLowerBound();
	}

	public BigInteger getUpper(String name) {
		return getDomain(name).getUpperBound();
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
			if (existing_domain.getLowerBound() == null || existing_domain.compareTo(new_domain) > 0) {
				// new_domain.setMin(new_min);
				bounds.put(name, new_domain);
				return true;
			}
		} catch (Exception ex) {
			internalFailure(ex.getMessage(), "Bounds.java", null);
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
			if (existing_domain.getUpperBound() == null || existing_domain.compareTo(new_domain) < 0) {
				bounds.put(name, new_domain);
				return true;
			}
		} catch (Exception ex) {
			internalFailure(ex.getMessage(), "Bounds.java", null);
		}
		return false;
	}
	
	
	
	/**
	 * Widen the current domain with the bounds from the new domain.
	 * @param d the new domain
	 */
	public void widenBounds(Domain d) {		
		BigInteger new_min = d.getLowerBound();
		//Widen the lower bounds if the new lower bound < this lower bound.
		widenLowerBound(d.getName(), new_min);
		BigInteger new_max = d.getUpperBound();
		//Widen the upper bound if the new upper bound > current upper bound.
		widenUpperBound(d.getName(), new_max);

	}

	public boolean addLowerBound(String name, BigInteger new_min) {
		try {
			Domain existing_domain = getDomain(name);
			Domain new_domain = (Domain) existing_domain.clone();
			new_domain.setLowerBound(new_min);
			// Check the lower bound and update the lower bound
			// When the existing bound in '-infinity' Or the new lower bound is
			// 'larger'.
			if (new_domain.compareTo(existing_domain) > 0) {
				// new_domain.setMin(new_min);
				bounds.put(name, new_domain);
				return true;
			}
		} catch (Exception ex) {
			internalFailure(ex.getMessage(), "Bounds.java", null);
		}
		return false;
	}

	public boolean addUpperBound(String name, BigInteger new_max) {
		try {
			Domain existing_domain = getDomain(name);
			Domain new_domain = (Domain) existing_domain.clone();
			new_domain.setUpperBound(new_max);
			// Check new domain is smaller (stronger) than existing one.
			if (new_domain.compareTo(existing_domain) < 0) {
				bounds.put(name, new_domain);
				return true;
			}
		} catch (Exception ex) {
			internalFailure(ex.getMessage(), "Bounds.java", null);
		}
		return false;
	}

	
	/**
	 * Take the union of current bounds and the new bounds
	 * to produce a new bounds which contains all the bounds in current or new or both bounds.
	 * @param bnd the new bounds
	 */
	public void union(Bounds bnd){		
		Iterator<Entry<String, Domain>> iterator = bnd.getBounds().entrySet().iterator();
		while(iterator.hasNext()){
			Entry<String, Domain> entry = iterator.next();
			Domain new_domain = entry.getValue();
			widenBounds(new_domain);
		}		
	}
	

	/**
	 * Check if all the bounds are consistent (lower bound <= upper bound)
	 * 
	 * @return true if bounds are consistent. Otherwise, return false.
	 */
	public boolean checkBoundConsistency() {
		Iterator<Entry<String, Domain>> iterator = bounds.entrySet().iterator();
		while (iterator.hasNext()) {
			Entry<String, Domain> bnd = iterator.next();
			Domain d = bnd.getValue();
			// Check upper bound < lower bound. If so, return false;			
			BigInteger max = d.getUpperBound();
			BigInteger min = d.getLowerBound();
			if(max == null && min == null){
				return true;
			}else{
				if(max == null || min == null){
					return true;
				}else{
					if (max.compareTo(min) < 0) {
						return false;
					}
					
					return true;
				}
			}
		}
		return true;
	}

	@Override
	/**
	 * Prints out all the bounds. 
	 */
	public String toString() {
		String str = "Bounds [";
		// Sort all the domains
		List<Domain> domains = new ArrayList<Domain>(bounds.values());
		//All the domains are sorted by names.
		Collections.sort(domains, new Domain(""));
		for (Domain d : domains) {
			str += "\n\t" + d.toString();
		}
		str += "\n]";

		return str;
	}

	public HashMap<String, Domain> getBounds() {
		return bounds;
	}

}
