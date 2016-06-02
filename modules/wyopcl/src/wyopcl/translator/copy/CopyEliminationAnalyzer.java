package wyopcl.translator.copy;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import wybs.lang.Builder;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.Analyzer;
import wyopcl.translator.ReadWriteAnalyzer;
import wyopcl.translator.bound.BasicBlock;
import wyopcl.translator.bound.BasicBlock.BlockType;
import wyopcl.translator.copy.LiveVariablesAnalysis.Env;

/**
 * Analyze the alias in the WyIL code to find all the necessary array copies and
 * eliminate un-necessary copies.
 * 
 * @author Min-Hsien Weng
 *
 */
public class CopyEliminationAnalyzer extends Analyzer {
	
	private LiveVariablesAnalysis liveAnalyzer;
	// Store the liveness analysis for each function (Key: function,
	// Value:Liveness information).
	private HashMap<FunctionOrMethod, LiveVariables> livenessStore;

	/**
	 * Basic Constructor
	 */
	public CopyEliminationAnalyzer(Builder builder, Configuration config) {
		super(config);
		this.liveAnalyzer = new LiveVariablesAnalysis(builder);
		// Diabled the constant propagation
		//this.liveAnalyzer.setEnable(false);
		//this.liveAnalyzer.setNops(true);
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
	 * Applies live variable analysis on the function, in order to get in/out
	 * set of each block.
	 * 
	 * @param function
	 *            code block of function
	 */
	private void computeLiveness(FunctionOrMethod function) {
		LiveVariables liveness = new LiveVariables();
		liveness.computeLiveness(function.name(), config.isVerbose(), this.getCFGraph(function), liveAnalyzer);
		// Store the liveness analysis for the function.
		livenessStore.put(function, liveness);
		// Print out analysis result
		if (config.isVerbose()) {
			printLivenss(function);
		}
	}

	/**
	 * Applies live variable analysis on each basic block.
	 * 
	 * @param module
	 */
	public void apply(WyilFile module) {
		// Builds up a CFG of the function.
		super.apply(module);
		// Apply live analysis on each function, except for main function.
		for (FunctionOrMethod function : module.functionOrMethods()) {
			computeLiveness(function);
		}
	}

	public boolean isLive(int reg, Code code, FunctionOrMethod f) {
		boolean isLive = true;

		// Check the array is live.
		BasicBlock blk = getBlockbyCode(f, code);// Get basic block that
													// contains the given code.
		if (blk != null) {
			Env outSet = getLiveness(f).getOUT(blk);
			isLive = outSet.contains(reg);
		}
		return isLive;
	}

	/**
	 * Determines whether to make a copy of array by checking liveness
	 * information or read-only property.
	 * 
	 * If the variable is live, then the copy is necessary. Otherwise, the
	 * register can be overwritten safely.
	 * 
	 * The rules of determining the copy of
	 * <table>
	 * <thead>
	 * <tr>
	 * <th colspan="2">f mutates b?</th>
	 * <th>F</th>
	 * <th>F</th>
	 * <th>T</th>
	 * <th>T</th>
	 * </tr>
	 * <tr>
	 * <th colspan="2">f returns b?</th>
	 * <th>F</th>
	 * <th>T</th>
	 * <th>T</th>
	 * <th>F</th>
	 * </tr>
	 * </thead> <tbody>
	 * <tr>
	 * <td>b is live?</td>
	 * <td>T</td>
	 * <td>No copy</td>
	 * <td>No copy</td>
	 * <td>Copy</td>
	 * <td>Copy</td>
	 * </tr>
	 * <tr>
	 * <td>b is live?</td>
	 * <td>F</td>
	 * <td>No copy</td>
	 * <td>No copy</td>
	 * <td>No copy</td>
	 * <td>No copy</td>
	 * </tr>
	 * </tbody>
	 * </table>
	 * 
	 * 
	 * 
	 * @param reg
	 *            the register of array variable
	 * @param code
	 *            the byte-code of function call.
	 * @param f
	 *            the caller function
	 * @return ture if the copy is un-needed and can be avoid. Otherwise, return
	 *         false.
	 * 
	 */
	public boolean isCopyEliminated(int reg, Code code, FunctionOrMethod f) {
		boolean isLive = isLive(reg, code, f);

		// If the variable is not alive, then the copies are not needed.
		if (!isLive) {
			return true;
		} else {
			if (code instanceof Codes.Invoke) {
				// Check the array is read-only. By default, the array is assumed
				// not read-only but modified.
				boolean isReadOnly = false;
				boolean isReturned = false;
				Codes.Invoke invoked = (Codes.Invoke) code;
				FunctionOrMethod invoked_function = this.getFunction(invoked.name.name(), invoked.type(0));
				if (invoked_function != null) {
					// Map the register to function argument.
					int argument = this.mapFunctionArgument(reg, invoked);
					
					// Check if parameter is modified inside 'invoked_function'.
					isReadOnly = !isMutated(argument, invoked_function);
					// Check if argument is returned by 'invoked_function'
					isReturned = isReturned(argument, invoked_function);
					// The 'var' is mutated and returned
					if (!isReadOnly) {
						if (isReturned) {
							return false;
						} else {
							return false;
						}
					} else {
						// The 'var' is not mutated
						if (isReturned) {
							return true;
						} else {
							return true;
						}
					}
				}
			}else if (code instanceof Codes.Update){
				// The copy is needed as the variable is alive after this code.
				return false;
			}else if (code instanceof Codes.Assign){
				// The copy is not needed due to the register becomes dead (not alive)
				return false; 
			}else if (code instanceof Codes.FieldLoad){
				// The copy is not needed due to the 
				return false;
			}
			throw new RuntimeException("Not implemeneted");
		}
	}
}
