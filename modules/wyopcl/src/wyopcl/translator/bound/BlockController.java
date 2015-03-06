package wyopcl.translator.bound;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import wyil.lang.Type;
import wyopcl.translator.bound.BasicBlock.BlockType;
import wyopcl.translator.bound.constraint.Constraint;

/**
 * Creates, retrieves and stores the blocks for a function.
 * @author Min-Hsien Weng
 *
 */
public class BlockController {
	private final String prefix = "%";
	//The list of basic block;
	private List<BasicBlock> list;
	//The variables are used in the control flow graph (CFG).	
	private BasicBlock current_blk;
	//The label name of the loop condition
	private String loop_condition;	

	public BlockController(){
		//Initialize the variables
		this.list = new ArrayList<BasicBlock>();
		//Initialize		
		createBasicBlock("exit", BlockType.EXIT);		
		this.current_blk = createBasicBlock("entry", BlockType.ENTRY);
	}

	/**
	 * Create a basic block with the specific label name
	 * @param label the branch name
	 * @param type the blk type
	 * @param parents the parent blk
	 * @return the blk
	 */
	public BasicBlock createBasicBlock(String label, BlockType type, BasicBlock... parents){
		BasicBlock blk = new BasicBlock(label, type);
		//Check if the block exists
		if(!list.contains(blk)){
			list.add(blk);
			BasicBlock parent = parents.length > 0 ? parents[0] : null;
			if(parent != null){
				parent.addChild(blk);
			}
			return blk;
		}else{
			for(BasicBlock block: list){
				if(blk.equals(block)){
					return block;
				}				
			}
		}
		return null;
	}

	/**
	 * Iterates over all nodes in a list to get the block,
	 * whose branch name is matched with label.
	 * @param label
	 * @return blk
	 */
	public BasicBlock getBasicBlock(String label){
		BasicBlock blk = getBasicBlock(label, BlockType.BLOCK);
		if(blk == null){
			//Get the block of If branch
			blk = getBasicBlock(label, BlockType.IF_BRANCH);
		}
		if(blk == null){
			//Get the block of Loop Exit
			blk = getBasicBlock(label, BlockType.LOOP_EXIT);
		}
		return blk;
	}

	/***
	 * Finds the block by the branch name and block types
	 * @param label
	 * @param type
	 * @return
	 */
	public BasicBlock getBasicBlock(String label, BlockType type){
		for(BasicBlock blk : list){
			if(blk.getBranch().equals(label)){
				if(blk.getType().equals(type)){
					return blk;
				}
			}
		}		
		return null;
	}

	/**
	 * Return the sorted list.
	 * @return
	 */
	public void sortedList(){
		//Sort the blks.
		Collections.sort(list);
	}

	/**
	 * Return the list.
	 * @return
	 */
	public List<BasicBlock> getList(){
		return list;
	}

	/**
	 * Keep track of the current basic block
	 * @return
	 */
	public BasicBlock getCurrentBlock(){
		//If the current block is null, throw out an Runtime exception
		if(current_blk == null){
			//throw new RuntimeException("Current block is null.");
			//current_blk = entry;
		}

		return current_blk;
	}

	/**
	 * Set the current basic block.
	 * @param blk
	 */
	public void setCurrentBlock(BasicBlock blk){
		current_blk = blk;
	}

	/**
	 * Create an entry node
	 * @param paramType
	 * @param param
	 * @param min
	 * @param max
	 */
	public void createEntryNode(Type paramType, String param, BigInteger min, BigInteger max){
		if(Utils.isIntType(paramType)){
			getCurrentBlock().addBounds(param, min, max);
		}
	}

	/**
	 * Creates the entry node
	 * @param paramTypes
	 */
	public void createEntryNode(List<Type> paramTypes){
		int index = 0;
		for(Type paramType: paramTypes){
			createEntryNode(paramType, prefix+index, null, null);
			index++;
		}
		//Create the default basic block and adds it to the child of entry node.
		BasicBlock blk = createBasicBlock("code", BlockType.BLOCK, getCurrentBlock());
		setCurrentBlock(blk);
	}

	
	
	/**
	 * Branches the current block and adds the 
	 * if_then_else blocks. And set the current
	 * block to the left one.
	 * @param new_label the name of new branch.
	 * @param c constraint
	 */
	public void createIfElseBranch(String new_label, Constraint c, Constraint neg_c){
		BasicBlock c_blk = getCurrentBlock();		
		//Branch out the block 
		//The left block does not have the name
		BasicBlock leftBlock = createBasicBlock(new_label, BlockType.ELSE_BRANCH, c_blk);
		BasicBlock rightBlock = createBasicBlock(new_label, BlockType.IF_BRANCH, c_blk);

		//Add the constraint to the left block
		leftBlock.addConstraint(neg_c);
		rightBlock.addConstraint(c);						
		//Set the current block to the left
		setCurrentBlock(leftBlock);
	}


	/**
	 * Branches the current block and adds the loop header, loop body and loop exit. And set the current
	 * block to the .
	 * @param new_label the name of new branch.
	 * @param c constraint
	 */
	public void createLoopStructure(String new_label, Constraint c, Constraint neg_c){
		BasicBlock c_blk = getCurrentBlock();
		//Check whether to add if-else blocks or loop-condition blocks.
		BasicBlock loop_body = createBasicBlock(new_label, BlockType.LOOP_BODY, c_blk);
		BasicBlock loop_exit = createBasicBlock(new_label, BlockType.LOOP_EXIT, c_blk);
		//put the opposite constraint to current blk(loopbody)			
		loop_body.addConstraint(neg_c);	
		//put the original constraint to the loop_exit			
		loop_exit.addConstraint(c);	
		setCurrentBlock(loop_body);
		//Reset the loop condition flag.
		loop_condition = null;
	}
}
