package wyopcl.bound;

import java.math.BigInteger;

public class Domain {
	private final String name;
	private BigInteger lower_bound = null;
	private BigInteger upper_bound = null;
	
	public Domain(String name){
		this.name = name;
	}	
	
	public Domain(String name, BigInteger lower_bound, BigInteger upper_bound){
		this.name = name;
		this.lower_bound = lower_bound;
		this.upper_bound = upper_bound;
	}
	
	public String getName() {
		return name;
	}
	
	public BigInteger getLower_bound() {
		return lower_bound;
	}

	public void setLower_bound(BigInteger lower_bound) {
		this.lower_bound = lower_bound;
	}

	public BigInteger getUpper_bound() {
		return upper_bound;
	}

	public void setUpper_bound(BigInteger upper_bound) {
		this.upper_bound = upper_bound;
	}
}
