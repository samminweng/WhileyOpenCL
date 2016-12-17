package wyopcl.translator;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;

import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.TreeNode;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;

/**
 * Find out what variables in each function are read-only by check if the variable appear on the lhs-handed side of the
 * statement. If the variable is never on lhs, then it is classified as read-only. Otherwise, it is read-write. <br>
 * <br>
 * However, the analyze does not analyze the below code types, including:
 * 
 * <pre>
 * <code>
 * Codes.Debug, Codes.Fail, Codes.Goto, Codes.If, Codes.IfIs, Codes.Label,
 * Codes.Lambda, Codes.Nop, Codes.Quantify, Codes.Return, Codes.Switch,
 * Codes.Void, Codes.IndirectInvoke
 * </code>
 * </pre>
 * 
 * This is because those code types does not perform read-write but workflow.
 *
 * @author Min-Hsien Weng
 *
 */
public class ReadWriteAnalyzer extends Analyzer {
	// Store the set of read-write registers for each function.
	private HashMap<FunctionOrMethod, HashSet<Integer>> stores;

	public ReadWriteAnalyzer(Configuration config) {
		super(config);
		stores = new HashMap<FunctionOrMethod, HashSet<Integer>>();
	}

	/**
	 * Add rhs register to the readwrite set.
	 * 
	 * Due to the copy is removed, lhs and rhs variables are aliased together, thus rhs register is added to readwrite
	 * set.
	 * 
	 * @param isCopyAvoided
	 *            the copy is removed (true) or not (false)
	 * @param register
	 *            the RHS register
	 * @param code
	 * @param function
	 */
	public void updateSet(boolean isCopyAvoided, int register, Code code, FunctionOrMethod function) {
		if (isCopyAvoided) {
			// Check if code is not const, new array or indexof byte-code
			if (!(code instanceof Codes.Const) && !(code instanceof Codes.NewArray)
					&& !(code instanceof Codes.IndexOf) && !(code instanceof Codes.NewRecord)
					&& !(code instanceof Codes.FieldLoad) && !(code instanceof Codes.Update)) {
				// Adds register to readwrite set.
				HashSet<Integer> store = stores.get(function);
				// The copy is NOT made, and the RHS register is aliased to lhs
				store.add(register);
			}
		}
	}

