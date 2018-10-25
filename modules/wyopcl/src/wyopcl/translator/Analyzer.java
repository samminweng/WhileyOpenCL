package wyopcl.translator;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.swing.tree.DefaultMutableTreeNode;

import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
import wyil.lang.Code;
import wyil.lang.CodeBlock;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.Codes.Assert;
import wyil.lang.Codes.Assign;
import wyil.lang.Codes.Comparator;
import wyil.lang.Codes.If;
import wyil.lang.Codes.Invariant;
import wyil.lang.Codes.Invoke;
import wyil.lang.Codes.Loop;
import wyil.lang.Codes.Return;
import wyil.lang.Codes.Update;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.bound.BoundBlock;
import wyopcl.translator.cfg.BasicBlock;
import wyopcl.translator.cfg.BasicBlock.BlockType;
import wyopcl.translator.cfg.CFGraph;
import wyopcl.translator.cfg.CFGraph.STATUS;

/**
 * Aims to build control flow graph for a function.
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public abstract class Analyzer {
	private static final String prefix = "_";
	protected Configuration config;
	// Boolean flag indicates whether to print out debugging messages
	public boolean isVerbose;
	// Maps of CFGs
	protected HashMap<FunctionOrMethod, CFGraph> cfgraphs;
	// The line number
	private int line;
	// Wyil byte-code
	protected WyilFile module;
	// The tree node of calling graph
	protected DefaultMutableTreeNode tree;
	// The transformed functions
	protected Optional<HashMap<FunctionOrMethod, FunctionOrMethod>> transformFuncMap;

	/**
	 * Constructor
	 */
	public Analyzer(Configuration config) {
		this.cfgraphs = new HashMap<FunctionOrMethod, CFGraph>();
		this.config = config;
		this.isVerbose = config.isVerbose();
	}

	/**
	 * Assign module to analyzer
	 * 
	 * @param module
	 */
	public void apply(WyilFile module, Optional<HashMap<FunctionOrMethod, FunctionOrMethod>> transformFuncMap) {
		this.module = module;
		this.transformFuncMap = transformFuncMap;
		this.buildCallGraph(module);
		// Iterate each function to build up CFG
		for (FunctionOrMethod function : module.functionOrMethods()) {
			// Check if the function is transformed 
			function = this.getFunction(function);
			this.buildCFG(function);
			
		}
		
		// Build up CFG for transformed function
		if(transformFuncMap.isPresent()){
			for(FunctionOrMethod transformedFunction : transformFuncMap.get().values()){
				this.buildCFG(transformedFunction);
			}
		}
		
		
	}

	
	
	
	/**
	 * Get the function. If the function has been transformed, then return the transformed one.
	 * 
	 * @param name
	 * @return function. Return null if the function is not defined in whiley program.
	 */
	protected FunctionOrMethod getFunction(FunctionOrMethod function) {
		String name = function.name();
		if (!this.module.functionOrMethod(name).isEmpty()){
			// Check if the function has been transformed into a new function byte-code.
			if(transformFuncMap.isPresent() && transformFuncMap.get().containsKey(function)){ 
				FunctionOrMethod transformedFunc = transformFuncMap.get().get(function);
				return transformedFunc;				
			}
		}
		
		return function;
	}
	
	/**
	 * Get the called function
	 * 
	 * @param code
	 * @return
	 */
	protected FunctionOrMethod getCalledFunction(Codes.Invoke code) {
		String name = code.name.name();
		wyil.lang.Type.FunctionOrMethod type = code.type(0);
		if (!this.module.functionOrMethod(name).isEmpty()){
			// Get the function byte with function name and type
			for(FunctionOrMethod func: this.module.functionOrMethods()){
				if(func.name().equals(name)
						&&func.type().equals(type)){
					// Get the function
					func = this.getFunction(func);
					return func;
				}
			}
		}
		
		return null;
	}
	
	
	/**
	 * Given a function name, get the CFGraph.
	 * 
	 * @param name
	 *            the function name
	 * @return the cached CFGraph. If no cached graph is found, return null.
	 */
	protected CFGraph getCFGraph(FunctionOrMethod function) {
		if (cfgraphs.containsKey(function))
			return cfgraphs.get(function);
		return null;
	}

	/**
	 * Get the block that contains the given code.
	 * 
	 * @param function
	 * @return
	 */
	protected BasicBlock getBlockbyCode(FunctionOrMethod function, Code code) {
		CFGraph graph = getCFGraph(function);
		// Get the list of block for the function.
		for (BasicBlock blk : graph.getBlockList()) {
			// Get the list of code.
			List<Code> codeblk = blk.getCodeBlock();
			// Check if code blk contains this byte-code.
			if (codeblk.contains(code)) {
					return blk;
			}
			
		}
		return null;
	}
	
	
	

	/**
	 * Gets the list of basic blocks for a function.
	 * 
	 * @param function
	 * @return
	 */
	protected List<BasicBlock> getBlocks(FunctionOrMethod function) {
		// Get the graph
		CFGraph graph = getCFGraph(function);
		if (graph != null) {
			// Return the list of blocks.
			return graph.getBlockList();
		}
		// Return an empty list
		return new ArrayList<BasicBlock>();
	}

	/**
	 * Checks if the CFGraph of the given function exist.
	 * 
	 * @param name
	 * @return
	 */
	protected boolean isCached(FunctionOrMethod function) {
		CFGraph graph = getCFGraph(function);
		if (graph != null) {
			if (graph.getStatus() == STATUS.COMPLETE) {
				return true;
			}
		} else {
			// Create an graph and symbol control
			cfgraphs.put(function, new CFGraph());
		}

		return false;
	}

	/**
	 * Outputs the control flow graphs (*.dot).
	 * 
	 * @param blks
	 *            the list of block
	 * @param filename
	 *            the name of input file.
	 * @param func_name
	 *            the name of function.
	 */
	private void printCFG(FunctionOrMethod function) {
		// Get the function name.
		String name = function.name();
		String dot_string = "digraph " + name + "{\n";
		CFGraph graph = getCFGraph(function);
		List<BasicBlock> blks = graph.getBlockList();
		// Write out each block 
		for (BasicBlock blk : blks) {
			if(blk.getType() == BlockType.LOOP_BODY || blk.getType() == BlockType.LOOP_HEADER
			  || blk.getType() == BlockType.LOOP_EXIT){
				// Draw loop structures with grey box shape
				dot_string += "\""+ blk.getLabel() + " [" + blk.getType() + "]\""+"[shape=box,style=filled,color=\".7 .3 1.0\"];\n";
			}else if(blk.getType() == BlockType.COND){
				// Draw condition with a diamond shape
				dot_string += "\""+ blk.getLabel() + " [" + blk.getType() + "]\""+"[shape=diamond];\n";
			} else{
				// Draw if-else branches with a box shape
				dot_string += "\""+ blk.getLabel() + " [" + blk.getType() + "]\""+"[shape=box];\n";
			}
		}
		// Write out the edges between two blocks
		for (BasicBlock blk : blks) {
			if (!blk.isLeaf()) {
				for (BasicBlock child : blk.getChildNodes()) {
					dot_string += "\"" + blk.getLabel() + " [" + blk.getType() + "]\"->\"" + child.getLabel() + " ["
							+ child.getType() + "]\";\n";
				}
			}
		}
		dot_string += "\n}";
		// )Write out the CFG-function_name.dot
		try {
			PrintWriter cfg_writer = new PrintWriter(name + ".dot", "UTF-8");
			cfg_writer.println(dot_string);
			cfg_writer.close();
		} catch (FileNotFoundException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * Build a control flow graph for a function.
	 * 
	 * @param function
	 *            the function code block.
	 */
	private void buildCFG(FunctionOrMethod function) {
		if (!isCached(function)) {
			line = 0;
			iterateWyilCode(function, function.body().bytecodes());
		}

		if (isVerbose) {
			// Print out CFGraph.
			this.printCFG(function);
		}
	}

	/**
	 * Prints out each bytecode with line number and indentation.
	 * 
	 * @param name
	 * @param line
	 */
	private int printWyILCode(FunctionOrMethod function, Code code, int line) {
//		if (isVerbose) {
//			String name = function.name();
//			// Print out the bytecode
//			if (code instanceof Codes.Label) {
//				System.out.println(name + "." + line + " [" + code + "]");
//			} else {
//				System.out.println(name + "." + line + " [\t" + code + "]");
//			}
//		}
		return ++line;
	}

	/**
	 * Build up the control flow graph: iterating each byte-code to create the block (e.g. loop structure/if-else
	 * branches) or reuse the current block to put the constraints into the corresponding block.
	 * 
	 * @param function
	 *            the function that is currently being analyzed.
	 * @param code_blk
	 *            the list of byte-code
	 */
	private void iterateWyilCode(FunctionOrMethod function, List<Code> code_blk) {
		// Parse each byte-code and add the constraints accordingly.
		for (Code code : code_blk) {
			// Get the Block.Entry and print out each byte-code
			line = printWyILCode(function, code, line);
			// Parse each byte-code and add the constraints accordingly.
			try {
				if(code instanceof Codes.Assign) {
					buildCFG((Codes.Assign) code, function);
				}else if (code instanceof Codes.If) {
					buildCFG((Codes.If) code, function);
				} else if (code instanceof Codes.Return) {
					buildCFG((Codes.Return) code, function);
				} else if (code instanceof Codes.Goto) {
					buildCFG((Codes.Goto) code, function);
				} else if (code instanceof Codes.Label) {
					buildCFG((Codes.Label) code, function);
				} else if (code instanceof Codes.Loop) {
					buildCFG((Codes.Loop) code, function);
				} else if (code instanceof Codes.Invoke) {
					buildCFG((Codes.Invoke) code, function);
				} else if (code instanceof Codes.Update) {
					buildCFG((Codes.Update) code, function);
				} else {
					// Add the byte-code to the current block in a CFGraph.
					CFGraph graph = getCFGraph(function);
					graph.getCurrentBlock().addCode(code);
				}
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}

	private void buildCFG(Assign code, FunctionOrMethod function) {
		// Get the graph
		CFGraph graph = getCFGraph(function);
		// Get the current block
		BasicBlock c_blk = graph.getCurrentBlock();
		if(isArrayAssign(code, function)) {
			// Set current block to be Assign block
			c_blk.setType(BlockType.ASSIGN);
			c_blk.addCode(code);			
			// Create another block
			String label = "Block" + line;
			// Create another block
			BasicBlock blk = graph.createBasicBlock(label, BlockType.BLOCK, c_blk);
			// Set next_blk to be the current block.
			graph.setCurrentBlock(blk);
		}else{
			c_blk.addCode(code);
		}
	}

	/**
	 * Builds an 'Update' block to store the code representing the assertion.
	 * 
	 * 
	 * @param code
	 * @param function
	 */
	private void buildCFG(Update code, FunctionOrMethod function) {
		// Get the graph
		CFGraph graph = getCFGraph(function);
		BasicBlock c_blk = graph.getCurrentBlock();
		// Get the label name (e.g. swap12).
		String label = "Update" + line;
		// Create a new single block for invoke wyil code.
		BasicBlock update_blk = graph.createBasicBlock(label, BlockType.UPDATE, c_blk);
		update_blk.addCode(code);
		// Create another block
		BasicBlock blk = graph.createBasicBlock(label, BlockType.BLOCK, update_blk);
		// Set next_blk to be the current block.
		graph.setCurrentBlock(blk);
		
	}

	/**
	 * Builds an 'ASSERT' block to store the code representing the assertion.
	 * 
	 * 
	 * @param code
	 * @param function
	 */
	@Deprecated
	private void buildCFG(Assert code, FunctionOrMethod function) {
		// Get label code from the list of assertion code
		String label = code.bytecodes().stream().filter(c -> c instanceof Codes.Label).map(c -> ((Codes.Label) c).label)
				.collect(Collectors.joining(", "));

		// Get current block
		CFGraph graph = this.getCFGraph(function);
		BasicBlock parent = graph.getCurrentBlock();
		// Create an assert block
		BasicBlock assert_blk = graph.createBasicBlock(label, BlockType.ASSERT, parent);
		// Add the code to blk
		code.bytecodes().forEach(c -> assert_blk.addCode(c));

		// Create a child block after assertion  
		BasicBlock child = graph.createBasicBlock(label, BlockType.BLOCK, assert_blk);
		 
		// Set child block as current one 
		graph.setCurrentBlock(child);

	}

	/**
	 * Builds up a basic block for the calling function.
	 * 
	 * @param code
	 *            Invoke byte-code
	 * @param function
	 */
	private void buildCFG(Invoke code, FunctionOrMethod function) {
		// Get the graph
		CFGraph graph = getCFGraph(function);
		BasicBlock c_blk = graph.getCurrentBlock();
		
		// Check if any array typed parameter is used in 'invoke' code
		boolean isArrayParam = false;		
		for(Type paramtype: code.type(0).params()){
			if(paramtype instanceof Type.Array 
				|| paramtype instanceof Type.Nominal // Structure
				){
				isArrayParam = true;
				break;
			}
		}
		
		if(isArrayParam){
			// Create a 'function call' block
			// Get the label name (e.g. swap12).
			String label = code.name.name() + line;
			// Create a new single block for invoke wyil code.
			BasicBlock invoke_blk = graph.createBasicBlock(label, BlockType.INVOKE, c_blk);
			invoke_blk.addCode(code);
			// Create another block
			BasicBlock blk = graph.createBasicBlock(label, BlockType.BLOCK, invoke_blk);
			// Set next_blk to be the current block.
			graph.setCurrentBlock(blk);
		}else{
			// Add 'invoke' code to current block
			c_blk.addCode(code);
		}
	}
	
	/**
	 * Adds an invariant code to the current block
	 * @param code
	 * @param function
	 */
	@Deprecated
	private void buildCFG(Invariant code, FunctionOrMethod function) {
		// Add the invariant to the current block.
		CFGraph graph = getCFGraph(function);
		BasicBlock c_blk = graph.getCurrentBlock();
		c_blk.addCode(code);
	}

	/**
	 * Iterate the bytecode inside the loop.
	 * 
	 * @param code
	 * @param function
	 */
	private void buildCFG(Loop code, FunctionOrMethod function) {
		// Begin a loop
		
		// Search for loop condition
		String loop_cond = "";
		for(Code c: code.bytecodes()){
			// The first if-else is the loop condition
			if(c instanceof Codes.If){
				// Extract the label
				loop_cond = ((Codes.If)c).target;
				break;
			}
		}
		
		CFGraph graph = getCFGraph(function);
		BasicBlock c_blk = graph.getCurrentBlock();
		// Create the loop header
		BasicBlock loop_header = graph.createBasicBlock(loop_cond, BlockType.LOOP_HEADER, c_blk);
		// Create the loop body and loop exit
		BasicBlock loop_body = graph.createBasicBlock(loop_cond, BlockType.LOOP_BODY, loop_header);
		// Create the loop exit, and add it to the child node of loop header.
		BasicBlock loop_exit = graph.createBasicBlock(loop_cond, BlockType.LOOP_EXIT, loop_header);
		// Set the current block to be loop body.
		graph.setCurrentBlock(loop_body);
		// Get the list of byte-code and iterate through the list.
		iterateWyilCode(function, code.bytecodes());
		// After iterating all loop byte-code, link the current block to the loop header 
		c_blk = graph.getCurrentBlock();
		c_blk.addChild(loop_header);
		// Set the current block to be loop exit.
		graph.setCurrentBlock(loop_exit);
		
		// Finish a loop

	}

	/**
	 * Checks or creates the goto block and updates the current block to be null.
	 * 
	 * @param code
	 *            Goto ({@link wyil.lang.Codes.Goto } byte-code
	 */
	private void buildCFG(Codes.Goto code, FunctionOrMethod function) {
		// Get the label name
		String label = code.target;
		CFGraph graph = getCFGraph(function);
		// Get current block
		BasicBlock current_blk = graph.getCurrentBlock();
		BasicBlock goto_blk = graph.getBasicBlock(label);
		if (goto_blk == null) {
			// Create a new block
			goto_blk = graph.createBasicBlock(label, BlockType.BLOCK);
		}
		
		if(current_blk != null){
			// Link the current and goto blocks
			current_blk.addChild(goto_blk);
		}
		
		// Set the current blk to null blk
		graph.setCurrentBlock(null);
	}

	/**
	 * Gets the block by the label byte-code and sets the current block to that block.
	 * 
	 * If the current and target blocks are not the same and target block is not a Loop Exit, then add the parent-child
	 * relation to these two blocks.
	 * 
	 * @param code
	 *            {@link wyil.lang.Codes.Label} byte-code
	 */
	private void buildCFG(Codes.Label code, FunctionOrMethod function) {
		String label = code.label;
		// Get the CFGraph
		CFGraph graph = getCFGraph(function);
		// Get the current block
		BasicBlock c_blk = graph.getCurrentBlock();
		// Get the target block (else branch or loop exit).
		BasicBlock blk = graph.getBasicBlock(label);
		if(blk == null){
			// Create a new block
			blk = graph.createBasicBlock(label, BlockType.BLOCK);
		}
		// Check if target block is loop exit.
		// If so, no needs to connect current block to target block.
		if (c_blk != null && !blk.getType().equals(BlockType.LOOP_EXIT)) {
			// Add current block to the target block.
			c_blk.addChild(blk);
		}
		
		// Switch the current block to the target block
		graph.setCurrentBlock(blk);

	}

	/**
	 * Analyze the 'If' byte-code to create if/else branches or loop structure.
	 * 
	 * @param code
	 * @param function
	 */
	private void buildCFG(If code, FunctionOrMethod function) {
		CFGraph graph = getCFGraph(function);

		// The original condition is 'ifge %0, %1 goto blklab1 : int'
		// The negated condition is iflt %0, %1 goto blklab1
		If neg_code = null;
		// Create an negated condition.
		switch (code.op) {
		case EQ:
			neg_code = Codes.If(code.type(0), code.operand(0), code.operand(1), Comparator.NEQ, code.target);
			break;
		case NEQ:
			neg_code = Codes.If(code.type(0), code.operand(0), code.operand(1), Comparator.EQ, code.target);
			break;
		case LT:
			neg_code = Codes.If(code.type(0), code.operand(0), code.operand(1), Comparator.GTEQ, code.target);
			break;
		case LTEQ:
			neg_code = Codes.If(code.type(0), code.operand(0), code.operand(1), Comparator.GT, code.target);
			break;
		case GT:
			neg_code = Codes.If(code.type(0), code.operand(0), code.operand(1), Comparator.LTEQ, code.target);
			break;
		case GTEQ:
			neg_code = Codes.If(code.type(0), code.operand(0), code.operand(1), Comparator.LT, code.target);
			break;
		default:
			throw new RuntimeException("Unknown comparator.");
		}

		// Check if the 'if' bytecode is the loop condition.
		BasicBlock loop_body = graph.getBasicBlock(code.target, BlockType.LOOP_BODY);
		if (loop_body!= null) {
			// Added the condition to loop body
			loop_body.addCode(code);
		} else {
			// Create if/else branches, and set the if branch as the current
			// block.
			graph.createIfElseBranch(code.target);
			// Added the negated condition to the if branch.
			graph.getBasicBlock(code.target, BlockType.IF_BRANCH).addCode(neg_code);
			// Add the original condition to the else branch.
			graph.getBasicBlock(code.target, BlockType.ELSE_BRANCH).addCode(code);
		}

	}

	/**
	 * Analyze the 'return' byte-code, to create an return block.
	 * 
	 * If the return code does not have return value, then create an exit block.
	 * 
	 * @param code
	 * @param name
	 */
	private void buildCFG(Return code, FunctionOrMethod function) {
		// Get the CFGraph
		CFGraph graph = getCFGraph(function);
		BasicBlock blk = graph.getCurrentBlock();
		// Check if there is any return value. If no, no needs of making a "Return" block.
		if (code.operands().length > 0) {
			String label = "return"+prefix+code.operand(0);
			// Create the return block, using target as the label.
			blk = graph.createBasicBlock(label, BlockType.RETURN, blk);
			// Add the code to current block.
			blk.addCode(code);
			// Set current block.
			graph.setCurrentBlock(blk);
		} else {
			// Connect current block to exit block.
			BasicBlock exit = graph.getBasicBlock("exit", BlockType.EXIT);
			if (exit == null) {
				exit = graph.createBasicBlock("exit", BlockType.EXIT, blk);
			} else {
				// If so, connect the current block with exit block.
				blk.addChild(exit);
			}
		}
		// Set the current block to null
		// graph.setCurrentBlock(null);
	}

	/**
	 * Get the actual (source-level) variable name of a register
	 * 
	 * @param reg
	 * @param function
	 * @return
	 */
	protected String getActualVarName(int register, FunctionOrMethod function) {
		// Get the mapping table between variable name and register.
		VariableDeclarations vars = function.attribute(VariableDeclarations.class);
		String var_name = vars.get(register).name();
		if (var_name == null) {
			// If it is a temporary variable at byte-code, then print out
			// the register
			var_name = prefix + register;
		}
		return var_name;
	}

	/**
	 * Check if the assignment is an array assignment
	 * 
	 * 
	 * @param code
	 * @param function
	 * @return
	 */
	protected boolean isArrayAssign(Assign code, FunctionOrMethod function) {
		int lhs_register = code.target(0);
		//Get the declarations for lhs register
		VariableDeclarations vars = function.attribute(VariableDeclarations.class);
		Declaration declaration = vars.get(lhs_register);
		Type type = declaration.type();
		// Check if lhs type is array or the below types 
		if (type instanceof Type.Array || type instanceof Type.Record || type instanceof Type.Nominal
				|| type instanceof Type.Union) {
			return true; // Consider the assignment as array assignment
		}
		return false;
	}
	
	
	
	/**
	 * Map the function argument to the register in the calling function.
	 * For example, 'a = f(b, c)'
	 * The passed argument 'b' is mapped to the first register
	 * in calling function 'f'
	 * 
	 * 
	 * @param parameter the function argument at caller site
	 * @param code
	 * @return the register in calling function
	 */
	protected int mapArgumentToParameter(int parameter, Codes.Invoke code) {
		// Map the register to input parameter.
		int[] ops = code.operands();
		
		// Find out the index of passed parameter
		int register =0;
		while(register<ops.length){
			if(ops[register] == parameter){
				break;
			}
			register++;
		}
		
		return register;// The operand index is also the registers defined in the function.
	}
	
	/**
	 * Visit the node and analyze the function
	 * 
	 * @param currentNode
	 */
	protected abstract void visit(DefaultMutableTreeNode node);
	
	/**
	 * Perform the post-order traversal to visit all nodes of a tree reference:
	 * http://www.tutorialspoint.com/data_structures_algorithms/tree_traversal.htm
	 * 
	 * @param root
	 */
	protected void postorderTraversalCallGraph(DefaultMutableTreeNode tree) {
		// Go through all the nodes in post order
		Enumeration<DefaultMutableTreeNode> nodes = (Enumeration<DefaultMutableTreeNode>) tree.postorderEnumeration();
		while (nodes.hasMoreElements()) {
			DefaultMutableTreeNode node = nodes.nextElement();
			// Root node represents the tree and does not have the function.
			if (!node.isRoot()){
				visit(node);
			}
		}
	}
	
	
	/**
	 * Iterate each code recursively to build the call graph
	 * 
	 * @param code
	 * @param function
	 * @param root
	 */
	protected void buildCallGraph(Code code, FunctionOrMethod function, DefaultMutableTreeNode parentNode) {
		if (code instanceof Codes.Invoke) {
			Codes.Invoke invoke = (Codes.Invoke) code;
			// Get the calling function.
			FunctionOrMethod callingfunction = getCalledFunction(invoke);
			// Check if function are defined in the program.
			// Check if calling function is not recursive function.
			// TreeNode can not be recursively added to the function.
			if (callingfunction != null && !callingfunction.equals(function)) {
				// Create the tree node and append the node to the parent node
				DefaultMutableTreeNode node = new DefaultMutableTreeNode(callingfunction);
				parentNode.add((DefaultMutableTreeNode)node);
				// Iterate the calling function
				for (Code c : callingfunction.body().bytecodes()) {
					buildCallGraph(c, callingfunction, node);
				}
			}
		} else if (code instanceof Codes.IndirectInvoke) {
			// Do nothing
			//System.out.println(code);
		} else if (code instanceof Codes.Loop) {
			Codes.Loop loop = (Codes.Loop) code;
			// Iterate the byte-code inside loop body
			for (Code c : loop.bytecodes()) {
				buildCallGraph(c, function, parentNode);
			}
		}

	}
	
	/**
	 * Go through each function in the tree (post-order)
	 * to check if the given node is one of child nodes. 
	 * 
	 * 
	 * @param node
	 * @return true if the node is a child node.
	 */
	private boolean findCallGraph(DefaultMutableTreeNode node){
		// Get a list of functions in the call graph tree
		Enumeration<DefaultMutableTreeNode> childNodes = tree.postorderEnumeration();
		boolean isFound = false;
		while(childNodes.hasMoreElements()){
			DefaultMutableTreeNode childNode = childNodes.nextElement();
			// Check if the given node is one of child nodes
			if(childNode.getUserObject().equals(node.getUserObject())){
				isFound = true;// Found the child node
				break;
			}
		}
		return isFound;// Not found
	}
	
	
	
	/**
	 * Creates a call graph to represent calling relationship between functions
	 * 
	 * The call graph is constructed with tree node
	 * 
	 * reference is http://docs.oracle.com/javase/tutorial/uiswing/components/tree.html
	 * 
	 * @param module
	 */
	protected void buildCallGraph(WyilFile module) {
		// Ensure the tree is built once
		if (tree == null) {
			
			// Create a root function
			tree = new DefaultMutableTreeNode("root"); 
			
			// Build call graph, starting with main function (root node)
			FunctionOrMethod main = module.functionOrMethod("main").get(0);
			DefaultMutableTreeNode mainNode = new DefaultMutableTreeNode(main);
			
			// Go through main function
			for (Code code : main.body().bytecodes()) {
				buildCallGraph(code, main, mainNode);
			}
			
			
			// Discover un-used or un-called functions to the tree
			for(FunctionOrMethod function: module.functionOrMethods()){
				DefaultMutableTreeNode node = new DefaultMutableTreeNode(function);
				// Check if the node function is added to the tree
				boolean isFound = findCallGraph(node);
				if(!isFound){
					// If not, then add the node to the tree
					tree.add(node);
				}
			}
			
			
		}
	}
	
}
