package wyopcl.translator.symbolic.pattern;

/**
 * The 'null' object for pattern class. This class is implemented with <a href="http://www.tutorialspoint.com/design_pattern/null_object_pattern.htm">null object pattern</a>
 * @author Min-Hsien Weng
 *
 */
public final class NullPattern extends Pattern {
	
	public NullPattern() {
		super();
		this.type = "NullPattern";
	}
	

	@Override
	public String toString() {
		return "Undecidable Pattern";
	}
	
}
