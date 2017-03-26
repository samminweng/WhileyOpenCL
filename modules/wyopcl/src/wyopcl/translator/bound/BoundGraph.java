package wyopcl.translator.bound;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Deque;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import wyil.lang.Codes.If;
import wyil.lang.Type;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.bound.BoundBlock.BlockType;
import wyopcl.translator.bound.constraint.Assign;
import wyopcl.translator.bound.constraint.Constraint;
import wyopcl.translator.copy.LiveVariablesAnalysis;
import wyrl.io.SpecLexer.RightAngle;

/**
 * Creates, retrieves and stores basic blocks for a function (bound analysis only).
 *  
 * @author Min-Hsien Weng
 *
 */
public class BoundGraph {
	private final String prefix = "_";
	private Set<BoundBlock> feedback_set; // The set of blocks that widening operator is applied	
	private Deque<BoundBlock> changed; // Store the blocks that need the bound inference
	//private final String prefix = "%";	
	// The list of basic block;
	private List<BoundBlock> blocks;
	// The variables are used in the control flow graph (CFG).
	private BoundBlock current_blk;
	// Status
	public enum STATUS{
		INIT, PROCESSING, COMPLETE
	}

	private STATUS status;	

	public BoundGraph() {
		// Initialize the variables
		this.blocks = new ArrayList<BoundBlock>();
		// Entry and Exit block
		//BasicBlock exit = createBasicBlock("exit", BlockType.EXIT);
		BoundBlock entry = createBasicBlock("entry", BlockType.ENTRY);		
		// First code block.
		this.current_blk = createBasicBlock("code", BlockType.BLOCK, entry);
		this.status = STATUS.INIT;
	}

	public STATUS getStatus(){
		return status;
	}

	public void setStatus(STATUS newStatus){
		this.status = newStatus;
	}	

	/**
	 * Create a basic block with the specific label name
	 * 
	 * @param label
	 *            the branch name
	 * @param type
	 *            the blk type
	 * @param parents
	 *            the parent blk
	 * @return the blk
	 */
	public BoundBlock createBasicBlock(String label, BlockType type, BoundBlock... parents) {
		//Create a new block
		BoundBlock	blk = new BoundBlock(label, type);
		//Add this block to the block list.
		blocks.add(blk);
		//Connect the block with the given parent blocks.
		BoundBlock parent = parents.length > 0 ? parents[0] : null;
		if (parent != null) {
			parent.addChild(blk);
		}
		return blk;

	}

	/**
	 * Get the block by comparing block name with blocks of several types, including 'Block', 'ELSE' 
	 * and 'LOOP_EXIT'. 
	 * <br>
	 * If no blocks is matched, then create a new block.
	 * 
	 * @param label
	 * @return blk the matched block
	 */
	public BoundBlock getBasicBlock(String label) {
		BoundBlock blk = null;
		blk = getBasicBlock(label, BlockType.BLOCK);
		if (blk != null) {
			return blk;
		}		
		// Get the block of else branch type
		blk = getBasicBlock(label, BlockType.ELSE_BRANCH);
		if (blk != null) {
			return blk;
		}

		// Get the block of Loop Exit type
		blk = getBasicBlock(label, BlockType.LOOP_EXIT);
		if(blk != null){
			return blk;
		}
		//If no blocks is found, then return/create a new block.
		return createBasicBlock(label, BlockType.BLOCK);
	}

	/***
	 * Finds the block by the branch name and block types
	 * 
	 * @param label
	 * @param type
	 * @return
	 */
	public BoundBlock getBasicBlock(String label, BlockType type) {
		for (BoundBlock blk : blocks) {
			if (blk.getLabel().equals(label)) {
				if (blk.getType().equals(type)) {
					return blk;
				}
			}
		}

		return null;
	}

	/**
	 * Return the sorted list.
	 * 
	 * @return
	 */
	public void sortedList() {
		// Sort the blks.
		Collections.sort(blocks);
	}

	/**
	 * Return the list of basic blocks.
	 * 
	 * @return
	 */
	public List<BoundBlock> getBlockList() {
		return blocks;
	}

	/**
	 * Keep track of the current basic block
	 * 
	 * @return
	 */
	public BoundBlock getCurrentBlock() {
		return current_blk;
	}

	/**
	 * Set the current basic block.
	 * 
	 * @param blk
	 */
	public void setCurrentBlock(BoundBlock blk) {
		current_blk = blk;
	}

	/**
	 * Branches out the current block to add if/else blocks and set the current block to 
	 * the if branch (left one).
	 * @param code 
	 * 
	 * @param new_label
	 *            the name of new branch.
	 * @param c
	 *            constraint
	 */
	public void createIfElseBranch(If code, Constraint c, Constraint neg_c) {
		BoundBlock c_blk = getCurrentBlock();		
		// Get the left and right variable
		String left = prefix + code.operand(0);
		String right = prefix + code.operand(1);
		String new_label = code.target;
		
		// Branch out the block
		// The left block does not have the name
		BoundBlock leftBlock = createBasicBlock(new_label, BlockType.IF_BRANCH, c_blk);
		BoundBlock rightBlock = createBasicBlock(new_label, BlockType.ELSE_BRANCH, c_blk);
		
		// Add the constraint to the left block
		leftBlock.addConstraint(neg_c);
		// Put left and right variable to leftblock
		leftBlock.addVar(left);
		leftBlock.addVar(right);
		
		// Add the constraint to rightblock
		rightBlock.addConstraint(c);
		// Put the code to c_blk
		rightBlock.addCode(code);
		rightBlock.addVar(left);
		rightBlock.addVar(right);
		

		// Set the current block to the left
		setCurrentBlock(leftBlock);
	}

