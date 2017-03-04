package wyopcl.translator.bound;

import java.math.BigInteger;
import java.util.Comparator;

import wyopcl.translator.bound.Bounds.Threshold;


public class Domain implements Comparable<Domain>, Cloneable, Comparator<Domain> {
	private final String prefix = "_";
	private final String name;

	private BigInteger lower_bound;
	private BigInteger upper_bound;
	// Indicate the upper bound is increasing with iterations.
	//private boolean isUpperBoundIncreasing;
	//private boolean isLowerBoundDecreasing;
	// Indicate the initial status of bounds
	private boolean isLowerUnknown;
	private boolean isUpperUnknown;

	public Domain(String name, BigInteger lower, BigInteger upper){
		this.name= name;
		this.lower_bound = lower;
		this.upper_bound = upper;
		this.isLowerUnknown = false;
		this.isUpperUnknown = false;
	}


	public Domain(String name) {
		this.name = name;
		//this.isLowerBoundDecreasing = false;
		//this.isUpperBoundIncreasing = false;
		this.lower_bound = null;
		this.upper_bound = null;
		this.isLowerUnknown = true;
		this.isUpperUnknown = true;
	}

	public String getName() {
		return name;
	}
	/**
	 * Get the register
	 * @return
	 */
	public int getReg(){
		//return the register no.
		if(name.matches("^"+prefix+"\\d.*")){
			if(name.contains(prefix)){
				String[] name_str = name.split(prefix);
				return Integer.parseInt(name_str[1]);
			}
			return Integer.parseInt(name.split("^"+prefix)[1]);
		}

		return -1;
		//Return the maximal values for other cases.
		//return Integer.MAX_VALUE;
	}

	private int getLabel(){
		if(name.contains("_")){
			String[] name_str = name.split("_");
			int lbl = Integer.parseInt(name_str[1].split("blklab")[1]);
			return lbl;
		}
		return -1;
	}


	public BigInteger getLowerBound() {
		return lower_bound;
	}

	public void set(BigInteger lower, BigInteger upper) {
		this.lower_bound = lower;
		this.upper_bound = upper;
		this.isLowerUnknown = false;
		this.isUpperUnknown = false;
		//this.isEmpty = false;
	}

	public void setLowerBound(BigInteger lower_bound) {
		this.lower_bound = lower_bound;
		//this.isLowerInit = false;
	}

	public BigInteger getUpperBound() {
		return upper_bound;
	}

	public void setUpperBound(BigInteger upper_bound) {
		this.upper_bound = upper_bound;
		//this.isUpperInit = false;
	}

	//	public boolean isUpperInit(){
	//		return this.isUpperInit;
	//	}
	//	
	//	public boolean isLowerInit(){
	//		return this.isLowerInit;
	//	}

	/**
	 * Compare the lower bound with the upper bound. 
	 * @return true if lower <= upper. Otherwise, return false.
	 */
	public boolean isConsistent(){
		if (this.isLowerUnknown || this.isUpperUnknown) {
			return false;
		}
		// Check if lower <= upper
		if(this.lower_bound!= null && this.upper_bound != null){
			if(this.lower_bound.compareTo(this.upper_bound)>0){
				return false;
			}
		}		
		return true;
	}


	/***
	 * Compare this domain with another domain (d). If both of them are equal,
	 * return 0. If this domain < d domain, return -1; If this domain > d
	 * domain, return 1;
	 */
	@Override
	public int compareTo(Domain d) {
		// Compare the name field.
		if (this.name.compareTo(d.getName()) != 0) {
			return this.name.compareTo(d.getName());
		}

		// Compare the lower_bound field
		if (this.lower_bound == null) {
			// That means this domain < d domain.
			if (d.lower_bound != null) {
				return -1;
			}
		} else {
			// This means this domain > d domain (l:-infinity)
			if (d.lower_bound == null) {
				return 1;
			} else {
				// Compare the lower bounds of this domain with d domain.
				if (this.lower_bound.equals(d.lower_bound) == false) {
					return this.lower_bound.compareTo(d.lower_bound);
				}
			}
		}

		// Compare the upper_bound field
		if (this.upper_bound == null) {
			// That means that this > d .
			if (d.upper_bound != null) {
				return 1;
			}
		} else {
			// This means that this < d (u:infinity)
			if (d.upper_bound == null) {
				return -1;
			} else {
				if (this.upper_bound.equals(d.upper_bound) == false) {
					return this.upper_bound.compareTo(d.upper_bound);
				}
			}
		}



		return 0;
	}

