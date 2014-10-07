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
			String var_name = entry.getKey();
			Domain new_domain = entry.getValue();
			Domain existing_domain = getDomain(var_name);
			existing_domain.widenBounds(new_domain);
			bounds.put(var_name, existing_domain);
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
		Collections.sort(domains);
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
