package wyopcl.translator.copy;

import java.util.HashMap;
import java.util.HashSet;
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
import wyopcl.translator.ReturnAnalyzer;
import wyopcl.translator.bound.BasicBlock;
import wyopcl.translator.bound.BasicBlock.BlockType;

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
	private LiveVariablesAnalysis liveAnalyzer;

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
	 * Determines whether to make a copy of array by checking liveness information or read-only property.
	 * 
	 * If the variable is live, then the copy is necessary. Otherwise, the register can be overwritten safely.
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

		boolean isCopyAvoided = true; // The copy is avoided
		boolean isLive = this.liveAnalyzer.isLive(register, code, function);

		// If the variable is not alive, then the copies are not needed.
		if (!isLive) {
			isCopyAvoided = true;
		} else {
			// If the variable is alive,
			if (code instanceof Codes.Invoke) {
				// For a function call, we need to check 1) readwrite 2) returned
				boolean isReadOnly = false;
				boolean isReturned = false;
				Codes.Invoke invoked = (Codes.Invoke) code;
				FunctionOrMethod invoked_function = this.getFunction(invoked.name.name());
				if (invoked_function != null) {
					// Map the register to function argument.
					int argument = this.mapFunctionArgument(register, invoked);

					// Check if parameter is modified inside 'invoked_function'.
					isReadOnly = !readwriteAnalyzer.isMutated(argument, invoked_function);
					// Check if argument is returned by 'invoked_function'
					isReturned = returnAnalyzer.isReturned(argument, invoked_function);
					// The 'var' is mutated and returned, and the copy is needed.
					if (!isReadOnly) {
						if (isReturned) {
							isCopyAvoided = false;							
						} else {
							isCopyAvoided = false;							
						}
					} else {
						// The 'var' is not mutated, and the copy is not needed.
						if (isReturned) {
							isCopyAvoided = true;							
						} else {
							isCopyAvoided = true;							
						}
					}
				}
			} else if (code instanceof Codes.Update) {
				// The copy is needed
				isCopyAvoided = false;				
			} else if (code instanceof Codes.Assign) {
				// The copy is needed
				isCopyAvoided = false;				
			} else if (code instanceof Codes.FieldLoad) {
				// The copy is needed
				isCopyAvoided = false;				
			}else{
				throw new RuntimeException("Not implemeneted");
			}
		}
		// Based on the copy analysis results, update the readwrite set.
		this.readwriteAnalyzer.updateSet(isCopyAvoided, register, code, function);
		this.returnAnalyzer.updateSet(isCopyAvoided, register, code, function);
		return isCopyAvoided;
		
	}
	
	
}
