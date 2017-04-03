package wyopcl.translator.bound;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map.Entry;

import wyil.lang.Code;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.translator.bound.constraint.Constraint;
import wyopcl.translator.bound.constraint.Range;
import wyopcl.translator.cfg.BasicBlock;
import wyopcl.translator.copy.LiveVariablesAnalysis;

/**
 * The bound block is used to build the bound graph (CFG) for bound analysis. 
 * 
 * The bound block contains a list of constraints, an union of bounds, and parent/child block (etc).. 
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public class BoundBlock extends BasicBlock {
	// Prefix of the variable
	private final String prefix = "_";
	// The set of dead variable, that will be passed onto the parent block
	private LinkedHashSet<String> deadVars;
	// The set of variables, which will be used in the block
	private LinkedHashSet<String> vars; 

	private LinkedHashSet<Code> codes;// Store all the byte-code for a block, preserving insertion order
	private List<Constraint> constraints;
	private Bounds bounds; // Store the bound set of all variables in the block

	/**
	 * Constructing a basic block with a specific name and block type.
	 * 
	 * @param label
	 *            the name of blk
	 * @param type
	 *            the type of blk
	 */
	public BoundBlock(String label, BlockType type) {
		// Use super constructor to create the BoundBlock.
		super(label, type);
		this.bounds = new Bounds();
		this.constraints = new ArrayList<Constraint>();
		this.codes = new LinkedHashSet<Code>();
		this.deadVars = new LinkedHashSet<String>();
		this.vars = new LinkedHashSet<String>();
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
		this.codes.add(code);
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
	 * Add a constraint to the list of constraints.
	 * 
	 * @param c
	 *            the constraint
	 */
	public void addConstraint(Constraint c) {
		// Constraint can be null, e.g. the negated equality is null
		if(c != null){
			constraints.add(c);
		}
		
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
		// String str = "-------------------------------\n";
		String str = "";
		str += String.format("%s [%s] ", this.getLabel(), this.getType());
		// Display the list of byte-code
		if(this.codes.size()>0){
			str += "\n-------------------------------";
			int index=0;
			for(Code code: this.codes){
				str += "\n"+index+":"+code;
				index++;
			}
			str += "\n-------------------------------";
		}
		// Display the vars set,  bounds and constraints.
		str += String.format("%n%s %s", "Vars", this.vars);
		// Display the dead vars set 
		str += String.format("%n%s %s", "DeadVars", this.deadVars);
		// Print out the constraints
		str += String.format("%n%s %s%n", "Constraints", this.constraints);
		// Print out the bounds
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
		if (this.getType().equals(blk.getType())) {
			if (this.getLabel().equals(blk.getLabel())) {
				return true;
			}
		}
		
		return false;
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
		this.vars.add(var);		
	}

	/**
	 * Check 'var' is in the 'Vars' set
	 * @param var
	 * @return
	 */
	public boolean isDeadVars(String var){
		return this.deadVars.contains(var);
	}


	/**
	 * Produce the input bounds of the block
	 * 
	 */
	public void produceInputBound() {
		// Reset the block bounds
		this.emptyBounds();

		// Produce the input bound by taking union of bound in all parent blocks before bound inference 
		for (BasicBlock blk : this.getParentNodes()) {
			BoundBlock parent = (BoundBlock)blk;			
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
	/**
	 * Go through each variable in Vars. If the variable is dead at the last code of the block
	 * then it is put to dead variables
	 * 
	 * @param liveAnalyzer
	 * @param function
	 */
	public void computeDeadVars(LiveVariablesAnalysis liveAnalyzer, FunctionOrMethod function) {
		// For an empty block, no dead variables
		if(this.codes.isEmpty()){
			return;
		}
		// Get the last code
		Code last_code = (Code)this.codes.toArray()[this.codes.size()-1];
		
		for(String var: this.vars){
			// Extract register from variable
			int register = Integer.parseInt(var.split(prefix)[1]);
			// Check if the register is live after last code 
			boolean islive = liveAnalyzer.isLive(register, last_code, function);
			if(islive == false){
				// Put the dead variable to 'DeadVars' set.
				this.deadVars.add(var);
			}
		}
	}

}
