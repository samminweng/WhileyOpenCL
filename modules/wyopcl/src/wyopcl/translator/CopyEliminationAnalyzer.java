package wyopcl.translator;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import wybs.lang.Builder;
import wyil.attributes.VariableDeclarations;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.Return;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyil.transforms.LiveVariablesAnalysis;
import wyil.transforms.LiveVariablesAnalysis.Env;
import wyopcl.translator.bound.BasicBlock;
import wyopcl.translator.bound.BasicBlock.BlockType;
import wyopcl.translator.bound.CFGraph;

/**
 * Analyze the alias in the WyIL code to find all the necessary array copies and eliminate un-necessary copies.
 * 
 * @author Min-Hsien Weng
 *
 */
public class CopyEliminationAnalyzer extends Analyzer {
	private LiveVariablesAnalysis liveAnalyzer;
	// Store the liveness analysis for each function (Key: function, Value:Liveness information).
	private HashMap<FunctionOrMethod, Liveness> livenessStore;

	/**
	 * Basic Constructor
	 */
	public CopyEliminationAnalyzer(Builder builder, Configuration config) {
		super(config);
		this.liveAnalyzer = new LiveVariablesAnalysis(builder);
		// Diabled the constant propagation
		this.liveAnalyzer.setEnable(false);
		this.liveAnalyzer.setNops(true);
		// Initialize the liveness stores.
		this.livenessStore = new HashMap<FunctionOrMethod, Liveness>();
	}

	/**
	 * Output the live variables, that are stored in In/Out set.
	 * 
	 * @param env
	 *            In/Out set of live variables
	 * @param vars
	 *            the hash map, which maps register to the variable name.
	 * @return
	 */
	private String getLiveVariables(Env env, FunctionOrMethod function) {
		String str = "";
		Boolean isFirst = true;
		Iterator<Integer> iterator = env.iterator();
		while (iterator.hasNext()) {
			int register = iterator.next();
			if (!isFirst) {
				str += ", ";
			} else {
				isFirst = false;
			}
			// Get the variable name from register
			str += this.getActualVarName(register, function);
		}
		return str;
	}

	/**
	 * Print out the liveness for a given function.
	 * 
	 * @param function
	 * @param livenessStore
	 */
	private void printLivenss(FunctionOrMethod function) {
		// Get function name
		System.out.println("###### Live analysis for " + function.name() + " function. ######");
		// Get liveness
		Liveness liveness = getLiveness(function);
		// Get the list of blocks for the function.
		for (BasicBlock block : this.getBlocks(function)) {
			// Print out the in/out set for the block.
			System.out.println("In" + ":{" + getLiveVariables(liveness.getInSet(block), function) + "}\n" + block
					+ "\nOut" + ":{" + getLiveVariables(liveness.getOutSet(block), function) + "}\n");
		}
	}

	/**
	 * Get the live analysis results of the function.
	 * 
	 * @param function
	 * @return
	 */
	public Liveness getLiveness(FunctionOrMethod function) {
		// Get function name
		return livenessStore.get(function);
	}

	/**
	 * Applies live variable analysis on the function, in order to get in/out set of each block.
	 * 
	 * @param function
	 *            code block of function
	 */
	private void computeLiveVariableBlocks(FunctionOrMethod function) {
		// Get the graph
		List<BasicBlock> blocks = this.getCFGraph(function).getBlockList();
		// Store in/out set for each block.
		Liveness liveness = new Liveness(blocks);
		int iter = 1;// Start with 1st iteration.
		do {
			if (config.isVerbose()) {
				System.out.println("###### Live analysis for " + function.name() + " function. ######");
				System.out.println("Iteration " + iter);
			}
			// Set the initial value of isChanged.
			liveness.setChanged(false);
			// Traverse the blocks in the reverse order other than exit block
			for (int index = blocks.size() - 1; index >= 0; index--) {
				BasicBlock block = blocks.get(index);
				// Compute in/out blocks, except for exit or return block.
				if (!block.getType().equals(BlockType.EXIT) || !block.getType().equals(BlockType.RETURN)) {
					// Get in/out set of the block.
					Env out = (Env) liveness.computeOut(block);
					// Compute the store in set of the block.
					Env in = liveness.computeIn(block, (Env) out.clone(), liveAnalyzer);
					if (config.isVerbose()) {
						System.out.println("In" + ":{" + getLiveVariables(in, function) + "}\n" + block 
								+ "\nOut" + ":{" + getLiveVariables(out, function) + "}\n");
					}
				}
			}
			// Increment the iteration.
			iter++;
		} while (liveness.isChanged);
		// Store the liveness analysis for the function.
		livenessStore.put(function, liveness);
		// Print out analysis result
		printLivenss(function);
	}

