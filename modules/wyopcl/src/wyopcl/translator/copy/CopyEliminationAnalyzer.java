package wyopcl.translator.copy;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Optional;

import javax.swing.tree.DefaultMutableTreeNode;

import wybs.lang.Builder;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.Analyzer;
import wyopcl.translator.ReadWriteAnalyzer;
import wyopcl.translator.ReturnAnalyzer;

/**
 * Analyze the alias in the WyIL code to find all the necessary array copies and eliminate un-necessary copies.
 * 
 * @author Min-Hsien Weng
 *
 */
public class CopyEliminationAnalyzer extends Analyzer {
	// Perform read-write checks
	private ReadWriteAnalyzer readwriteAnalyzer;
	// Perform return checks
	private ReturnAnalyzer returnAnalyzer;
	// Perform liveness checks
	public LiveVariablesAnalysis liveAnalyzer;

	/**
	 * Basic Constructor
	 */
	public CopyEliminationAnalyzer(Configuration config,
								   ReadWriteAnalyzer readwriteAnalyzer, 
								   ReturnAnalyzer returnAnalyzer,
								   LiveVariablesAnalysis liveAnalyzer) {
		super(config);
		this.readwriteAnalyzer = readwriteAnalyzer;
		this.returnAnalyzer = returnAnalyzer;
		this.liveAnalyzer = liveAnalyzer;

	}

	/**
	 * Applies live variable analysis on each basic block.
	 * 
	 * @param module
	 */
	public void apply(WyilFile module, Optional<HashMap<FunctionOrMethod, FunctionOrMethod>> transformFuncMap) {
		// Builds up a CFG of the function.
		super.apply(module, transformFuncMap);
		if (this.config.isVerbose()) {
			// Iterate each function to determine if copies are needed.
			postorderTraversalCallGraph(tree);
		}
	}

	/**
	 * Determines whether to make a copy of array using liveness information and mutability property. Rules are as
	 * below:
	 * 
	 * f mutates b? |F |F |T |T f returns b? |F |T |T |F ---------------------------------------------- b is live? T |No
	 * Copy|No Copy |Copy |Copy F |No Copy|No Copy |No Copy|No Copy
	 * 
	 * 
	 * @param register
	 *            the register of array variable
	 * @param code
	 *            the byte-code of function call.
	 * @param f
	 *            the caller function
	 * @return ture if the copy is un-needed and can be avoid. Otherwise, return false.
	 * 
	 *         Note that The copies are not needed by default in some special forms of byte-code ('FieldLoad')
	 * 
	 */
	public boolean isCopyEliminated(int register, Code code, FunctionOrMethod function) {
		boolean isLive = liveAnalyzer.isLive(register, code, function);

		if (!isLive) {
			// The register is NOT alive, and thus the copy can be eliminated.
			return true;
		} else {
			// The register is alive
			if (code instanceof Codes.Invoke) {
				// Special case for a function call
				Codes.Invoke functioncall = (Codes.Invoke) code;
				FunctionOrMethod callee = this.getCallingFunction(functioncall);
				if (callee != null) {
					// Map the register to function argument.
					int callee_register = this.mapFunctionArgumentToCalleeRegister(register, functioncall);
					// Check if parameter is modified inside 'invoked_function'.
					boolean isMutated = readwriteAnalyzer.isMutated(callee_register, callee);
					// 'r' is NOT mutated inside invoked function
					if (!isMutated) {
						return true;
					}
				}
			}
		}
		// For all the other cases, the copy must be kept.
		return false;
	}

	/**
	 * Update the read-write set due to changes to the copy of rhs register
	 * 
	 * @param isCopyAvoided
	 * @param code
	 * @param function
	 */
	public void updateSet(boolean isCopyAvoided, int register, Code code, FunctionOrMethod function) {
		// Based on the copy analysis results, update the readwrite set.
		this.readwriteAnalyzer.updateSet(isCopyAvoided, register, code, function);
		this.returnAnalyzer.updateSet(isCopyAvoided, register, code, function);
	}

	@Override
	protected void visit(DefaultMutableTreeNode node) {
		FunctionOrMethod function = (FunctionOrMethod) node.getUserObject();
		if (function != null) {
			// Check and Get the transformed function
			function = this.getFunction(function);
			// Analyze whether the copy is need for each byte-code
			for (Code code : function.body().bytecodes()) {
				if (code instanceof Codes.Assign) {
					int rhs = ((Codes.Assign) code).operand(0);
					boolean isCopyEliminated = isCopyEliminated(rhs, code, function);
				}
			}
		}
	}
}
