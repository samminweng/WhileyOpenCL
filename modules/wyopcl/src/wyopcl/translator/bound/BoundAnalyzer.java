package wyopcl.translator.bound;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Deque;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

import wyil.attributes.VariableDeclarations;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.ArrayGenerator;
import wyil.lang.Codes.Fail;
import wyil.lang.Codes.NewArray;
import wyil.lang.Codes.UnaryOperatorKind;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.bound.BoundBlock.BlockType;
import wyopcl.translator.bound.Bounds.Threshold;
import wyopcl.translator.bound.constraint.Assign;
import wyopcl.translator.bound.constraint.Const;
import wyopcl.translator.bound.constraint.Constraint;
import wyopcl.translator.bound.constraint.Equals;
import wyopcl.translator.bound.constraint.GreaterThan;
import wyopcl.translator.bound.constraint.GreaterThanEquals;
import wyopcl.translator.bound.constraint.LeftPlus;
import wyopcl.translator.bound.constraint.LessThan;
import wyopcl.translator.bound.constraint.LessThanEquals;
import wyopcl.translator.bound.constraint.LeftMultiply;
import wyopcl.translator.bound.constraint.Negate;

/***
 * A class is to store all the constraints, produced from the wyil file, with
 * CFGraph, and infer the bounds consistent with all the constraints.
 * 
 * This class is implemented with singleton design pattern to ensure that there
 * is only one instance of bound analyzer.
 * 
 * @author Min-Hsien Weng
 *
 */
public class BoundAnalyzer {
	private final String prefix = "_";
	private Configuration config;
	// The boolean flag indicates the byte-code is inside loop structure.
	private boolean isLoop;
	// The line number
	private int line;
	private WyilFile module;

	// Store the bounds for all functions
	private HashMap<FunctionOrMethod, Bounds> boundMap;


	/**
	 * Constructor
	 */
	public BoundAnalyzer(WyilFile module) {
		this.module = module;
		this.boundMap = new HashMap<FunctionOrMethod, Bounds>();
	}

