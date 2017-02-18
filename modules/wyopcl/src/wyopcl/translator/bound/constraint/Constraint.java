package wyopcl.translator.bound.constraint;

import wyopcl.translator.bound.Bounds;

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
	 *
	 */
	public abstract void inferBound(Bounds bnd);
	
	
}
