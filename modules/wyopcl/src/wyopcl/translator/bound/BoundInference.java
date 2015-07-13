package wyopcl.translator.bound;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import wyopcl.translator.BoundAnalyzerHelper;
import wyopcl.translator.Configuration;
import wyopcl.translator.bound.BasicBlock.BlockType;

/**
 * Given a list of CFG blocks, infer the bounds for each block and output the
 * result bounds of return value.
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public class BoundInference {
	private final String prefix = "%";
	// A list of loop variables.
	private HashMap<String, BoundChange> loop_variables;

	public BoundInference() {
		this.loop_variables = new HashMap<String, BoundChange>();
	}

	/**
	 * Get the bound change of loop variable. If not found, add a new bound
	 * change to the hashmap
	 * 
	 * @param loop_var
	 */
	public BoundChange getBoundChange(String loop_var) {
		if (!loop_variables.containsKey(loop_var)) {
			loop_variables.put(loop_var, new BoundChange(loop_var));
		}

		return loop_variables.get(loop_var);
	}

	/**
	 * Check if the bounds of loop variables
	 * 
	 * @param config
	 * @param bnd_before
	 * @param bnd_after
	 */
	private void checkLoopVarBoundChange(Configuration config, Bounds bnd_before, Bounds bnd_after, int iteration, BasicBlock blk) {

		// check loop variable is increasing
		for (String loop_var : bnd_before.getBounds().keySet()) {
			// Upper bounds
			BigInteger upper_before = bnd_before.getUpper(loop_var);
			BigInteger upper_after = bnd_after.getUpper(loop_var);
			BoundChange boundChange = getBoundChange(loop_var);
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

		}
		// }

	}

	/**
	 * Widens the upper/lower bounds against thresholds, according to the bound changes and widen strategy
	 * 
	 * @param config
	 * @param blk
	 *            the block
	 */
	private void widenLoopVarBounds(Configuration config, BasicBlock blk) {
		//boolean isChange = false;
		for(String var: blk.getBounds().getBounds().keySet()){
			if(loop_variables.keySet().contains(var)){
				String loop_var = var;
				BoundChange boundChange = getBoundChange(loop_var);
				// Widen the upper bound
				if (boundChange.isUBIncreasing()) {
					if (config.isGradualWiden()) {
						blk.getBounds().widenUpperBoundsAgainstThresholds(loop_var);
					} else {
						blk.getBounds().widenUpperBoundsToInf(loop_var);
					}
				}
				// Reset the increasing flag
				// boundChange.setUBIncreasing(false);
				// Widen the lower bound
				if (boundChange.isLBDecreasing()) {
					if (config.isGradualWiden()) {
						blk.getBounds().widenLowerBoundsAgainstThresholds(loop_var);
					} else {
						blk.getBounds().widenLowerBoundsToInf(loop_var);
					}
				}
			}
		}
		// Clear all the bound changes
		//loop_variables.clear();
		//return isChange;

	}

	/**
	 * Repeatedly iterates over all blocks, starting from the entry block to the
	 * exit block, and infer the bounds consistent with all the constraints in
	 * each block.
	 * 
	 * @return the bounds
	 */
	public Bounds inferBounds(Configuration config, CFGraph graph) {
		List<BasicBlock> list = graph.getList();
		// The least common multiple of naive (4) and graduate (12) widening
		// strategies plus one.
		int MaxIteration = 5;
		if (config.isGradualWiden()) {
			MaxIteration = 20;
		}

		boolean isFixedPointed = false;
		int iteration = 0;
		// Stop the loop when the program reaches the fixed point or
		// max-iterations
		// by using AND operator to combine these two condition.
		// If both of two conditions are evaluated to be true, then enter the
		// loop.
		// while (!isFixedPointed && iteration <= MaxIteration) {
		while (!isFixedPointed) {
			if (config.isVerbose()) {
				System.out.println("Iteration " + iteration + " => ");
			}
			// Initialize the isFixedPointed
			isFixedPointed = true;
			// Iterate all the blocks, except Exit block.
			// After three iterations, widen the bounds of loop variable
			// in loop header.
			// The bounds in loop header does not need to go through
			// bound inference procedure
			// because the widening operator forces the loop variable to
			// blow out to inf
			for (BasicBlock blk : list) {
				boolean isChanged = false;
				// Take the union of all blocks, except for exit block.
				if (!blk.getType().equals(BlockType.EXIT)) {
					Bounds bnd_before = null, bnd_after = null;
					//Before the bound inference, clone and assign the inferred bounds to the bnd_before.
					bnd_before = (Bounds) blk.getBounds().clone();
					// Take the union of parents' bounds.
					for (BasicBlock parent : blk.getParentNodes()) {
						blk.unionBounds(parent);
					}									
					
					blk.inferBounds();// End of bound inference for all constraints in all blks.
					
					bnd_after = (Bounds) blk.getBounds();
					if (blk.getType().equals(BlockType.LOOP_BODY)) {
						checkLoopVarBoundChange(config, bnd_before, bnd_after, iteration, blk);
					}
					//Test the equality of existing and newly inferred bounds.
					if(bnd_before!= null && !bnd_before.equals(bnd_after)){
						// If bounds has changed, then isChanged = false.
						isChanged = true;
					}
					
					// Print out the bounds.
					if (config.isVerbose()) {
						System.out.println(blk);
						System.out.println("isChanged=" + isChanged);
					}
					
					
					// Use bitwise 'AND' to combine all the results
					isFixedPointed &= (!isChanged);
					
				}
			}
			
			if (config.isVerbose()) {
				System.out.println("isFixedPointed=" + isFixedPointed);
			}
			
			// Repeat the bound inference for (maximal) three iterations
			if(iteration == 3){
				//Widen the bounds of loop variables in all blocks.
				for(BasicBlock blk: list){
					widenLoopVarBounds(config, blk);
				}
				//Reset the iteration
				iteration = 0;
			}else{
				iteration++;
			}
			
		}

		// Take the union of all blocks to produce the functional result
		BasicBlock exit_blk = graph.getBasicBlock("exit", BlockType.EXIT);
		for (BasicBlock blk : list) {
			// Consider the consistent bounds without taking into the
			// inconsistent bounds.
			if (blk.isConsistent() && blk.getType() != BlockType.EXIT) {
				exit_blk.unionBounds(blk);
			}
		}

		return exit_blk.getBounds();
	}

}
