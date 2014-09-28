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
	 * @return true if bounds are consistent with all constraints. Otherwise, return false.
	 */
	public boolean checkBoundConsistency(Bounds bnd, int... iterations){
		int MaxIteration = iterations.length >0 ? iterations[0] : 5;
		for(int i=0;i<MaxIteration;i++){
				//Iterate through the constraints to infer the bounds.
				int consistent = 0;
				for(Constraint c: list){
					if(c.inferBound(bnd)){
						//If the bounds are consistent, then add the counter.
						consistent++;
					}
				}				
				//Check if the bounds are consistent with all the constraints.
				if(consistent == list.size()){
					System.out.println("isBoundConsistent = "+true);
					return true;
				}
		}


		return false;

	}


}
