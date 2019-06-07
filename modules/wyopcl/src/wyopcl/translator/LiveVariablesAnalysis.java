package wyopcl.translator;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
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
import wyopcl.translator.bound.BoundBlock;
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

	/**
	 * Constructor
	 * 
	 * @param config
	 */
	public LiveVariablesAnalysis(Configuration config) {
		super(config);
		// Initialize the liveness stores.
		this.livenessStore = new HashMap<FunctionOrMethod, LiveVariables>();
	}

	/**
	 * A constructor with over-writing 'isVerbose' flag
	 * 
	 * @param cofig
	 * @param isVerbose
	 */
	public LiveVariablesAnalysis(Configuration config, boolean isVerbose) {
		super(config);
		// Initialize the liveness stores.
		this.livenessStore = new HashMap<FunctionOrMethod, LiveVariables>();
		this.isVerbose = isVerbose;
	}

	// /**
	// * Applies live variable analysis on each basic block.
	// *
	// * @param module
	// */
	// public void apply(WyilFile module, Optional<HashMap<FunctionOrMethod, FunctionOrMethod>> transformFuncMap) {
	// // Builds up a CFG of the function.
	// super.apply(module, transformFuncMap);
	// postorderTraversalCallGraph(tree);
	// }

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
		if (code instanceof Codes.FieldLoad) {
			// The register at fieldload byte-code is used to load a specific field from a record data structure
			// It is assumed to be NOT alive.
			return false;
		}

		// Check the array is live.
		BasicBlock blk = getBlockbyCode(f, code);// Get basic block that contains the given code.
		if (blk != null) {
			HashSet<Integer> outSet = getLiveness(f).getOUT(blk);
			isLive = outSet.contains(reg);

			// For function call
			if (code instanceof Codes.Invoke) {
				// Check if the 'reg' is used into 'code' more than once.
				Codes.Invoke invoke = (Codes.Invoke) code;
				int counts = 0;
				for (int op : invoke.operands()) {
					if (op == reg) {
						counts++;
					}
				}
				if (counts >= 2) {
					return true;// That means, 'reg' is used twice.
				}
			}

		} else {
			throw new RuntimeException("Block not found.");
		}
		return isLive;
	}

	/**
	 * Get the live analysis results of the function.
	 * 
	 * @param function
	 * @return
	 */
	private LiveVariables getLiveness(FunctionOrMethod function) {
		// Get function name
		return livenessStore.get(function);
	}

	
	/**
	 * Return the live variables of given basic block.
	 * 
	 * @param function
	 * @param blk
	 * @return
	 */
	public HashSet<Integer> getLiveVars(FunctionOrMethod function, BasicBlock blk) {
		// Return the live variables in the block
		HashSet<Integer> out = livenessStore.get(function).getOUT(blk);
		return out;
	}
	

	/**
	 * Applies live variable analysis on the function, in order to get in/out set of each block.
	 * 
	 * @param function
	 *            code block of function
	 */
	@Override
	public void analyzeFunction(FunctionOrMethod function) {
		LiveVariables liveness = new LiveVariables(this.config);
		CFGraph cfGraph = this.getCFGraph(function);
		if (cfGraph != null) {
			liveness.computeLiveness(function.name(), isVerbose, cfGraph);
			// Store the liveness analysis for the function.
			livenessStore.put(function, liveness);
		} else {
			throw new RuntimeException("Not building CFG for " + function);
		}
	}

	/**
	 * Output the live variables, that are stored in In/Out set.
	 * 
	 * @param set
	 *            In/Out set of live variables
	 * @param vars
	 *            the hash map, which maps register to the variable name.
	 * @return
	 */
	private String getLiveVariables(LinkedHashSet<Integer> set, FunctionOrMethod function) {
		String str = "[";
		Boolean isFirst = true;
		Iterator<Integer> iterator = set.iterator();
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
		str += "]";
		return str;
	}

	/**
	 * Print the live variables of given function
	 * 
	 * @param function
	 */
	public void printFunctionAnalysisResult(FunctionOrMethod function) {
		LiveVariables liveness = livenessStore.get(function);

		// Get function name
		System.out.println("// Live variables for " + function.name() + " function");

		System.out.print("// In Set:");
		List<String> results = new ArrayList<String>();
		// Get the list of inSet of function.
		for (LinkedHashSet<Integer> inSetValues : liveness.getInSet().values()) {
			// Print out the in/out set for the block.
			results.add(getLiveVariables(inSetValues, function));
		}
		System.out.println("[" + String.join(", ", results) + "]");
		results.clear();
		System.out.print("// Out Set:");
		// Get the list of inSet of function.
		for (LinkedHashSet<Integer> setValues : liveness.getOutSet().values()) {
			// Print out the in/out set for the block.
			results.add(getLiveVariables(setValues, function));
		}
		System.out.println("[" + String.join(", ", results) + "]");
	}

}
