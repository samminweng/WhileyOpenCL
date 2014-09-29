package wyopcl.bound;

import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;

public class Bounds {
	// Every subclass shares the 'bounds' variable;
	protected static HashMap<String, Domain> bounds;
	private boolean isChanged = false;

	public Bounds() {
		bounds = new HashMap<String, Domain>();
	}

	/*
	 * public boolean isChanged() { return isChanged; }
	 * 
	 * public void setChanged(boolean isChanged) { this.isChanged = isChanged; }
	 */

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
		return getDomain(name).getMin();
	}

	public BigInteger getUpper(String name) {
		return getDomain(name).getMax();
	}

	public boolean addLowerBound(String name, BigInteger new_min) {
		isChanged = false;
		try {
			Domain existing_domain = getDomain(name);
			Domain new_domain = (Domain) existing_domain.clone();
			new_domain.setMin(new_min);
			// Check the lower bound and update the lower bound
			// When the existing bound in '-infinity' Or the new lower bound is
			// 'larger'.
			//if (new_domain.getMin() == null || new_min.compareTo(new_domain.getMin()) > 0) {
			if (new_domain.compareTo(existing_domain) > 0) {
				//new_domain.setMin(new_min);
				bounds.put(name, new_domain);
				isChanged = true;
			}
		} catch (Exception ex) {
			internalFailure(ex.getMessage(), "Bounds.java", null);
		}
		return isChanged;
	}

	public boolean addUpperBound(String name, BigInteger new_max) {
		isChanged = false;
		try {
			Domain existing_domain = getDomain(name);
			Domain new_domain = (Domain) existing_domain.clone();
			new_domain.setMax(new_max);		
			// when the existing upper bound is infinity (null) or the new upper
			// bound is 'smaller'.	
			//Check new domain is smaller (stronger) than existing one.
			if (new_domain.compareTo(existing_domain) < 0) {
				//new_domain.setMax(new_max);
				bounds.put(name, new_domain);
				isChanged = true;
			}			
		} catch (Exception ex) {
			internalFailure(ex.getMessage(), "Bounds.java", null);
		}
		return isChanged;
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
			if (d.getMax().compareTo(d.getMin()) < 0) {
				return false;
			}
		}

		return true;
	}

}