	@Override
	public String toString() {
		//Change the string format
		//return "Domain [name=" + name + ", lower_bound=" + this.lower_bound + ", upper_bound=" + this.upper_bound + "]";
		return "domain("+this.name+")\t= "+getBounds() + "\t";
		//+ "UB=" + this.isUpperBoundIncreasing +"\t"
		//+ "LB=" + this.isLowerBoundDecreasing; 
	}
	/**
	 * Gets the upper and lower bounds, and converts them to a string 
	 * @return 
	 */
	public String getBounds(){
		String lb;
		if(this.isLowerUnknown == true){
			lb = "empty";
			//lb = "\u2205";//Empty set
		}else if (this.lower_bound == null) {
			lb = "-infinity";
		}else{
			lb = this.lower_bound.toString();
		}
		//String ub = (this.upper_bound == null) ? "infinity" : this.upper_bound.toString();
		String ub;
		if(this.isUpperUnknown == true){
			ub = "empty";
			//ub = "\u2205";//Empty set 
		}else if(this.upper_bound == null){
			ub = "infinity";
		}else{
			ub = this.upper_bound.toString();
		}
		
		//Change the string format
		//return "Domain [name=" + name + ", lower_bound=" + this.lower_bound + ", upper_bound=" + this.upper_bound + "]";
		return "[" + lb + ".."  + ub + "]";
	}

	@Override
	public Object clone() throws CloneNotSupportedException {
		Domain d = new Domain(this.name);
		d.lower_bound = this.lower_bound;
		d.upper_bound = this.upper_bound;
		//d.isEmpty = this.isEmpty;
		d.isLowerUnknown = this.isLowerUnknown;
		d.isUpperUnknown = this.isUpperUnknown;
		return d;
	}

	public boolean equals(Object obj) {
		if (!(obj instanceof Domain)) {
			return false;
		}
		Domain d = (Domain) obj;
		// Compare this domain with obj. If the result == 0, return true.
		// Otherwise, return false.
		if (this.compareTo(d) == 0) {
			return true;
		} else {
			return false;
		}

	}


	/**
	 * Implemented for sort the domains
	 */
	@Override
	@Deprecated
	public int compare(Domain d0, Domain d1) {		
		int reg = d0.getReg() - d1.getReg();
		if(reg == 0){
			return d0.getLabel() - d1.getLabel();
		}else{
			return reg;
		}
	}

	public void union(Domain domain) {
		// Lower bounds
		BigInteger new_min = domain.getLowerBound();
		BigInteger old_min = this.getLowerBound();

		// Upper bounds
		BigInteger new_max = domain.getUpperBound();
		BigInteger old_max = this.getUpperBound();

		// Empty domain is initialized
		if(domain.isEmpty()){
			// Do nothing
			return;
		}

		if (this.isEmpty()) {
			this.set(new_min, new_max);
			return;
		}

		// This and domain are not Empty
		// New Lower bound is lower
		if(new_min == null || (old_min != null && new_min.compareTo(old_min) < 0)) {
			this.setLowerBound(new_min);
		}

		// New Upper bound is larger
		if(new_max == null || (old_max != null && new_max.compareTo(old_max) > 0)) {
			this.setUpperBound(new_max);
		}

		// Check if the domain is consistent 
		if(this.isConsistent() == false){
			// Set the domain as an empty set
			this.set(new Domain(this.getName()));
		}
		
		
		return;

	}

	public boolean isEmpty() {
		// TODO Auto-generated method stub
		return this.isLowerUnknown || this.isUpperUnknown;
	}

	/**
	 * Intersect current domain with passing domain. 
	 * For example, 
	 * Current Domain = [0 ... 10]
	 * New Domain = [0 ... 5]
	 * 
	 * The intersect domain is [0 ... 5]
	 * 
	 * More complicated example:
	 * Current Domain = [-inf ... 0]
	 * New Domain = [5 ... 5] 
	 * 
	 * The intersected domain is [5 ... 0]????
	 * 
	 * 
	 * @param domain
	 */
	public void intersect(Domain domain) {
		// Lower bounds
		BigInteger new_min = domain.getLowerBound();
		BigInteger old_min = this.getLowerBound();

		// Upper bounds
		BigInteger new_max = domain.getUpperBound();
		BigInteger old_max = this.getUpperBound();

		// Intersect empty 
		// Empty domain is initialized
		if(domain.isEmpty() || this.isEmpty()){
			// Create an
			this.setEmpty();
			return;
		}

		// Both current and new domain are not Empty
		// Update the domain with weaker (larger) lower bound
		if(new_min != null){
			if (old_min == null || old_min.compareTo(new_min) < 0){
				this.setLowerBound(new_min);
			}
		}
		
		// Update the domain with weaker (smaller) upper bound
		if(new_max != null) {
			if (old_max == null || old_max.compareTo(new_max) > 0){
				this.setUpperBound(new_max);
			}
		}
		
		// Check if the resulting domain is an consistent domain. (lower bound > upper bound)
		// If not, update the domain with an empty set. 
		// For example, the intersection of [5 ... 5] [-inf ...0] domains is [5 .. 0]
		// which is not consistent and caused by empty intersection
		// To solve the issue, we check if the new domain is inconsistent 
		if (this.isConsistent() == false){
			// Set the domain to be an empty domain
			this.set(new Domain(this.getName()));
		}

	}

