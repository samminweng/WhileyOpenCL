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
public class AliasAnalyzer extends Analyzer {
	private final String prefix = "%";
	private LiveVariablesAnalysis liveAnalyzer;
	//Store the liveness analysis for each function
	private HashMap<FunctionOrMethod, Liveness> store;
	

	/**
	 * Basic Constructor
	 */
	public AliasAnalyzer(Builder builder, Configuration config) {
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
		Liveness liveness = store.get(function);
		//Get function name
		String name = function.name();
	    System.out.println("###### Live analysis for " + name + " function. ######");
	    for(BasicBlock block: liveness.getBlocks()){
	    	Env in = liveness.getIn(block);
	    	Env out = liveness.getOut(block);
	    	//Print out the in/out set for the block.
	    	System.out.println("In" + ":{" + getLiveVars(in, vars) + "}\n" + block + "\nOut" + ":{" + getLiveVars(out, vars) + "}\n");
	    }
	    
		
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
		int iter = 0;
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
				Env out = (Env)liveness.getOut(block).clone();
				Env in = (Env) out.clone();
				CodeBlock codeBlock = block.getCodeBlock();
				for (int i = codeBlock.size() - 1; i >= 0; i--) {
					Code code = codeBlock.get(i);
					//Special case
					if(code instanceof Codes.Return){
						Codes.Return r = (Codes.Return)code;
						if(r.operand != Codes.NULL_REG){
							//Add the return value to out set.
							out.add(r.operand);
							liveness.setOut(block, out);
						}						
					}else{
						in = liveAnalyzer.propagate(null, codeBlock.get(i), in);
					}					
				}
				// Update the in set for the block.
				liveness.setIn(block, in);
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
	public void applyLiveAnalysis(WyilFile module) {
		this.buildCFG(module);
		// Iterate each function to build up CFG
		for (FunctionOrMethod function : module.functionOrMethods()) {
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
		private List<BasicBlock> blocks;
		//Indicate if there is any change of in/out set.
		private boolean isChanged;
		private HashMap<BasicBlock, Env> inSet;
		private HashMap<BasicBlock, Env> outSet;

		public Liveness(List<BasicBlock> blocks) {
			this.blocks = blocks;
			this.inSet = new HashMap<BasicBlock, Env>();
			this.outSet = new HashMap<BasicBlock, Env>();
			for (BasicBlock block : blocks) {
				inSet.put(block, new Env());
				outSet.put(block, new Env());
			}
		}
		
		/**
		 * Get the list of basic blocks.
		 * @return
		 */
		public List<BasicBlock> getBlocks(){
			return this.blocks;
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
		protected void setIn(BasicBlock block, Env new_in) {
			//Check if new and existing in set are the same
			Env in = inSet.get(block);
			if(!in.containsAll(new_in)){
				//Use logic OR operator to combine the result of 'isChanged' flag.
				this.isChanged |= true;
				//Update in set
				inSet.put(block, new_in);
			}
		}
		
		/**
		 * Get the in set.
		 * @param block
		 * @return
		 */
		public Env getIn(BasicBlock block){
			return inSet.get(block);
		}
		

		/**
		 * Set 'out' set for a block.
		 * @param block
		 * @param out
		 * @return
		 */
		protected void setOut(BasicBlock block, Env new_out){
			Env out = outSet.get(block);
			if(!out.containsAll(new_out)){
				this.isChanged |= true;
				//Update the out set.
				outSet.put(block, new_out);
			}			 
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
				Env out_old = outSet.get(block);
				Env out = (Env)out_old.clone();
				// Get child nodes of the block
				for (BasicBlock child : block.getChildNodes()) {
					Env in = inSet.get(child);
					out.addAll(in);
				}
				
				//Check if old and new out set are the same.
				if(!out.containsAll(out_old)){
					this.isChanged &= true;
					// Update the out set
					outSet.put(block, out);
				}
				
			}

			return outSet.get(block);
		}

	}

}
