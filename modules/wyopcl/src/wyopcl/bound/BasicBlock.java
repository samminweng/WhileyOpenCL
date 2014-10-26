package wyopcl.bound;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import wyopcl.bound.constraint.Constraint;
/**
 * The basic block for building the control flow graph (CFG).
 * @author Min-Hsien Weng
 *
 */
public class BasicBlock {
	private List<Constraint> constraintList;
	private List<BasicBlock> childNodes = null;
	private final String branch;
	private Bounds unionOfBounds;
	
	public BasicBlock(String branch){
		this.branch = branch;		
		this.unionOfBounds = new Bounds();
		this.constraintList = new ArrayList<Constraint>();
	}	
	
	/**
	 * Adds a child node to the current node, and
	 * infer the bounds of current node and combines
	 * the bounds of current and child nodes into 
	 * the union of bounds.  
	 * @param blk the child node.
	 */
	public void addChild(BasicBlock child){
		if(childNodes == null){
			childNodes = new ArrayList<BasicBlock>();
		}		
		childNodes.add(child);
		//Infer the bounds
		this.inferFixedPoint();
		//Take the union of bounds of child node and current node. 
		child.getBounds().union((Bounds) this.getBounds().clone());
	}
	
	
	public boolean isLeaf(){
		if(childNodes == null){
			return true;
		}		
		return false;
	}
	
	public String getBranch(){
		return branch;
	}
	
	public List<BasicBlock> getChildNodes(){
		return childNodes;
	}
	
	public void addConstraint(Constraint c){		
		constraintList.add(c);
	}	
	
	public Bounds getBounds(){
		return unionOfBounds;
	}	
	
	public void addBounds(String name, BigInteger new_min, BigInteger new_max){
		unionOfBounds.addLowerBound(name, new_min);
		unionOfBounds.addLowerBound(name, new_max);
	}
	
	
	/**
	 * Iterate through the constraints to infer the bounds.
	 * @param bnd
	 * @return true if all the bounds are consistent or unchanged with all the constraints.
	 * 		   false otherwise.
	 */
	private boolean inferBound(Bounds bnd){
		//Iterate through the constraints to infer the bounds.
		boolean isFixedPointed = true;		
		for(Constraint c: constraintList){
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
	public boolean inferFixedPoint(int... iterations){
		int MaxIteration = iterations.length >0 ? iterations[0] : 5;
		for(int i=0;i<MaxIteration;i++){
			boolean isFixedPointed = this.inferBound(unionOfBounds);
			if(isFixedPointed){			
				return true;
			}
		}		
		return false;
	}

	@Override
	public String toString() {
		/*return "BasicBlock [constraintList=" + constraintList
				+ ", parent=" + parent 
				+ ", childNodes=" + childNodes
				+ ", branch=" + branch + ", unionOfBounds=" + unionOfBounds + "]";*/
		return "BasicBlock [union of Bounds=" + unionOfBounds + "]";
	}
	
	
	

}
