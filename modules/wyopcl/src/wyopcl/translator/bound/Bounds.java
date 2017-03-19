package wyopcl.translator.bound;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;

import wyopcl.Configuration;

/***
 * adds the upper or lower bounds and keeps track of the bounds for all
 * variables.
 * 
 * @author Min-Hsien Weng
 *
 */
public class Bounds implements Cloneable {
	// Every subclass shares the 'bounds' variable;
	private HashMap<String, Domain> bounds;
	public boolean isChanged = false;

	public enum Threshold {
		_I64_MIN() {
			public BigInteger getValue() {
				return new BigInteger("-9223372036854775808");
			}
		},
		_I32_MIN() {
			public BigInteger getValue() {
				return new BigInteger("-2147483648");
			}
		},
		_I16_MIN() {
			public BigInteger getValue() {
				return new BigInteger("-32768");
			}
		},
		_I16_MAX() {
			public BigInteger getValue() {
				return new BigInteger("32767");
			}
		},
		_UI16_MAX(){
			public BigInteger getValue() {
				return new BigInteger("65535");
			}
		},		
		_I32_MAX() {
			public BigInteger getValue() {
				return new BigInteger("2147483647");
			}
		},
		_UI32_MAX() {
			public BigInteger getValue() {
				return new BigInteger("4294967295");
			}
		},
		_I64_MAX() {
			public BigInteger getValue() {
				return new BigInteger("9223372036854775807");
			}
		},
		_UI64_MAX() {
			public BigInteger getValue() {
				return new BigInteger("18446744073709551615");
			}
		};

		public abstract BigInteger getValue();

		private Threshold() {

		}
	}

	public Bounds() {
		bounds = new HashMap<String, Domain>();
	}

	/**
	 * Sorts the domains in the Hashmap by their domain names
	 * 
	 * @return
	 */
	public List<Domain> sortedDomains() {
		// Sort the symbol tables
		List<Domain> sortedDomains = new ArrayList<Domain>(bounds.values());
		Collections.sort(sortedDomains);
		return sortedDomains;
	}

	/**
	 * Gets all the stored bounds data, including variables and their domains
	 * 
	 * @return
	 */
	public HashMap<String, Domain> getBounds() {
		return bounds;
	}

	/**
	 * Get the domain by name. If domain is not found, then add a new one.
	 * 
	 * @param name
	 * @return
	 */
	public Domain getDomain(String name) {
		if (!bounds.containsKey(name)) {
			bounds.put(name, new Domain(name));
			//throw new RuntimeException("Domain("+name+") NOT found.");
		}
		return bounds.get(name);
	}

	public BigInteger getLower(String name) {
		return getDomain(name).getLower();
	}

	public boolean setLowerBound(String name, BigInteger lower_bound) {
		BigInteger existing_bound = getLower(name);
		// Check if existing bound == lower_bound
		if (existing_bound == null && lower_bound == null) {
			return false;
		}
		if (existing_bound != null && lower_bound != null && existing_bound.compareTo(lower_bound) == 0) {
			return false;
		}
		getDomain(name).setLowerBound(lower_bound);
		return true;
	}

	public BigInteger getUpper(String name) {
		return getDomain(name).getUpper();
	}

	
	
	public boolean setUpperBound(String name, BigInteger upper_bound) {
		BigInteger existing_bound = getUpper(name);
		// Check if existing bound == upper_bound
		if (existing_bound == null && upper_bound == null) {
			return false;
		}
		if (existing_bound != null && upper_bound != null && existing_bound.compareTo(upper_bound) == 0) {
			return false;
		}
		getDomain(name).setUpperBound(upper_bound);
		return true;
	}

