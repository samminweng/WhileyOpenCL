package wyopcl.bound;

import java.math.BigInteger;

public class Domain implements Comparable<Domain>, Cloneable{
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

	public BigInteger getMin() {
		return lower_bound;
	}

	public void setMin(BigInteger lower_bound) {
		this.lower_bound = lower_bound;
	}

	public BigInteger getMax() {
		return upper_bound;
	}

	public void setMax(BigInteger upper_bound) {
		this.upper_bound = upper_bound;
	}

	@Override
	public int compareTo(Domain d) {
		//Compare the name field.
		if(this.name.compareTo(d.getName()) !=0){
			return this.name.compareTo(d.getName());
		}
		//Compare the lower_bound field
		if(this.lower_bound == null){
			return (d.lower_bound == null)? 0 : 1;
			//That means this domain > 'd' domain.
		}

		if (this.lower_bound.compareTo(d.lower_bound)!=0){
			return this.lower_bound.compareTo(d.lower_bound);
		}

		//Compare the upper_bound field
		if(this.upper_bound == null){
			return (d.upper_bound == null)? 0: 1;
			//That means that this domain > d domain.			
		}


		if (this.upper_bound.compareTo(d.upper_bound) != 0){
			return this.upper_bound.compareTo(d.upper_bound);
		}
		return 0;
	}


	@Override
	public String toString() {
		String lb = (this.lower_bound == null)? "-infinity": this.lower_bound.toString() ;
		String ub = (this.upper_bound == null)? "infinity": this.upper_bound.toString();
		
		
		return "Domain [name=" + name +
				", lower_bound=" + this.lower_bound +
				", upper_bound=" + this.upper_bound + "]";
	}
	
	
	
	
	@Override
	public Object clone() throws CloneNotSupportedException {
		Domain d = new Domain(this.name);
		d.lower_bound = this.lower_bound;
		d.upper_bound = this.upper_bound;
		return d;
	}

	
	public boolean equals(Object obj) {
		if(!(obj instanceof Domain)){
			return false;
		}
		
		//return super.equals(obj);
		Domain d = (Domain)obj;
		if(d.name != this.name){
			return false;
		}
		
		if(d.lower_bound == null){
			if(this.lower_bound != null)
				return false;
		}else{
			if(this.lower_bound==null || !(d.lower_bound.equals(this.lower_bound)))
				return false;
		}		
		
		if(d.upper_bound == null){
			if(this.upper_bound != null)
				return false;
		}else{
			if(this.upper_bound== null || !(d.upper_bound.equals(this.upper_bound)))
				return false;
		}
		
		return true;
	}
	
	
	
	
}
