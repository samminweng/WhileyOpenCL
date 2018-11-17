package wyopcl.translator.copy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;

import javax.swing.tree.DefaultMutableTreeNode;

import wybs.lang.Builder;
import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.Analyzer;
import wyopcl.translator.LiveVariablesAnalysis;
import wyopcl.translator.ReadWriteAnalyzer;
import wyopcl.translator.ReturnAnalyzer;
import wyopcl.translator.ReturnAnalyzer.RETURN;

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
	private int line;

	/**
	 * Basic Constructor
	 */
	public CopyEliminationAnalyzer(Configuration config, ReadWriteAnalyzer readwriteAnalyzer,
			ReturnAnalyzer returnAnalyzer, LiveVariablesAnalysis liveAnalyzer) {
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
		postorderTraversalCallGraph(tree);
	}

	/**
	 * Determines whether to make a copy of array using liveness information and mutability property. Rules are as
	 * below:
	 * 
	 * f mutates b? |F |F |T |T f returns b? |F |T |T |F b is live? T |No
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
	 *         Note that The copies are not needed by default in some special forms of byte-code ('FieldLoad')
	 * 
	 */
	public boolean isCopyEliminated(int register, int pos, Code code, FunctionOrMethod function) {		
		boolean isLive = liveAnalyzer.isLive(register, code, function);
		if (this.isVerbose) {
			System.out.print("\t liveness: " + getVar(register, function) + " = " + isLive);
		}
		
		if (!isLive) {
			if(this.isVerbose) {
				System.out.print("\n");
			}
			// The register is NOT alive, and thus the copy can be eliminated.
			return true;
		} else {
			// The register is alive and continue checking if the code is a function call.
			if (code instanceof Codes.Invoke) {
				// Special case for a function call
				Codes.Invoke functioncall = (Codes.Invoke) code;
				FunctionOrMethod callee = this.getCalledFunction(functioncall);
				if (callee != null) {
					// Map the register to function argument.
					int param = this.mapArgumentToParameter(register, pos, functioncall);
					// Check if parameter is modified inside 'invoked_function'.
					boolean isMutated = readwriteAnalyzer.isMutated(param, callee);
					if (this.isVerbose) {
						// Read-only is the negated 'isMutated' value
						System.out.print("\t readonly: " + getVar(register, function) + " = " + !isMutated);
					}
					// Get the return
					RETURN isReturn = returnAnalyzer.isReturned(param, callee);
					if (this.isVerbose) {
						System.out.print("\t return: " + getVar(register, function) + " = " + isReturn + "\n");
					}
					// 'r' is NOT mutated inside invoked function
					if (!isMutated) {	
						if (isReturn == RETURN.MAYBE_RETURN || isReturn == RETURN.ALWAYS_RETURN) {
							// We use caller macro
							return false; // We need the copy
						}
						return true;
					}
				}
				// End of invoke code
			}else {
				// End the messages
				if(this.isVerbose) {
					System.out.print("\n");
				}
			}			
			// For all the other cases, the copy must be kept.
			return false;
		}
		
	}

	/**
	 * Update the read-write set due to changes to the copy of rhs register
	 * 
	 * @param isCopyEliminated
	 * @param code
	 * @param function
	 */
	public void updateSet(boolean isCopyEliminated, int register, Code code, FunctionOrMethod function) {
		// Based on the copy analysis results, update the readwrite set.
		this.readwriteAnalyzer.updateSet(isCopyEliminated, register, code, function);
		this.returnAnalyzer.updateSet(isCopyEliminated, register, code, function);
	}

	/**
	 * Prints out each bytecode with line number and indentation.
	 * 
	 * @param name
	 * @param line
	 */
	private void printWyILCode(FunctionOrMethod function, Code code) {
		String name = function.name();
		// Print out the bytecode
		if (code instanceof Codes.Label) {
			System.out.println(name + "." + line + " [" + code + "]");
		} else if (code instanceof Codes.Assign) {
			Codes.Assign assign = (Codes.Assign) code;
			String lhs = getVar(assign.target(0), function);
			String rhs = getVar(assign.operand(0), function);
			System.out.println("["+name + "." + line +" " +  lhs + " = " + rhs + "] //" + code);
		} else if (code instanceof Codes.Invoke) {
			Codes.Invoke invoke = (Codes.Invoke) code;			
			String lhs = getVar(invoke.target(0), function);
			List<String> params = new ArrayList<String>();
			for(int op: invoke.operands()) {
				String param = getVar(op, function);
				params.add(param);
			}			
			System.out.println("[" + name + "." + line + " " + lhs + " = " +invoke.name.name() + "("+ String.join(", ", params) + ")" 
			                    + "] //" + code);
		} else {
			System.out.println("[" +name + "." + line + " ] //" + code + "");
		}

	}

	/**
	 * Print out each line of code in function 'function'
	 * 
	 * @param function
	 * @param code_blk
	 */
	private void printWyILCodeBlock(FunctionOrMethod function, List<Code> code_blk) {
		String name = function.name();
		line =0;
		// Parse each byte-code and add the constraints accordingly.
		for (Code code : code_blk) {
			// Get the Block.Entry and print out each byte-code
			System.out.println(name + "." + line + " [" + code + "]");
			line++;// Increment the line number
		}
		System.out.println("//End of " + name + " function");
	}

	/**
	 * Get variable name
	 * 
	 * @param reg
	 * @return
	 */
	private String getVar(int reg, FunctionOrMethod function) {
		VariableDeclarations vars = function.attribute(VariableDeclarations.class);
		String name = "_" + reg;
		// Check if the register has been kept in the declarations.
		Declaration declaration = vars.get(reg);
		if (declaration != null && declaration.name() != null && !declaration.name().isEmpty()) {
			name = declaration.name();
		}
		return name;
	}

	@Override
	protected void visit(DefaultMutableTreeNode node) {
		FunctionOrMethod function = (FunctionOrMethod) node.getUserObject();
		if (function != null) {
			// Check and Get the transformed function
			function = this.getFunction(function);
			// Print out all byte-code of function
			if (this.isVerbose) {
				this.printWyILCodeBlock(function, function.body().bytecodes());
			}
			line = 0;
			// Analyze whether the copy is need for each byte-code
			for (Code code : function.body().bytecodes()) {
				if (code instanceof Codes.Assign) {
					if (this.isVerbose) {
						printWyILCode(function, code);
					}
					int rhs = ((Codes.Assign) code).operand(0);
					boolean isCopyEliminated = isCopyEliminated(rhs, 0, code, function);
					updateSet(isCopyEliminated, rhs, code, function);
				} else if (code instanceof Codes.Invoke) {
					Codes.Invoke invoke = (Codes.Invoke) code;
					// Check if the called function is not runtime call
					String module = invoke.name.module().toString();
					if (!module.contains("whiley/lang") && !module.contains("whiley/io")) {
						if (this.isVerbose) {
							printWyILCode(function, code);
						}
						int pos = 0;
						for (int param : invoke.operands()) {
							boolean isCopyEliminated = isCopyEliminated(param, pos, code, function);
							updateSet(isCopyEliminated, param, code, function);
							pos++;
						}
					}
				}
				line++;
			}
		}
	}
}
