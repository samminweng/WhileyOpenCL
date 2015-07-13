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
	

	public BoundInference() {
		
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
		/*int MaxIteration = 5;
		if (config.isGradualWiden()) {
			MaxIteration = 20;
		}*/

		boolean isFixedPoint = false;
		int iteration = 0;
		// Stop the loop when the program reaches the fixed point or
		// max-iterations
		// by using AND operator to combine these two condition.
		// If both of two conditions are evaluated to be true, then enter the
		// loop.
		// while (!isFixedPointed && iteration <= MaxIteration) {
		while (!isFixedPoint) {
			if (config.isVerbose()) {
				System.out.println("Iteration " + iteration + " => ");
			}
			// Initialize the isFixedPointed
			isFixedPoint = true;
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
					// Take the union of parents' bounds to produce the input bounds for bound inference.
					for (BasicBlock parent : blk.getParentNodes()) {
						blk.unionBounds(parent);
					}									
					
					blk.inferBounds();
					// End of bound inference for each blks.
					
					bnd_after = (Bounds) blk.getBounds();
					if (blk.getType().equals(BlockType.LOOP_BODY)) {
						bnd_after.checkBoundChange(bnd_before);
						//checkLoopVarBoundChange(config, bnd_before, bnd_after, iteration, blk);
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
					isFixedPoint &= (!isChanged);
				}
			}
			
			if (config.isVerbose()) {
				System.out.println("isFixedPoint=" + isFixedPoint);
			}
			
			// Repeat the bound inference for (maximal) three iterations
			if(iteration == 3){
				//Widen the bounds of loop variables in all blocks.
				for(BasicBlock blk: list){
					blk.getBounds().widenBounds(config);
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
