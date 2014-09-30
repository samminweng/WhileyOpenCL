package wyopcl.bound.constraint;

import wyopcl.bound.Bounds;

/**
 * An interface of primitive constraints.
 * 
 * @author Min-Hsien Weng 
 *
 */
public interface Constraint {
	/**
	 * Infer bounds from the constraints and domains
	 * @param bnd
	 * @return true if the bounds are changed. Return false if the bounds remain the same.
	 */
	boolean inferBound(Bounds bnd);
}
