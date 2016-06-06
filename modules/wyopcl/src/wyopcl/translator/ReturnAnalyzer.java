package wyopcl.translator;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;

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
	// Store the set of return registers for each function.
	private HashMap<FunctionOrMethod, HashSet<Integer>> stores;

	public ReturnAnalyzer(Configuration config) {
		super(config);
		this.stores = new HashMap<FunctionOrMethod, HashSet<Integer>>();
	}
	

	/**
	 * Update the return set.
	 * 
	 * If the copy of the register is avoided, then the register is aliased
	 * to lhs variable. And if the lhs variable is a return register, then
	 * the register would be a return value.
	 * 
	 * 
	 * @param isCopyAvoided
	 * @param register
	 * @param function
	 */
	public void updateSet(boolean isCopyAvoided, int register, Code code, FunctionOrMethod function){
		if(isCopyAvoided){
			// Adds register to return set.
			if(!stores.containsKey(function)){
				stores.put(function, new HashSet<Integer>());
			}
			
			HashSet<Integer> store = stores.get(function);
			int lhs = -1;
			if(code instanceof Codes.Assign){
				lhs = ((Codes.Assign)code).target(0);
			}else if (code instanceof Codes.FieldLoad){
				lhs = ((Codes.FieldLoad)code).target(0);
			}else if (code instanceof Codes.Update){
				lhs = ((Codes.Update)code).target(0);
			}else if (code instanceof Codes.Invoke){				
				Codes.Invoke invoke = (Codes.Invoke)code;
				// Check if there is a return value in invoke bytecode
				if(invoke.targets().length>0){
					lhs = ((Codes.Invoke)code).target(0);
				}
			}else if (code instanceof Codes.IndexOf){
				lhs = ((Codes.IndexOf)code).target(0);
			}
			
			// Check if lhs variable is a return register
			if(lhs >=0 && store.contains(lhs)){
				store.add(register);
			}
			
		}
	}
	
	
	/**
	 * Perform the post-order traversal to visit all nodes of a tree reference:
	 * http://www.tutorialspoint.com/data_structures_algorithms/tree_traversal.htm
	 * 
	 * @param root
	 */
	private void postorderTraversalCallGraph(DefaultMutableTreeNode tree) {
		// Go through all the nodes in post order
		Enumeration<DefaultMutableTreeNode> nodes = tree.postorderEnumeration();
		while (nodes.hasMoreElements()) {
			DefaultMutableTreeNode node = nodes.nextElement();
			visit(node);
		}

	}

	/**
	 * Visit the node and compute the return set for that function
	 * 
	 * @param currentNode
	 */
	private void visit(DefaultMutableTreeNode currentNode) {
		// Compute the return set for the give node
		String name = (String) currentNode.getUserObject();
		FunctionOrMethod function = (FunctionOrMethod) this.getFunction(name);

		if (function != null) {
			HashSet<Integer> store;
			if (!stores.containsKey(function)) {
				stores.put(function, new HashSet<Integer>());
			}
			// Store return registers
			store = stores.get(function);
			// Go through each return bytecode
			for (Code code : function.body().bytecodes()) {
				if (code instanceof Codes.Return) {
					Codes.Return r = (Codes.Return) code;
					if (r.targets().length > 0) {
						// add return register to set
						store.add(r.target(0));
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
	public void apply(WyilFile module) {
		super.apply(module);
		postorderTraversalCallGraph(tree);
	}

	/**
	 * Check if a register is returned by the 'function'
	 * 
	 * @param register
	 * @param function
	 * @return true if the register is returned. Return false if it is not returned.
	 */
	public boolean isReturned(int register, FunctionOrMethod function) {
		HashSet<Integer> store = stores.get(function);
		if (store.contains(register)) {
			return true;
		}

		return false;
	}

}