	/**
	 * Creates the loop header, loop body and loop exit and
	 * set the current block to the loop body.
	 * @param code 
	 * 
	 * @param new_label
	 *            the name of new branch.
	 * @param c
	 *            constraint
	 */
	public void createLoopStructure(If code, Constraint c, Constraint neg_c) {
		BoundBlock c_blk = getCurrentBlock();
		// Get the left and right variable
		String left = prefix + code.operand(0);
		String right = prefix + code.operand(1);
		String new_label = code.target;
		//Create the loop header
		BoundBlock loop_header = createBasicBlock(new_label, BlockType.LOOP_HEADER, c_blk);
		// Set the loop flag to be true.
		// Check whether to add if-else blocks or loop-condition blocks.
		BoundBlock loop_body = createBasicBlock(new_label, BlockType.LOOP_BODY, loop_header);
		BoundBlock loop_exit = createBasicBlock(new_label, BlockType.LOOP_EXIT, loop_header);
		// put the opposite constraint to the loop body
		loop_body.addConstraint(neg_c);
		// Put left and right to 'Vars' set
		loop_body.addVar(left);
		loop_body.addVar(right);
		
		
		
		// put the original constraint to the loop_exit
		loop_exit.addConstraint(c);
		// Put the code to loop exit
		loop_exit.addCode(code);
		
		// Put left and right variable to Vars
		loop_exit.addVar(left);
		loop_exit.addVar(right);
		
		// Set the current block to be loop body.
		setCurrentBlock(loop_body);
	}

	/**
	 * Given a block type, get a list of blocks. 
	 * @param blk_type
	 * @return
	 */
	public List<BoundBlock> getBasicBlockByType(BlockType blk_type){
		List<BoundBlock> blks = new ArrayList<BoundBlock>();
		for(BoundBlock blk: blocks){
			if(blk.getType().equals(blk_type)){
				blks.add(blk);
			}
		}

		return blks;
	}

	/**
	 * Adds the constraint to the current block.
	 * 
	 * @param c
	 */
	public void addConstraint(Constraint c) {
		// Add the constraint to current block
		getCurrentBlock().addConstraint(c);
		
	}

	/**
	 * Outputs the control flow graphs (*.dot).
	 * @param blks the list of block
	 * @param filename the name of input file.
	 * @param func_name the name of function.
	 */
	public void printCFG(List<BoundBlock> blks, String filename, String func_name){
		//Sort the blks.
		//blk_ctrl.sortedList();
		String dot_string= "digraph "+func_name+"{\n";		

		for(BoundBlock blk: blks){
			if(!blk.isLeaf()){
				for(BoundBlock child: blk.getChildNodes()){
					dot_string += "\""+blk.getLabel()+" [" +blk.getType()+"]\"->\""+ child.getLabel() +" ["+child.getType() + "]\";\n";
				}
			}
		}
		dot_string += "\n}";
		//Write out the CFG-function_name.dot
		try {
			PrintWriter cfg_writer = new PrintWriter(filename+"-"+func_name+".dot", "UTF-8");
			cfg_writer.println(dot_string);
			cfg_writer.close();
		} catch (FileNotFoundException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * Check if the type is instance of Integer by inferring the type from
	 * <code>wyil.Lang.Type</code> objects, including the effective collection
	 * types.
	 * 
	 * @param type
	 * @return true if the type is or contains an integer type.
	 */
	public boolean isIntType(Type type) {
		if (type instanceof Type.Int) {
			return true;
		}

		if (type instanceof Type.Array) {
			return isIntType(((Type.Array) type).element());
		}


		return false;
	}

	/**
	 * Create a deque and put Entry and code blocks into the queue
	 * 
	 * @return a deque
	 */
	public Deque<BoundBlock> createDequeAddEntry() {
		// Create a deque to track all the blocks that have bound changes
		// Deque provides 'pollLast' to get and remove the last block
		// So we can have Last In First Out or First In First Out behaviour.
		changed = new LinkedList<BoundBlock>();

		// Get the entry block and add entry and its child nodes to 
		BoundBlock entry = this.getBasicBlock("entry", BlockType.ENTRY);
		changed.add(entry);
		// Add the first child block of entry node
		changed.add(this.getBasicBlock("code", BlockType.BLOCK));

		return changed;
	}

	
	
	/**
	 * Create a feedback set that contains one block of the graph 
	 * so the widening operator can be applied to the block of this set.
	 * 
	 * @return
	 */
	public Set<BoundBlock> createFeedbackSet() {
		// Create a hash set that has constant complexity
		this.feedback_set = new HashSet<BoundBlock>();
		
		// Put all loop headers to the set
		List<BoundBlock> blks = this.getBasicBlockByType(BlockType.LOOP_HEADER);
		this.feedback_set.addAll(blks);
		
		return this.feedback_set;
	}

	/***
	 * Initialize each variable of a function with an empty domain.
	 * 
	 * 
	 * @param function
	 */
	public void initialize(FunctionOrMethod function) {
		// Initialize all block with empty domains
		for(BoundBlock blk: this.getBlockList()){
			blk.emptyBounds();
		}		
	}

	/**
	 * Put the variable to dead 'Vars' set in current block
	 * So the bound of the variable in 'Vars' set will NOT pass to child blocks
	 * 
	 * @param op
	 */
	/*public void addDeadVar(String var) {
		// Add the variable to current block
		getCurrentBlock().addVar(var);
		
	}

	public void removeDeadVar(String var) {
		// Remove variable from dead set
		getCurrentBlock().removeVar(var);
	}
	*/
}