	/**
	 * Build up Control Flow Graph.
	 * 
	 * @param config
	 * @param variableDeclarations
	 * @param code_blk
	 */
	public void buildCFG(Configuration config, FunctionOrMethod function) {
		this.config = config;

		if (!BoundAnalyzerHelper.isCached(function)) {
			BoundAnalyzerHelper.promoteCFGStatus(function);
		}else{
			// The control flow graph has been cached Get the graph
			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);
			BoundBlock entry = graph.getBasicBlock("entry", BlockType.ENTRY);
			graph.setCurrentBlock(entry);			
		}
		this.line = 0;
		iterateBytecode(function, function.body().bytecodes());
		// Check if the CFG graph is built and cached in the map.
		// If not, run the CFG building procedure.
		if (BoundAnalyzerHelper.isCached(function)) {
			BoundAnalyzerHelper.promoteCFGStatus(function);
		}	

	}

	/**
	 * Prints out each bytecode with line number and indentation.
	 * 
	 * @param name
	 * @param line
	 * @see <a href="http://en.wikipedia.org/wiki/ANSI_escape_code">ANSI escape
	 *      code</a>
	 */
	private int printWyILCode(Code code, FunctionOrMethod function, int line) {
		// Print out the bytecode with the format (e.g. 'main.9 [const %12 =
		// 2345 : int]')
		String font_color_start = "";
		String font_color_end = "";		
		if (code instanceof Codes.Label) {
			// System.out.println(font_color_start+name+"."+line+"."+depth+" ["+code+"]"+font_color_end);
			System.out.println(font_color_start + function.name() + "." + line + " [" + code + "]" + font_color_end);
		} else {
			// System.out.println(font_color_start+name+"."+line+"."+depth+" [\t"+code+"]"+font_color_end);
			System.out.println(font_color_start + function.name() + "." + line + " [\t" + code + "]" + font_color_end);
		}
		return ++line;
	}


	/**
	 * Build up the control flow graph: iterating each byte-code to extract the
	 * constraints, create the block (e.g. loop structure/if-else branches) or
	 * reuse the current block to put the constraints into the corresponding
	 * block.
	 * 
	 * @param name
	 *            the function name that is currently being analyzed.
	 * @param code_blk
	 *            the list of byte-code
	 */
	private void iterateBytecode(FunctionOrMethod function, List<Code> code_blk) {
		// Parse each byte-code and add the constraints accordingly.
		for (Code code : code_blk) {
			if (this.config.isVerbose() && !BoundAnalyzerHelper.isCached(function)) {
				// Get the Block.Entry and print out each byte-code
				line = printWyILCode(code, function, line);
			}

			// Parse each byte-code and add the constraints accordingly.
			try {
				if (code instanceof Codes.Invoke) {
					analyze((Codes.Invoke) code, function);
				} else if (code instanceof Codes.Invariant) {
					// analyze((Codes.Invariant) code, name);
				} else if (code instanceof Codes.Assert) {
					/// analyze((Codes.Assert)code, name);
				} else if (code instanceof Codes.Assign) {
					analyze((Codes.Assign) code, function);
				} else if (code instanceof Codes.Assume) {
					// analyze((Codes.Assume)code, name);
				} else if (code instanceof Codes.BinaryOperator) {
					analyze((Codes.BinaryOperator) code, function);
				} else if (code instanceof Codes.Convert) {
					analyze((Codes.Convert) code, function);
				} else if (code instanceof Codes.Const) {
					analyze((Codes.Const) code, function);
				} else if (code instanceof Codes.Debug) {
					// Do nothing
				} else if (code instanceof Codes.Dereference) {
					// Do nothing
				} else if (code instanceof Codes.FieldLoad) {
					analyze((Codes.FieldLoad) code, function);
				} else if (code instanceof Codes.Fail) {
					analyze((Codes.Fail) code, function);
				} else if (code instanceof Codes.Goto) {
					analyze((Codes.Goto) code, function);
				} else if (code instanceof Codes.If) {
					analyze((Codes.If) code, function);
				} else if (code instanceof Codes.IfIs) {
					// Do nothing
				} else if (code instanceof Codes.IndexOf) {
					analyze((Codes.IndexOf) code, function);
				} else if (code instanceof Codes.IndirectInvoke) {
					// Do nothing
				} else if (code instanceof Codes.Invert) {
					// Do nothing
				} else if (code instanceof Codes.Loop) {
					analyze((Codes.Loop) code, function);
				} else if (code instanceof Codes.Label) {
					analyze((Codes.Label) code, function);
				} else if (code instanceof Codes.Lambda) {
					// Do nothing
				} else if (code instanceof Codes.LengthOf) {
					analyze((Codes.LengthOf) code, function);
				} else if (code instanceof Codes.Move) {
					throw new RuntimeException("Not implemented!");
				} else if (code instanceof Codes.NewRecord) {
					// Do nothing
				} else if (code instanceof Codes.Return) {
					analyze((Codes.Return) code, function);
				} else if (code instanceof Codes.NewArray) {
					analyze((Codes.NewArray) code, function);
				} else if (code instanceof Codes.Nop) {
					// Do nothing
				} else if (code instanceof Codes.Switch) {
					// Do nothing
				} else if (code instanceof Codes.UnaryOperator) {
					analyze((Codes.UnaryOperator) code, function);
				} else if (code instanceof Codes.Update) {
					analyze((Codes.Update) code, function);
				} else if (code instanceof Codes.ArrayGenerator) {
					analyze((Codes.ArrayGenerator) code, function);
				} else {
					throw new RuntimeException("unknown wyil code encountered (" + code + ")");
				}
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}

		}
	}


	/**
	 * Generate an array with a given array
	 * arraygen %8 = [6; 7] : int[]
	 * 
	 * @param code
	 * @param name
	 */
	private void analyze(ArrayGenerator code, FunctionOrMethod function) {
		String target_reg = prefix + code.target(0);
		String input_reg = prefix + code.operand(1);

		// Add 'size' attribute to target array
		BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);
		graph.addConstraint(new Assign(target_reg+"_size", input_reg));

	}

	/**
	 * Create a new array. For example, 
	 * newlist %8 = (%3, %4, %5, %6, %7) : int[]
	 * 
	 * 
	 * @param code
	 * @param name
	 */
	private void analyze(NewArray code, FunctionOrMethod function) {
		// Get the target register
		String target_reg = prefix + code.target(0);

		BigInteger size = BigInteger.valueOf(code.operands().length);
		// Add 'size' attribute to target array
		BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);
		graph.addConstraint(new Const(target_reg+"_size", size));

	}

	/**
	 * Analyze the fail byte-code.
	 * 
	 * @param sym_factory
	 * @param code
	 */
	private void analyze(Fail code, FunctionOrMethod function) {
		// Due to the fact that fail byte-code does not extract any bound or symbol.
	}

	/***
	 * Initialize each variable of a function with an empty domain.
	 * 
	 * 
	 * @param function
	 */
	public void initializeBoundDomain(FunctionOrMethod function){
		BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);

		// Initialize all block with empty domains
		for(BoundBlock blk: graph.getBlockList()){
			blk.emptyBounds(function);
		}

	}



	/**
	 * Infer the bounds of a function by repeatedly iterating over all blocks in
	 * CFGraph from the entry block to the exit block, and then inferring the
	 * bounds consistent with all the constraints in each block.
	 * 
	 * @param name
	 *            the function
	 * @return the bounds
	 */
	public Bounds inferFunctionBounds(FunctionOrMethod function) {
		BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);

		if (config.isVerbose()) {
			// Print out bounds along with size information.
			BoundAnalyzerHelper.printCFG(config, function);
		}
		
		initializeBoundDomain(function);
		
		// Create a deque to track all the blocks that have bound changes
		// Deque provides 'pollLast' to get and remove the last block
		// So we can have Last In First Out or First In First Out behaviour.
		Deque<BoundBlock> changed = new LinkedList<BoundBlock>();

		// Get the entry block and add entry and its child nodes to 
		BoundBlock entry = graph.getBasicBlock("entry", BlockType.ENTRY);
		changed.add(entry);
		// Add the first child block of entry node
		changed.add(graph.getBasicBlock("code", BlockType.BLOCK));

		// Repeatedly iterates over all blocks in deque 
		// and infer the bounds consistent with all the constraints in each block.
		int iteration = 0;
		// Stop the loop when the changed 
		while (!changed.isEmpty()) {
			// Debugging messages
			if (config.isVerbose()) {
				System.out.println("### Iteration " + iteration + " ### ");
				String str = "'" + changed.size() + "' blocks in queue : ";
				Iterator<BoundBlock> iterator = changed.iterator();
				while(iterator.hasNext()){
					BoundBlock blk = iterator.next();
					str += "[" + blk.getType()+ "]";
				}
				System.out.println(str);
			}

			// Get the last block of the deque in Depth-First (last in first out) manner
			BoundBlock blk = changed.pollLast();

			// Get the first block of the deque in Breath-First (first in first out) manner
			//BoundBlock blk = changed.pollFirst();

			boolean isChanged = false;
			// Iterate all the blocks, except Exit block.
			Bounds bnd_before = null, bnd_after = null;
			// Clone the bounds before the bound inference
			bnd_before = (Bounds) blk.getBounds().clone();

			// Reset the block bounds
			blk.emptyBounds(function);

			// Take the union of parents' bounds to produce the input bound
			for (BoundBlock parent : blk.getParentNodes()) {
				// Take the bounds of parent nodes
				blk.unionBounds(parent);
			}

			// Beginning of bound inference.
			blk.inferBounds();
			// End of bound inference.

			bnd_after = (Bounds) blk.getBounds();
			// Check the changes of before and after bounds
			if (bnd_before != null && bnd_after != null 
					&& !bnd_before.equals(bnd_after)) {
				// Widen the bounds for each block
				bnd_after.widenBounds(config, bnd_before);
				// Check if the blk has any child nodes
				if(blk.hasChild() == true){
					for(BoundBlock child : blk.getChildNodes()){
						if (!child.getType().equals(BlockType.EXIT)) {
							// If bounds has changed, then add its child nodes to 'changed set'
							changed.add(child);
						}
					}
				}

				isChanged = true;
			}

			// Debug
			if (config.isVerbose()) {
				// Print out the bounds.
				System.out.println(blk);
				System.out.println("isChanged=" + isChanged);
			}

			iteration++;
		}

		// Take the union of all blocks to produce the bounds of a function.
		BoundBlock exit_blk = graph.getBasicBlock("exit", BlockType.EXIT);
		// Check if there is any exit block, e.g. main function does not always have exit block 
		// because it may not have the return 
		if(exit_blk == null){
			// Get current block
			BoundBlock current_block = graph.getCurrentBlock();
			exit_blk = graph.createBasicBlock("exit", BlockType.EXIT, current_block);
		}

		// Initialize the bounds
		exit_blk.emptyBounds(function);

		// Go through all the blocks to produce final output bounds
		for (BoundBlock blk : graph.getBlockList()) {
			// Check if the bounds are consistent (lower <= upper)
			if (blk.isConsistent() && blk.getType() != BlockType.EXIT) {
				// Take union of consistent block bounds
				exit_blk.unionBounds(blk);
			}
		}
		// Produce the aggregated bounds of a function.
		Bounds bnds = exit_blk.getBounds();

		BoundAnalyzerHelper.printBoundsAndSize(function, bnds);

		if (config.isVerbose()) {
			// Print out bounds along with size information.
			BoundAnalyzerHelper.printCFG(config, function);
		}

		// Put the bounds to HashMap
		boundMap.put(function, bnds);		

		// Return the inferred bounds of the function
		return bnds;
	}	

	/*
	public Bounds inferFunctionBounds(String name) {
		BoundGraph graph = BoundAnalyzerHelper.getCFGraph(name);

		if (config.isVerbose()) {
			// Print out bounds along with size information.
			BoundAnalyzerHelper.printCFG(config, name);
		}

		// Repeatedly iterates over all blocks, starting from the entry block to the
		// exit block, and infer the bounds consistent with all the constraints in each block.
		List<BoundBlock> list = graph.getBlockList();
		boolean isFixedPoint = false;
		int iteration = 0;
		// Stop the loop when the program reaches the fixed point or max-iterations
		while (!isFixedPoint) {
			if (config.isVerbose()) {
				System.out.println("=== Iteration " + iteration + " === ");
			}
			// Initialize the isFixedPointed
			isFixedPoint = true;

			// Iterate all blocks (Order does not matter).
			for (BoundBlock blk : list) {
				boolean isChanged = false;
				// Iterate all the blocks, except Exit block.
				if (!blk.getType().equals(BlockType.EXIT)) {
					Bounds bnd_before = null, bnd_after = null;
					// Clone the bounds before the bound inference
					bnd_before = (Bounds) blk.getBounds().clone();

					// Reset the block bounds
					if(!blk.getType().equals(BlockType.ENTRY)){
						blk.emptyBounds(null);
					}

					// Take the union of parents' bounds to produce the input bound
					for (BoundBlock parent : blk.getParentNodes()) {
						// Take the bounds of parent nodes
						blk.unionBounds(parent);
					}

					// Beginning of bound inference.
					blk.inferBounds();
					// End of bound inference.

					bnd_after = (Bounds) blk.getBounds();
					// Repeat the bound inference for (maximal) three iterations
					if(iteration >0 && iteration %3 == 0){
						bnd_after.widenBounds(config, bnd_before);
					}					

					// Check the changes of before and after bounds
					if (bnd_before != null && bnd_after != null 
							&& !bnd_before.equals(bnd_after)) {	
						// If bounds has changed, then isChanged = false.
						isChanged = true;
					}

					// Debug
					if (config.isVerbose()) {
						// Print out the bounds.
						System.out.println(blk);
						System.out.println("isChanged=" + isChanged);
					}

					// Use bitwise 'AND' to combine the bound change of each block. 
					isFixedPoint &= (!isChanged);
				}
			}

			if (config.isVerbose()) {
				System.out.println("isFixedPoint=" + isFixedPoint);
			}

			iteration++;
		}

		// Take the union of all blocks to produce the bounds of a function.
		BoundBlock exit_blk = graph.getBasicBlock("exit", BlockType.EXIT);
		// Check if there is any exit block, e.g. main function does not always have exit block 
		// because it may not have the return 
		if(exit_blk == null){
			// Get current block
			BoundBlock current_block = graph.getCurrentBlock();
			exit_blk = graph.createBasicBlock("exit", BlockType.EXIT, current_block);
		}


		for (BoundBlock blk : list) {
			// Consider the bounds of consistent block and discard the bounds of inconsistent block.
			if (blk.isConsistent() && blk.getType() != BlockType.EXIT) {
				exit_blk.unionBounds(blk);
			}
		}
		// Produce the aggregated bounds of a function.
		Bounds bnds = exit_blk.getBounds();

		BoundAnalyzerHelper.printBoundsAndSize(this.module, bnds, name);

		if (config.isVerbose()) {
			// Print out bounds along with size information.
			BoundAnalyzerHelper.printCFG(config, name);
		}

		// Put the bounds to HashMap
		boundMap.put(name, bnds);		

		// Return the inferred bounds of the function
		return bnds;
	}	
	 */

	private void analyze(Codes.Assign code, FunctionOrMethod function) {
		String target_reg = prefix + code.target(0);
		String op_reg = prefix + code.operand(0);
		if (code.type(0) instanceof Type.Array) {
			// Add the constraint to the size variable of target array
			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);
			graph.addConstraint(new Assign(target_reg+"_size", op_reg+"_size"));
		}

		// Check if the assigned value is an integer
		if (BoundAnalyzerHelper.isIntType(code.type(0))) {
			// Add the constraint 'target = operand'
			if (!BoundAnalyzerHelper.isCached(function)) {
				BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);
				graph.addConstraint(new Assign(target_reg, op_reg));
			}
		}
	}

	/**
	 * Parses 'Const' bytecode to add the 'Const' constraint to the list.
	 * 
	 * @param code
	 */
	private void analyze(Codes.Const code, FunctionOrMethod function) {
		Constant constant = code.constant;
		String target_reg = prefix + code.target();

		// Check the value is an Constant.Integer
		if (constant instanceof Constant.Integer && !BoundAnalyzerHelper.isCached(function)) {
			// Add the 'Const' constraint.
			BigInteger value = ((Constant.Integer) constant).value;
			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);
			graph.addConstraint(new Const(target_reg, value));
		}

		if (constant instanceof Constant.Array) {
			// Get the list and extract the size info.
			BigInteger size = BigInteger.valueOf((((Constant.Array) constant).values).size());
			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);
			graph.addConstraint(new Const(target_reg+"_size", size));
		}

	}

	/**
	 * Implements the propagation rule for <code>Codes.IndexOf</code> bytecode
	 * to assign the bounds from the source operator register to the target
	 * operator.
	 * 
	 * @param code
	 */
	private void analyze(Codes.IndexOf code, FunctionOrMethod function) {
		if (BoundAnalyzerHelper.isIntType((Type) code.type(0))
				&& !BoundAnalyzerHelper.isCached(function)) {
			String target = prefix + code.target(0);
			String op = prefix + code.operand(0);
			String index = prefix + code.operand(1);
			// Get the CFGraph
			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);
			graph.addConstraint(new Equals(target, op));
		}
	}

	/**
	 * Parses the 'If' bytecode to add the constraints to the list.
	 * 
	 * @param code
	 * @throws CloneNotSupportedException
	 */
	private void analyze(Codes.If code, FunctionOrMethod function) {
		String left = prefix + code.operand(0);
		String right = prefix + code.operand(1);
		if (!BoundAnalyzerHelper.isCached(function)) {
			// Get CF graph.
			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);
			Constraint c = null;
			Constraint neg_c = null;
			if (BoundAnalyzerHelper.isIntType(code.type(0))) {
				switch (code.op) {
				case EQ:
					c = new Equals(left, right);
					neg_c = new Equals(left, right);
					break;
				case NEQ:

					break;
				case LT:
					c = new LessThan(left, right);
					neg_c = new GreaterThanEquals(left, right);
					break;
				case LTEQ:
					// Add the 'left <= right' constraint to the branched list.
					c = new LessThanEquals(left, right);
					neg_c = new GreaterThan(left, right);
					break;
				case GT:
					c = new GreaterThan(left, right);
					neg_c = new LessThanEquals(left, right);
					break;
				case GTEQ:
					// Branch and add the left >= right constraint to
					c = new GreaterThanEquals(left, right);
					neg_c = new LessThan(left, right);
					// Add the constraint 'left< right' to current constraint
					// list.
					break;
				default:
					throw new RuntimeException("Unknow operator (" + code + ")");

				}

				// Check if the 'if' bytecode is the loop condition.
				if (isLoop) {
					// Create a loop body and loop exit.
					graph.createLoopStructure(code.target, c, neg_c);
				} else {
					// Create if and else branches.
					graph.createIfElseBranch(code.target, c, neg_c);
				}
			}
		}
	}

	/**
	 * Gets the block by the label byte-code and sets the current block to that
	 * block.
	 * 
	 * If the current and target blocks are not the same and target block is not
	 * a Loop Exit, then add the parent-child relation to these two blocks.
	 * 
	 * @param code
	 *            {@link wyil.lang.Codes.Label} byte-code
	 */
	private void analyze(Codes.Label code, FunctionOrMethod function) {
		String label = code.label;
		if (!BoundAnalyzerHelper.isCached(function)) {
			// Get the CFGraph
			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);
			// Get the target blk. If it is null, then create a new block.
			BoundBlock blk = graph.getBasicBlock(label);
			// Get the current block
			BoundBlock c_blk = graph.getCurrentBlock();
			// Check if the target blk is a loop structure.
			if (c_blk != null && !(c_blk.equals(blk))) {
				if (blk.getType().equals(BlockType.LOOP_EXIT)) {
					// current block -> loop header 
					BoundBlock loop_header = graph.getBasicBlock(label, BlockType.LOOP_HEADER);
					// current block -> loop header
					c_blk.addChild(loop_header);
				}else{
					c_blk.addChild(blk);
				}
			}
			// Switch the current block
			graph.setCurrentBlock(blk);
		}
	}



	/**
	 * Parse the 'return' bytecode and add the constraint
	 * 
	 * @param code
	 */
	private void analyze(Codes.Return code, FunctionOrMethod function) {
		// check if there is any return value
		if(code.operands().length ==0){
			return; // Do nothing
		}

		// Get the return operand
		String retOp = prefix + code.operand(0);
		Type type = code.type(0);

		if (!BoundAnalyzerHelper.isCached(function)) {

			// Get the CFGraph
			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);
			BoundBlock c_blk = graph.getCurrentBlock();
			// Check if the current blk exits. If so, then proceed the following
			// procedure.
			if (c_blk != null) {
				// Create a return block 
				BoundBlock return_block = graph.createBasicBlock("return"+retOp, BlockType.RETURN, c_blk);

				// Check if the return type is integer.
				if (BoundAnalyzerHelper.isIntType(type)) {
					// Add the 'Assign' constraint to the return (ret) variable.
					return_block.addConstraint((new Assign("return", retOp)));
				}

				// Add the bounds of size variable
				if(type instanceof Type.Array){
					return_block.addConstraint((new Assign("return_size", retOp+"_size")));
				}

				// Connect the current block with exit block.
				BoundBlock exit_block = graph.getBasicBlock("exit", BlockType.EXIT);
				if(exit_block == null){
					exit_block = graph.createBasicBlock("exit", BlockType.EXIT, return_block);
				}
				return_block.addChild(exit_block);

				graph.setCurrentBlock(null);
			}
		}
	}


	/**
	 * Parse 'Unary Operator' bytecode and add the constraints in accordance
	 * with operator kind. For example, add the 'Negate' constraint for the
	 * negated operator.
	 * 
	 * @param code
	 */
	private void analyze(Codes.UnaryOperator code, FunctionOrMethod function) {
		UnaryOperatorKind kind = code.kind;
		String x = prefix + code.operand(0);
		String y = prefix + code.target(0);
		// Get a graph
		BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);
		switch (kind) {
		case NEG:
			graph.addConstraint(new Negate(x, y));
			break;
		default:
			throw new RuntimeException("unknown unary operator encountered (" + code + ")");
		}

	}

	/**
	 * Extract LengthOf byte-code.
	 * 
	 * 'lengthof %5 = %0'
	 * 
	 * 
	 * @param code
	 */
	private void analyze(Codes.LengthOf code, FunctionOrMethod function) {
		// Get the size att
		String op_reg = prefix + code.operand(0);
		String target_reg = prefix + code.target(0);

		BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);
		graph.addConstraint(new Assign(target_reg, op_reg+"_size"));

	}

	/**
	 * Creates a loop structure, including loop header, loop body and loop exit.
	 * 
	 * @param code
	 */
	private void analyze(Codes.Loop code,  FunctionOrMethod function) {
		// Set the loop flag to be true,
		// in order to identify the bytecode is inside a loop

		isLoop = true;

		// Get the list of byte-code and iterate through the list.
		iterateBytecode(function, code.bytecodes());

		// Set the flag to be false after finishing iterating all the byte-code.
		isLoop = false;
	}



	/**
	 * Implemented the propagation rule for <code>Codes.BinaryOperator</code>
	 * code to add the 'Plus' constraints of operands and target registers.
	 * 
	 * @param code
	 */
	private void analyze(Codes.BinaryOperator code, FunctionOrMethod function) {
		String target = prefix + code.target(0);
		// Add the type att
		if (BoundAnalyzerHelper.isIntType(code.type(0)) && !BoundAnalyzerHelper.isCached(function)) {
			// Get the values
			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);
			switch (code.kind) {
			case ADD:
				// Use the left plus to represent the addition
				graph.addConstraint(new LeftPlus(prefix + code.operand(0), prefix + code.operand(1), target));
				break;
			case SUB:
				// Negated the operand
				graph.addConstraint(new Negate(prefix + code.operand(1), prefix + code.operand(1)));
				// Use the left plus to represent the subtraction.
				graph.addConstraint(new LeftPlus(prefix + code.operand(0), prefix + code.operand(1), target));
				break;
			case MUL:
				graph.addConstraint(new LeftMultiply(prefix+ code.operand(0), prefix + code.operand(1), target));
				break;
			case DIV:
				break;
			case REM:
				break;
			case BITWISEAND:
				break;
			case BITWISEOR:
				break;
			case BITWISEXOR:
				break;
			case LEFTSHIFT:
				break;
			case RIGHTSHIFT:
				break;
			default:
				throw new RuntimeException("unknown binary expression encountered (" + code + ")");
			}
		}

	}


	/**
	 * Updates an element of a list. But how do we update the bounds???
	 * 
	 * @param code
	 */
	private void analyze(Codes.Update code, FunctionOrMethod function) {

	}

	/**
	 * Checks or creates the goto block and updates the current block to be
	 * null.
	 * 
	 * @param code
	 *            Goto ({@link wyil.lang.Codes.Goto } byte-code
	 */
	private void analyze(Codes.Goto code, FunctionOrMethod function) {
		if (!BoundAnalyzerHelper.isCached(function)) {
			// Get the label name
			String label = code.target;
			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);
			BoundBlock goto_blk = graph.getBasicBlock(label);
			// Set the current blk to null blk
			graph.setCurrentBlock(null);
		}
	}

	/**
	 * Analyze the FieldLoad byte-code. 
	 * 
	 * 
	 * @param code
	 * @param name
	 */
	private void analyze(Codes.FieldLoad code, FunctionOrMethod function) {
		//String target = prefix + code.target(0);
		//String record = prefix + code.operand(0);
	}

	private void analyze(Codes.Convert code, FunctionOrMethod function) {
		//String target = prefix + code.target(0);
		// sym_ctrl.putAttribute(target, "type", code.result);

		//if (code.result instanceof Type.Array) {
		// Get the value
		//}

	}


	/**
	 * 
	 * 
	 * @param function
	 * @return
	 */
	private Bounds getBounds(FunctionOrMethod function) {
		// Get the bounds
		Bounds bounds = this.boundMap.get(function);
		// Check if the bound is inferred not. If not, then infer the bounds
		if (bounds == null) {
			bounds = this.inferFunctionBounds(function);
		}
		return bounds;
	}



	/**
	 * Check the bounds of given register is +/- infinity 
	 * 
	 * 
	 * @param register
	 * @param function
	 * @return true for unbounded register.
	 */
	public boolean isUnBounded(int register, FunctionOrMethod function) {
		// Get the bounds
		Bounds bounds = getBounds(function);

		// Get the domain of register
		BigInteger l_bnd = bounds.getLower(prefix + register);
		BigInteger u_bnd = bounds.getUpper(prefix + register);

		if(l_bnd == null || u_bnd == null){
			return true;
		}

		return false;
	}




	/**
	 * Use the bound results to suggest the proper integer type, i.e.
	 * 
	 * <ul>
	 * 
	 * <li>int16_t: 16-bit integer from −32,768 to 32,767
	 * <li>uint16_t: unsigned 16-bit integers from 0 to 65,535 
	 * 
	 * <li>int32_t: 32-bit integer from −2,147,483,648 to 2,147,483,647
	 * <li>uint32_t: unsigned 32-bit integers from 0 to 4,294,967,295 
	 * 
	 * <li>int64_t: 64-bit integer from −9,223,372,036,854,775,808 to 9,223,372,036,854,775,807
	 * <li>uint64_t: unsigned 64-bit integers from 0 to 18,446,744,073,709,551,615
	 * 
	 * </ul>
	 * 
	 * 
	 * See https://en.wikipedia.org/wiki/Integer_(computer_science)
	 * @param register
	 * @param function
	 * @return
	 */
	public String suggestIntegerType(int register, FunctionOrMethod function){

		// Get the bounds
		Bounds bounds = getBounds(function);

		// Get the domain of register
		BigInteger l_bnd = bounds.getLower(prefix+register);
		BigInteger u_bnd = bounds.getUpper(prefix+register);
		// Check the register is unbounded or not.
		if(l_bnd != null && u_bnd != null){
			// Check lower bound >= 0
			if(l_bnd.compareTo(BigInteger.ZERO)>=0){
				// Used unsigned integer types

				// Unsigned 16-bit integer
				if(u_bnd.compareTo(Threshold._UI16_MAX.getValue())<=0){
					return "uint16_t";
				}

				// Unsigned 32-bit integer
				if(u_bnd.compareTo(Threshold._UI32_MAX.getValue())<=0){
					return "uint32_t";
				}

				// Unsigned 64-bit integers
				return "uint64_t";

			}else{
				// 16-bit integers 
				if(l_bnd.compareTo(Threshold._I16_MIN.getValue())>=0
						&& u_bnd.compareTo(Threshold._I16_MAX.getValue())<=0){
					return "int16_t";
				}

				// 32-bit integers
				if(l_bnd.compareTo(Threshold._I32_MIN.getValue())>=0
						&& u_bnd.compareTo(Threshold._I32_MAX.getValue())<=0){
					return "int32_t";
				}

				// The default 64-bit integer 
				return "int64_t"; 
			}
		}
		// The default 64-bit integer 
		return "int64_t"; 
	}



	/**
	 * Get the list of bytecode of the invoked function and infer the bounds of
	 * the function in the context of input bounds. And then propagate the
	 * bounds of return value back to the caller.
	 * 
	 * @param caller_name
	 *            the name of caller function.
	 * @param code
	 */
	private void analyze(Codes.Invoke code, FunctionOrMethod function) {
		FunctionOrMethod callee = this.module.functionOrMethod(code.name.name(), code.type(0));
		FunctionOrMethod caller = function;
		if (callee != null) {
			int caller_line = line;	


			// Infer the bounds of caller function.
			Bounds input_bnds = inferFunctionBounds(caller);

			// Build CFGraph for callee.
			buildCFG(config, callee);


			// Propagate the bounds of input parameters to the function.
			BoundAnalyzerHelper.propagateInputBoundsToCallee(callee, code, input_bnds);



			// Infer the bounds of callee function.
			Bounds ret_bnd = inferFunctionBounds(callee);

			// check if there is any return
			BoundAnalyzerHelper.propagateBoundsBackCaller(caller, code, ret_bnd);

			// Promote the status of callee's CF graph to be 'complete'
			BoundAnalyzerHelper.promoteCFGStatus(callee);

			//Reset the line number
			this.line = caller_line;
		}
	}

}
