package wyopcl.bound.constraint;

import wyopcl.bound.Bounds;

/**
 * An interface of primitive constraints.
 * 
 * @author mw169
 *
 */
public interface Constraint {	
	boolean inferBound(Bounds bnd);
}
