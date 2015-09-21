package wyopcl.translator;

import java.math.BigInteger;
import java.util.List;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.Fail;
import wyil.lang.Codes.UnaryOperatorKind;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Type.Tuple;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.translator.bound.BasicBlock;
import wyopcl.translator.bound.BasicBlock.BlockType;
import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.CFGraph;
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
import wyopcl.translator.bound.constraint.Union;

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
	private final String prefix = "%";
	private Configuration config;
	// The boolean flag indicates the byte-code is inside loop structure.
	private boolean isLoop;
	// The line number
	private int line;
	// Static instance
	private static BoundAnalyzer instance = new BoundAnalyzer();

	/**
	 * Constructor
	 */
	public BoundAnalyzer() {
	}

	public static BoundAnalyzer getInstance() {
		return instance;
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
		// this.function_name = name;
		FunctionOrMethod functionOrMethod = AnalyzerHelper.getFunctionOrMethod(config, name);

		if (!AnalyzerHelper.isCached(name)) {
			AnalyzerHelper.promoteCFGStatus(name);
		}
		this.line = 0;
		iterateBytecode(name, functionOrMethod.body().bytecodes());
		// Check if the CFG graph is built and cached in the map.
		// If not, run the CFG building procedure.
		if (AnalyzerHelper.isCached(name)) {
			AnalyzerHelper.promoteCFGStatus(name);
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
			if (!AnalyzerHelper.isCached(name)) {
				// Get the Block.Entry and print out each byte-code
				line = printWyILCode(code, name, line);
			}

			if (code instanceof Codes.Invoke) {
				analyze((Codes.Invoke) code, name);
			} else {
				// Parse each byte-code and add the constraints accordingly.
				try {
					if (code instanceof Codes.Invariant) {
						analyze((Codes.Invariant) code, name);
					} else if (code instanceof Codes.Assign) {
						analyze((Codes.Assign) code, name);
					} else if (code instanceof Codes.Assume){
						analyze((Codes.Assume)code, name);
					} else if (code instanceof Codes.BinaryOperator) {
						analyze((Codes.BinaryOperator) code, name);
					} else if (code instanceof Codes.Convert) {
						analyze((Codes.Convert) code, name);
					} else if (code instanceof Codes.Const) {
						analyze((Codes.Const) code, name);
					} else if (code instanceof Codes.Debug) {
						// DebugInterpreter.getInstance().interpret((Codes.Debug)code,
						// stackframe);
					} else if (code instanceof Codes.Dereference) {
						// DereferenceInterpreter.getInstance().interpret((Codes.Dereference)code,
						// stackframe);
					} else if (code instanceof Codes.FieldLoad) {
						analyze((Codes.FieldLoad) code, name);
					} else if (code instanceof Codes.Fail) {
						analyze((Codes.Fail) code, name);
					} else if (code instanceof Codes.Goto) {
						analyze((Codes.Goto) code, name);
					} else if (code instanceof Codes.If) {
						analyze((Codes.If) code, name);
					} else if (code instanceof Codes.IfIs) {
						// IfIsInterpreter.getInstance().interpret((Codes.IfIs)code,
						// stackframe);
					} else if (code instanceof Codes.IndexOf) {
						analyze((Codes.IndexOf) code, name);
					} else if (code instanceof Codes.IndirectInvoke) {
						// IndirectInvokeInterpreter.getInstance().interpret((Codes.IndirectInvoke)code,
						// stackframe);
					} else if (code instanceof Codes.Invert) {
						// InvertInterpreter.getInstance().interpret((Codes.Invert)code,
						// stackframe);
					} else if (code instanceof Codes.Loop) {
						analyze((Codes.Loop) code, name);
					} else if (code instanceof Codes.Label) {
						analyze((Codes.Label) code, name);
					} else if (code instanceof Codes.Lambda) {
						// LambdaInterpreter.getInstance().interpret((Codes.Lambda)code,
						// stackframe);
					} else if (code instanceof Codes.LengthOf) {
						analyze((Codes.LengthOf) code, name);
					} else if (code instanceof Codes.Move) {
						throw new RuntimeException("Not implemented!");
					} else if (code instanceof Codes.NewList) {
						analyze((Codes.NewList) code, name);
					} else if (code instanceof Codes.NewRecord) {
						// NewRecordInterpreter.getInstance().interpret((Codes.NewRecord)code,
						// stackframe);
					} else if (code instanceof Codes.NewTuple) {
						analyze((Codes.NewTuple) code, name);
					} else if (code instanceof Codes.Return) {
						analyze((Codes.Return) code, name);
					} else if (code instanceof Codes.NewObject) {
						// NewObjectInterpreter.getInstance().interpret((Codes.NewObject)code,
						// stackframe);
					} else if (code instanceof Codes.Nop) {
						// NopInterpreter.getInstance().interpret((Codes.Nop)code,
						// stackframe);
					} else if (code instanceof Codes.Switch) {
						// SwitchInterpreter.getInstance().interpret((Codes.Switch)code,
						// stackframe);
					} else if (code instanceof Codes.TupleLoad) {
						analyze((Codes.TupleLoad) code, name);
					} else if (code instanceof Codes.UnaryOperator) {
						analyze((Codes.UnaryOperator) code, name);
					} else if (code instanceof Codes.Update) {
						analyze((Codes.Update) code, name);
					} else {
						throw new RuntimeException("unknown wyil code encountered (" + code + ")");
					}
				} catch (Exception ex) {
					throw new RuntimeException(ex.getMessage());
				}
			}
		}
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
		CFGraph graph = AnalyzerHelper.getCFGraph(name);

		// Repeatedly iterates over all blocks, starting from the entry block to the
		// exit block, and infer the bounds consistent with all the constraints in each block.
		List<BasicBlock> list = graph.getBlockList();
		boolean isFixedPoint = false;
		int iteration = 0;
		// Stop the loop when the program reaches the fixed point or
		// max-iterations
		// by using AND operator to combine these two condition.
		// If both of two conditions are evaluated to be true, then enter the
		// loop.
		while (!isFixedPoint) {
			if (config.isVerbose()) {
				System.out.println("Iteration " + iteration + " => ");
			}
			// Initialize the isFixedPointed
			isFixedPoint = true;
			
			// Iterate all blocks (Order does not matter).
			for (BasicBlock blk : list) {
				boolean isChanged = false;
				// Iterate all the blocks, except Exit block.
				if (!blk.getType().equals(BlockType.EXIT)) {
					Bounds bnd_before = null, bnd_after = null;
					// Before the bound inference, clone and assign the inferred
					// bounds to the bnd_before.
					bnd_before = (Bounds) blk.getBounds().clone();
					// Take the union of parents' bounds to produce the input
					// bounds for bound inference.
					for (BasicBlock parent : blk.getParentNodes()) {
						blk.unionBounds(parent);
					}
					
					// Beginning of bound inference.
					blk.inferBounds();
					// End of bound inference.

					bnd_after = (Bounds) blk.getBounds();
					// Check bound change at each block.
					bnd_after.checkBoundChange(bnd_before);						
					
					// Test the equality of existing and newly inferred bounds.
					if (bnd_before != null && !bnd_before.equals(bnd_after)) {
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
			if (iteration == 3) {
				// After three iterations, widen the bounds of variables whose upper bounds are increasing
				// or whose lower bounds are decreasing.
				for (BasicBlock blk : list) {
					//Widen the bounds
					blk.getBounds().widenBounds(config);					
				}
				// Reset the iteration
				iteration = 0;
			} else {
				iteration++;
			}
		}

		// Take the union of all blocks to produce the bounds of a function.
		BasicBlock exit_blk = graph.getBasicBlock("exit", BlockType.EXIT);
		for (BasicBlock blk : list) {
			// Consider the bounds of consistent block and discard the bounds of inconsistent block.
			if (blk.isConsistent() && blk.getType() != BlockType.EXIT) {
				exit_blk.unionBounds(blk);
			}
		}
		// Produce the aggregated bounds of a function.
		Bounds bnds = exit_blk.getBounds();
		// Print out bounds along with size information.
		AnalyzerHelper.printBoundsAndSize(config, bnds, name);
		AnalyzerHelper.printCFG(config, name);
		return bnds;
	}

	/**
	 * Analyze the invariant byte-code. Currently skip the byte-code of
	 * invariant.
	 * 
	 * @param code
	 *            Invariant {@link wyil.lang.Codes.Invariant}
	 */
	private void analyze(Codes.Invariant code, String name) {
		// Skip the byte-code inside an invariant
		// graph.enabledInvariant();
		// iterateBytecode(name, code.bytecodes());
		// graph.disabledInvariant();
	}
	
	
	private void analyze(Codes.Assume code, String name){
		iterateBytecode(name, code.bytecodes());
	}
	

	private void analyze(Codes.Assign code, String name) {
		String target_reg = prefix + code.target();
		String op_reg = prefix + code.operand(0);
		if (code.type() instanceof Type.Array) {
			// Get the 'size' attribute 
			BigInteger size = AnalyzerHelper.getSizeInfo(name, op_reg);
			if (size != null) {
				AnalyzerHelper.addSizeInfo(name, target_reg, size);
			}
		}

		// Check if the assigned value is an integer
		if (TranslatorHelper.isIntType(code.type())) {
			// Add the constraint 'target = operand'
			if (!AnalyzerHelper.isCached(name)) {
				CFGraph graph = AnalyzerHelper.getCFGraph(name);
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
		if (constant instanceof Constant.Integer && !AnalyzerHelper.isCached(name)) {
			// Add the 'Const' constraint.
			BigInteger value = ((Constant.Integer) constant).value;
			CFGraph graph = AnalyzerHelper.getCFGraph(name);
			graph.addConstraint(new Const(target_reg, value));
		}

		if (constant instanceof Constant.List) {
			// Get the list and extract the size info.
			BigInteger size = BigInteger.valueOf((((Constant.List) constant).values).size());
			AnalyzerHelper.addSizeInfo(name, target_reg, size);
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
		if (TranslatorHelper.isIntType((Type) code.type()) && !AnalyzerHelper.isCached(name)) {
			String target = prefix + code.target();
			String op = prefix + code.operand(0);
			String index = prefix + code.operand(1);
			// Get the CFGraph
			CFGraph graph = AnalyzerHelper.getCFGraph(name);
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
		String left = prefix + code.leftOperand;
		String right = prefix + code.rightOperand;
		if (!AnalyzerHelper.isCached(name)) {
			// Get CF graph.
			CFGraph graph = AnalyzerHelper.getCFGraph(name);
			Constraint c = null;
			Constraint neg_c = null;
			if (TranslatorHelper.isIntType(code.type)) {
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
				/*case IN:
					throw new RuntimeException("Un-implemented comparator (" + code + ")");*/
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
		if (!AnalyzerHelper.isCached(name)) {
			// Get the CFGraph
			CFGraph graph = AnalyzerHelper.getCFGraph(name);
			// Get the target blk. If it is null, then create a new block.
			BasicBlock blk = graph.getBasicBlock(label);
			// Get the current block
			BasicBlock c_blk = graph.getCurrentBlock();
			if (c_blk != null && !(c_blk.equals(blk))) {
				// Check if the target blk is not a loop structure.
				if (!blk.getType().equals(BlockType.LOOP_EXIT)) {
					c_blk.addChild(blk);
				}
			}
			// Switch the current block
			graph.setCurrentBlock(blk);
		}
	}

	/**
	 * Add the 'equal' constraints of the target and operand register.
	 * 
	 * @param code
	 *            the new list byte-code
	 */
	private void analyze(Codes.NewList code, String name) {
		String target = prefix + code.target();
		if (TranslatorHelper.isIntType(code.type()) && !AnalyzerHelper.isCached(name)) {
			// Get the CFGraph
			CFGraph graph = AnalyzerHelper.getCFGraph(name);
			for (int operand : code.operands()) {
				graph.addConstraint(new Union(prefix + code.target(), prefix + operand));
			}
		}
		// Add the 'size' attribute
		AnalyzerHelper.addSizeInfo(name, target, BigInteger.valueOf(code.operands().length));
	}

	/**
	 * Parse the 'return' bytecode and add the constraint
	 * 
	 * @param code
	 */
	private void analyze(Codes.Return code, String name) {
		// Get the return operand
		String retOp = prefix + code.operand;
		Type type = code.type;

		if (!AnalyzerHelper.isCached(name)) {
			// Get the CFGraph
			CFGraph graph = AnalyzerHelper.getCFGraph(name);
			BasicBlock c_blk = graph.getCurrentBlock();
			// Check if the current blk exits. If so, then proceed the following
			// procedure.
			if (c_blk != null) {
				// Check if the return type is integer.
				if (TranslatorHelper.isIntType(code.type)) {
					// Add the 'Equals' constraint to the return (ret) variable.
					c_blk.addConstraint((new Assign("return", retOp)));
				}
				// Connect the current block with exit block.
				c_blk.addChild(graph.getBasicBlock("exit", BlockType.EXIT));
				graph.setCurrentBlock(null);
			}
		}

		if (type instanceof Type.Array) {
			// Get 'size' info from the register of return value.
			BigInteger size = (BigInteger) AnalyzerHelper.getSizeInfo(name, retOp);
			AnalyzerHelper.addSizeInfo(name, "return", size);
		}

	}

	/**
	 * Deprecated due to v0.3.36
	 * 
	 * Parses ListOperator byte-code.
	 * 
	 * @param graph
	 * @param sym_ctrl
	 * @param code
	 */
	@Deprecated
	/*
	private void analyze(Codes.ListOperator code, String name) {
		String target_reg = prefix + code.target();
		//SymbolFactory sym_factory = BoundAnalyzerHelper.getSymbolFactory(name);
		switch (code.kind) {
		case APPEND:
			BigInteger size = BigInteger.ZERO;
			for (int operand : code.operands()) {
				String op_reg = prefix + operand;
				//Get size info
				AnalyzerHelper.getSizeInfo(name, op_reg);
				size = size.add(AnalyzerHelper.getSizeInfo(name, op_reg));
				//size = size.add((BigInteger) sym_factory.getAttribute(op, "size"));
				if (!AnalyzerHelper.isCached(name)) {
					// Get the CFGraph
					CFGraph graph = AnalyzerHelper.getCFGraph(name);
					graph.addConstraint(new Equals(target_reg, prefix + operand));
				}
			}
			
			// put 'size' attribute to the target reg
			AnalyzerHelper.addSizeInfo(name, target_reg, size);
			break;
		default:
			throw new RuntimeException("unknown list operator encountered (" + code + ")");
		}
	}*/

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
		String y = prefix + code.target();
		// Get a graph
		CFGraph graph = AnalyzerHelper.getCFGraph(name);
		switch (kind) {
		case NEG:
			graph.addConstraint(new Negate(x, y));
			break;
		case NUMERATOR:
			throw new RuntimeException("Unimplemeted unary operator encountered (" + code + ")");
		case DENOMINATOR:
			throw new RuntimeException("Unimplemeted unary operator encountered (" + code + ")");
		default:
			throw new RuntimeException("unknown unary operator encountered (" + code + ")");
		}

	}

	/**
	 * Extract LengthOf byte-code.
	 * 
	 * @param code
	 */
	private void analyze(Codes.LengthOf code, String name) {
		//SymbolFactory sym_factory = BoundAnalyzerHelper.getSymbolFactory(name);
		// Get the size att
		String op_reg = prefix + code.operand(0);
		String target_reg = prefix + code.target();
		Type type = code.assignedType();
		BigInteger size = (BigInteger) AnalyzerHelper.getSizeInfo(name, op_reg);
		if(size != null){
			// Add 'size' att
			AnalyzerHelper.addSizeInfo(name, target_reg, size);
		}
		
		
		
		
		// graph.addConstraint(new Const(target, size));
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
	 * Deprecated due to v0.3.36
	 * The bounds of a list/map shall be propagated from the operand to the
	 * target.
	 * 
	 * @param code
	 */
	@Deprecated
	/*
	private void analyze(Codes.SubList code, String name) {
		CFGraph graph = AnalyzerHelper.getCFGraph(name);
		if (code.type().element() instanceof Type.Int) {
			for (int operand : code.operands()) {
				graph.addConstraint(new Equals(prefix + code.target(), prefix + operand));
			}
		}

	}*/

	/**
	 * Implemented the propagation rule for <code>Codes.BinaryOperator</code>
	 * code to add the 'Plus' constraints of operands and target registers.
	 * 
	 * @param code
	 */
	private void analyze(Codes.BinaryOperator code, String name) {
		String target = prefix + code.target();
		// Add the type att
		Type type = code.assignedType();
		if (TranslatorHelper.isIntType(code.type()) && !AnalyzerHelper.isCached(name)) {
			// Get the values
			CFGraph graph = AnalyzerHelper.getCFGraph(name);
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
	 * Load the tuple values at the given index and assign the bounds of the
	 * operand to the target.
	 * 
	 * @param code
	 */
	private void analyze(Codes.TupleLoad code, String name) {
		// Check if the index is that of value field (1).
		CFGraph graph = AnalyzerHelper.getCFGraph(name);
		int index = code.index;
		if (index % 2 == 1) {
			Type.Tuple tuple = (Tuple) code.type();
			if (TranslatorHelper.isIntType(tuple.element(index))) {
				graph.addConstraint(new Equals(prefix + code.target(), prefix + code.operand(0)));
			}
		}

	}

	/**
	 * Take the union of bounds from operands and target
	 * 
	 * @param code
	 */
	private void analyze(Codes.NewTuple code, String name) {
		// Assing the bounds of value field to the target
		Type.Tuple tuple = code.type();
		if (!AnalyzerHelper.isCached(name)) {
			// Get the CFGraph
			CFGraph graph = AnalyzerHelper.getCFGraph(name);
			int index = 1;
			while (index < code.operands().length) {
				if (TranslatorHelper.isIntType(tuple.element(index))) {
					graph.addConstraint(new Union(prefix + code.target(), prefix + code.operand(index)));
				}
				index += 2;
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
		if (!AnalyzerHelper.isCached(name)) {
			// Get the label name
			String label = code.target;
			CFGraph graph = AnalyzerHelper.getCFGraph(name);
			BasicBlock goto_blk = graph.getBasicBlock(label);
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
		String target = prefix + code.target();
		String record = prefix + code.operand(0);
	}

	private void analyze(Codes.Convert code, String name) {
		String target = prefix + code.target();
		// sym_ctrl.putAttribute(target, "type", code.result);

		if (code.result instanceof Type.Array) {
			// Get the value
		}

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
		FunctionOrMethod callee = AnalyzerHelper.getFunctionOrMethod(this.config, code.name.name());
		if (callee != null) {
			int caller_line = line;
			// Callee name
			String callee_name = callee.name();
			// Infer the bounds of caller function.
			Bounds input_bnds = inferBounds(caller_name);

			AnalyzerHelper.propagateSizeInfoToFunctionCall(caller_name, callee_name, callee.type().params(), code.operands());
			// Build CFGraph for callee.
			buildCFG(config, callee_name);
			// Propagate the bounds of input parameters to the function.
			AnalyzerHelper.propagateInputBoundsToFunctionCall(caller_name, callee_name, callee.type().params(), code.operands(), input_bnds);

			// Infer the bounds of callee function.
			Bounds ret_bnd = inferBounds(callee_name);
			// Promote the status of callee's CF graph to be 'complete'
			AnalyzerHelper.promoteCFGStatus(callee_name);
			AnalyzerHelper.propagateBoundsFromFunctionCall(caller_name, callee_name, prefix + code.target(), code.type().ret(), ret_bnd);
			AnalyzerHelper.propagateSizeFromFunctionCall(caller_name, callee_name, prefix + code.target(), code.type().ret());
			//Reset the line number
			this.line = caller_line;
		}
	}

}
