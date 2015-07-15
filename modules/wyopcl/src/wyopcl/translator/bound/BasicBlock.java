package wyopcl.translator.bound;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;

import wyopcl.translator.bound.constraint.Constraint;
/**
 * The basic block for building the control flow graph (CFG).
 * @author Min-Hsien Weng
 *
 */
public class BasicBlock implements Comparable<BasicBlock>{
	private List<Constraint> constraints;
	private List<BasicBlock> childNodes = null;
	private List<BasicBlock> parentNodes = null;
	//The branch name
	private String branch;
	private BlockType type;
	private Bounds unionOfBounds;
	//Indicate if the bounds remain unchanged. False: unchanged. True: changed.
	private boolean isChanged;
	
	public enum BlockType{
		ENTRY(0){
			public String toString(){
				return "ENTRY";
			}
		},
		ASSERT(1){
			public String toString(){
				return "ASSERT";
			}
		},
		ASSUME(2){
			public String toString(){
				return "ASSUME";
			}
		},
		BLOCK(3){
			public String toString(){
				return "BLOCK";
			}
		},
		LOOP_HEADER(4){
			public String toString(){
				return "LOOP_HEADER";
			}
		},
		LOOP_BODY(5){
			public String toString(){
				return "LOOP_BODY";
			}
		},
		LOOP_EXIT(6){
			public String toString(){
				return "LOOP_EXIT";
			}
		},
		IF_BRANCH(7){
			public String toString(){
				return "IF";
			}
		},
		ELSE_BRANCH(8){
			public String toString(){
				return "ELSE";
			}
		},
		EXIT(9){
			public String toString(){
				return "EXIT";
			}
		};
		public int order;
		private BlockType(int order){
			this.order = order;
		}
	}
	/**
	 * Private constructor
	 */
	private BasicBlock(){
		this.unionOfBounds = new Bounds();
		this.constraints = new ArrayList<Constraint>();
	}	
	/**
	 * Constructing a basic block with a specific name and block type.
	 * @param branch the name of blk
	 * @param type the type of blk
	 */
	public BasicBlock(String branch, BlockType type){
		//Use the nested constructor to create the BasicBlock object.
		this();
		this.branch = branch;
		this.type = type;
		this.isChanged = false;
	}
	
	/**
	 * clear all the constraints.
	 */
	public void emptyConstraints(){
		this.constraints.clear();
		
	}
	/**
	 * Empty the bounds.
	 */
	public void emptyBounds(){
		this.unionOfBounds = null;
		this.unionOfBounds = new Bounds();
	}

	/**
	 * Adds a child node to the current node
	 * and also add the current node to the parent list of its child nodes.
	 * @param blk the child node.
	 */
	public void addChild(BasicBlock child){
		if(childNodes == null){
			childNodes = new ArrayList<BasicBlock>();
		}

		//Check if the child node has been added before.
		if(!childNodes.contains(child)){
			childNodes.add(child);
			//set the parent-child rel to the child node.
			child.addParent(this);	
		}

	}


	private void addParent(BasicBlock parent){
		if(parentNodes == null){
			parentNodes = new ArrayList<BasicBlock>();
		}		
		parentNodes.add(parent);
	}


	/**
	 * Combines the bounds of current and parent nodes into 
	 * the union of bounds. 
	 * Check if the var has been existed in the current bounds.
	 * If so, then the union operator takes 
	 * 
	 * min of current and parent' lower bounds and 
	 * max of these two blk's upper bounds.
	 * 
	 * And sets the bounds directly to current bounds. 
	 *  
	 * @param parent
	 */
	public void unionBounds(BasicBlock parent){
		//Take the union of bounds of parent node and current node.
		this.unionOfBounds.union((Bounds) parent.getBounds().clone());
	}


	/**
	 * Check if the block is the leaf node.
	 * @return
	 */
	public boolean isLeaf(){
		if(childNodes == null){
			return true;
		}		
		return false;
	}
	
	/**
	 * Check if the blk has the parent nodes.
	 * @return true if blk has parent. Otherwise, return false.
	 */
	public boolean hasParent(){
		if(parentNodes == null){
			return false;
		}
		return true;
	}

