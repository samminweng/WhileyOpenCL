package wyopcl.translator;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import wybs.lang.Builder;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyil.transforms.LiveVariablesAnalysis;
import wyil.transforms.LiveVariablesAnalysis.Env;
import wyopcl.translator.bound.BasicBlock;
import wyopcl.translator.bound.BasicBlock.BlockType;
import wyopcl.translator.copy.LiveVariables;


/**
 * Analyze the alias in the WyIL code to find all the necessary array copies and eliminate un-necessary copies.
 * 
 * @author Min-Hsien Weng
 *
 */
public class CopyEliminationAnalyzer extends Analyzer {
	private LiveVariablesAnalysis liveAnalyzer;
	// Store the liveness analysis for each function (Key: function, Value:Liveness information).
	private HashMap<FunctionOrMethod, LiveVariables> livenessStore;

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
		this.livenessStore = new HashMap<FunctionOrMethod, LiveVariables>();
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
		System.out.println("###### Live variables for " + function.name() + " function. ######");
		// Get liveness
		LiveVariables liveness = getLiveness(function);
		// Get the list of blocks for the function.
		for (BasicBlock block : this.getBlocks(function)) {
			// Print out the in/out set for the block.
			System.out.println("In" + ":{" + getLiveVariables(liveness.getIN(block), function) + "}\n" + block
					+ "\nOut" + ":{" + getLiveVariables(liveness.getOUT(block), function) + "}\n");
		}
	}

	/**
	 * Get the live analysis results of the function.
	 * 
	 * @param function
	 * @return
	 */
	public LiveVariables getLiveness(FunctionOrMethod function) {
		// Get function name
		return livenessStore.get(function);
	}

	/**
	 * Applies live variable analysis on the function, in order to get in/out set of each block.
	 * 
	 * @param function
	 *            code block of function
	 */
	private void computeLiveness(FunctionOrMethod function) {
		LiveVariables liveness = new LiveVariables();
		liveness.computeLiveness(function.name(), config.isVerbose(),  this.getCFGraph(function), liveAnalyzer);
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
			computeLiveness(function);
		}
	}
}
