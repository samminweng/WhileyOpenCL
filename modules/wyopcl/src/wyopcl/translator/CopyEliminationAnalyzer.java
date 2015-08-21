package wyopcl.translator;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import wybs.lang.Builder;
import wyil.attributes.VariableDeclarations;
import wyil.lang.Code;
import wyil.lang.CodeBlock;
import wyil.lang.CodeBlock.Index;
import wyil.lang.Codes;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyil.transforms.LiveVariablesAnalysis;
import wyil.transforms.LiveVariablesAnalysis.Env;
import wyil.util.dfa.BackwardFlowAnalysis;
import wyopcl.translator.bound.BasicBlock;
import wyopcl.translator.bound.CFGraph;

/**
 * Analyze the alias in the WyIL code to find all the necessary array copies and
 * eliminate un-necessary copies.
 * 
 * @author Min-Hsien Weng
 *
 */
public class CopyEliminationAnalyzer extends Analyzer {
	private final String prefix = "%";
	private LiveVariablesAnalysis liveAnalyzer;
	//Store the liveness analysis for each function
	private HashMap<FunctionOrMethod, Liveness> store;


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
		this.store = new HashMap<FunctionOrMethod, Liveness>();
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
	private String getLiveVars(Env env, VariableDeclarations vars) {
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
	 * Apply the live variable analysis on a list of bytecode
	 * 
	 * @param codes
	 */
	private void applyLiveAnalysisByCode(FunctionOrMethod function) {
		VariableDeclarations vars = function.attribute(VariableDeclarations.class);
		String name = function.name();
		System.out.println("###### Live analysis for " + name + " function. ######");
		Env env = new Env();
		List<Code> codes = function.body().bytecodes();
		System.out.println("In" + "={" + getLiveVars(env, vars) + "}");
		for (int iter = 0; iter < 5; iter++) {
			System.out.println("Iteration: "+iter);
			for (int i = codes.size() - 1; i >= 0; i--) {
				Code code = codes.get(i);
				// Construct an Index object.
				CodeBlock.Index id = new CodeBlock.Index(null, i);
				Env out = (Env) env.clone();
				env = liveAnalyzer.propagate(id, code, env);
				if (config.isVerbose()) {
					System.out.println("In[" + i + "]" + "={" + getLiveVars(env, vars) + "}\n" + "L." + i + " = " + code + "\n" + "Out[" + i + "]:{"
							+ getLiveVars(out, vars) + "}\n\n");
				}
				out = null;
			}
		}

		Env out = liveAnalyzer.lastStore();
		System.out.println("Out" + ":{" + getLiveVars(env, vars) + "}\n");

	}
	/**
	 * Print out the liveness for a given function.
	 * @param function
	 * @param store
	 */
	private void printLivenss(FunctionOrMethod function){
		VariableDeclarations vars = function.attribute(VariableDeclarations.class);
		//Get function name
		String name = function.name();
		System.out.println("###### Live analysis for " + name + " function. ######");
		//Get liveness 
		Liveness liveness = store.get(function);
		//Get the list of blocks for the function.
		List<BasicBlock> blocks = this.getBlocks(function);
		for(BasicBlock block: blocks){
			Env in = liveness.getInSet(block);
			Env out = liveness.getOutSet(block);
			//Print out the in/out set for the block.
			System.out.println("In" + ":{" + getLiveVars(in, vars) + "}\n" + block + "\nOut" + ":{" + getLiveVars(out, vars) + "}\n");
		}


	}


	
	/**
	 * Computes the live variables for return byte-code
	 * @param code
	 */
	private void compute(Codes.Return code, Env in, Env out){
		if(code.operand != Codes.NULL_REG){
			//Check if return value is in/out set.
			if(!in.contains(code.operand)){
				//Add the return value to both in and out set.
				in.add(code.operand);
			}
			
			if(!out.contains(code.operand)){
				out.add(code.operand);
			}							
		}
	}
	
	/**
	 * Computes live variables for invariant
	 * @param code
	 * @param in
	 * @param out
	 */
	private void compute(Codes.Invariant code, Env in, Env out){
		//Get the list of byte-code from invariant
		List<Code> codes = code.bytecodes();
		//Iterate each byte-code.
		for(int j=codes.size()-1;j>=0;j--){
			in = liveAnalyzer.propagate(null, codes.get(j), in);
		}		
	}
	
	/**
	 * 
	 * @param code
	 * @param in
	 * @param out
	 */
	private void compute(Codes.Invoke code, Env in, Env out){
		//Get the callee
	
	}
	

	/**
	 * Apply live variable analysis on the function, and get in/out set of each
	 * block.
	 * 
	 * @param module
	 */
	private void applyLiveAnalysisByBlock(FunctionOrMethod function) {
		VariableDeclarations vars = function.attribute(VariableDeclarations.class);
		String name = function.name();
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
			//Traverse the blocks in the reverse order.
			for (int b= blocks.size()-1;b>=0;b--) {
				// Get the block
				BasicBlock block = blocks.get(b);
				// Get the child block
				Env out = (Env)liveness.getOutSet(block).clone();
				Env in = (Env) out.clone();
				CodeBlock codeBlock = block.getCodeBlock();
				for (int i = codeBlock.size() - 1; i >= 0; i--) {
					Code code = codeBlock.get(i);
					//Special cases
					if(code instanceof Codes.Return){
						compute((Codes.Return)code, in, out);						
					}else if (code instanceof Codes.Invariant){
						compute((Codes.Invariant)code, in, out);
					}else if (code instanceof Codes.Invoke){
						compute((Codes.Invariant)code, in, out);
					} else {
						in = liveAnalyzer.propagate(null, code, in);
					}					
				}
				
				// Update the in set for the block.
				liveness.setInSet(block, in);
				// Update the out set for the block.
				liveness.setOutSet(block, out);				
				if(config.isVerbose()){
					System.out.println("In" + ":{" + getLiveVars(in, vars) + "}\n" + block + "\nOut" + ":{" + getLiveVars(out, vars) + "}\n");
				}				
			}
			//Increment the iteration.
			iter++;
		}while(liveness.isChanged);
		//Store the liveness analysis for the function. 
		store.put(function, liveness);
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
			//if(function.name().equals("main")){
				//Print out the CFGraph
				if(config.isVerbose()){
					this.printCFG(function);
				}			
				applyLiveAnalysisByBlock(function);
				printLivenss(function);
			//}
		}

