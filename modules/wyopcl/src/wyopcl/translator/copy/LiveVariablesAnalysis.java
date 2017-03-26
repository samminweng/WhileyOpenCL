package wyopcl.translator.copy;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import javax.swing.tree.DefaultMutableTreeNode;

import wybs.lang.Builder;
import wycc.util.Pair;
import wyil.lang.Code;
import wyil.lang.CodeBlock;
import wyil.lang.CodeBlock.Index;
import wyil.lang.Codes;
import wyil.lang.Codes.If;
import wyil.lang.Codes.IfIs;
import wyil.lang.Codes.Loop;
import wyil.lang.Codes.Switch;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.util.dfa.BackwardFlowAnalysis;
import wyopcl.Configuration;
import wyopcl.translator.Analyzer;
import wyopcl.translator.cfg.BasicBlock;
import wyopcl.translator.cfg.CFGraph;

/**
 * Implements Live variable analyzer to check if a register is alive or dead after a code of the function.
 * 
 * 
 * This class is based on David Pearce's propagation rule for live variable.
 * 
 * @author Min-Hsien Weng
 *
 */
public class LiveVariablesAnalysis extends Analyzer {
	// Store the liveness analysis for each function
	// (Key: function, Value:Liveness information).
	private HashMap<FunctionOrMethod, LiveVariables> livenessStore;
	
	
	
	public LiveVariablesAnalysis(Configuration config) {
		super(config);
		// Initialize the liveness stores.
		this.livenessStore = new HashMap<FunctionOrMethod, LiveVariables>();
		this.isVerbose = config.isVerbose();
	}
	/**
	 * A constructor with over-writing 'isVerbose' flag
	 * 
	 * @param cofig
	 * @param isVerbose
	 */
	public LiveVariablesAnalysis(Configuration config, boolean isVerbose){
		super(config);
		// Initialize the liveness stores.
		this.livenessStore = new HashMap<FunctionOrMethod, LiveVariables>();
		this.isVerbose = isVerbose;		
	}

	/**
	 * Applies live variable analysis on each basic block.
	 * 
	 * @param module
	 */
	public void apply(WyilFile module, Optional<HashMap<FunctionOrMethod, FunctionOrMethod>> transformFuncMap) {
		// Builds up a CFG of the function.
		super.apply(module, transformFuncMap);
		postorderTraversalCallGraph(tree);
	}

	/**
	 * Check if a register is alive after the code
	 * 
	 * @param reg
	 * @param code
	 * @param f
	 * @return true if the reg is a live. Return false if the register is not alive
	 */
	public boolean isLive(int reg, Code code, FunctionOrMethod f) {
		boolean isLive = true; // Assume the reg is alive conservatively
		// Special case
		if(code instanceof Codes.FieldLoad){
			// The register at fieldload byte-code is used to load a specific field from a record data structure
			// It is assumed to be NOT alive.
			return false;
		}
		
		// Check the array is live.
		BasicBlock blk = getBlockbyCode(f, code);// Get basic block that
													// contains the given code.
		if (blk != null) {
			HashSet<Integer> outSet = getLiveness(f).getOUT(blk);
			isLive = outSet.contains(reg);
		}else{
			throw new RuntimeException("Block not found.");
		}
		return isLive;
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
	private String getLiveVariables(HashSet<Integer> env, FunctionOrMethod function) {
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
			System.out.println("In" + ":{" + getLiveVariables(liveness.getIN(block), function) + "}\n" + block + "\nOut"
					+ ":{" + getLiveVariables(liveness.getOUT(block), function) + "}\n");
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
		CFGraph cfGraph = this.getCFGraph(function);
		if(cfGraph != null){
			liveness.computeLiveness(function.name(), isVerbose, cfGraph);
			// Store the liveness analysis for the function.
			livenessStore.put(function, liveness);
			// Print out analysis result
			if (isVerbose) {
				printLivenss(function);
			}
		}else{
			throw new RuntimeException("Not building CFG for "+function);
		}
	}

	@Override
	protected void visit(DefaultMutableTreeNode node) {
		// Apply live analysis on each calling function
		FunctionOrMethod function = (FunctionOrMethod) node.getUserObject();
		if(function != null){
			// Check if the function has been transformed. If so, use the transformed one.		
			function = this.getFunction(function);
			computeLiveness(function);
		}
	}
}