	/**
	 * Given a byte-code, add lhs variable to the Hashset.
	 * 
	 * @param code
	 * @param store
	 */
	private void iterateBytecode(Code code, HashSet<Integer> store) {
		// Skip the workflow code type
		if (code instanceof Codes.Debug || code instanceof Codes.Fail || code instanceof Codes.Goto
				|| code instanceof Codes.If || code instanceof Codes.IfIs || code instanceof Codes.Label
				|| code instanceof Codes.Lambda || code instanceof Codes.Nop || code instanceof Codes.Quantify
				|| code instanceof Codes.Return || code instanceof Codes.Switch || code instanceof Codes.Void
				|| code instanceof Codes.IndirectInvoke) {
			// Do nothing
		} else {
			// Check the register is left-handed side
			if (code instanceof Codes.ArrayGenerator) {
				store.add(((Codes.ArrayGenerator) code).target(0));
			} else if (code instanceof Codes.AssertOrAssume) {
				// Iterate the assertion block
				Codes.AssertOrAssume at = (Codes.AssertOrAssume) code;
				for (Code c : at.bytecodes()) {
					iterateBytecode(c, store);
				}
			} else if (code instanceof Codes.Assign) {
				store.add(((Codes.Assign) code).target(0));
			} else if (code instanceof Codes.BinaryOperator) {
				store.add(((Codes.BinaryOperator) code).target(0));
			} else if (code instanceof Codes.Const) {
				store.add(((Codes.Const) code).target(0));
			} else if (code instanceof Codes.Convert) {
				store.add(((Codes.Convert) code).target(0));
			} else if (code instanceof Codes.Dereference) {
				store.add(((Codes.Dereference) code).target(0));
			} else if (code instanceof Codes.FieldLoad) {
				store.add(((Codes.FieldLoad) code).target(0));
			} else if (code instanceof Codes.IndexOf) {
				store.add(((Codes.IndexOf) code).target(0));
			} else if (code instanceof Codes.Invariant) {
				// Go through invariant block
				Codes.Invariant inv = (Codes.Invariant) code;
				for (Code c : inv.bytecodes()) {
					iterateBytecode(c, store);
				}
			} else if (code instanceof Codes.Invert) {
				store.add(((Codes.Invert) code).target(0));
			} else if (code instanceof Codes.Invoke) {
				Codes.Invoke invoke = (Codes.Invoke) code;
				// Check if there is any return value;
				if (invoke.targets().length > 0) {
					store.add(((Codes.Invoke) code).target(0));
				}
			} else if (code instanceof Codes.LengthOf) {
				store.add(((Codes.LengthOf) code).target(0));
			} else if (code instanceof Codes.Loop) {
				// Get loop block
				Codes.Loop loop = (Codes.Loop) code;
				for (Code c : loop.bytecodes()) {
					iterateBytecode(c, store);
				}
			} else if (code instanceof Codes.Move) {
				store.add(((Codes.Move) code).target(0));
			} else if (code instanceof Codes.NewArray) {
				store.add(((Codes.NewArray) code).target(0));
			} else if (code instanceof Codes.NewObject) {
				store.add(((Codes.NewObject) code).target(0));
			} else if (code instanceof Codes.NewRecord) {
				store.add(((Codes.NewRecord) code).target(0));
			} else if (code instanceof Codes.Not) {
				store.add(((Codes.Not) code).target(0));
			} else if (code instanceof Codes.UnaryOperator) {
				store.add(((Codes.UnaryOperator) code).target(0));
			} else if (code instanceof Codes.Update) {
				store.add(((Codes.Update) code).target(0));
			} else {
				throw new RuntimeException("Not implemented");
			}
		}
	}

	/**
	 * Check whether a register is read and write inside the function.
	 * 
	 * @param register
	 * @param function
	 * @return true if register is read-write. Otherwise, return false (read-only).
	 */
	public boolean isMutated(int register, FunctionOrMethod function) {
		HashSet<Integer> store = stores.get(function);
		// Check if the register belongs to read-write set
		if (store.contains(register)) {
			return true; // read-write
		}
		return false;// Read-only
	}

	/**
	 * Compute the read-write set for the given function
	 * 
	 * @param currentNode
	 */
	@Override
	protected void visit(DefaultMutableTreeNode currentNode) {
		// Compute the readwrite set for the give node
		FunctionOrMethod function = (FunctionOrMethod) currentNode.getUserObject();
		HashSet<Integer> store;
		if (!stores.containsKey(function)) {
			stores.put(function, new HashSet<Integer>());
		}

		if (function != null) {
			// Store read-write registers
			store = stores.get(function);
			// Go through each bytecode and add lhs register to read-write set
			for (Code code : function.body().bytecodes()) {
				iterateBytecode(code, store);
			}
		}

		// Print out the node information (path).
		if (!currentNode.isRoot()) {
			FunctionOrMethod parent = (FunctionOrMethod) ((DefaultMutableTreeNode) currentNode.getParent()).getUserObject();
			System.out.println(parent + "->" + function.name());
		}
	}

	/**
	 * Go through every function, and checks each byte-code and adds the lhs register to read-write set.
	 * 
	 *
	 * @param module
	 */
	public void apply(WyilFile module, Optional<HashMap<FunctionOrMethod, FunctionOrMethod>> transformFuncMap) {
		super.apply(module, transformFuncMap);
		// Traverse the tree in post-order and find out whether a variable is read-write or not
		postorderTraversalCallGraph(tree);

	}

}
