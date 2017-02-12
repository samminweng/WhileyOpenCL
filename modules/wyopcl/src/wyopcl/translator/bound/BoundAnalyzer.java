package wyopcl.translator.bound;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
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
	private HashMap<String, Bounds> boundMap;
	

	/**
	 * Constructor
	 */
	public BoundAnalyzer(WyilFile module) {
		this.module = module;
		this.boundMap = new HashMap<String, Bounds>();
	}

	/**
	 * Build up Control Flow Graph.
	 * 
	 * @param config
	 * @param variableDeclarations
	 * @param code_blk
	 */
	public void buildCFG(Configuration config, String name) {
		this.config = config;
		FunctionOrMethod functionOrMethod = this.module.functionOrMethod(name).get(0);
		
		if (!BoundAnalyzerHelper.isCached(name)) {
			BoundAnalyzerHelper.promoteCFGStatus(name);
		}else{
			// The control flow graph has been cached
			// Get the graph
			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(name);
			BoundBlock entry = graph.getBasicBlock("entry", BlockType.ENTRY);
			graph.setCurrentBlock(entry);			
		}
		this.line = 0;
		iterateBytecode(name, functionOrMethod.body().bytecodes());
		// Check if the CFG graph is built and cached in the map.
		// If not, run the CFG building procedure.
		if (BoundAnalyzerHelper.isCached(name)) {
			BoundAnalyzerHelper.promoteCFGStatus(name);
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
	private int printWyILCode(Code code, String name, int line) {
		// Print out the bytecode with the format (e.g. 'main.9 [const %12 =
		// 2345 : int]')
		String font_color_start = "";
		String font_color_end = "";		
		if (code instanceof Codes.Label) {
			// System.out.println(font_color_start+name+"."+line+"."+depth+" ["+code+"]"+font_color_end);
			System.out.println(font_color_start + name + "." + line + " [" + code + "]" + font_color_end);
		} else {
			// System.out.println(font_color_start+name+"."+line+"."+depth+" [\t"+code+"]"+font_color_end);
			System.out.println(font_color_start + name + "." + line + " [\t" + code + "]" + font_color_end);
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
	private void iterateBytecode(String name, List<Code> code_blk) {
		// Parse each byte-code and add the constraints accordingly.
		for (Code code : code_blk) {
			if (this.config.isVerbose() && !BoundAnalyzerHelper.isCached(name)) {
				// Get the Block.Entry and print out each byte-code
				line = printWyILCode(code, name, line);
			}

			// Parse each byte-code and add the constraints accordingly.
			try {
				if (code instanceof Codes.Invoke) {
					analyze((Codes.Invoke) code, name);
				} else if (code instanceof Codes.Invariant) {
					// analyze((Codes.Invariant) code, name);
				} else if (code instanceof Codes.Assert) {
					/// analyze((Codes.Assert)code, name);
				} else if (code instanceof Codes.Assign) {
					analyze((Codes.Assign) code, name);
				} else if (code instanceof Codes.Assume) {
					// analyze((Codes.Assume)code, name);
				} else if (code instanceof Codes.BinaryOperator) {
					analyze((Codes.BinaryOperator) code, name);
				} else if (code instanceof Codes.Convert) {
					analyze((Codes.Convert) code, name);
				} else if (code instanceof Codes.Const) {
					analyze((Codes.Const) code, name);
				} else if (code instanceof Codes.Debug) {
					// Do nothing
				} else if (code instanceof Codes.Dereference) {
					// Do nothing
				} else if (code instanceof Codes.FieldLoad) {
					analyze((Codes.FieldLoad) code, name);
				} else if (code instanceof Codes.Fail) {
					analyze((Codes.Fail) code, name);
				} else if (code instanceof Codes.Goto) {
					analyze((Codes.Goto) code, name);
				} else if (code instanceof Codes.If) {
					analyze((Codes.If) code, name);
				} else if (code instanceof Codes.IfIs) {
					// Do nothing
				} else if (code instanceof Codes.IndexOf) {
					analyze((Codes.IndexOf) code, name);
				} else if (code instanceof Codes.IndirectInvoke) {
					// Do nothing
				} else if (code instanceof Codes.Invert) {
					// Do nothing
				} else if (code instanceof Codes.Loop) {
					analyze((Codes.Loop) code, name);
				} else if (code instanceof Codes.Label) {
					analyze((Codes.Label) code, name);
				} else if (code instanceof Codes.Lambda) {
					// Do nothing
				} else if (code instanceof Codes.LengthOf) {
					analyze((Codes.LengthOf) code, name);
				} else if (code instanceof Codes.Move) {
					throw new RuntimeException("Not implemented!");
				} else if (code instanceof Codes.NewRecord) {
					// Do nothing
				} else if (code instanceof Codes.Return) {
					analyze((Codes.Return) code, name);
				} else if (code instanceof Codes.NewArray) {
					analyze((Codes.NewArray) code, name);
				} else if (code instanceof Codes.Nop) {
					// Do nothing
				} else if (code instanceof Codes.Switch) {
					// Do nothing
				} else if (code instanceof Codes.UnaryOperator) {
					analyze((Codes.UnaryOperator) code, name);
				} else if (code instanceof Codes.Update) {
					analyze((Codes.Update) code, name);
				} else if (code instanceof Codes.ArrayGenerator) {
					analyze((Codes.ArrayGenerator) code, name);
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
	private void analyze(ArrayGenerator code, String name) {
		String target_reg = prefix + code.target(0);
		String input_reg = prefix + code.operand(1);
		
		// Add 'size' attribute to target array
		BoundGraph graph = BoundAnalyzerHelper.getCFGraph(name);
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
	private void analyze(NewArray code, String name) {
		// Get the target register
		String target_reg = prefix + code.target(0);
		
		BigInteger size = BigInteger.valueOf(code.operands().length);
		// Add 'size' attribute to target array
		BoundGraph graph = BoundAnalyzerHelper.getCFGraph(name);
		graph.addConstraint(new Const(target_reg+"_size", size));
		
	}

	/**
	 * Analyze the fail byte-code.
	 * 
	 * @param sym_factory
	 * @param code
	 */
	private void analyze(Fail code, String name) {
		// Do nothing due to the fact that fail byte-code does not extract
		// any bound or symbol.

	}

	/**
	 * Infer the bounds of a function by repeatedly iterating over all blocks in
	 * CFGraph from the entry block to the exit block, and then inferring the
	 * bounds consistent with all the constraints in each block.
	 * 
	 * @param name
	 *            the function name
	 * @return the bounds
	 */
	public Bounds inferBounds(String name) {
		BoundGraph graph = BoundAnalyzerHelper.getCFGraph(name);
		
		if (config.isVerbose()) {
			// Print out bounds along with size information.
			BoundAnalyzerHelper.printCFG(config, name);
		}

		// Repeatedly iterates over all blocks, starting from the entry block to the
		// exit block, and infer the bounds consistent with all the constraints in each block.
		List<BoundBlock> list = graph.getBlockList();
		boolean isFixedPoint = false;
		int iteration = 1;
		// Stop the loop when the program reaches the fixed point or max-iterations
		// by using AND operator to combine these two condition.
		// If both of two conditions are evaluated to be true, then enter the
		// loop.
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
					// Take the union of parents' bounds to produce the input
					// bounds for bound inference.
					for (BoundBlock parent : blk.getParentNodes()) {
						// Take the bounds of parent nodes
						blk.unionBounds(parent);
					}
					
					// Beginning of bound inference.
					blk.inferBounds();
					// End of bound inference.

					bnd_after = (Bounds) blk.getBounds();
					// Check if upper/lower bound has any change
					bnd_after.checkBoundChange(bnd_before);
										
					// Check bound change at each block.
					// Test the equality of existing and newly inferred bounds.
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

			// Repeat the bound inference for (maximal) three iterations
			if ( iteration%3 == 0) {
				// After three iterations, widen the bounds of variables whose upper bounds are increasing
				// or whose lower bounds are decreasing.
				for (BoundBlock blk : list) {
					// Debug
					/*if (config.isVerbose()) {
						// Print out the bounds.
						System.out.println("=== Before the widening operator ===");
						System.out.println(blk);
					}*/
					
					//Widen the bounds
					blk.getBounds().widenBounds(config);
					/*// Debug
					if (config.isVerbose()) {
						// Print out the bounds.
						System.out.println("=== After the widening operator === ");
						System.out.println(blk);
					}*/
					
				}
				// Reset the iteration
				iteration = 1;
			}else{
				iteration++;
			}
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
			//if (blk.isConsistent() && blk.getType() != BlockType.EXIT) {
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
		
		// Return the inferred bounds
		return bnds;
	}

	/**
	 * Analyze the invariant byte-code. Currently skip the byte-code of
	 * invariant.
	 * 
	 * @param code
	 *            Invariant {@link wyil.lang.Codes.Invariant}
	 */
	/*private void analyze(Codes.Invariant code, String name) {
		// Skip the byte-code inside an invariant
		// graph.enabledInvariant();
		// iterateBytecode(name, code.bytecodes());
		// graph.disabledInvariant();
	}
	
	private void analyze(Codes.Assert code, String name){
		//iterateBytecode(name, code.bytecodes());
	}
	
	
	private void analyze(Codes.Assume code, String name){
		//iterateBytecode(name, code.bytecodes());
	}
	*/

	private void analyze(Codes.Assign code, String name) {
		String target_reg = prefix + code.target(0);
		String op_reg = prefix + code.operand(0);
		if (code.type(0) instanceof Type.Array) {
			// Add the constraint to the size variable of target array
			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(name);
			graph.addConstraint(new Assign(target_reg+"_size", op_reg+"_size"));
		}

		// Check if the assigned value is an integer
		if (isIntType(code.type(0))) {
			// Add the constraint 'target = operand'
			if (!BoundAnalyzerHelper.isCached(name)) {
				BoundGraph graph = BoundAnalyzerHelper.getCFGraph(name);
				graph.addConstraint(new Assign(target_reg, op_reg));
			}
		}
	}

	/**
	 * Parses 'Const' bytecode to add the 'Const' constraint to the list.
	 * 
	 * @param code
	 */
	private void analyze(Codes.Const code, String name) {
		Constant constant = code.constant;
		String target_reg = prefix + code.target();

		// Check the value is an Constant.Integer
		if (constant instanceof Constant.Integer && !BoundAnalyzerHelper.isCached(name)) {
			// Add the 'Const' constraint.
			BigInteger value = ((Constant.Integer) constant).value;
			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(name);
			graph.addConstraint(new Const(target_reg, value));
		}

		if (constant instanceof Constant.Array) {
			// Get the list and extract the size info.
			BigInteger size = BigInteger.valueOf((((Constant.Array) constant).values).size());
			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(name);
			graph.addConstraint(new Const(target_reg+"_size", size));
			
			//BoundAnalyzerHelper.addSizeInfo(name, target_reg, size);
		}

	}

	/**
	 * Implements the propagation rule for <code>Codes.IndexOf</code> bytecode
	 * to assign the bounds from the source operator register to the target
	 * operator.
	 * 
	 * @param code
	 */
	private void analyze(Codes.IndexOf code, String name) {
		if (isIntType((Type) code.type(0)) && !BoundAnalyzerHelper.isCached(name)) {
			String target = prefix + code.target(0);
			String op = prefix + code.operand(0);
			String index = prefix + code.operand(1);
			// Get the CFGraph
			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(name);
			graph.addConstraint(new Equals(target, op));
		}
	}

	/**
	 * Parses the 'If' bytecode to add the constraints to the list.
	 * 
	 * @param code
	 * @throws CloneNotSupportedException
	 */
	private void analyze(Codes.If code, String name) {
		String left = prefix + code.operand(0);
		String right = prefix + code.operand(1);
		String label = code.target;
		if (!BoundAnalyzerHelper.isCached(name)) {
			// Get CF graph.
			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(name);
			Constraint c = null;
			Constraint neg_c = null;
			if (isIntType(code.type(0))) {
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
	private void analyze(Codes.Label code, String name) {
		String label = code.label;
		if (!BoundAnalyzerHelper.isCached(name)) {
			// Get the CFGraph
			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(name);
			// Get the target blk. If it is null, then create a new block.
			BoundBlock blk = graph.getBasicBlock(label);
			// Get the current block
			BoundBlock c_blk = graph.getCurrentBlock();
			if (c_blk != null && !(c_blk.equals(blk))) {
				// Check if the target blk is a loop structure.
				if (blk.getType().equals(BlockType.LOOP_EXIT)) {
					// current block -> loop header
					// Get the loop header
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
	private void analyze(Codes.Return code, String name) {
		// check if there is any return value
		if(code.operands().length ==0){
			return; // Do nothing
		}
		
		// Get the return operand
		String retOp = prefix + code.operand(0);
		Type type = code.type(0);

		if (!BoundAnalyzerHelper.isCached(name)) {
			
			// Get the CFGraph
			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(name);
			BoundBlock c_blk = graph.getCurrentBlock();
			// Check if the current blk exits. If so, then proceed the following
			// procedure.
			if (c_blk != null) {
				// Create a return block 
				BoundBlock return_block = graph.createBasicBlock("return"+retOp, BlockType.RETURN, c_blk);
				
				// Check if the return type is integer.
				if (isIntType(type)) {
					// Add the 'Equals' constraint to the return (ret) variable.
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
	private void analyze(Codes.UnaryOperator code, String name) {
		UnaryOperatorKind kind = code.kind;
		String x = prefix + code.operand(0);
		String y = prefix + code.target(0);
		// Get a graph
		BoundGraph graph = BoundAnalyzerHelper.getCFGraph(name);
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
	private void analyze(Codes.LengthOf code, String name) {
		// Get the size att
		String op_reg = prefix + code.operand(0);
		String target_reg = prefix + code.target(0);
		
		BoundGraph graph = BoundAnalyzerHelper.getCFGraph(name);
		graph.addConstraint(new Assign(target_reg, op_reg+"_size"));
	
	}

	/**
	 * Creates a loop structure, including loop header, loop body and loop exit.
	 * 
	 * @param code
	 */
	private void analyze(Codes.Loop code, String name) {
		// Set the loop flag to be true,
		// in order to identify the bytecode is inside a loop
		
		isLoop = true;
		
		// Get the list of byte-code and iterate through the list.
		iterateBytecode(name, code.bytecodes());
		
		// Set the flag to be false after finishing iterating all the byte-code.
		isLoop = false;
	}

	

	/**
	 * Implemented the propagation rule for <code>Codes.BinaryOperator</code>
	 * code to add the 'Plus' constraints of operands and target registers.
	 * 
	 * @param code
	 */
	private void analyze(Codes.BinaryOperator code, String name) {
		String target = prefix + code.target(0);
		// Add the type att
		if (isIntType(code.type(0)) && !BoundAnalyzerHelper.isCached(name)) {
			// Get the values
			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(name);
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
				break;
			case DIV:
				break;
			case REM:
				break;
			/*case RANGE:
				// Take the union of operands
				// graph.addConstraint(new Range(target, left,
				// right.subtract(BigInteger.ONE)));
				// Add the size att
				// sym_ctrl.putAttribute(target, "size",
				// right.subtract(left).subtract(BigInteger.ONE));
				break;*/
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
	private void analyze(Codes.Update code, String name) {

	}

	/**
	 * Checks or creates the goto block and updates the current block to be
	 * null.
	 * 
	 * @param code
	 *            Goto ({@link wyil.lang.Codes.Goto } byte-code
	 */
	private void analyze(Codes.Goto code, String name) {
		if (!BoundAnalyzerHelper.isCached(name)) {
			// Get the label name
			String label = code.target;
			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(name);
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
	private void analyze(Codes.FieldLoad code, String name) {
		String target = prefix + code.target(0);
		String record = prefix + code.operand(0);
	}

	private void analyze(Codes.Convert code, String name) {
		String target = prefix + code.target(0);
		// sym_ctrl.putAttribute(target, "type", code.result);

		if (code.result instanceof Type.Array) {
			// Get the value
		}

	}

	/**
	 * Check if the type is instance of Integer by inferring the type from
	 * <code>wyil.Lang.Type</code> objects, including the effective collection
	 * types.
	 * 
	 * @param type
	 * @return true if the type is or contains an integer type.
	 */
	public boolean isIntType(Type type) {
		if (type instanceof Type.Int) {
			return true;
		}

		if (type instanceof Type.Array) {
			return isIntType(((Type.Array) type).element());
		}
		
		return false;
	}
	
	
	/**
	 * 
	 * 
	 * @param function
	 * @return
	 */
	private Bounds getBounds(FunctionOrMethod function) {

		// Get the function name
		String func_name = function.name().toString();
		// Get the bounds
		Bounds bounds = this.boundMap.get(func_name);
		// Check if the bound is inferred not. If not, then infer the bounds
		if (bounds == null) {
			bounds = this.inferBounds(func_name);
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
	private void analyze(Codes.Invoke code, String caller_name) {
		//FunctionOrMethod callee = AnalyzerHelper.getFunctionOrMethod(this.config, code.name.name());
		FunctionOrMethod callee = this.module.functionOrMethod(code.name.name(), code.type(0));
		if (callee != null) {
			int caller_line = line;
			// Callee name
			String callee_name = callee.name();
			// Infer the bounds of caller function.
			Bounds input_bnds = inferBounds(caller_name);

			// Build CFGraph for callee.
			buildCFG(config, callee_name);
			// Propagate the bounds of input parameters to the function.
			BoundAnalyzerHelper.propagateInputBoundsToFunctionCall(caller_name, callee_name, callee.type().params(), code.operands(), input_bnds);

			// Infer the bounds of callee function.
			Bounds ret_bnd = inferBounds(callee_name);
			
			// check if there is any return
			Type ret_type = null;
			if(code.targets().length>0){
				// Get return type
				ret_type = code.type(0).returns().get(0);
			}
			
			// Promote the status of callee's CF graph to be 'complete'
			BoundAnalyzerHelper.promoteCFGStatus(callee_name);
			BoundAnalyzerHelper.propagateBoundsFromFunctionCall(caller_name, callee_name, prefix + code.target(0), ret_type, ret_bnd);
			//Reset the line number
			this.line = caller_line;
		}
	}

}
