package wyopcl.translator.symbolic.pattern;

import java.util.List;

import wyil.lang.Code;
import wyopcl.translator.symbolic.Expr;

/**
 * The abstract class for all pattern classes. This class is implemented with
 * <a href="http://www.tutorialspoint.com/design_pattern/null_object_pattern.htm">null object pattern</a>
 * @author Min-Hsien Weng
 *
 */
public abstract class Pattern {
	protected final String prefix = "%";
	protected String type;//The pattern type
	protected boolean isNil;
	protected Expr numberOfIterations;// the number of loop iterations in affine form. 
	
	public Pattern(){			
	}
	
	public abstract boolean isNil();
	public abstract Expr getNumberOfIterations();
	
}
