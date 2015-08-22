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
 * Analyze the alias in the WyIL code to find all the necessary array copies and
 * eliminate un-necessary copies.
 * 
 * @author Min-Hsien Weng
 *
 */
public class CopyEliminationAnalyzer extends Analyzer {
	//private final String prefix = "%";
	private LiveVariablesAnalysis liveAnalyzer;
	//Store the liveness analysis for each function (Key: function name, Value:Liveness information).
	private HashMap<String, Liveness> livenessStore;

	/**
	 * Basic Constructor
	 */
	public CopyEliminationAnalyzer(Builder builder, Configuration config) {
		super(config);
		this.liveAnalyzer = new LiveVariablesAnalysis(builder);
		// Diabled the constant propagation
		this.liveAnalyzer.setEnable(false);
		this.liveAnalyzer.setNops(true);
		//Initialize the liveness stores.
		this.livenessStore = new HashMap<String, Liveness>();
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
	private String getLiveVars(Env env, FunctionOrMethod function) {
		//Get the mapping table between variable name and register.
		VariableDeclarations vars = function.attribute(VariableDeclarations.class);
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
			String var_name = vars.get(register).name();
			if (var_name == null) {
				// If it is a temporary variable at byte-code, then print out
				// the register
				var_name = "%" + register;
			}
			str += var_name;
		}
		return str;
	}


	/**
	 * Print out the liveness for a given function.
	 * @param function
	 * @param livenessStore
	 */
	private void printLivenss(FunctionOrMethod function){
		//Get function name
		String name = function.name();
		System.out.println("###### Live analysis for " + name + " function. ######");
		//Get liveness 
		Liveness liveness = livenessStore.get(name);
		//Get the list of blocks for the function.
		List<BasicBlock> blocks = this.getBlocks(function);
		for(BasicBlock block: blocks){
			Env in = liveness.getIn(block);
			Env out = liveness.getOut(block);
			//Print out the in/out set for the block.
			System.out.println("In" + ":{" + getLiveVars(in, function) + "}\n" 
					+ block + "\nOut" + ":{" + getLiveVars(out, function) + "}\n");
		}


	}



	/**
	 * 
	 * @param code
	 * @param in
	 * @param out
	 */
	private Env computeIn(Codes.Invoke code, Env in){
		//Get the callee (called function).
		String callee = code.name.name();
		//Get callee's liveness 
		Liveness liveness = livenessStore.get(callee);
		//Check if the information has been produced.
		if(liveness != null){

		}
		
		return in;

	}

	
	/**
	 * Compute the liveness information for a list of code.
	 * @param block the basic block that contains a list of byte-code.
	 * @param in the in set
	 * @return 
	 */
	private Env computeIn(List<Code> codes, Env in){
		// Compute the live variables, and store the results in in/out set.
		for(int i = codes.size()-1; i>=0; i--){
			Code code = codes.get(i);
			if(code instanceof Codes.Assert){
				in = computeIn(((Codes.Assert)code).bytecodes(), in);
			}else if(code instanceof Codes.Return){
				Return r = (Codes.Return)code;
				if(r.operand != Codes.NULL_REG){
					//Check if return value is in/out set.
					if(!in.contains(r.operand)){
						//Add the return value to both in and out set.
						in.add(r.operand);
					}							
				}					
			}else if (code instanceof Codes.Invariant){
				in = computeIn(((Codes.Invariant)code).bytecodes(), in);
			}else if (code instanceof Codes.Invoke){
				in = computeIn((Codes.Invoke)code, in);
			}else{
				in = liveAnalyzer.propagate(null, code, in);
			}
		}		
		return in;
	}


	

