package wyopcl.translator.bound;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import wyopcl.translator.BoundAnalyzerHelper;
import wyopcl.translator.Configuration;
import wyopcl.translator.bound.BasicBlock.BlockType;
/**
 * Given a list of CFG blocks, infer the bounds for each block and output the result
 * bounds of return value.
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public class BoundInference {
	private final String prefix = "%";
	// A list of loop variables.
	private HashMap<String, BoundChange> loop_variables;
	public BoundInference(){
		this.loop_variables = new HashMap<String, BoundChange>();
	}
	
	/**
	 * Added loop variable to the hashmap
	 * 
	 * @param target
	 */
	public void addLoopVar(String target) {
		if (!loop_variables.containsKey(target)) {
			loop_variables.put(target, new BoundChange(target));
		}
	}
	
	/***
	 * Finds the block by the branch name and block types
	 * 
	 * @param label
	 * @param type
	 * @return
	 */
	private BasicBlock getBasicBlock(List<BasicBlock> list, String label, BlockType type) {
		for (BasicBlock blk : list) {
			if (blk.getBranch().equals(label)) {
				if (blk.getType().equals(type)) {
					return blk;
				}
			}
		}
		return null;
	}
	
	
	/**
	 * Infer the bounds for a block.
	 * 
	 * @param blk
	 *            the target block.
	 * @param isChanged
	 *            the bound
	 * @param iteration
	 *            the iteration number.
	 * @return true if bounds are unchanged. Otherwise, return false.
	 */
	private boolean inferBlockBounds(Configuration config, BasicBlock blk, boolean isChanged, int iteration) {
		Bounds bnd_before = null, bnd_after = null;
		// Before the bound inference
		// The bound before bound inference.
		if (blk.getType().equals(BlockType.LOOP_BODY)) {
			bnd_before = (Bounds) blk.getBounds().clone();
		}
		// If bounds remain unchanged, then isChanged = true.
		isChanged |= blk.inferBounds();

		if (blk.getType().equals(BlockType.LOOP_BODY)) {
			bnd_after = (Bounds) blk.getBounds().clone();
			// check loop variable is increasing
			for (String loop_var : loop_variables.keySet()) {
				// Upper bounds
				BigInteger upper_before = bnd_before.getUpper(loop_var);
				BigInteger upper_after = bnd_after.getUpper(loop_var);
				BoundChange boundChange = loop_variables.get(loop_var);
				if (upper_before != null && upper_after != null) {
					// Check if the upper bounds is increasing
					if (upper_before.compareTo(upper_after) < 0) {
						boolean isIncreasing = boundChange.isUBIncreasing();
						isIncreasing |= true;
						boundChange.setUBIncreasing(isIncreasing);
						loop_variables.put(loop_var, boundChange);
					}
				}

				// Lower bounds
				BigInteger lower_before = bnd_before.getLower(loop_var);
				BigInteger lower_after = bnd_after.getLower(loop_var);
				if (lower_before != null && lower_after != null) {
					// Check if the lower bound is decreasing
					if (lower_before.compareTo(lower_after) > 0) {
						boolean isDecreasing = boundChange.isLBDecreasing();
						isDecreasing |= true;
						boundChange.setLBDecreasing(isDecreasing);
						loop_variables.put(loop_var, boundChange);
					}
				}

				// After three iterations, the bounds is still increasing.
				if (iteration % 4 == 0) {
					// Widen the upper bound
					if (boundChange.isUBIncreasing()) {
						if (config.isGradualWiden()) {
							isChanged |= blk.getBounds().widenUpperBoundsAgainstThresholds(loop_var);
						} else {
							isChanged |= blk.getBounds().widenUpperBoundsToInf(loop_var);
						}
					}
					// Reset the increasing flag
					boundChange.setUBIncreasing(false);
					// Widen the lower bound
					if (boundChange.isLBDecreasing()) {
						if (config.isGradualWiden()) {
							isChanged |= blk.getBounds().widenLowerBoundsAgainstThresholds(loop_var);
						} else {
							isChanged |= blk.getBounds().widenLowerBoundsToInf(loop_var);
						}
					}
					// Reset the decreasing flag
					boundChange.setLBDecreasing(false);
					loop_variables.put(loop_var, boundChange);
				}
			}
		}

		// Print out the bounds.
		if (config.isVerbose()) {
			System.out.println(blk);
			System.out.println("isChanged=" + isChanged);
		}
		return isChanged;
	}
	
	
	
	
	
	/**
	 * Repeatedly iterates over all blocks, starting from the entry block to the
	 * exit block, and infer the bounds consistent with all the constraints in
	 * each block.
	 * 
	 * @return the bounds
	 */
	public Bounds inferBounds(Configuration config, List<BasicBlock> list) {
		// Sort the blks
		//blk_ctrl.sortedList();
		// The least common multiple of naive (4) and graduate (12) widening
		// strategies plus one.
		int MaxIteration = 5;
		if(config.isGradualWiden()){
			MaxIteration = 20;
		}		

		boolean isFixedPointed = false;
		int iteration = 1;
		// Stop the loop when the program reaches the fixed point or
		// max-iterations
		// by using AND operator to combine these two condition.
		// If both of two conditions are evaluated to be true, then enter the
		// loop.
		while (!isFixedPointed && iteration <= MaxIteration) {
			if (config.isVerbose()) {
				System.out.println("Iteration " + iteration + " => ");
			}
			// Initialize the isFixedPointed
			isFixedPointed = true;
			// If bounds has changed, then isChanged = false.
			boolean isChanged = false;
			// Iterate all the blocks, except Exit block.
			for (BasicBlock blk : list) {
				// Take the union of all blocks for exit block
				if (!blk.getType().equals(BlockType.EXIT)) {
					// Take the union of parents' bounds.
					for (BasicBlock parent : blk.getParentNodes()) {
						blk.unionBounds(parent);
					}
					isChanged = inferBlockBounds(config, blk, isChanged, iteration);
					// Use bitwise 'AND' to combine all the results
					isFixedPointed &= (!isChanged);
				}
			}// End of bound inference for all constraints in all blks.
			if (config.isVerbose()) {
				System.out.println("isFixedPointed=" + isFixedPointed);
			}
			iteration++;
		}

		// Take the union of all blocks to produce the functional result
		BasicBlock exit_blk = getBasicBlock(list, "exit", BlockType.EXIT);
		for (BasicBlock blk : list) {
			// Consider the consistent bounds without taking into the
			// inconsistent bounds.
			if (blk.isConsistent() && blk.getType() != BlockType.EXIT) {
				exit_blk.unionBounds(blk);
			}
		}

		Bounds bnd = exit_blk.getBounds();
		// check the verbose to determine whether to print out the CFG
		//if (config.isVerbose()) {
		//	BoundAnalyzerHelper.printCFG(list, config.getFilename(),
		//			(String) config.getProperty("function_name"));
		//}
		return bnd;
	}
	
}
