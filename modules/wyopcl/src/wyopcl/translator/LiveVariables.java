package wyopcl.translator;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.CodeBlock;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.Codes.Return;
import wyopcl.translator.cfg.BasicBlock;
import wyopcl.translator.cfg.BasicBlock.BlockType;
import wyopcl.translator.cfg.CFGraph;

/**
 * Stores and computes live variables for each function, including each block's 'IN' and 'OUT' set.
 * 
 * @author Min-Hsien Weng
 *
 */
public class LiveVariables {
	private boolean isChanged;// Indicate if there is any change of in/out set.
	private HashMap<BasicBlock, HashSet<Integer>> inSet;// Each env stores the register numbers.
	private HashMap<BasicBlock, HashSet<Integer>> outSet;

	/**
	 * Constructor with a list of blocks.
	 * 
	 * @param blocks
	 */
	public LiveVariables() {
		inSet = new HashMap<BasicBlock, HashSet<Integer>>();
		outSet = new HashMap<BasicBlock, HashSet<Integer>>();
	}

	private void initialize(List<BasicBlock> blocks) {
		// Initialize in/out set for each block.
		for (BasicBlock block : blocks) {
			HashSet<Integer> in = new HashSet<Integer>();
			HashSet<Integer> out = new HashSet<Integer>();
			// Use different initial values for return block.
			if (block.getType().equals(BlockType.RETURN)) {
				Codes.Return code = (Return) block.getCodeBlock().get(0);
				// Add the return register to both in/out set.
				in.add(code.operand(0));
				out.add(code.operand(0));
			}
			inSet.put(block, in);
			outSet.put(block, out);
		}
		this.isChanged = true;
	}

