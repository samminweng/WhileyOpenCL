package wyopcl.bound.constraint;

import wyopcl.bound.Bounds;

/**
 * An interface of primitive constraints.
 * 
 * @author Min-Hsien Weng 
 *
 */
public abstract class Constraint implements Cloneable{	
	@Override
	public Object clone() throws CloneNotSupportedException {
		//return this.clone();
		return super.clone();
	}

	/**
	 * Infer bounds from the constraints and domains
	 * @param bnd
	 * @return true if the bounds are changed. Return false if the bounds remain the same.
	 */
	public abstract boolean inferBound(Bounds bnd);
	
	
}
