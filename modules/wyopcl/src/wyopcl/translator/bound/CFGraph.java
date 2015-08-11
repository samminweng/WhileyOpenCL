package wyopcl.translator.bound;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyopcl.translator.AnalyzerHelper;
import wyopcl.translator.Configuration;
import wyopcl.translator.TranslatorHelper;
import wyopcl.translator.bound.BasicBlock.BlockType;
import wyopcl.translator.bound.constraint.Constraint;

/**
 * Creates, retrieves and stores the blocks for a function. 
 *  
 * @author Min-Hsien Weng
 *
 */
public class CFGraph {
	private final String prefix = "%";	
	// The list of basic block;
	private List<BasicBlock> blocks;
	// The variables are used in the control flow graph (CFG).
	private BasicBlock current_blk;
	// Status
	public enum STATUS{
		INIT, PROCESSING, COMPLETE
	}

	private STATUS status;	
	
	public CFGraph() {
		// Initialize the variables
		this.blocks = new ArrayList<BasicBlock>();
		// Entry and Exit block
		BasicBlock exit = createBasicBlock("exit", BlockType.EXIT);
		BasicBlock entry = createBasicBlock("entry", BlockType.ENTRY);
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
	public BasicBlock createBasicBlock(String label, BlockType type, BasicBlock... parents) {
		BasicBlock blk = new BasicBlock(label, type);
		// Check if the block exists
		if (!blocks.contains(blk)) {
			blocks.add(blk);
			BasicBlock parent = parents.length > 0 ? parents[0] : null;
			if (parent != null) {
				parent.addChild(blk);
			}
			return blk;
		} else {
			for (BasicBlock block : blocks) {
				if (blk.equals(block)) {
					return block;
				}
			}
		}
		return null;
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
	public BasicBlock getBasicBlock(String label) {
		BasicBlock blk = null;
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
	public BasicBlock getBasicBlock(String label, BlockType type) {
		for (BasicBlock blk : blocks) {
			if (blk.getBranch().equals(label)) {
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
	public List<BasicBlock> getBlockList() {
		return blocks;
	}

	/**
	 * Keep track of the current basic block
	 * 
	 * @return
	 */
	public BasicBlock getCurrentBlock() {
		// If the current block is null, throw out an Runtime exception
		if (current_blk == null) {
			// throw new RuntimeException("Current block is null.");
			// current_blk = entry;
		}
		return current_blk;
	}

	/**
	 * Set the current basic block.
	 * 
	 * @param blk
	 */
	public void setCurrentBlock(BasicBlock blk) {
		current_blk = blk;
	}

	/**
	 *  Propagate the input bounds to entry node
	 * 
	 * @param paramType
	 * @param param
	 * @param min
	 * @param max
	 */
	public void addInputBounds(List<Type> params, int[] operands, Bounds bnd) {
		//clear all the bounds in each block
		for(BasicBlock blk: blocks){
			blk.emptyBounds();
		}
		
		BasicBlock entry = getBasicBlock("entry", BlockType.ENTRY);
		//Clear all the constraints/bounds in entry block.		
		entry.emptyConstraints();
		int index = 0;
		for (Type paramType : params) {
			String param = prefix + index;
			String operand = prefix + operands[index];
			// Check parameter type
			if (TranslatorHelper.isIntType(paramType)) {
				entry.addBounds(param, bnd.getLower(operand),  bnd.getUpper(operand));
			}	
			index++;
		}
		
	}


	/**
	 * Branches out the current block to add if/else blocks and set the current block to 
	 * the if branch (left one).
	 * 
	 * @param new_label
	 *            the name of new branch.
	 * @param c
	 *            constraint
	 */
	public void createIfElseBranch(String new_label, Constraint c, Constraint neg_c) {
		BasicBlock c_blk = getCurrentBlock();
		// Branch out the block
		// The left block does not have the name
		BasicBlock leftBlock = createBasicBlock(new_label, BlockType.IF_BRANCH, c_blk);
		BasicBlock rightBlock = createBasicBlock(new_label, BlockType.ELSE_BRANCH, c_blk);

		// Add the constraint to the left block
		leftBlock.addConstraint(neg_c);
		rightBlock.addConstraint(c);
		
		// Set the current block to the left
		setCurrentBlock(leftBlock);
	}

	/**
	 * Creates the loop header, loop body and loop exit and
	 * set the current block to the loop body.
	 * 
	 * @param new_label
	 *            the name of new branch.
	 * @param c
	 *            constraint
	 */
	public void createLoopStructure(String new_label, Constraint c, Constraint neg_c) {
		//Create the loop header
		BasicBlock loop_header = createBasicBlock(new_label, BlockType.LOOP_HEADER, getCurrentBlock());
		// Set loop_header to be the current block
		setCurrentBlock(loop_header);
		// Set the loop flag to be true.
		// Check whether to add if-else blocks or loop-condition blocks.
		BasicBlock loop_body = createBasicBlock(new_label, BlockType.LOOP_BODY, loop_header);
		BasicBlock loop_exit = createBasicBlock(new_label, BlockType.LOOP_EXIT, loop_header);
		// Connect the loop header with the loop body
		loop_body.addChild(loop_header);
		// put the opposite constraint to the loop body
		loop_body.addConstraint(neg_c);
		// put the original constraint to the loop_exit
		loop_exit.addConstraint(c);
		// Set the current block to be loop body.
		setCurrentBlock(loop_body);
	}

	/**
	 * Given a block type, get a list of blocks. 
	 * @param blk_type
	 * @return
	 */
	public List<BasicBlock> getBasicBlockByType(BlockType blk_type){
		List<BasicBlock> blks = new ArrayList<BasicBlock>();
		for(BasicBlock blk: blocks){
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
		getCurrentBlock().addConstraint(c);
	}

	/**
	 * Outputs the control flow graphs (*.dot).
	 * @param blks the list of block
	 * @param filename the name of input file.
	 * @param func_name the name of function.
	 */
	public void printCFG(List<BasicBlock> blks, String filename, String func_name){
		//Sort the blks.
		//blk_ctrl.sortedList();
		String dot_string= "digraph "+func_name+"{\n";		

		for(BasicBlock blk: blks){
			if(!blk.isLeaf()){
				for(BasicBlock child: blk.getChildNodes()){
					dot_string += "\""+blk.getBranch()+" [" +blk.getType()+"]\"->\""+ child.getBranch() +" ["+child.getType() + "]\";\n";
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
	 * Add byte-code to the current block.
	 * @param code
	 */
	public void addCode(Code code){
		BasicBlock blk = getCurrentBlock();
		blk.addCode(code);
	}
	
}
