package wyopcl.translator.bound;

import java.math.BigInteger;
import java.util.Comparator;


public class Domain implements Comparable<Domain>, Cloneable, Comparator<Domain> {
	private final String prefix = "_";
	private final String name;
	
	private BigInteger lower_bound;
	private BigInteger upper_bound;
	// Indicate the upper bound is increasing with iterations.
	private boolean isUpperBoundIncreasing;
	private boolean isLowerBoundDecreasing;
	// Indicate the initial status of bounds
	private boolean isLowerInit;
	private boolean isUpperInit;
	
	public Domain(String name) {
		this.name = name;
		this.isLowerBoundDecreasing = false;
		this.isUpperBoundIncreasing = false;
		this.lower_bound = null;
		this.upper_bound = null;
		this.isLowerInit = true;
		this.isUpperInit = true;
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

	public void setLowerBound(BigInteger lower_bound) {
		this.lower_bound = lower_bound;
		this.isLowerInit = false;
	}

	public BigInteger getUpperBound() {
		return upper_bound;
	}

	public void setUpperBound(BigInteger upper_bound) {
		this.upper_bound = upper_bound;
		this.isUpperInit = false;
	}

	public boolean isUpperInit(){
		return this.isUpperInit;
	}
	
	public boolean isLowerInit(){
		return this.isLowerInit;
	}
	
	/**
	 * Compare the lower bound with the upper bound. 
	 * @return true if lower <= upper. Otherwise, return false.
	 */
	public boolean isConsistent(){
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
		return "domain("+this.name+")\t= "+getBounds() + "\t"
				+ "UB=" + this.isUpperBoundIncreasing +"\t"
				+ "LB=" + this.isLowerBoundDecreasing; 
	}
	/**
	 * Gets the upper and lower bounds, and converts them to a string 
	 * @return 
	 */
	public String getBounds(){
		String lb = (this.lower_bound == null) ? "-infinity" : this.lower_bound.toString();
		String ub = (this.upper_bound == null) ? "infinity" : this.upper_bound.toString();
		//Change the string format
		//return "Domain [name=" + name + ", lower_bound=" + this.lower_bound + ", upper_bound=" + this.upper_bound + "]";
		return "[" + lb + ".."  + ub + "]";
	}
	
	@Override
	public Object clone() throws CloneNotSupportedException {
		Domain d = new Domain(this.name);
		d.lower_bound = this.lower_bound;
		d.upper_bound = this.upper_bound;
		d.isLowerInit = false;
		d.isUpperInit = false;
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
	public int compare(Domain d0, Domain d1) {		
		int reg = d0.getReg() - d1.getReg();
		if(reg == 0){
			return d0.getLabel() - d1.getLabel();
		}else{
			return reg;
		}
	}

	public boolean isUpperBoundIncreasing() {
		return isUpperBoundIncreasing;
	}

	public void setUpperBoundIncreasing(boolean isUpperBoundIncreasing) {
		this.isUpperBoundIncreasing = isUpperBoundIncreasing;
	}

	public boolean isLowerBoundDecreasing() {
		return isLowerBoundDecreasing;
	}

	public void setLowerBoundDecreasing(boolean isLowerBoundDecreasing) {
		this.isLowerBoundDecreasing = isLowerBoundDecreasing;
	}
}