	/**
	 * Given a control flow graph, compute 'IN' and 'OUT' set for each code block using live variable analysis (Whiley
	 * compiler) and stores each in/out set with HashMap separately.
	 * 
	 * @param name
	 * @param isVerbose
	 * @param graph
	 * @param liveAnalyzer
	 */
	public void computeLiveness(String name, boolean isVerbose, CFGraph graph) {
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
				// Skip exit or return block.
				if (block.getType().equals(BlockType.EXIT) || block.getType().equals(BlockType.RETURN)) {
					continue;
				}
				// Compute in/out for a block
				HashSet<Integer> out = (HashSet<Integer>) computeOut(block);
				// Compute the store in set of the block.
				HashSet<Integer> in = computeIN(block, (HashSet<Integer>) out.clone());
				if (isVerbose) {
					System.out.println("In" + ":{" + in + "}\n" + block + "\nOut" + ":{" + out + "}\n");
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
	 * <p>
	 * Implements a classic live variables analysis to enable efficient reference counting. Compound structures in
	 * Whiley (e.g. lists, sets, records, etc) are <i>reference counted</i>. This means we count the number of aliases
	 * to them in the heap and on the stack. Then, when a compound structure is updated, we can perform an <i>inplace
	 * update</i> if the reference count is 1; otherwise, we have to clone the structure. Cloning is potentially
	 * expensive, and we want to avoid it as much as possible. Therefore, as soon as a variable is no longer live, we
	 * should decrement its reference count. This is signalled using the special <code>void</code> bytecode which,
	 * literally, "voids" a given register thereby allowing us to release it.
	 * </p>
	 * <p>
	 * The purpose of this class is to determine when a variable is live, and when it is not. The live variables
	 * analysis operates as a backwards analysis, propagating information from variable uses (i.e. <code>load</code>
	 * bytecodes) back to their definitions (i.e. <code>store</code> bytecodes). For more information on Live Variables
	 * Analysis, see <a href="http://en.wikipedia.org/wiki/Live_variable_analysis">the Wikipedia page</a>.
	 * </p>
	 *
	 * @author David J. Pearce, 2011
	 *
	 */
	public HashSet<Integer> propagate(CodeBlock.Index index, Code code, HashSet<Integer> environment) {
		// rewrites.put(index,null);
		boolean isLive = true;
		environment = (HashSet<Integer>) environment.clone();

		// Compute 'env = (env - def)' where 'def' set is dead variables at code 
		if (code instanceof Code.AbstractBytecode) {
			Code.AbstractBytecode aa = (Code.AbstractBytecode) code;

			if (code instanceof Codes.ArrayGenerator) {
				// Special case for arraygen (modified by Sam)
				Codes.ArrayGenerator arrgen = (Codes.ArrayGenerator) code;
				// Because left operand is dead and remove it from environment set
				isLive = environment.remove(arrgen.target(0));
			} else {
				for (int target : aa.targets()) {
					isLive = environment.remove(target);
				}
			}
		}

		// Compute 'env = env + used' where 'used' set is used/live at code
		if (code instanceof Codes.Assign) {
			Codes.Assign assign = (Codes.Assign) code;
			// Put right operand to environment set because it is a used variable
			environment.add(assign.operand(0));
		} else if (code instanceof Codes.Update) {
			// Special case for update code (left operand is always alive)
			Codes.Update cu = (Codes.Update) code;
			if (!(cu.type(0) instanceof Type.Reference)) {
				// Put target to environment (modified by Sam)
				isLive = environment.add(cu.target(0));
			}
//		} else if (code instanceof Codes.Invoke) {
//			Codes.Invoke invoke = (Codes.Invoke)code;
//			for (int operand : invoke.operands()) {
//				environment.add(operand);
//			}
//		} else if(code instanceof Codes.IndirectInvoke){
//				//&& ((Codes.IndirectInvoke) code).type(0) instanceof Type.Method){
//			Codes.IndirectInvoke indirectInvoke = (Codes.IndirectInvoke)code;
//			for (int operand : indirectInvoke.operands()) {
//				environment.add(operand);
//			}
		} else if(code instanceof Code.AbstractBytecode) {
			// FIXME: this seems to be a problem if there are no assigned variables!
			Code.AbstractBytecode c = (Code.AbstractBytecode) code;
			for (int operand : c.operands()) {
				environment.add(operand);
			}
		}else if(code instanceof Codes.Const || code instanceof Codes.Label 
				|| code instanceof Codes.Quantify){
			// Do nothing because const any used variable
			// We skip Quantify code
		} else{
			throw new RuntimeException("Not implemented");
		}
//		}else if (!isLive) {
//			// rewrites.put(index, Codes.Nop);
//		} 

		return environment;
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
	private HashSet<Integer> compute(List<Code> codes, HashSet<Integer> in) {
		// Traverse the wyil code in the reverse order.
		for (int i = codes.size() - 1; i >= 0; i--) {
			// Compute the live variables, and store the results in in/out set.
			Code code = codes.get(i);
			if (code instanceof Codes.Assert) {
				in = compute(((Codes.Assert) code).bytecodes(), in);
			} else if (code instanceof Codes.Invariant) {
				in = compute(((Codes.Invariant) code).bytecodes(), in);
			} else {
				in = propagate(null, code, in);
			}
		}
		return in;
	}

	/**
	 * Compute the liveness information for a list of code.
	 * 
	 * @param b
	 *            the basic block that contains a list of byte-code.
	 * @param in
	 *            the initial 'in' set
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public HashSet<Integer> computeIN(BasicBlock b, HashSet<Integer> in) {
		// Get the exiting 'in' set
		HashSet<Integer> old_in = (HashSet<Integer>) getIN(b).clone();

		List<Code> codes = b.getCodeBlock();
		in = compute(codes, in);
		// Check if new 'in' set is different from existing 'in' set.
		if (!old_in.equals(in)) {
			// Use logic OR operator to combine the result of 'isChanged' flag.
			this.isChanged |= true;
			// Update 'in' set
			inSet.put(b, in);
		}
		return getIN(b);
	}

	/**
	 * Set 'out' set and check if there is any change in 'out' set.
	 * 
	 * @param block
	 * @param new_out
	 */
	protected void setOUT(BasicBlock blk, HashSet<Integer> out) {
		HashSet<Integer> old_out = getOUT(blk);
		if (!old_out.equals(out)) {
			this.isChanged |= true;
			outSet.put(blk, out);
		}
	}

	/**
	 * Get the in set.
	 * 
	 * @param block
	 * @return
	 */
	public HashSet<Integer> getIN(BasicBlock block) {
		return inSet.get(block);
	}

	/**
	 * Get the out set.
	 * 
	 * @param block
	 * @return
	 */
	public HashSet<Integer> getOUT(BasicBlock block) {
		return outSet.get(block);
	}

	/**
	 * Compute 'out' set for a block. Take the union of in sets of child blocks to produce the out set.
	 * 
	 * @param set
	 */
	public HashSet<Integer> computeOut(BasicBlock b) {
		// Check if the block is not exit block.
		HashSet<Integer> out = getOUT(b);
		// Check if block has the children.
		if (!b.isLeaf()) {
			// Take the union of child blocks' in set.
			for (BasicBlock child : b.getChildNodes()) {
				HashSet<Integer> in = getIN(child);
				out.addAll(in);
			}
			// Update 'out' set of the block
			outSet.put(b, out);
		}
		return getOUT(b);
	}
}
