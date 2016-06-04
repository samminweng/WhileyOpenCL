package wyopcl.translator;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import wyil.attributes.VariableDeclarations;
import wyil.lang.Code;
import wyil.lang.CodeBlock;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.Codes.Assert;
import wyil.lang.Codes.Comparator;
import wyil.lang.Codes.If;
import wyil.lang.Codes.Invariant;
import wyil.lang.Codes.Invoke;
import wyil.lang.Codes.Loop;
import wyil.lang.Codes.Return;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.bound.BasicBlock;
import wyopcl.translator.bound.BasicBlock.BlockType;
import wyopcl.translator.bound.CFGraph;
import wyopcl.translator.bound.CFGraph.STATUS;

/**
 * Aims to build control flow graph for a function.
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public abstract class Analyzer {
	// private static final String prefix = "%";
	protected Configuration config;
	// Maps of CFGs
	protected HashMap<FunctionOrMethod, CFGraph> cfgraphs;
	// The boolean flag indicates the byte-code is inside loop structure.
	private boolean isLoop;
	// The line number
	private int line;
	// Wyil byte-code
	protected WyilFile module;
	// Perform read-write checks
	private ReadWriteAnalyzer readwriteAnalyzer;
	// Perform return checks
	private ReturnAnalyzer returnAnalyzer;

	/**
	 * Constructor
	 */
	public Analyzer(Configuration config) {
		this.cfgraphs = new HashMap<FunctionOrMethod, CFGraph>();
		this.config = config;
		this.readwriteAnalyzer = new ReadWriteAnalyzer();
		this.returnAnalyzer = new ReturnAnalyzer();
	}

	/**
	 * Assign module to analyzer
	 * 
	 * @param module
	 */
	public void apply(WyilFile module) {
		this.module = module;
		// Perform read-write checks
		this.readwriteAnalyzer.apply(module);
		// Perform return checks
		this.returnAnalyzer.apply(module);
		
		// Iterate each function to build up CFG
		for (FunctionOrMethod function : module.functionOrMethods()) {
			this.buildCFG(function);
		}
	}

	/**
	 * Returns the function
	 * 
	 * @param name
	 * @param type
	 * @return
	 */
	public FunctionOrMethod getFunction(String name, Type.FunctionOrMethod type) {
		return this.module.functionOrMethod(name, type);
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
			CodeBlock codeBlk = blk.getCodeBlock();
			// Check if code blk contains this byte-code.
			if (codeBlk.bytecodes().contains(code)) {
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

		if (config.isVerbose()) {
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
		if (config.isVerbose()) {
			String name = function.name();
			// Print out the bytecode
			if (code instanceof Codes.Label) {
				System.out.println(name + "." + line + " [" + code + "]");
			} else {
				System.out.println(name + "." + line + " [\t" + code + "]");
			}
		}
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
				if (code instanceof Codes.Assert) {
					// buildCFG((Codes.Assert)code, function);
				} else if (code instanceof Codes.Invariant) {
					buildCFG((Codes.Invariant) code, function);
				} else if (code instanceof Codes.If) {
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

	/**
	 * Builds an 'ASSERT' block to store the code representing the assertion.
	 * 
	 * 
	 * @param code
	 * @param function
	 */
	private void buildCFG(Assert code, FunctionOrMethod function) {
		// Get label code from the list of assertion code
		String label = code.bytecodes().stream().filter(c -> c instanceof Codes.Label).map(c -> ((Codes.Label) c).label)
				.collect(Collectors.joining(", "));

		// Get current block
		CFGraph graph = this.getCFGraph(function);
		BasicBlock parent = graph.getCurrentBlock();
		// Create an assert block
		BasicBlock blk = graph.createBasicBlock(label, BlockType.ASSERT, parent);
		// Add the code to blk
		code.bytecodes().stream().forEach(c -> blk.addCode(c));

		// Set current blk to the original blk
		graph.setCurrentBlock(blk);

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
		// Get the label name (e.g. swap12).
		String label = code.name.name() + line;
		// Create a new single block for invoke wyil code.
		BasicBlock invoke_blk = graph.createBasicBlock(label, BlockType.INVOKE, c_blk);
		invoke_blk.addCode(code);
		// Create another block
		BasicBlock blk = graph.createBasicBlock(label, BlockType.BLOCK, invoke_blk);
		// Set next_blk to be the current block.
		graph.setCurrentBlock(blk);
	}

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
		// Set the loop flag to be true,
		// in order to identify the bytecode is inside a loop
		isLoop = true;

		CFGraph graph = getCFGraph(function);
		BasicBlock c_blk = graph.getCurrentBlock();

		// Create the loop header
		BasicBlock loop_header = graph.createBasicBlock("", BlockType.LOOP_HEADER, c_blk);
		// Set the current block to be loop header.
		graph.setCurrentBlock(loop_header);
		// Get the list of byte-code and iterate through the list.
		iterateWyilCode(function, code.bytecodes());
		// Set the flag to be false after finishing iterating all the byte-code.
		isLoop = false;

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
		BasicBlock goto_blk = graph.getBasicBlock(label);
		if (goto_blk == null) {
			// Create a new block
			graph.createBasicBlock(label, BlockType.BLOCK);
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
		// Check if target block is loop exit.
		// If so, no needs to connect current block to target block.
		if (c_blk != null && (blk != null && !blk.getType().equals(BlockType.LOOP_EXIT))) {
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
		if (isLoop) {
			// Create a loop body and loop exit.
			graph.createLoopStructure(code.target);
			// Added the condition to loop body
			graph.getBasicBlock(code.target, BlockType.LOOP_BODY).addCode(code);
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
			// Create the return block, using target as the label.
			blk = graph.createBasicBlock(this.getActualVarName(code.operand(0), function), BlockType.RETURN, blk);
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
			var_name = "%" + register;
		}
		return var_name;
	}

	/**
	 * Check if a register is returned by the function 'f'
	 * 
	 * @param register
	 * @param function
	 * @return true if the register is returned inside the function 'f'.
	 */
	protected boolean isReturned(int register, FunctionOrMethod function) {
		return this.returnAnalyzer.isReturned(register, function);
	}

	/**
	 * Check if the array 'r' is updated inside the function.
	 * 
	 * @param reg
	 *            the register
	 * @param function
	 *            the function
	 * @return true if reg is updated.
	 */
	protected boolean isMutated(int register, FunctionOrMethod function) {
		return readwriteAnalyzer.isMutated(register, function);
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
	protected int mapFunctionArgument(int parameter, Codes.Invoke code) {
		// Map the register to input parameter.
		int[] ops = code.operands();
		
		// Find out the index of passed parameter
		int index =0;
		while(index<ops.length){
			if(ops[index] == parameter){
				break;
			}
			index++;
		}
		
		return index;// The operand index is also the registers defined in the function.
	}
	
}