	/**
	 * Return the blk name.
	 * @return the name of blk.
	 */
	public String getBranch(){
		return this.branch;
	}
	/**
	 * Return the block type.
	 * @return
	 */
	public BlockType getType(){
		return this.type;
	}

	/**
	 * Return a list of child blks.
	 * @return
	 */
	public List<BasicBlock> getChildNodes(){
		return childNodes;
	}
	/**
	 * Return a list of parent blks.
	 * @return the list of blocks. If no parents is found, return an immutable 
	 * empty list.
	 */
	public List<BasicBlock> getParentNodes(){
		if(parentNodes == null){
			//Return an immutable list
			return Collections.emptyList();
		}
		
		return parentNodes;
	}

	/**
	 * Add a constraint to the list of constraints.
	 * @param c the constraint
	 */
	public void addConstraint(Constraint c){
		if(c != null && !constraints.contains(c)){
			constraints.add(c);
		}
	}	
	
	public Bounds getBounds(){		
		return unionOfBounds;
	}	

	public BigInteger getLower(String name){
		return unionOfBounds.getLower(name);
	}

	public BigInteger getUpper(String name){
		return unionOfBounds.getUpper(name);
	}
	/**
	 * adds the bounds of a register with the given bounds. 
	 * @param name
	 * @param new_min
	 * @param new_max
	 */
	public void addBounds(String name, BigInteger new_min, BigInteger new_max){
		unionOfBounds.addLowerBound(name, new_min);
		unionOfBounds.addUpperBound(name, new_max);
	}	
	
	/**
	 * Iterate through the constraints to infer the bounds 
	 * @return true if the bounds are changed. Return false if bounds remain unchanged.
	 */
	public boolean inferBounds(){
		isChanged = false;
		//Iterate through the constraints to infer the bounds.
		for(Constraint c: this.constraints){
			//The inferBound method returns False if the bounds remain unchanged.
			isChanged |= c.inferBound(this.unionOfBounds);
		}		
		
		return isChanged;
	}




	/**
	 *  
	 * Repeatedly infer the Bound consistent with all the constraints.
	 * @param iterations optional parameter. iterations[0] specifies the number of iterations. If not specifies, 
	 * the default value is 5. 
	 * @return true if bounds remain 'unchanged'. Otherwise, return false.
	 */

	public boolean inferFixedPoint(int... iterations){
		int MaxIteration = iterations.length >0 ? iterations[0] : 5;
		boolean isFixedPoint = true;
		for(int i=0;i<MaxIteration;i++){
			//Initialize the isFixedPointed
			isFixedPoint = true;
			//Use the OR bitwise operator to combine all the results.
			isFixedPoint |= inferBounds();	
		}		
		return isFixedPoint;
	}

	@Override
	public String toString() {
		/*return "BasicBlock [constraintList=" + constraintList
				+ ", parent=" + parent 
				+ ", childNodes=" + childNodes
				+ ", branch=" + branch + ", unionOfBounds=" + unionOfBounds + "]";*/
		return  "---------------------------------------\n"
				+ String.format("%s %-20s %s%n", "Name", "Type", "Constraints")
				+ String.format("%s %-15s %s%n", this.branch, this.type, this.constraints)
				+ this.unionOfBounds+"\n"
				+"---------------------------------------\n"
				+"IsConsistent="+isConsistent();
	}


	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof BasicBlock)) {
			return false;
		}
		BasicBlock blk = (BasicBlock)obj;
		if(this.getBranch().equals(blk.getBranch())){
			if(this.getType().equals(blk.getType())){
				return true;
			}			
		}
		return false;
	}

	@Override
	/**
	 * Implements for sorting the elements in the list. 
	 */
	public int compareTo(BasicBlock blk) {
		return this.type.order - blk.type.order;		
	}
	
	/**
	 * Indicate if the inferred bounds are consistent. .
	 * @return true if all the bounds are consistent.
	 */
	public boolean isConsistent() {
		return this.unionOfBounds.checkBoundConsistency();
	}
}