	/**
	 * 
	 * Widens the lower bound if existing lower bound > the new lower bound or
	 * existing lower bound is -infinity.
	 * 
	 * @param name
	 *            the variable name
	 * @param new_min
	 *            the new lower bound
	 * @return true if the lower bound is changed.
	 */
	public boolean widenLowerBound(String name, BigInteger new_min) {
		try {
			Domain existing_domain = getDomain(name);
			Domain new_domain = (Domain) existing_domain.clone();
			new_domain.setLowerBound(new_min);
			// Check if the new domain is smaller than existing domain.
			if (!existing_domain.equals(new_domain)) {
				// Old lower bound is NOT -infity 
				if (existing_domain.getLower() != null ||
						(existing_domain.getLower() != null && new_min != null && 
						existing_domain.getLower().compareTo(new_min)>=0)){
					//	|| existing_domain.compareTo(new_domain) > 0) {
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
	 * 
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
			if (!existing_domain.equals(new_domain)) {
				// if (existing_domain.getUpperBound() != null ||
				// existing_domain.compareTo(new_domain) < 0) {
				bounds.put(name, new_domain);
				return true;
				// }
			}
		} catch (Exception ex) {
			throw new RuntimeException(ex.getMessage());
		}
		return false;
	}

	/**
	 * Adds the lower bounds of a variable.
	 * Sets the given name to the intersection of its original bounds and [new_min .. inf].
	 * 
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
			
			// Check new lower bound > existing lower bound (stronger) 
			if (existing_domain.getLower() == null || !existing_domain.equals(new_domain)
				&& new_domain.getLower().compareTo(existing_domain.getLower()) > 0) {
				bounds.put(name, new_domain);
				return true;
			}

		} catch (Exception ex) {
			throw new RuntimeException(ex.getMessage());
		}
		return false;
	}

	/**
	 * Adds the upper bounds
	 * 
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
			/*if(existing_domain.getUpperBound() == null){
				// Update the upper bound
				bounds.put(name, new_domain);
				return true;
			}*/
			// Check new domain is smaller (stronger) than existing one.
			if (existing_domain.getUpper() == null || (!existing_domain.equals(new_domain)
					&& new_domain.getUpper().compareTo(existing_domain.getUpper()) < 0)) {
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
	 * Take the union of existing and new bounds to produce the final bounds.
	 * 
	 * @param new_bnd
	 *            new bounds
	 */
	public void union(Bounds new_bnd) {
		for (String var : new_bnd.bounds.keySet()) {
			getDomain(var).union(new_bnd.getDomain(var));
		}
	}
	
	/**
	 * Take the union of current and new domains
	 * 
	 * @param new_domain
	 */
	public void union(String var, Domain new_domain){
		getDomain(var).union(new_domain);
	}
	
	/**
	 * Perform the intersection of new and old bounds
	 * and return the resulting bounds.
	 * 
	 * @param new_bnd
	 */
	public void intersect(Bounds new_bnd) {
		for (String var : new_bnd.bounds.keySet()) {
			getDomain(var).intersect(new_bnd.getDomain(var));
		}
	}


	/**
	 * Check if all the bounds are NOT empty. If
	 * 
	 * @return true if the block is reach. Otherwise, return false.
	 */
	public boolean checkBoundReachable() {
		Iterator<Entry<String, Domain>> iterator = bounds.entrySet().iterator();
		while (iterator.hasNext()) {
			Entry<String, Domain> bnd = iterator.next();
			Domain d = bnd.getValue();
			// Check if domain is empty. If so, return false;
			if(d.isEmpty()){
				return false;
			}
		}
		return true;
	}

	@Override
	/**
	 * Prints out all the bounds. 
	 */
	public String toString() {
		String str = "";
		// Sort all the domains
		List<Domain> domains = sortedDomains();
		for (Domain d : domains) {
			str += "\n\t" + d.toString();
		}
		//domains = null;
		return str;
	}

	@Override
	public Object clone() {
		Bounds bnd = new Bounds();
		Iterator<Entry<String, Domain>> iterator = this.bounds.entrySet().iterator();
		while (iterator.hasNext()) {
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

	/**
	 * Compare two bounds
	 */
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Bounds) {
			Bounds bnd = (Bounds) obj;
			// Check that both bounds are the same size.
			if (this.bounds.size() != bnd.bounds.size()) {
				return false;
			}
			// For each variable, check that the domain from this bounds is
			// equal to the domain from
			// the obj bounds.
			for (String var : this.bounds.keySet()) {
				if (!this.getDomain(var).equals(bnd.getDomain(var))) {
					return false;
				}
			}
			return true;
		}
		return false;
	}

	/**
	 * 
	 * Check the bound change for variables in the bound Hashmap. For each variable,
	 * if the upper bound is larger than that of previous bound, then the variable
	 * has an increasing upper bound. In the same manner, if the lower bound is lower
	 * than that of previous one, then the variable has a decreasing lower bound. 
	 * 
	 * @param previous_iter
	 *            the domain of previous iteration
	 */
	@Deprecated
	public void checkBoundChange(Bounds prev) {

		for (String var : this.bounds.keySet()) {
			// Upper bound
			BigInteger upper_prev = prev.getUpper(var);
			BigInteger upper_curr = this.getUpper(var);
			if (upper_prev != null && upper_curr != null) {
				// Check if the upper bounds is increasing
				if (upper_prev.compareTo(upper_curr) < 0) {
					Domain d = this.getDomain(var);
					//boolean isIncreasing = d.isUpperBoundIncreasing();
					//isIncreasing |= true;
					//d.setUpperBoundIncreasing(isIncreasing);
				}
			}

			// Lower bound
			BigInteger lower_prev = prev.getUpper(var);
			BigInteger lower_curr = this.getUpper(var);
			if (lower_prev != null && lower_curr != null) {
				// Check if the upper bounds is increasing
				if (lower_prev.compareTo(lower_curr) > 0) {
					Domain d = this.getDomain(var);
					//d.setLowerBoundDecreasing(true);
				}
			}
		}
	}

	/**
	 * Widens the upper/lower bounds against thresholds, according to the bound
	 * changes and widen strategy
	 * 
	 * @param config
	 * @param blk
	 *            the block
	 */
	public void widenBounds(Configuration config, Bounds before) {
		// Get the strategy
		boolean isGradual = config.isGradualWiden();
		
		for (String var : bounds.keySet()) {
			Domain new_d = getDomain(var);
			Domain old_d = before.getDomain(var);
			new_d.widenBound(isGradual, old_d);	
		}
	}
	
	/**
	 * Add the Domain to the bound set
	 * 
	 * 
	 * @param x
	 */
	public void addDomain(Domain d) {
		String name = d.getName();
		if(!this.bounds.containsKey(name)){
			// Add a new domain
			this.bounds.put(d.getName(), d);
		}else{
			// Intersect the new domain with existing domain
			this.getDomain(name).intersect(d);
		}
	}

}