		//Get the main function
		FunctionOrMethod main_function = module.functionOrMethod("main").get(0);
		//Iterate each block
		//for(BasicBlock blockthis.getBlocks(main_function)
		
		
		
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
		private HashMap<BasicBlock, Env> inSetStore;
		private HashMap<BasicBlock, Env> outSetStore;

		/**
		 * Constructor with a list of blocks.
		 * @param blocks
		 */
		public Liveness(List<BasicBlock> blocks) {
			this.inSetStore = new HashMap<BasicBlock, Env>();
			this.outSetStore = new HashMap<BasicBlock, Env>();
			//Initialize in/out set for each block.
			for(BasicBlock block: blocks){
				inSetStore.put(block, new Env());
				outSetStore.put(block, new Env());
			}
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
		 * Set 'in' set for a block.
		 * 
		 * @param block
		 * @return
		 */
		protected void setInSet(BasicBlock block, Env new_in) {
			//Check if new and existing in set are the same
			Env in = inSetStore.get(block);
			if(!in.equals(new_in)){
				//Use logic OR operator to combine the result of 'isChanged' flag.
				this.isChanged |= true;
				//Update in set
				inSetStore.put(block, new_in);
			}
		}

		/**
		 * Get the in set.
		 * @param block
		 * @return
		 */
		public Env getInSet(BasicBlock block){			
			return inSetStore.get(block);
		}


		/**
		 * Set 'out' set for a block.
		 * @param block
		 * @param out
		 * @return
		 */
		protected void setOutSet(BasicBlock block, Env new_out){
			Env out = outSetStore.get(block);
			if(!out.equals(new_out)){
				this.isChanged |= true;
				//Update the out set.
				outSetStore.put(block, new_out);
			}			 
		}
		/**
		 * Compute the out set 
		 * @param block
		 * @return
		 */
		private void computeOutSet(BasicBlock block){
			// Check if the block has the child blocks.
			if (!block.isLeaf()) {
				Env out_old = outSetStore.get(block);
				Env out = (Env)out_old.clone();
				// Get child nodes of the block
				for (BasicBlock child : block.getChildNodes()) {
					Env in = inSetStore.get(child);
					out.addAll(in);
				}

				//Check if old and new out set are the same by using 'equal' operator.
				if(!out.equals(out_old)){
					this.isChanged &= true;
					// Update the out set
					outSetStore.put(block, out);
				}
			}
		}



		/**
		 * Returns 'out' set for a block. Take the union of in sets of child
		 * blocks to produce the out set.
		 * 
		 * @param set
		 */
		protected Env getOutSet(BasicBlock block) {
			computeOutSet(block);
			return outSetStore.get(block);
		}

	}

	/**
	 * Represents the alias between two variables for a block to show that
	 *  left operand is aliased to right operand at block u
	 * 
	 * 
	 * @author Min-Hsien Weng
	 *
	 */
	protected class AliasPair{
		private int left;
		private int right;
		private BasicBlock block;
		public AliasPair(int left, int right, BasicBlock block){
			this.left = left;
			this.right = right;
			this.block = block;
		}


	}



}
