package wyopcl.translator.copy;

import java.util.HashMap;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.Return;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyil.transforms.LiveVariablesAnalysis;
import wyil.transforms.LiveVariablesAnalysis.Env;
import wyopcl.translator.bound.BasicBlock;
import wyopcl.translator.bound.BasicBlock.BlockType;
import wyopcl.translator.bound.CFGraph;


/**
 * Stores and computes live variables for each function, including each block's 'IN' and 'OUT' set.
 * 
 * @author Min-Hsien Weng
 *
 */
public class LiveVariables {
	private boolean isChanged;// Indicate if there is any change of in/out  set.
	private HashMap<BasicBlock, Env> inSet;// Each env stores the register numbers.
	private HashMap<BasicBlock, Env> outSet;
	/**
	 * Constructor with a list of blocks.
	 * 
	 * @param blocks
	 */
	public LiveVariables() {
		inSet = new HashMap<BasicBlock, Env>();
		outSet = new HashMap<BasicBlock, Env>();
	}

	private void initialize(List<BasicBlock> blocks){
		// Initialize in/out set for each block.
		for (BasicBlock block : blocks) {
			Env in = new Env();
			Env out = new Env();
			// Use different initial values for return block.
			if (block.getType().equals(BlockType.RETURN)) {
				Codes.Return code = (Return) block.getCodeBlock().get(0);
				// Add the return register to both in/out set.
				in.add(code.operand);
				out.add(code.operand);
			}
			inSet.put(block, in);
			outSet.put(block, out);
		}
		this.isChanged = true;
	}

	/**
	 * Given a control flow graph, compute 'IN' and 'OUT' set for each code block using live variable analysis
	 * (Whiley compiler) and stores each in/out set with HashMap separately.
	 * @param name
	 * @param isVerbose
	 * @param graph
	 * @param liveAnalyzer
	 */
	public void computeLiveness(String name, boolean isVerbose, CFGraph graph, LiveVariablesAnalysis liveAnalyzer){
		List<BasicBlock> blocks = graph.getBlockList();
		initialize(blocks);
		int iteration = 1;// Start with 1st iteration.
		do {
			if (isVerbose) {
				System.out.println("###### Live analysis for " + name + " function. ######");
				System.out.println("Iteration " + iteration);
			}
			// Set the initial value of isChanged.
			this.isChanged = false;
			// Traverse the blocks in the reverse order other than exit block
			for (int index = blocks.size() - 1; index >= 0; index--) {
				BasicBlock block = blocks.get(index);
				// Compute in/out blocks, except for exit or return block.
				if (!block.getType().equals(BlockType.EXIT) || !block.getType().equals(BlockType.RETURN)) {
					// Get in/out set of the block.
					Env out = (Env) computeOut(block);
					// Compute the store in set of the block.
					Env in = computeIN(block, (Env) out.clone(), liveAnalyzer);
					if (isVerbose) {
						System.out.println("In" + ":{" + in + "}\n" + block 
								+ "\nOut" + ":{" + out + "}\n");
					}
				}
			}
			// Increment the iteration.
			iteration++;
		} while (this.isChanged);
		
	}



	/**
	 * Set the isChanged flag.
	 * 
	 * @param isChanged
	 */
	public void setChanged(boolean isChanged) {
		this.isChanged = isChanged;
	}

	public boolean isChanged() {
		return this.isChanged;
	}

	/**
	 * Compute 'in' set for a list of code.
	 * 
	 * @param codes
	 *            the list of wyil code.
	 * @param in
	 *            the 'in' set
	 * @return the resulting 'in' set.
	 */
	private Env compute(List<Code> codes, Env in, LiveVariablesAnalysis liveAnalyzer) {
		// Traverse the wyil code in the reverse order.
		for (int i = codes.size() - 1; i >= 0; i--) {
			// Compute the live variables, and store the results in in/out set.
			Code code = codes.get(i);
			if (code instanceof Codes.Assert) {
				in = compute(((Codes.Assert) code).bytecodes(), in, liveAnalyzer);
			} else if (code instanceof Codes.Invariant) {
				in = compute(((Codes.Invariant) code).bytecodes(), in, liveAnalyzer);
			} else {
				in = liveAnalyzer.propagate(null, code, in);
			}
		}
		return in;
	}

	/**
	 * Compute the liveness information for a list of code.
	 * 
	 * @param block
	 *            the basic block that contains a list of byte-code.
	 * @param in
	 *            the initial 'in' set
	 * @return
	 */
	public Env computeIN(BasicBlock block, Env in, LiveVariablesAnalysis liveAnalyzer) {
		List<Code> codes = block.getCodeBlock().bytecodes();
		in = compute(codes, in, liveAnalyzer);
		// Update 'in' set of the block.
		setIN(block, in);
		return in;
	}

	/**
	 * Set 'in' set for a block and check if 'new_in' is different from existing 'in'. If so, then update
	 * 'isChanged' flag to indicate there is a change.
	 * 
	 * @param block
	 * @return
	 */
	protected void setIN(BasicBlock blk, Env new_in) {
		// Check if new 'in' set is different from existing 'in' set.
		Env in = getIN(blk);
		if (!in.equals(new_in)) {
			// Use logic OR operator to combine the result of 'isChanged' flag.
			this.isChanged |= true;
			// Update 'in' set
			inSet.put(blk, new_in);
		}
	}

	/**
	 * Set 'out' set and check if there is any change in 'out' set.
	 * 
	 * @param block
	 * @param new_out
	 */
	protected void setOUT(BasicBlock blk, Env new_out) {
		Env out = getOUT(blk);
		if (!out.equals(new_out)) {
			this.isChanged |= true;
			outSet.put(blk, new_out);
		}
	}

	/**
	 * Get the in set.
	 * 
	 * @param block
	 * @return
	 */
	public Env getIN(BasicBlock block) {
		return inSet.get(block);
	}

	/**
	 * Get the out set.
	 * 
	 * @param block
	 * @return
	 */
	public Env getOUT(BasicBlock block) {
		return outSet.get(block);
	}		

	/**
	 * Compute 'out' set for a block. Take the union of in sets of child blocks to produce the out set.
	 * 
	 * @param set
	 */
	public Env computeOut(BasicBlock block) {
		// Check if the block is not exit block.
		Env out = getOUT(block);
		// Check if block has the children.
		if(!block.isLeaf()){
			// Take the union of child blocks' in set.
			for (BasicBlock child : block.getChildNodes()) {
				Env in = getIN(child);
				out.addAll(in);
			}
			setOUT(block, out);
		}
		return getOUT(block);
	}

}