	/**
	 * Reset the domain to be empty set
	 * 
	 */
	public void setEmpty() {
		this.lower_bound = null;
		this.upper_bound = null;
		this.isLowerUnknown = true;
		this.isUpperUnknown = true;

	}

	/**
	 * Over-write the current domain with passing domain
	 * 
	 * 
	 * @param domain
	 */
	public void set(Domain domain) {
		this.lower_bound = domain.getLowerBound();
		this.upper_bound = domain.getUpperBound();
		this.isLowerUnknown = domain.isLowerUnknown;
		this.isUpperUnknown = domain.isUpperUnknown;
	}

	
	/**
	 * Widens the lower bounds against a list of min values of integer types.
	 * (i.e. int16_t, int32_t and int64_t).
	 * 
	 * @param name
	 * @return
	 */
	private void widenLowerBoundsAgainstThresholds(BigInteger min) {		
		if (min != null) {
			// Check the max values and widen the upper bound
			BigInteger threshold = Threshold._I16_MIN.getValue();
			if (min.compareTo(threshold) < 0) {
				this.setLowerBound(threshold);
				return;
			} 
			threshold = Threshold._I32_MIN.getValue();
			if (min.compareTo(threshold) < 0) {
				this.setLowerBound(threshold);
				return;
			} 
			threshold = Threshold._I64_MIN.getValue();
			if (min.compareTo(threshold) < 0) {
				this.setLowerBound(threshold);
				return;
			}
			// Widen the upper bound to inf
			this.setLowerBound(null);
			return;
		}
	}
	
	/**
	 * Widens the upper bounds against a list of max values of integer types.
	 * (i.e. int16_t, int32_t and int64_t).
	 * 
	 * @param name
	 * @return
	 */
	private void widenUpperBoundsAgainstThresholds(BigInteger max) {
		if (max != null) {
			// Check the max values and widen the upper bound
			BigInteger threshold = Threshold._I16_MAX.getValue();
			if (max.compareTo(threshold) <= 0) {
				this.setUpperBound(threshold);
				return;
			}
			threshold = Threshold._I32_MAX.getValue();
			if (max.compareTo(threshold) <= 0) {
				this.setUpperBound(threshold);
				return;
			} 
			threshold = Threshold._I64_MAX.getValue();
			if (max.compareTo(threshold) <= 0) {
				this.setUpperBound(threshold);
				return;
			}
			// Widen the upper bound to inf
			this.setUpperBound(null);
			return;
		}

		return;
	}
	

	public void widenBound(boolean isGradual, Domain d) {
		
		// Check the empty set
		if(this.isEmpty()){
			this.set(d);
			return;
		}
			
		if(d.isEmpty()){
			// Do nothing
			return;
		}
		
		
		// Both are not empty
		// Check the lower bound is decreasing
		BigInteger this_min = this.getLowerBound();
		BigInteger d_min = d.getLowerBound();
		if(this_min != null && d_min != null
				&& this_min.compareTo(d_min)<0){
			if (isGradual) {
				widenLowerBoundsAgainstThresholds(this_min);
			} else {
				this.setLowerBound(null);
			}
		}
		
		// Check upper bound is increasing and Widen the upper bound
		BigInteger this_max = this.getUpperBound();
		BigInteger d_max = d.getUpperBound();
		if(this_max != null && d_max != null
				&& this_max.compareTo(d_max)>0){
			if (isGradual) {
				widenUpperBoundsAgainstThresholds(this_max);
			} else {
				this.setUpperBound(null);
			}
		}
		

	}

	/**
	 * Return the sum of 'x' and 'y' 
	 * 
	 * 
	 * @param x
	 * @param y
	 * @return
	 */
	public static BigInteger plus(BigInteger x, BigInteger y) {
		if (x == null || y == null) {
			return null;
		}
		return x.add(y);
	}
}
