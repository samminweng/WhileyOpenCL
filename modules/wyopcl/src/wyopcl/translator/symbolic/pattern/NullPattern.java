package wyopcl.translator.symbolic.pattern;

import wyopcl.translator.Configuration;
/**
 * The 'null' object for pattern class. This class is implemented with <a href="http://www.tutorialspoint.com/design_pattern/null_object_pattern.htm">null object pattern</a>
 * @author Min-Hsien Weng
 *
 */
public class NullPattern extends Pattern {
	
	public NullPattern(Configuration config) {
		super(config);
		this.type = "NullPattern";
		
	}
	

	@Override
	public String toString() {
		return "Undecidable Pattern";
	}
	
}