	/**
	 * Applies live variable analysis on each basic block.
	 * 
	 * @param module
	 */
	public void apply(WyilFile module) {
		// Apply live analysis on each function, except for main function.
		for (FunctionOrMethod function : module.functionOrMethods()) {
			// Builds up a CFG of the function.
			this.buildCFG(function);
			computeLiveVariableBlocks(function);
		}
	}
	
	
	
	
	

	/**
	 * Stores and computes the liveness information for a function, including each block's 'in' and 'out' set.
	 * 
	 * @author Min-Hsien Weng
	 *
	 */
	public class Liveness {
		private boolean isChanged;// Indicate if there is any change of in/out  set.
		private HashMap<BasicBlock, Env> inSets;// Each env stores the register numbers.
		private HashMap<BasicBlock, Env> outSets;
		/**
		 * Constructor with a list of blocks.
		 * 
		 * @param blocks
		 */
		public Liveness(List<BasicBlock> blocks) {
			this.inSets = new HashMap<BasicBlock, Env>();
			this.outSets = new HashMap<BasicBlock, Env>();
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
				inSets.put(block, in);
				outSets.put(block, out);
			}
			this.isChanged = true;
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
		 * 
		 * @param code
		 * @param in
		 * @param out
		 */
		private Env computeIn(Codes.Invoke code, Env in) {
			// Get the callee (called function).
			String callee = code.name.name();
			// Get callee's liveness
			Liveness liveness = livenessStore.get(callee);
			// Check if the information has been produced.
			if (liveness != null) {

			}

			return in;
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
		private Env computeIn(List<Code> codes, Env in, LiveVariablesAnalysis liveAnalyzer) {
			// Traverse the wyil code in the reverse order.
			for (int i = codes.size() - 1; i >= 0; i--) {
				// Compute the live variables, and store the results in in/out set.
				Code code = codes.get(i);
				if (code instanceof Codes.Assert) {
					in = computeIn(((Codes.Assert) code).bytecodes(), in, liveAnalyzer);
				} else if (code instanceof Codes.Invariant) {
					in = computeIn(((Codes.Invariant) code).bytecodes(), in, liveAnalyzer);
				} else if (code instanceof Codes.Invoke) {
					// in = computeIn((Codes.Invoke)code, in);
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
		public Env computeIn(BasicBlock block, Env in, LiveVariablesAnalysis liveAnalyzer) {
			List<Code> codes = block.getCodeBlock().bytecodes();
			in = computeIn(codes, in, liveAnalyzer);
			// Update 'in' set of the block.
			setInSet(block, in);
			return in;
		}

		/**
		 * Set 'in' set for a block and check if 'new_in' is different from existing 'in'. If so, then update
		 * 'isChanged' flag to indicate there is a change.
		 * 
		 * @param block
		 * @return
		 */
		protected void setInSet(BasicBlock blk, Env new_in) {
			// Check if new 'in' set is different from existing 'in' set.
			Env in = getInSet(blk);
			if (!in.equals(new_in)) {
				// Use logic OR operator to combine the result of 'isChanged'
				// flag.
				this.isChanged |= true;
				// Update 'in' set
				inSets.put(blk, new_in);
			}
		}

		/**
		 * Set 'out' set and check if there is any change in 'out' set.
		 * 
		 * @param block
		 * @param new_out
		 */
		protected void setOutSet(BasicBlock blk, Env new_out) {
			Env out = getOutSet(blk);
			if (!out.equals(new_out)) {
				this.isChanged |= true;
				outSets.put(blk, new_out);
			}
		}

		/**
		 * Get the in set.
		 * 
		 * @param block
		 * @return
		 */
		public Env getInSet(BasicBlock block) {
			return inSets.get(block);
		}

		/**
		 * Get the out set.
		 * 
		 * @param block
		 * @return
		 */
		public Env getOutSet(BasicBlock block) {
			return outSets.get(block);
		}		
		
		/**
		 * Compute 'out' set for a block. Take the union of in sets of child blocks to produce the out set.
		 * 
		 * @param set
		 */
		protected Env computeOut(BasicBlock block) {
			// Check if the block is not exit block.
			Env out = getOutSet(block);
			// Check if block has the children.
			if(!block.isLeaf()){
				// Take the union of child blocks' in set.
				for (BasicBlock child : block.getChildNodes()) {
					Env in = getInSet(child);
					out.addAll(in);
				}
				setOutSet(block, out);
			}
			return getOutSet(block);
		}

	}
}
