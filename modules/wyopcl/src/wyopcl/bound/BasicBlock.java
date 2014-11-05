package wyopcl.bound;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import wyopcl.bound.constraint.Constraint;
/**
 * The basic block for building the control flow graph (CFG).
 * @author Min-Hsien Weng
 *
 */
public class BasicBlock implements Comparable<BasicBlock>{
	
	private List<Constraint> constraintList;
	private List<BasicBlock> childNodes = null;
	private List<BasicBlock> parentNodes = null;
	
	
	public enum BlockType{
		BLOCK{
			public String toString(){
				return "BLOCK";
			}
		}, LOOP_HEADER{
			public String toString(){
				return "LOOP_HEADER";
			}
		}, LOOP_BODY{
			public String toString(){
				return "LOOP_BODY";
			}
		}, LOOP_EXIT{
			public String toString(){
				return "LOOP_EXIT";
			}
		}, IF_BRANCH{
			public String toString(){
				return "IF";
			}
		}, ELSE_BRANCH{
			public String toString(){
				return "ELSE";
			}
		}, ENTRY{
			public String toString(){
				return "ENTRY";
			}
		}, EXIT{
			public String toString(){
				return "EXIT";
			}
		}
	}
	

	//The branch name
	private String branch;
	private BlockType type;
	private Bounds unionOfBounds;
	//Indicate if the bounds remain unchanged. False: unchanged. True: changed.
	private boolean isChanged = false;
	
	private BasicBlock(){
		this.unionOfBounds = new Bounds();
		this.constraintList = new ArrayList<Constraint>();
	}	
	
	public BasicBlock(String branch, BlockType type){
		//Use the nested constructor to create the BasicBlock object.
		this();
		this.branch = branch;
		this.type = type;
		
	}
	/**
	 * Sets the branch name.
	 * @param branch the branch name
	 */
	public void setBranch(String branch){
		this.branch = branch;
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
	 * @param parent
	 */
	public void unionBounds(BasicBlock parent){
		//Take the union of bounds of parent node and current node. 
		this.getBounds().union((Bounds) parent.getBounds().clone());
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
	
	public boolean hasChild(){
		if(childNodes==null){
			return false;
		}
	
		return true;
	}
	
	public boolean hasParent(){
		if(parentNodes == null){
			return false;
		}
		return true;
	}
	
	
	public String getBranch(){
		return this.branch;
	}
	
	public BlockType getType(){
		return this.type;
	}
	
	
	public List<BasicBlock> getChildNodes(){
		return childNodes;
	}
	
	public List<BasicBlock> getParentNodes(){
		return parentNodes;
	}
	
	
	public void addConstraint(Constraint c){
		if(c != null){
			constraintList.add(c);
		}
	}	
	
	public boolean isChanged(){
		return isChanged;
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
	 * Infer the bounds 
	 * @return true if the bounds are changed. Return false if bounds remain unchanged.
	 */
	public boolean inferBounds(){
		isChanged = false;
		//Iterate through the constraints to infer the bounds.
		for(Constraint c: this.constraintList){
			//The inferBound method returns False if the bounds remain unchanged.
			boolean inferBound = c.inferBound(this.unionOfBounds);
			//So we use the bitwise Or to combine all the results
			isChanged |= inferBound;
		}
		return isChanged;
	}
	
	
	
	
	/**
	 * Repeatedly infer the Bound consistent with all the constraints.
	 * @param iterations optional parameter. iterations[0] specifies the number of iterations. If not specifies, 
	 * the default value is 5. 
	 * @return true if bounds remain 'unchanged'. Otherwise, return false.
	 */
	public boolean inferFixedPoint(int... iterations){
		int MaxIteration = iterations.length >0 ? iterations[0] : 5;
		boolean isFixedPointed = true;
		for(int i=0;i<MaxIteration;i++){
			//Initialize the isFixedPointed
			isFixedPointed = true;
			//Iterate through the constraints to infer the bounds.
			for(Constraint c: this.constraintList){
				//The inferBound method returns false when all the bounds.
				//So we negated the result and use the AND bitwise to combine all the results.
				boolean isChanged = c.inferBound(this.unionOfBounds);
				isFixedPointed &= !isChanged;
			}
		}		
		return isFixedPointed;
	}

	@Override
	public String toString() {
		/*return "BasicBlock [constraintList=" + constraintList
				+ ", parent=" + parent 
				+ ", childNodes=" + childNodes
				+ ", branch=" + branch + ", unionOfBounds=" + unionOfBounds + "]";*/
		return branch + ":\n"
				+"<<"+constraintList+">>\n"
				+ unionOfBounds;
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
	
	/**
	 * Get the blk label no
	 * @return the number of blk label 
	 */
	private int getblklab(){
		if(this.branch.equals("entry")){
			return Integer.MIN_VALUE;
		}
		
		if(this.branch.equals("exit")){
			return Integer.MAX_VALUE;
		}
		
		String blk_lab="";
		if(this.branch.contains("_")){
			blk_lab = this.branch.split("_")[0];
		}else{
			blk_lab = this.branch;
		}	
		
		if(blk_lab.matches("^blklab.*")){
			return Integer.parseInt(blk_lab.split("blklab")[1]);
		}
		
		return Integer.MIN_VALUE;
	}
	


	@Override
	/**
	 * Implements for sorting the elements in the list. 
	 */
	public int compareTo(BasicBlock blk) {
		return this.getblklab() - blk.getblklab();		
	}

	
	

}
