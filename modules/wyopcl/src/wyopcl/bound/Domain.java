package wyopcl.bound;

import java.math.BigInteger;
import java.util.Comparator;
import java.util.regex.Pattern;

public class Domain implements Comparable<Domain>, Cloneable, Comparator<Domain> {
	private final String name;
	private BigInteger lower_bound = null;
	private BigInteger upper_bound = null;

	public Domain(String name) {
		this.name = name;
	}

	public Domain(String name, BigInteger lower_bound, BigInteger upper_bound) {
		this.name = name;
		this.lower_bound = lower_bound;
		this.upper_bound = upper_bound;
	}

	public String getName() {
		return name;
	}
	
	private int getReg(){
		
		if(name.contains("_")){
			String[] name_str = name.split("_");
			int reg = Integer.parseInt(name_str[0].substring(1));
			return reg;
		}
		return Integer.parseInt(name.substring(1));		
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
	}

	public BigInteger getUpperBound() {
		return upper_bound;
	}

	public void setUpperBound(BigInteger upper_bound) {
		this.upper_bound = upper_bound;
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
		String lb = (this.lower_bound == null) ? "-infinity" : this.lower_bound.toString();
		String ub = (this.upper_bound == null) ? "infinity" : this.upper_bound.toString();
		//Change the string format
		//return "Domain [name=" + name + ", lower_bound=" + this.lower_bound + ", upper_bound=" + this.upper_bound + "]";
		return "D("+this.name+") = [" + lb + ".."  + ub + "]";
	}

	@Override
	public Object clone() throws CloneNotSupportedException {
		Domain d = new Domain(this.name);
		d.lower_bound = this.lower_bound;
		d.upper_bound = this.upper_bound;
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

	@Override
	/**
	 * Implemented for sort the domains
	 */
	public int compare(Domain d0, Domain d1) {
		if(d0.getName()=="return" || d1.getName() == "return"){
			return 0;
		}
		int reg = d0.getReg() - d1.getReg();
		if(reg == 0){
			return d0.getLabel() - d1.getLabel();
		}else{
			return reg;
		}
	}

}
