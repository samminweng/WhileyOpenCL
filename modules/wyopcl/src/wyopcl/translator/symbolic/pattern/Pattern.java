package wyopcl.translator.symbolic.pattern;

import wyopcl.translator.Configuration;

public class Pattern extends Object{
	protected final String prefix = "%";
	public final Configuration config;
	protected String type;//The pattern type
	protected boolean isNil;//The flag indicates whether this pattern is matched with the given loop (True: not matched False: Matched).
	
	public Pattern(Configuration config){
		this.config = config;
		this.isNil = true;//By default.
	}
	
	/**
	 * Check if the pattern is null.
	 * @return true if the pattern is null. Return false if the pattern is successfully constructed.
	 */
	public boolean isNil() {
		return this.isNil;
	}
	
	/**
	 * Get the pattern type.
	 * @return the pattern type. 
	 */
	public String getType(){
		return this.type;
	}

}
