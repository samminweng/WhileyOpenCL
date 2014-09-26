package wyopcl.bound.constraint;

import wyopcl.bound.Bounds;

public interface Constraint {
	boolean inferBound(Bounds bnd);
}
