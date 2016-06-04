package wyopcl.translator;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.TreeNode;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;

/**
 * Find out what variables in each function are read-only by check if the variable appear on
 * the lhs-handed side of the statement. If the variable is never on lhs, then it is classified
 * as read-only. Otherwise, it is read-write.
 * <br><br>
 * However, the analyze does not analyze the below code types, including:
 * <pre><code>
 * Codes.Debug, Codes.Fail, Codes.Goto, Codes.If, Codes.IfIs, Codes.Label,
 * Codes.Lambda, Codes.Nop, Codes.Quantify, Codes.Return, Codes.Switch,
 * Codes.Void, Codes.IndirectInvoke
 * </code></pre>
 * This is because those code types does not perform read-write but workflow.
 *
 * @author Min-Hsien Weng
 *
 */
public class ReadWriteAnalyzer {
	// Store the set of read-write registers for each function.
	private HashMap<FunctionOrMethod, HashSet<Integer>> stores;
	// Wyil byte-code
	private WyilFile module;
	// The tree node of calling graph 
	private DefaultMutableTreeNode tree;
	
	public ReadWriteAnalyzer() {
		stores = new HashMap<FunctionOrMethod, HashSet<Integer>>();
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
				Codes.Invoke invoke = (Codes.Invoke)code;
				// Check if there is any return value;
				if(invoke.targets().length>0){
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
	 * @param register
	 * @param function
	 * @return true if register is read-write. Otherwise, return false (read-only).
	 */
	public boolean isMutated(int register, FunctionOrMethod function){
		HashSet<Integer> store = stores.get(function);
		// Check if the register belongs to read-write set
		if (store.contains(register)){
			return true; // read-write
		}
		return false;// Read-only
	}
	
	
	/**
	 * Iterate each code recursively and 
	 * @param code
	 * @param function
	 * @param root
	 */
	private void buildCallGraph(Code code, FunctionOrMethod function, DefaultMutableTreeNode parentNode){
		if(code instanceof Codes.Invoke){
			Codes.Invoke invoke = (Codes.Invoke)code;
			// Create the tree node and append the node to the parent node
			DefaultMutableTreeNode node = new DefaultMutableTreeNode(invoke.name.name());
			parentNode.add(node);
			// Get the calling function
			FunctionOrMethod callingfunction = this.module.functionOrMethod(invoke.name.name(), invoke.type(0));
			// Check if calling function is not recursive function
			// Treenode can not be recursively added to the function. 
			if(callingfunction != null && callingfunction.equals(function)){
				// Iterate the calling function
				for(Code c :callingfunction.body().bytecodes()){
					buildCallGraph(c, callingfunction, node);
				}
			}
		}else if(code instanceof Codes.IndirectInvoke){
			Codes.IndirectInvoke indirect = (Codes.IndirectInvoke)code;
			System.out.println(indirect);
			
			//root.add(new DefaultMutableTreeNode(indirect.name()));
		}else if(code instanceof Codes.Loop){
			Codes.Loop loop = (Codes.Loop)code;
			// Iterate the byte-code inside loop body
			for(Code c :loop.bytecodes()){
				buildCallGraph(c, function, parentNode);
			}
			
		}
		
	}
	
	/**
	 * Perform the in-order traversal to visit all nodes of a tree
	 * reference: http://www.tutorialspoint.com/data_structures_algorithms/tree_traversal.htm
	 * @param root
	 */
	private void traversalCallGraph(DefaultMutableTreeNode currentNode){
		if(!currentNode.isRoot()){
			System.out.println(currentNode.getParent()+"->"+currentNode);
		}
		
		if(currentNode.isLeaf()){
			return ;
		}
		
		Enumeration<DefaultMutableTreeNode> childNodes = currentNode.children();
		// Iterate the child nodes
		while(childNodes.hasMoreElements()){
			DefaultMutableTreeNode childNode = childNodes.nextElement();
			traversalCallGraph(childNode);
		}
		
		// Iterate siblings by setting current Node to its sibling		
		/*while((currentNode = currentNode.getNextSibling()) != null){
			// Traverse the sibling nodes
			inOrderTraversal(currentNode);
		}*/
	}
	
	
	/**
	 * Creates a call graph to represent calling relationship between
	 * functions
	 * 
	 * The call graph is constructed with tree node
	 * 
	 * reference is http://docs.oracle.com/javase/tutorial/uiswing/components/tree.html
	 * @param module
	 */
	private void buildCallGraph(WyilFile module){
		// Create the root node, i.e. main function
		tree = new DefaultMutableTreeNode("main");
		
		FunctionOrMethod main = module.functionOrMethod("main").get(0);
		// Go through main function
		for(Code code :main.body().bytecodes()){
			buildCallGraph(code, main, tree);
		}
		// Traverse the tree
		traversalCallGraph(tree);
		
	}
	
	
	
	/**
	 * Go through every function, and checks each byte-code and adds the lhs register
	 * to read-write set.
	 * 
	 *
	 * @param module
	 */
	public void apply(WyilFile module) {
		// Assign the module
		this.module = module;
		// Build the call tree
		buildCallGraph(module);
		
		// Iterate each function to find out whether each variable is read-only
		for (FunctionOrMethod function : module.functionOrMethods()) {
			HashSet<Integer> store;
			if (!stores.containsKey(function)) {
				stores.put(function, new HashSet<Integer>());
			}
			// Store read-write registers
			store = stores.get(function);
			// Go through each bytecode and add lhs register to read-write set
			for (Code code : function.body().bytecodes()) {
				iterateBytecode(code, store);
			}
		}
	}

}
