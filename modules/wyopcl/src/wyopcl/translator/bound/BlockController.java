package wyopcl.translator.bound;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import wyil.lang.Type;
import wyopcl.translator.Configuration;
import wyopcl.translator.bound.BasicBlock.BlockType;
import wyopcl.translator.bound.constraint.Constraint;

/**
 * Creates, retrieves and stores the blocks for a function.
 * This class also infers the bounds.
 * @author Min-Hsien Weng
 *
 */
public class BlockController {
	private final String prefix = "%";
	private final Configuration config;
	//The list of basic block;
	private List<BasicBlock> list;
	//The variables are used in the control flow graph (CFG).	
	private BasicBlock current_blk;
	//The label name of the loop condition
	private String loop_condition;	
	//A list of loop variables.
	private HashMap<String, BoundChange> loop_variables;

	public BlockController(Configuration config){
		this.config = config;
		//Initialize the variables
		this.list = new ArrayList<BasicBlock>();
		//Initialize		
		createBasicBlock("exit", BlockType.EXIT);		
		this.current_blk = createBasicBlock("entry", BlockType.ENTRY);
		this.loop_variables = new HashMap<String, BoundChange>();
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
	public void addParamBounds(Type paramType, String param, BigInteger min, BigInteger max){
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
			addParamBounds(paramType, prefix+index, null, null);
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
	 * Create a loop header and appends it to the current block.
	 * @param label
	 * @param c
	 */
	public BasicBlock createLoopHeader(String label){
		BasicBlock loop_header = createBasicBlock(label, BlockType.LOOP_HEADER, getCurrentBlock());
		loop_condition = label;
		return loop_header;
	}
	
	/**
	 * Check if the if bytecode is the loop condition
	 * @return
	 */
	public boolean isLoopCondition(){		
		//Check if the if-bytecode is the loop condition.
		if(!Utils.checkAssertOrAssume() && loop_condition != null){
			//Reset the loop condition flag.
			loop_condition = null;
			return true;
		}
		return false;
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
	}
	
	/**
	 * Added loop variable to the hashmap
	 * @param target
	 */
	public void addLoopVar(String target){
		if(!loop_variables.containsKey(target)){
			loop_variables.put(target, new BoundChange(target));
		}
	}

	/**
	 * Infer the bounds for a block. 
	 * @param blk the target block.
	 * @param isChanged the bound
	 * @param iteration the iteration number.
	 * @return true if bounds are unchanged. Otherwise, return false.
	 */
	protected boolean inferBlockBounds(BasicBlock blk, boolean isChanged, int iteration){
		Bounds bnd_before = null, bnd_after = null;
		//Before the bound inference
		//The bound before bound inference. 
		if(blk.getType().equals(BlockType.LOOP_BODY)){
			bnd_before = (Bounds) blk.getBounds().clone();		
		}
		//If bounds remain unchanged, then isChanged = true.
		isChanged |= blk.inferBounds();	

		if(blk.getType().equals(BlockType.LOOP_BODY)){
			bnd_after = (Bounds) blk.getBounds().clone();
			//check loop variable is increasing
			for(String loop_var: loop_variables.keySet()){			
				//Upper bounds
				BigInteger upper_before = bnd_before.getUpper(loop_var);
				BigInteger upper_after = bnd_after.getUpper(loop_var);								
				BoundChange boundChange = loop_variables.get(loop_var);
				if(upper_before!= null && upper_after!=null){
					//Check if the upper bounds is increasing
					if(upper_before.compareTo(upper_after)<0){
						boolean isIncreasing = boundChange.isUBIncreasing();
						isIncreasing |= true;
						boundChange.setUBIncreasing(isIncreasing);
						loop_variables.put(loop_var, boundChange);
					}					
				}

				//Lower bounds
				BigInteger lower_before = bnd_before.getLower(loop_var);
				BigInteger lower_after = bnd_after.getLower(loop_var);
				if(lower_before!= null && lower_after != null){
					//Check if the lower bound is decreasing
					if(lower_before.compareTo(lower_after)>0){
						boolean isDecreasing = boundChange.isLBDecreasing();
						isDecreasing |= true;
						boundChange.setLBDecreasing(isDecreasing);
						loop_variables.put(loop_var, boundChange);
					}					
				}

				//After three iterations, the bounds is still increasing.
				if(iteration%3==0){
					//Widen the upper bound
					if(boundChange.isUBIncreasing()){
						if(config.isGradualWiden()){
							isChanged |= blk.getBounds().widenUpperBoundsAgainstThresholds(loop_var);
						}else{
							isChanged |= blk.getBounds().widenUpperBoundsToInf(loop_var);
						}
					}
					//Reset the increasing flag
					boundChange.setUBIncreasing(false);
					//Widen the lower bound
					if(boundChange.isLBDecreasing()){
						if(config.isGradualWiden()){
							isChanged |= blk.getBounds().widenLowerBoundsAgainstThresholds(loop_var);
						}else{
							isChanged |= blk.getBounds().widenLowerBoundsToInf(loop_var);
						}
					}
					//Reset the decreasing flag
					boundChange.setLBDecreasing(false);					
					loop_variables.put(loop_var, boundChange);
				}
			}
		}

		//Print out the bounds.
		if(config.isVerbose()){
			System.out.println(blk);
			System.out.println("isChanged="+isChanged);
		}
		return isChanged;
	}



	


	

}
