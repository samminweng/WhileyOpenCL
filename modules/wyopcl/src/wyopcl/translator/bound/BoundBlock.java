package wyopcl.translator.bound;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Deque;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import wyil.lang.Code;
import wyil.lang.CodeBlock;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.bound.BoundBlock.BlockType;
import wyopcl.translator.bound.constraint.Constraint;
import wyopcl.translator.bound.constraint.Range;

/**
 * The bound block is used to build the bound graph (CFG) for bound analysis. 
 * 
 * The bound block contains a list of constraints, an union of bounds, and parent/child block (etc).. 
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public class BoundBlock implements Comparable<BoundBlock> {
	// Prefix of the variable
	private final String prefix = "_";
	// The set of dead variable in the block, that will be passed onto the parent block
	private Set<String> dead_vars;

	private CodeBlock codeBlock;// Store all the byte-code for a block
	private List<Constraint> constraints;
	private List<BoundBlock> childNodes = null;
	private List<BoundBlock> parentNodes = null;
	// The branch name
	private String label;
	private BlockType type;
	private Bounds bounds;

	public enum BlockType {
		ENTRY(0) {
			public String toString() {
				return "ENTRY";
			}
		},
		ASSERT(1) {
			public String toString() {
				return "ASSERT";
			}
		},
		ASSUME(2) {
			public String toString() {
				return "ASSUME";
			}
		},
		BLOCK(3) {
			public String toString() {
				return "BLOCK";
			}
		},
		LOOP_HEADER(4) {
			public String toString() {
				return "LOOP_HEADER";
			}
		},
		LOOP_BODY(5) {
			public String toString() {
				return "LOOP_BODY";
			}
		},
		LOOP_EXIT(6) {
			public String toString() {
				return "LOOP_EXIT";
			}
		},
		IF_BRANCH(7) {
			public String toString() {
				return "IF";
			}
		},
		ELSE_BRANCH(8) {
			public String toString() {
				return "ELSE";
			}
		},
		// Store function call code only.
		INVOKE(9){
			public String toString(){
				return "INVOKE";
			}
		},
		// Store return code only.
		RETURN(10){
			public String toString(){
				return "RETURN";
			}
		},		
		EXIT(11) {
			public String toString() {
				return "EXIT";
			}
		};
		public int order;

		private BlockType(int order) {
			this.order = order;
		}
	}

	/**
	 * Private constructor
	 */
	private BoundBlock() {
		this.bounds = new Bounds();
		this.constraints = new ArrayList<Constraint>();
		this.codeBlock = new CodeBlock();
		this.dead_vars = new HashSet<String>();
	}

	/**
	 * Constructing a basic block with a specific name and block type.
	 * 
	 * @param label
	 *            the name of blk
	 * @param type
	 *            the type of blk
	 */
	public BoundBlock(String label, BlockType type) {
		// Use the nested constructor to create the BasicBlock object.
		this();
		this.label = label;
		this.type = type;
		//this.isChanged = false;
	}

	/**
	 * clear all the 'Range' constraints, which are used to propagates input/output bounds 
	 * between a function call
	 */
	public void emptyRangeConstraints() {
		// Remove the Range constraints 
		Iterator<Constraint> iterator = this.constraints.iterator();
		// Use the iterator to remove 
		while(iterator.hasNext()){
			Constraint c = iterator.next();
			if(c instanceof Range){
				iterator.remove();
			}
		}
	}

	/**
	 * Empty the bounds and initialize each variable with empty domain
	 * @param list 
	 */
	public void emptyBounds() {
		this.bounds = new Bounds();
	}

	/**
	 * Add Wyil code to the block
	 * 
	 * @param code
	 */
	public void addCode(Code code) {
		this.codeBlock.add(code);
	}
	/**
	 * Get the list of codes.
	 * @return
	 */
	public CodeBlock getCodeBlock(){
		return this.codeBlock;
	}

	/**
	 * Adds a child node to the current node and also add the current node to
	 * the parent list of its child nodes.
	 * 
	 * @param blk
	 *            the child node.
	 */
	public void addChild(BoundBlock child) {
		if (childNodes == null) {
			childNodes = new ArrayList<BoundBlock>();
		}

		// Check if the child node has been added before.
		if (!childNodes.contains(child)) {
			childNodes.add(child);
			// set the parent-child rel to the child node.
			child.addParent(this);
		}

	}

	private void addParent(BoundBlock parent) {
		if (parentNodes == null) {
			parentNodes = new ArrayList<BoundBlock>();
		}
		parentNodes.add(parent);
	}

	/**
	 * Combines the bounds of current and parent nodes into the union of bounds.
	 * Check if the var has been existed in the current bounds. If so, then the
	 * union operator takes
	 * 
	 * min of current and parent' lower bounds and max of these two blk's upper
	 * bounds.
	 * 
	 * And sets the bounds directly to current bounds.
	 * 
	 * @param parent
	 */
	public void unionBounds(BoundBlock parent) {
		// Take the union of bounds of parent node and current node.
		this.bounds.union((Bounds) parent.getBounds().clone());
	}
	/**
	 * Intersect the bounds of current and its parent nodes and then set the bounds directly.
	 * 
	 * 
	 * @param parent
	 */
	public void intersecBounds(BoundBlock parent){
		this.bounds.intersect((Bounds) parent.getBounds().clone());
	}

	/**
	 * Check if the block is the leaf node.
	 * 
	 * @return
	 */
	public boolean isLeaf() {
		if (childNodes == null) {
			return true;
		}
		return false;
	}

	/**
	 * Check if the blk has the parent nodes.
	 * 
	 * @return true if blk has parent. Otherwise, return false.
	 */
	public boolean hasParent() {
		if (parentNodes == null) {
			return false;
		}
		return true;
	}

	/**
	 * Return the blk label.
	 * 
	 * @return the name of blk.
	 */
	public String getLabel() {
		return this.label;
	}
	/**
	 * Set the block label.
	 * @param label
	 */
	public void setLabel(String label){
		this.label = label;
	}

	/**
	 * Return the block type.
	 * 
	 * @return
	 */
	public BlockType getType() {
		return this.type;
	}

	/**
	 * Return a list of child blks.
	 * 
	 * @return
	 */
	public List<BoundBlock> getChildNodes() {
		return childNodes;
	}

	/**
	 * Return a list of parent blks.
	 * 
	 * @return the list of blocks. If no parents is found, return an immutable
	 *         empty list.
	 */
	public List<BoundBlock> getParentNodes() {
		if (parentNodes == null) {
			// Return an immutable list
			return Collections.emptyList();
		}

		return parentNodes;
	}

	/**
	 * Add a constraint to the list of constraints.
	 * 
	 * @param c
	 *            the constraint
	 */
	public void addConstraint(Constraint c) {
		constraints.add(c);
	}

	public Bounds getBounds() {
		return bounds;
	}

	public BigInteger getLower(String name) {
		return bounds.getLower(name);
	}

	public BigInteger getUpper(String name) {
		return bounds.getUpper(name);
	}




	/**
	 * 
	 * Repeatedly infer the Bound consistent with all the constraints.
	 * 
	 * @param iterations
	 *            optional parameter. iterations[0] specifies the number of
	 *            iterations. If not specifies, the default value is 5.
	 * @return true if bounds remain 'unchanged'. Otherwise, return false.
	 */
	/*public boolean inferFixedPoint(int... iterations) {
		int MaxIteration = iterations.length > 0 ? iterations[0] : 5;
		boolean isFixedPoint = true;
		for (int i = 0; i < MaxIteration; i++) {
			// Initialize the isFixedPointed
			isFixedPoint = true;
			// Use the OR bitwise operator to combine all the results.
			isFixedPoint |= inferBounds();
		}
		return isFixedPoint;
	}*/

	@Override
	public String toString() {
		//String str = "-------------------------------\n";
		String str = "";
		str += String.format("%s [%s] ", this.label, this.type);
		//Display the list of byte-code
		if(this.codeBlock.size()>0){
			str += "\n-------------------------------";
			int index=0;
			for(Code code: this.codeBlock){
				str += "\nl."+index+":"+code;
				index++;
			}
			str += "\n-------------------------------";
		}
		//Display the vars set,  bounds and constraints.
		str += String.format("%n%s %s", "Dead Vars", this.dead_vars);
		//Print out the constraints
		str += String.format("%n%s %s%n", "Constraints", this.constraints);
		//Print out the bounds
		str += this.bounds + "\n";
		str += "IsReachable=" + isReachable();
		//str += "\n-------------------------------\n";

		return str;
	}

	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof BoundBlock)) {
			return false;
		}
		BoundBlock blk = (BoundBlock) obj;
		if (this.getLabel().equals(blk.getLabel())) {
			if (this.getType().equals(blk.getType())) {
				return true;
			}
		}
		return false;
	}

	@Override
	/**
	 * Implements for sorting the elements in the list.
	 */
	public int compareTo(BoundBlock blk) {
		return this.type.order - blk.type.order;
	}

	/**
	 * Indicate if the inferred bounds are consistent. .
	 * 
	 * @return true if all the bounds are consistent.
	 */
	public boolean isReachable() {
		return this.bounds.checkBoundReachable();
	}

	/**
	 * Add or update the existing domain
	 * 
	 * @param d
	 */
	public void addDomain(Domain d) {
		// Set or update the domain
		this.bounds.addDomain(d);
	}

	public boolean hasChild() {
		if (childNodes == null) {
			return false;
		}
		return true;
	}



	/**
	 * Iterate through the constraints to infer the bounds
	 * 
	 * @return true if the bounds are changed. Return false if bounds remain
	 *         unchanged.
	 */
	public void inferBounds() {		
		// Iterate through the constraints to infer the bounds.
		for (Constraint c : this.constraints) {
			c.inferBound(this.bounds);
		}
	}

	/**
	 * add the variable 'var' to 'Vars' set.
	 * 
	 * @param var
	 */
	public void addVar(String var) {
		this.dead_vars.add(var);		
	}

	/**
	 * Check 'var' is in the 'Vars' set
	 * @param var
	 * @return
	 */
	public boolean isDeadVars(String var){
		return this.dead_vars.contains(var);
	}



	public void produceInputBound() {
		// Reset the block bounds
		this.emptyBounds();

		// Produce the input bound by taking union of bound in all parent blocks before bound inference 
		for (BoundBlock parent : this.getParentNodes()) {
			// Get all the domains in parent blocks
			HashMap<String, Domain> parent_domains = parent.bounds.getBounds();
			Iterator<Entry<String, Domain>> iterator = parent_domains.entrySet().iterator();
			while(iterator.hasNext()){
				Entry<String, Domain> entry = iterator.next();
				// Get variable
				String var = entry.getKey();
				// Get new domain
				Domain new_domain = entry.getValue();
				// Check if the variable is in 'Vars'
				if(!parent.isDeadVars(var)){
					this.bounds.union(var, new_domain);
				}
			}

		}

	}

	public void removeVar(String var) {
		this.dead_vars.remove(var);
	}

}
