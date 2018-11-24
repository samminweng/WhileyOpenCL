package wyopcl.translator;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import javax.swing.tree.DefaultMutableTreeNode;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;

/**
 * Iterate each function and adds all the return registers to the set in each function.
 * 
 * If the register is not in the set, then it is not a return register.
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public class ReturnAnalyzer extends Analyzer {
	// Return results
	public enum RETURN {
		ALWAYS_RETURN, MAYBE_RETURN, NEVER_RETURN
	}

	// Store the set of return registers for each function.
	private HashMap<FunctionOrMethod, HashSet<Integer>> returnStores;
	// Store the set of aliasing variables
	private HashMap<FunctionOrMethod, List<HashSet<Integer>>> aliasStores;

	public ReturnAnalyzer(Configuration config) {
		super(config);
		this.returnStores = new HashMap<FunctionOrMethod, HashSet<Integer>>();
		this.aliasStores = new HashMap<FunctionOrMethod, List<HashSet<Integer>>>();
	}

	/**
	 * Return the aliasing set for the given register. If not found, return null.
	 * 
	 * @param register
	 * @param function
	 * @return
	 */
	private HashSet<Integer> getAliasVariables(int register, FunctionOrMethod function) {
		List<HashSet<Integer>> aliasStore = aliasStores.get(function);
		// Search for aliasing set g
		for (HashSet<Integer> aliasSet : aliasStore) {
			if (aliasSet.contains(register)) {
				// Return the aliasing set
				return aliasSet;

			}
		}
		return null;
	}

	/**
	 * Put the aliasing of lhs and rhs registers
	 * 
	 * 
	 * @param lhs
	 * @param rhs
	 * @param function
	 */
	private void aliasVariables(int lhs, int rhs, FunctionOrMethod function) {
		List<HashSet<Integer>> aliasStore = aliasStores.get(function);

		// Get alias set for lhs register
		HashSet<Integer> aliasSetLHS = getAliasVariables(lhs, function);
		HashSet<Integer> aliasSetRHS = getAliasVariables(rhs, function);
		// Go through each case and if any aliasing exists before, then we update the set
		// If both set are found, then merge both set to a single
		if (aliasSetLHS != null && aliasSetRHS != null) {
			HashSet<Integer> mergeSet = new HashSet<Integer>();
			mergeSet.addAll(aliasSetLHS);
			mergeSet.addAll(aliasSetRHS);
			// Remove the previous lhs and rhs aliasing set
			aliasStore.remove(aliasSetLHS);
			aliasStore.remove(aliasSetRHS);
			// Add the mergeSet to aliasStore
			aliasStore.add(mergeSet);
			// Update the stores
			aliasStores.put(function, aliasStore);
		} else if (aliasSetLHS != null) {
			// Put the aliasing to LHS set
			aliasSetLHS.add(rhs);
		} else if (aliasSetRHS != null) {
			aliasSetRHS.add(lhs);
		} else {
			// Both sets are null, so create a new set
			// Put both variables into a new set
			HashSet<Integer> aliasSet = new HashSet<Integer>();
			aliasSet.add(lhs);
			aliasSet.add(rhs);
			// Put the set to the store
			aliasStore.add(aliasSet);
		}

		// Get the alias set for lhs/rhs
		HashSet<Integer> aliasSet = getAliasVariables(lhs, function);

		// Get return set of given function
		HashSet<Integer> returnStore = returnStores.get(function);

		// Check if any return variable is aliased to lhs register
		for (int retRegister : returnStore) {
			if (aliasSet.contains(retRegister)) {
				// Put all the aliasing variables to return set
				returnStore.addAll(aliasSet);
				break;
			}
		}

	}

	/**
	 * Update the return set.
	 * 
	 * If the copy of the register is avoided, then the register is aliased to lhs variable. And if the lhs variable is
	 * a return register, then the register would be a return value.
	 * 
	 * 
	 * @param isCopyEliminated
	 * @param rhs
	 * @param code
	 * @param function
	 */
	public void updateSet(boolean isCopyEliminated, int rhs, Code code, FunctionOrMethod function) {
		if (isCopyEliminated) {
			if ((code instanceof Codes.Const) || (code instanceof Codes.NewArray) || (code instanceof Codes.IndexOf)) {
				return;
			}
			// Extract lhs register
			int lhs = -1;
			if (code instanceof Codes.Assign) {
				Codes.Assign assign = (Codes.Assign) code;
				lhs = assign.target(0);
				// Alias lhs and rhs
				aliasVariables(lhs, rhs, function);
			} else if (code instanceof Codes.FieldLoad) {
				lhs = ((Codes.FieldLoad) code).target(0);
			} else if (code instanceof Codes.Update) {
				lhs = ((Codes.Update) code).target(0);
				// Alias lhs and rhs
				aliasVariables(lhs, rhs, function);
			} else if (code instanceof Codes.Invoke) {
				Codes.Invoke invoke = (Codes.Invoke) code;
				// Check if there is a return value in invoke bytecode
				if (invoke.targets().length > 0) {
					lhs = ((Codes.Invoke) code).target(0);
				}
			} else if (code instanceof Codes.NewRecord) {
				lhs = ((Codes.NewRecord) code).target(0);
				// Alias lhs and rhs
				aliasVariables(lhs, rhs, function);
			} else {
				throw new RuntimeException("Not implemented");
			}

		}
	}

	/**
	 * This function is replaced by analyzeFunction
	 * 
	 * 
	 * Compute the return set for the given function node
	 * 
	 * @param currentNode
	 * @deprecated
	 */
	@Override
	protected void visit(DefaultMutableTreeNode currentNode) {
		// Compute the return set for the give node
		FunctionOrMethod function = (FunctionOrMethod) currentNode.getUserObject();
		if (function != null) {
			// Get the transformed function if so.
			function = this.getFunction(function);
			HashSet<Integer> returnStore;
			if (!returnStores.containsKey(function)) {
				returnStores.put(function, new HashSet<Integer>());
				aliasStores.put(function, new ArrayList<HashSet<Integer>>());
			}
			// Store return registers
			returnStore = returnStores.get(function);
			// Go through each return bytecode
			for (Code code : function.body().bytecodes()) {
				if (code instanceof Codes.Return) {
					Codes.Return r = (Codes.Return) code;
					if (r.operands().length > 0) {
						int reg = r.operand(0);
						// add return register to set
						returnStore.add(reg);
					}
				}
			}
		}
	}

	/**
	 * Go through every function, and checks each return byte-code and adds the return register to the set.
	 * 
	 *
	 * @param module
	 */
	public void apply(WyilFile module, Optional<HashMap<FunctionOrMethod, FunctionOrMethod>> transformFuncMap) {
		super.apply(module, transformFuncMap);
		postorderTraversalCallGraph(tree);
	}

	/**
	 * Check if the register appears in every return statement of the function, and if the register never appears on the
	 * left-handed side of an assignment, which ensures the register is read-only.
	 * 
	 * @param register
	 *            the passed register
	 * @param function
	 *            the called function
	 * @return
	 */
	private boolean isRegisterAlwaysReturn(int register, List<Code> bytecodes, boolean isAlwaysReturned) {
		// Go through each return bytecode
		for (Code code : bytecodes) {
			if (code instanceof Codes.Return) {
				Codes.Return ret = (Codes.Return) code;
				if (ret.operands().length > 0) {
					// Check if the return register is the passed register
					isAlwaysReturned = isAlwaysReturned & (ret.operand(0) == register);
				}
			} else if (code instanceof Codes.Assign) {
				Codes.Assign ass = (Codes.Assign) code;
				// Check if the register is NOT on the left-side
				isAlwaysReturned = isAlwaysReturned & (ass.target(0) != register);
			} else if (code instanceof Codes.Loop) {
				Codes.Loop loop = (Codes.Loop) code;
				isAlwaysReturned = isRegisterAlwaysReturn(register, loop.bytecodes(), isAlwaysReturned);
			}
		}

		return isAlwaysReturned;// true: the register is always returned.

	}

	/**
	 * Check if a register is returned by the 'function'
	 * 
	 * @param register
	 * @param function
	 * @return true if the register is returned. Return false if it is not returned.
	 */
	public RETURN isReturned(int register, FunctionOrMethod function) {
		HashSet<Integer> store = returnStores.get(function);
		if (store.contains(register)) {
			// Check if the register is on the left-handed side of the function body
			List<Code> bytecodes = function.body().bytecodes();
			if (isRegisterAlwaysReturn(register, bytecodes, true)) {
				return RETURN.ALWAYS_RETURN;
			}
			return RETURN.MAYBE_RETURN;
			// return true;
		}

		return RETURN.NEVER_RETURN;
		// return false;
	}

	@Override
	public void analyzeFunction(FunctionOrMethod function) {

		HashSet<Integer> returnStore;
		if (!returnStores.containsKey(function)) {
			returnStores.put(function, new HashSet<Integer>());
			aliasStores.put(function, new ArrayList<HashSet<Integer>>());
		}
		// Store return registers
		returnStore = returnStores.get(function);
		// Go through each return bytecode
		for (Code code : function.body().bytecodes()) {
			if (code instanceof Codes.Return) {
				Codes.Return r = (Codes.Return) code;
				if (r.operands().length > 0) {
					int reg = r.operand(0);
					// add return register to set
					returnStore.add(reg);
				}
			}
		}
		
		if(this.isVerbose) {			
			System.out.println("// Return variables in "+ function.name() + ":" + returnStore);
		}

	}

}
