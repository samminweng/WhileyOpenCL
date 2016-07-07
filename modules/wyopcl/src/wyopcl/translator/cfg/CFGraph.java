package wyopcl.translator.cfg;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import wyil.lang.Type;
import wyopcl.translator.cfg.BasicBlock;
import wyopcl.translator.cfg.BasicBlock.BlockType;

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
		//BasicBlock exit = createBasicBlock("exit", BlockType.EXIT);
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
		BasicBlock blk = getBasicBlock(label, type);
		// Check if the block exists
		if (blk == null) {
			//Create a new block
			blk = new BasicBlock(label, type);
			//Add this block to the block list.
			blocks.add(blk);
		}
		//Connect the block with the given parent blocks.
		BasicBlock parent = parents.length > 0 ? parents[0] : null;
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
	 * @return blk the matched block. If not found, return null
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
		//If no blocks is found, then return null.
		return null;
		//return createBasicBlock(label, BlockType.BLOCK);
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
	 * Branches out the current block to add if/else blocks and set the current block to 
	 * the if branch (left one).
	 * 
	 * @param new_label
	 *            the name of new branch.
	 * @param c
	 *            constraint
	 */
	public void createIfElseBranch(String new_label) {
		BasicBlock c_blk = getCurrentBlock();
		// Branch out the block
		// Create the condition block
		BasicBlock cond = createBasicBlock(new_label, BlockType.COND, c_blk);
		// Create if/else branch and link them to the condition block
		BasicBlock leftBlock = createBasicBlock(new_label, BlockType.IF_BRANCH, cond);
		BasicBlock rightBlock = createBasicBlock(new_label, BlockType.ELSE_BRANCH, cond);
		
		// Set the current block to the left
		setCurrentBlock(leftBlock);
	}
	
	
	/**
	 * Creates the loop header, loop body and loop exit. And set the current block to the loop body.
	 * 
	 * @param new_label
	 *            the name of new branch.
	 */
	public void createLoopStructure(String new_label) {
		BasicBlock c_blk = getCurrentBlock();
		// Create the loop header
		BasicBlock loop_header = createBasicBlock(new_label, BlockType.LOOP_HEADER, c_blk);
		// Create the loop body and loop exit
		BasicBlock loop_body = createBasicBlock(new_label, BlockType.LOOP_BODY, loop_header);
		BasicBlock loop_exit = createBasicBlock(new_label, BlockType.LOOP_EXIT, loop_header);
		// Connect the loop header with the loop body
		loop_body.addChild(loop_header);
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
	
}
