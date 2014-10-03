package wyopcl.bound;

import java.util.ArrayList;

import wyopcl.bound.constraint.Constraint;

public class ConstraintList implements Cloneable{
	public ArrayList<Constraint> list;	
	public ConstraintList(){
		list = new ArrayList<Constraint>();		
	}

	public void addConstraint(Constraint c){
		list.add(c);
	}
	
	
	
	/**
	 * Iterate through the constraints to infer the bounds.
	 * @param bnd
	 * @return true if all the bounds are consistent or unchanged with all the constraints.
	 * 		   false otherwise.
	 */
	public boolean inferBound(Bounds bnd){
		//Iterate through the constraints to infer the bounds.
		boolean isFixedPointed = true;		
		for(Constraint c: list){
			//The inferBound method returns false when all the bounds.
			//So we negated the result and use the AND bitwise to combine all the results.
			isFixedPointed ^= !(c.inferBound(bnd));
		}				
		//Check if all the bounds are consistent or unchanged with all the constraints.
		//Is so, then the fixed pointed is reached.
		return isFixedPointed;
	}



	/**
	 * Repeatedly run the inferBound method.
	 * @param bnd
	 * @param iterations optional parameter. iterations[0] specifies the number of iterations. If not specifies, 
	 * the default value is 5. 
	 * @return true if bounds are consistent with all constraints. Otherwise, return false.
	 */
	public boolean inferFixedPoint(Bounds bnd, int... iterations){
		int MaxIteration = iterations.length >0 ? iterations[0] : 5;
		for(int i=0;i<MaxIteration;i++){
			boolean isFixedPointed = this.inferBound(bnd);
			if(isFixedPointed){
				return true;
			}
		}		
		return false;

	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		ConstraintList newConslist = new ConstraintList();
		//Deep copy the list
		ArrayList<Constraint> newlist = new ArrayList<Constraint>();
		for(Constraint cons: this.list){
			Constraint cloned = (Constraint) cons.clone();
			newlist.add(cloned);			
		}
		newConslist.list = newlist;
		return newlist;
	}
}
