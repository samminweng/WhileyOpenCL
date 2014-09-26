package wyopcl.bound.constraint;

import java.util.ArrayList;

import wyopcl.bound.Bounds;

public class ConstraintList {
	
	protected static ArrayList<Constraint> list;
	public ConstraintList(){
		list = new ArrayList<Constraint>();
	}
	
	public void addConstraint(Constraint c){
		list.add(c);
	}
	
	
	public boolean inferBound(Bounds bnd){
		//Iterate through the constraints to infer the bounds.
		for(Constraint c: list){
			if(!c.inferBound(bnd)){
				return false;
			}
		}
		return true;
	}
	
	
	
	/**
	 * Repeatedly run the inferBound method.
	 * @param bnd
	 * @param iterations optional parameter. iterations[0] specifies the number of iterations. If not specifies, 
	 * the default value is 5. 
	 * @return
	 */
	public boolean inferFixPoint(Bounds bnd, int... iterations){
		int MaxPass = iterations.length >0 ? iterations[0] : 5;
		
		for (int i=0; i<MaxPass; i++){
			if(!inferBound(bnd)){
				return false;
			}
		}
			
			
		return true;
		
	}
	
	
}
