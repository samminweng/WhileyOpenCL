package wyopcl.translator;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.Codes.Assign;
import wyil.lang.Codes.Assume;
import wyil.lang.Codes.BinaryOperator;
import wyil.lang.Codes.Const;
import wyil.lang.Codes.Convert;
import wyil.lang.Codes.Fail;
import wyil.lang.Codes.FieldLoad;
import wyil.lang.Codes.Goto;
import wyil.lang.Codes.If;
import wyil.lang.Codes.IndexOf;
import wyil.lang.Codes.Invariant;
import wyil.lang.Codes.Invoke;
import wyil.lang.Codes.Label;
import wyil.lang.Codes.LengthOf;
import wyil.lang.Codes.ListOperator;
import wyil.lang.Codes.Loop;
import wyil.lang.Codes.NewList;
import wyil.lang.Codes.NewTuple;
import wyil.lang.Codes.Return;
import wyil.lang.Codes.SubList;
import wyil.lang.Codes.TupleLoad;
import wyil.lang.Codes.UnaryOperator;
import wyil.lang.Codes.Update;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.translator.bound.BasicBlock;
import wyopcl.translator.bound.CFGraph;
import wyopcl.translator.bound.SymbolFactory;
import wyopcl.translator.bound.BasicBlock.BlockType;
import wyopcl.translator.bound.CFGraph.STATUS;
/**
 * Aims to build control flow graph for a function.
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public abstract class Analyzer {
	private static final String prefix = "%";
	protected Configuration config;
	// Maps of CFGs	
	protected HashMap<FunctionOrMethod, CFGraph> cfgraphs;

	/**
	 * Constructor
	 */
	public Analyzer(Configuration config){
		this.cfgraphs = new HashMap<FunctionOrMethod, CFGraph>();
		this.config = config;
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
	 * Checks if the CFGraph of the given function exist.
	 * 
	 * @param name
	 * @return
	 */
	private boolean isCached(FunctionOrMethod function) {
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
	public void printCFG(FunctionOrMethod function) {
		//Get the function name.
		String name = function.name();		
		String dot_string = "digraph " + name + "{\n";
		CFGraph graph = getCFGraph(function);
		List<BasicBlock> blks = graph.getBlockList();
		for (BasicBlock blk : blks) {
			if (!blk.isLeaf()) {
				for (BasicBlock child : blk.getChildNodes()) {
					dot_string += "\"" + blk.getBranch() + " [" + blk.getType() + "]\"->\"" + child.getBranch() + " [" + child.getType() + "]\";\n";
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
	 * Apply analysis on the function to build up control flow graph for a function.
	 * @param function
	 */
	public CFGraph buildCFG(FunctionOrMethod function){
		if (!isCached(function)) {
			int line = 0;
			iterateWyilCode(function, function.body().bytecodes(), line);
		}		
		return getCFGraph(function);
	}

	/**
	 * Prints out each bytecode with line number and indentation.
	 * 
	 * @param name
	 * @param line
	 */
	private int printWyILCode(FunctionOrMethod function, Code code, int line) {
		String name = function.name();
		// Print out the bytecode with the format (e.g. 'main.9 [const %12 = 2345 : int]')
		if (code instanceof Codes.Label) {			
			System.out.println( name + "." + line + " [" + code + "]");
		} else {

			System.out.println(name + "." + line + " [\t" + code + "]");
		}
		return ++line;
	}

	/**
	 * Build up the control flow graph: iterating each byte-code to create the block
	 * (e.g. loop structure/if-else branches) or reuse the current block to put
	 * the constraints into the corresponding block.
	 * 
	 * @param function
	 *            the function that is currently being analyzed.
	 * @param code_blk
	 *            the list of byte-code
	 */
	protected void iterateWyilCode(FunctionOrMethod function, List<Code> code_blk, int line) {
		// Parse each byte-code and add the constraints accordingly.
		for (Code code : code_blk) {			
			// Get the Block.Entry and print out each byte-code
			line = printWyILCode(function, code, line);
			// Parse each byte-code and add the constraints accordingly.
			try {
				if (code instanceof Codes.If) {
					analyze((Codes.If) code, function);
				}else if (code instanceof Codes.Return) {
					analyze((Codes.Return) code, function);
				} else {
					//Add the byte-code to the current block in a CFGraph.
					CFGraph graph = getCFGraph(function);
					graph.getCurrentBlock().addCode(code);
				}				
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}
	
	/**
	 * Analyze the 'If' byte-code 
	 * @param code
	 * @param function
	 */
	protected void analyze(If code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		
	}


	/**
	 * Analyze the 'return' byte-code to connect the current to Exit block.
	 * @param code
	 * @param name
	 */
	protected void analyze(Return code, FunctionOrMethod function){	
		// Get the CFGraph
		CFGraph graph = getCFGraph(function);
		BasicBlock c_blk = graph.getCurrentBlock();
		// Check if the current blk exits. 
		//If so, connect the current block with exit block.
		if (c_blk != null) {
			c_blk.addCode(code);
			c_blk.addChild(graph.getBasicBlock("exit", BlockType.EXIT));
		}
	}

	



}