	/**
	 * Apply live variable analysis on the function, and get in/out set of each
	 * block.
	 * 
	 * @param module
	 */
	private void applyLiveAnalysisByBlock(FunctionOrMethod function) {
		String name = function.name();
		//Get the graph
		CFGraph graph = this.getCFGraph(function);
		List<BasicBlock> blocks = graph.getBlockList();
		// Store in/out set for each block.
		Liveness liveness = new Liveness(blocks);

		int iter = 1;//Start with 1st iteration.
		do {
			if(config.isVerbose()){
				System.out.println("###### Live analysis for " + name + " function. ######");
				System.out.println("Iteration " + iter);
			}			
			//Set the initial value of isChanged.
			liveness.setIsChanged(false);
			//Traverse the blocks in the reverse order other than exit block
			for (int b= blocks.size()-1;b>=0;b--) {
				BasicBlock block = blocks.get(b);
				if(!block.getType().equals(BlockType.EXIT)){
					// Get in/out set of the block.
					Env out = (Env)liveness.getOut(block).clone();
					Env in = (Env) out.clone();
					// Compute the store in set of the block.
					in = computeIn(block.getCodeBlock().bytecodes(), in);					
					// Update 'in' set of the block.
					liveness.setIn(block, in);	
					if(config.isVerbose()){
						System.out.println("In" + ":{" + getLiveVars(in, function) + "}\n"
								+ block + "\nOut" + ":{" + getLiveVars(out, function) + "}\n");
					}
				}				
			}
			//Increment the iteration.
			iter++;
		}while(liveness.isChanged);	
		//Store the liveness analysis for the function. 
		livenessStore.put(name, liveness);
	}

	/**
	 * Apply live variable analysis on each basic block.
	 * 
	 * @param module
	 */
	public void apply(WyilFile module) {
		// Iterate each function to build up CFG
		this.buildCFG(module);
		// Apply live analysis on each function, except for main function.
		for (FunctionOrMethod function : module.functionOrMethods()) {
			//Print out the CFGraph
			if(config.isVerbose()){
				this.printCFG(function);
			}			
			applyLiveAnalysisByBlock(function);
			printLivenss(function);
		}
	}

	/**
	 * Stores the liveness for each block, including 'in' and 'out' set.
	 * 
	 * @author Min-Hsien Weng
	 *
	 */
	protected class Liveness {
		//Indicate if there is any change of in/out set.
		private boolean isChanged;
		private HashMap<BasicBlock, Env> inStore;
		private HashMap<BasicBlock, Env> outStore;

		/**
		 * Initializes the in set for each block.
		 * @param blocks
		 */
		private void initialize(List<BasicBlock> blocks){
			//Initialize in/out set for each block.
			for(BasicBlock block: blocks){
				inStore.put(block, new Env());
				outStore.put(block, new Env());
			}
		}

		/**
		 * Constructor with a list of blocks.
		 * @param blocks
		 */
		public Liveness(List<BasicBlock> blocks) {
			this.inStore = new HashMap<BasicBlock, Env>();
			this.outStore = new HashMap<BasicBlock, Env>();	
			initialize(blocks);
		}		

		/**
		 * Set the isChanged flag.
		 * @param isChanged
		 */
		public void setIsChanged(boolean isChanged){
			this.isChanged = isChanged;
		}

		public boolean isChanged(){
			return this.isChanged;
		}

		/**
		 * Set 'in' set for a block and check if 'new_in' is 
		 * different from existing 'in'. If so, then update 
		 * 'isChanged' flag to indicate there is a change. 
		 * 
		 * @param block
		 * @return
		 */
		protected void setIn(BasicBlock block, Env new_in) {
			//Check if new and existing in set are the same
			Env in = inStore.get(block);
			if(!in.equals(new_in)){
				//Use logic OR operator to combine the result of 'isChanged' flag.
				this.isChanged |= true;				
			}
			//Update in set
			inStore.put(block, new_in);
		}

		/**
		 * Get the in set.
		 * @param block
		 * @return
		 */
		public Env getIn(BasicBlock block){			
			return inStore.get(block);
		}


		/**
		 * Returns 'out' set for a block. Take the union of in sets of child
		 * blocks to produce the out set.
		 * 
		 * @param set
		 */
		protected Env getOut(BasicBlock block) {
			// Check if the block has the child blocks.
			if (!block.isLeaf()) {
				Env out = outStore.get(block);
				// Get child nodes of the block
				for (BasicBlock child : block.getChildNodes()) {
					Env in = inStore.get(child);
					out.addAll(in);
				}	
				outStore.put(block, out);
			}
			return outStore.get(block);
		}
		
		
		/**
		 * Check if a register is live at a given block.
		 *
		 * 
		 * @param reg
		 * @param blk
		 * @return
		 */
		protected boolean isLive(int reg, BasicBlock blk){
			//Get the in set of the block
			Env in = getIn(blk);
			//Check if 'in' set contains the register
			return in.contains(reg);
		}
		
	}
}
