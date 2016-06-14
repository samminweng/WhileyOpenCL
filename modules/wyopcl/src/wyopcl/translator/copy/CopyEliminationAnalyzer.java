package wyopcl.translator.copy;

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
	public ReadWriteAnalyzer readwriteAnalyzer;
	// Perform return checks
	public ReturnAnalyzer returnAnalyzer;
	// Perform liveness checks
	public LiveVariablesAnalysis liveAnalyzer;

	/**
	 * Basic Constructor
	 */
	public CopyEliminationAnalyzer(Builder builder, Configuration config) {
		super(config);
		this.readwriteAnalyzer = new ReadWriteAnalyzer(config);
		this.returnAnalyzer = new ReturnAnalyzer(config);
		this.liveAnalyzer = new LiveVariablesAnalysis(config);
	}

	/**
	 * Applies live variable analysis on each basic block.
	 * 
	 * @param module
	 */
	public void apply(WyilFile module) {
		// Builds up a CFG of the function.
		super.apply(module);
		// Builds up a calling graph and perform read-write checks.
		this.readwriteAnalyzer.apply(module);
		this.returnAnalyzer.apply(module);
		this.liveAnalyzer.apply(module);
	}

	/**
	 * Determines whether to make a copy of array using liveness information and mutability property.
	 * Rules are as below:
	 * 
	 * f mutates b?	   |F	   |F		|T		|T
	 * f returns b?    |F	   |T		|T		|F
	 * ----------------------------------------------
	 * b is live?   T  |No Copy|No Copy |Copy	|Copy
	 * 				F  |No Copy|No Copy |No Copy|No Copy
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
	 */
	public boolean isCopyEliminated(int register, Code code, FunctionOrMethod function) {
		boolean isCopyAvoided = false; // The copy is needed
		boolean isLive = this.liveAnalyzer.isLive(register, code, function);

		if (!isLive) {
			// If the variable is NOT alive, then the copy is avoided.
			isCopyAvoided = true;
		} else {
			// If the variable is alive,
			if (code instanceof Codes.Invoke) {
				// For a function call
				Codes.Invoke functioncall = (Codes.Invoke) code;
				FunctionOrMethod invoked_function = this.getFunction(functioncall.name.name());
				if (invoked_function != null) {
					// Map the register to function argument.
					int argument = this.mapFunctionArgument(register, functioncall);
					// Check if parameter is modified inside 'invoked_function'.
					boolean isMutated = !readwriteAnalyzer.isMutated(argument, invoked_function);
					// 'r' is NOT mutated inside invoked function
					if (!isMutated) {
						isCopyAvoided = true;
					}
				}
			}
		}
		
		return isCopyAvoided;
	}
	
	
	/**
	 * Update the read-write set due to changes to the copy of rhs register
	 * 
	 * @param isCopyAvoided
	 * @param code
	 * @param function
	 */
	public void updateSet(boolean isCopyAvoided, int register, Code code, FunctionOrMethod function){
		if (isCopyAvoided) {
			// Based on the copy analysis results, update the readwrite set.
			this.readwriteAnalyzer.updateSet(isCopyAvoided, register, code, function);
			this.returnAnalyzer.updateSet(isCopyAvoided, register, code, function);
		}
		
	}
}
