package wyopcl.translator;

import java.math.BigInteger;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.UnaryOperatorKind;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Type.Tuple;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.translator.bound.BasicBlock;
import wyopcl.translator.bound.BasicBlock.BlockType;
import wyopcl.translator.bound.BoundInference;
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
import wyopcl.translator.bound.constraint.Range;
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
	// Bound inference processor
	private BoundInference bound_infer_proc;
	// Static instance
	private static BoundAnalyzer instance = new BoundAnalyzer();

	/**
	 * Constructor
	 */
	public BoundAnalyzer() {
		bound_infer_proc = new BoundInference();
	}

	public static BoundAnalyzer getInstance() {
		return instance;
	}

	/**
	 * Constructor of bound analyzer
	 * 
	 * @param config
	 * @param variableDeclarations
	 * @param code_blk
	 */
	public void buildCFG(Configuration config, String name) {
		this.config = config;
		// this.function_name = name;
		FunctionOrMethod functionOrMethod = BoundAnalyzerHelper.getFunctionOrMethod(config, name);
		// Check if the CFG graph is built and cached in the map.
		// If not, run the CFG building procedure.
		if (!BoundAnalyzerHelper.isCached(name)) {
			BoundAnalyzerHelper.promoteCFGStatus(name);
			iterateBytecode(name, functionOrMethod.body().bytecodes());
		}
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
		// Get the CFGraph
		CFGraph graph = BoundAnalyzerHelper.getCFGraph(name);
		SymbolFactory sym_factory = BoundAnalyzerHelper.getSymbolFactory(name);
		// The line number
		int line = 0;
		// Parse each byte-code and add the constraints accordingly.
		for (Code code : code_blk) {
			// Get the Block.Entry
			line = TranslatorHelper.printWyILCode(code, name, line);
			if (code instanceof Codes.Invoke) {
				analyze((Codes.Invoke) code, name);
			} else {
				// Parse each byte-code and add the constraints accordingly.
				try {
					if (code instanceof Codes.Invariant) {
						analyze(graph, sym_factory, (Codes.Invariant) code, name);
					} else if (code instanceof Codes.Assign) {
						analyze(graph, sym_factory, (Codes.Assign) code);
					} else if (code instanceof Codes.BinaryOperator) {
						analyze(graph, sym_factory, (Codes.BinaryOperator) code);
					} else if (code instanceof Codes.Convert) {
						analyze(graph, sym_factory, (Codes.Convert) code);
					} else if (code instanceof Codes.Const) {
						analyze(graph, sym_factory, (Codes.Const) code);
					} else if (code instanceof Codes.Debug) {
						// DebugInterpreter.getInstance().interpret((Codes.Debug)code,
						// stackframe);
					} else if (code instanceof Codes.Dereference) {
						// DereferenceInterpreter.getInstance().interpret((Codes.Dereference)code,
						// stackframe);
					} else if (code instanceof Codes.FieldLoad) {
						analyze(graph, sym_factory, (Codes.FieldLoad) code);
					} else if (code instanceof Codes.Goto) {
						analyze(graph, sym_factory, (Codes.Goto) code);
					} else if (code instanceof Codes.If) {
						analyze(graph, sym_factory, (Codes.If) code);
					} else if (code instanceof Codes.IfIs) {
						// IfIsInterpreter.getInstance().interpret((Codes.IfIs)code,
						// stackframe);
					} else if (code instanceof Codes.IndexOf) {
						analyze(graph, sym_factory, (Codes.IndexOf) code);
					} else if (code instanceof Codes.IndirectInvoke) {
						// IndirectInvokeInterpreter.getInstance().interpret((Codes.IndirectInvoke)code,
						// stackframe);
					} else if (code instanceof Codes.Invert) {
						// InvertInterpreter.getInstance().interpret((Codes.Invert)code,
						// stackframe);
					} else if (code instanceof Codes.ListOperator) {
						analyze(graph, sym_factory, (Codes.ListOperator) code);
					} else if (code instanceof Codes.Loop) {
						analyze(graph, sym_factory, (Codes.Loop) code, name);
					} else if (code instanceof Codes.Label) {
						analyze(graph, sym_factory, (Codes.Label) code);
					} else if (code instanceof Codes.Lambda) {
						// LambdaInterpreter.getInstance().interpret((Codes.Lambda)code,
						// stackframe);
					} else if (code instanceof Codes.LengthOf) {
						analyze(graph, sym_factory, (Codes.LengthOf) code);
					} else if (code instanceof Codes.Move) {
						throw new RuntimeException("Not implemented!");
					} else if (code instanceof Codes.NewList) {
						analyze(graph, sym_factory, (Codes.NewList) code);
					} else if (code instanceof Codes.NewRecord) {
						// NewRecordInterpreter.getInstance().interpret((Codes.NewRecord)code,
						// stackframe);
					} else if (code instanceof Codes.NewTuple) {
						analyze(graph, sym_factory, (Codes.NewTuple) code);
					} else if (code instanceof Codes.Return) {
						analyze(graph, sym_factory, (Codes.Return) code);
					} else if (code instanceof Codes.NewObject) {
						// NewObjectInterpreter.getInstance().interpret((Codes.NewObject)code,
						// stackframe);
					} else if (code instanceof Codes.Nop) {
						// NopInterpreter.getInstance().interpret((Codes.Nop)code,
						// stackframe);
					} else if (code instanceof Codes.SubList) {
						analyze(graph, sym_factory, (Codes.SubList) code);
					} else if (code instanceof Codes.Switch) {
						// SwitchInterpreter.getInstance().interpret((Codes.Switch)code,
						// stackframe);
					} else if (code instanceof Codes.TupleLoad) {
						analyze(graph, sym_factory, (Codes.TupleLoad) code);
					} else if (code instanceof Codes.UnaryOperator) {
						analyze(graph, sym_factory, (Codes.UnaryOperator) code);
					} else if (code instanceof Codes.Update) {
						analyze(graph, sym_factory, (Codes.Update) code);
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
	 * Infer the bounds of a function by repeatedly iterating over all blocks in
	 * CFGraph from the entry block to the exit block, and then inferring the
	 * bounds consistent with all the constraints in each block.
	 * 
	 * @param name
	 *            the function name
	 * @return the bounds
	 */
	public Bounds inferBounds(String name) {
		CFGraph graph = BoundAnalyzerHelper.getCFGraph(name);
		// Sort the blks
		graph.sortedList();
		Bounds bnds = bound_infer_proc.inferBounds(config, graph.getList());
		BoundAnalyzerHelper.printBoundsAndSymbols(config, bnds, name);
		BoundAnalyzerHelper.printCFG(config, name);
		return bnds;
	}

	/**
	 * Analyze the invariant byte-code
	 * 
	 * @param code
	 *            Invariant {@link wyil.lang.Codes.Invariant}
	 */
	private void analyze(CFGraph graph, SymbolFactory sym_ctrl, Codes.Invariant code, String name) {
		graph.enabledInvariant();
		iterateBytecode(name, code.bytecodes());
		graph.disabledInvariant();
	}

	private void analyze(CFGraph graph, SymbolFactory sym_ctrl, Codes.Assign code) {
		String target = prefix + code.target();
		String operand = prefix + code.operand(0);

		// Check if the assigned value is an integer
		if (TranslatorHelper.isIntType(code.type())) {
			// Add the constraint 'target = operand'
			graph.addConstraint(new Assign(target, operand));
		}

		if (code.type() instanceof Type.List) {
			sym_ctrl.putAttribute(target, "type", code.type());
			// Get the 'size' attribute from
			BigInteger size = (BigInteger) sym_ctrl.getAttribute(operand, "size");
			sym_ctrl.putAttribute(target, "size", size);
		}
	}

	/**
	 * Parses 'Const' bytecode to add the 'Const' constraint to the list.
	 * 
	 * @param code
	 */
	private void analyze(CFGraph graph, SymbolFactory sym_ctrl, Codes.Const code) {
		Constant constant = code.constant;
		String target = prefix + code.target();

		// Check the value is an Constant.Integer
		if (constant instanceof Constant.Integer) {
			// Add the 'Const' constraint.
			BigInteger value = ((Constant.Integer) constant).value;
			graph.addConstraint(new Const(target, value));
			// sym_ctrl.putAttribute(target, "value", value);
		}

		if (constant instanceof Constant.List) {
			// Add type attribute
			sym_ctrl.putAttribute(target, "type", code.assignedType());
			List<Constant> list = ((Constant.List) constant).values;
			sym_ctrl.putAttribute(target, "value", list);
			sym_ctrl.putAttribute(target, "size", BigInteger.valueOf(list.size()));
		}

	}

	/**
	 * Implements the propagation rule for <code>Codes.IndexOf</code> bytecode
	 * to assign the bounds from the source operator register to the target
	 * operator.
	 * 
	 * @param code
	 */
	private void analyze(CFGraph graph, SymbolFactory sym_ctrl, Codes.IndexOf code) {
		if (TranslatorHelper.isIntType((Type) code.type())) {
			String target = prefix + code.target();
			String op = prefix + code.operand(0);
			String index = prefix + code.operand(1);
			graph.addConstraint(new Equals(target, op));
		}
	}

	/**
	 * Parses the 'If' bytecode to add the constraints to the list.
	 * 
	 * @param code
	 * @throws CloneNotSupportedException
	 */
	private void analyze(CFGraph graph, SymbolFactory sym_ctrl, Codes.If code) {
		String left = prefix + code.leftOperand;
		String right = prefix + code.rightOperand;

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
				// Add the constraint 'left< right' to current constraint list.
				break;
			case IN:
				throw new RuntimeException("Un-implemented comparator (" + code + ")");
			default:
				throw new RuntimeException("Unknow operator (" + code + ")");

			}

			// Check if the 'if' bytecode is the loop condition.
			if (graph.isLoop()) {
				// Create a loop body and loop exit.
				graph.createLoopStructure(code.target, c, neg_c);
			} else {
				// Create if and else branches.
				graph.createIfElseBranch(code.target, c, neg_c);
			}
		}

	}

	/**
	 * Get the block by the label from Label byte-code. If the block is not
	 * found, then create a new block with the given label. And set the current
	 * block to that block.
	 * 
	 * @param code
	 *            {@link wyil.lang.Codes.Label} byte-code
	 */
	private void analyze(CFGraph graph, SymbolFactory sym_ctrl, Codes.Label code) {
		String label = code.label;
		// Get the target blk. If it is null, then create a new block.
		BasicBlock blk = graph.getBasicBlock(label);
		// Get the current block
		BasicBlock c_blk = graph.getCurrentBlock();
		if (c_blk != null && !(c_blk.equals(blk))) {
			c_blk.addChild(blk);
		}
		// Switch the current block
		graph.setCurrentBlock(blk);
	}

	/**
	 * Add the 'equal' constraints of the target and operand register.
	 * 
	 * @param code
	 *            the new list byte-code
	 */
	private void analyze(CFGraph graph, SymbolFactory sym_ctrl, Codes.NewList code) {
		String target = prefix + code.target();
		sym_ctrl.putAttribute(target, "type", code.type());
		if (TranslatorHelper.isIntType(code.type())) {
			for (int operand : code.operands()) {
				graph.addConstraint(new Union(prefix + code.target(), prefix + operand));
			}
		}
		// Add the 'size' attribute
		sym_ctrl.putAttribute(target, "size", BigInteger.valueOf(code.operands().length));
	}

	/**
	 * Parse the 'return' bytecode and add the constraint
	 * 
	 * @param code
	 */
	private void analyze(CFGraph graph, SymbolFactory sym_ctrl, Codes.Return code) {
		// Get the return operand
		String retOp = prefix + code.operand;
		BasicBlock c_blk = graph.getCurrentBlock();
		// Check if the current blk exits. If so, then proceed the following
		// procedure.
		if (c_blk != null) {
			Type type = code.type;
			// Check if the return type is integer.
			if (TranslatorHelper.isIntType(code.type)) {
				// Add the 'Equals' constraint to the return (ret) variable.
				c_blk.addConstraint((new Assign("return", retOp)));
			}

			if (type instanceof Type.List) {
				sym_ctrl.putAttribute("return", "type", type);
				// Get 'size' att from ret op
				BigInteger size = (BigInteger) sym_ctrl.getAttribute(retOp, "size");
				sym_ctrl.putAttribute("return", "size", size);
			}
			// Connect the current block with exit block.
			c_blk.addChild(graph.getBasicBlock("exit", BlockType.EXIT));
			graph.setCurrentBlock(null);
		}

	}

	/**
	 * Parses ListOperator byte-code.
	 * 
	 * @param graph
	 * @param sym_ctrl
	 * @param code
	 */
	private void analyze(CFGraph graph, SymbolFactory sym_ctrl, Codes.ListOperator code) {
		String target = prefix + code.target();

		switch (code.kind) {
		case APPEND:
			BigInteger size = BigInteger.ZERO;
			for (int operand : code.operands()) {
				String op = prefix + operand;
				size = size.add((BigInteger) sym_ctrl.getAttribute(op, "size"));
				graph.addConstraint(new Equals(target, prefix + operand));
			}
			// put 'type' attribute
			sym_ctrl.putAttribute(target, "type", code.type());
			// put 'size' attribute
			sym_ctrl.putAttribute(target, "size", size);
			break;
		default:
			throw new RuntimeException("unknown list operator encountered (" + code + ")");
		}
	}

	/**
	 * Parse 'Unary Operator' bytecode and add the constraints in accordance
	 * with operator kind. For example, add the 'Negate' constraint for the
	 * negated operator.
	 * 
	 * @param code
	 */
	private void analyze(CFGraph graph, SymbolFactory sym_ctrl, Codes.UnaryOperator code) {
		UnaryOperatorKind kind = code.kind;
		String x = prefix + code.operand(0);
		String y = prefix + code.target();
		//
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
	private void analyze(CFGraph graph, SymbolFactory sym_ctrl, Codes.LengthOf code) {
		// Get the size att
		String op = prefix + code.operand(0);
		BigInteger size = (BigInteger) sym_ctrl.getAttribute(op, "size");
		String target = prefix + code.target();
		Type type = code.assignedType();
		// Add 'type' att
		sym_ctrl.putAttribute(target, "type", type);
		// Add 'value' att
		sym_ctrl.putAttribute(target, "value", size);
		graph.addConstraint(new Const(target, size));
	}

	/**
	 * Creates a loop structure, including loop header, loop body and loop exit.
	 * 
	 * @param code
	 */
	private void analyze(CFGraph graph, SymbolFactory sym_ctrl, Codes.Loop code, String name) {
		// Add loop variables to bound inference processor.
		String label = code.toString();
		for (int op : code.modifiedOperands) {
			bound_infer_proc.addLoopVar(prefix + op);
		}

		BasicBlock loopheader = graph.createLoopHeader(label);
		graph.setCurrentBlock(loopheader);
		// Set the loop flag to be true.
		graph.setLoop(true);
		// Get the list of byte-code and iterate through the list.
		iterateBytecode(name, code.bytecodes());
	}

	/**
	 * The bounds of a list/map shall be propagated from the operand to the
	 * target.
	 * 
	 * @param code
	 */
	private void analyze(CFGraph graph, SymbolFactory sym_ctrl, Codes.SubList code) {
		if (code.type().element() instanceof Type.Int) {
			for (int operand : code.operands()) {
				graph.addConstraint(new Equals(prefix + code.target(), prefix + operand));
			}
		}

	}

	/**
	 * Implemented the propagation rule for <code>Codes.BinaryOperator</code>
	 * code to add the 'Plus' constraints of operands and target registers.
	 * 
	 * @param code
	 */
	private void analyze(CFGraph graph, SymbolFactory sym_ctrl, Codes.BinaryOperator code) {
		String target = prefix + code.target();
		// Add the type att
		Type type = code.assignedType();
		sym_ctrl.putAttribute(target, "type", type);
		if (TranslatorHelper.isIntType(code.type())) {
			// Get the values
			BigInteger left = (BigInteger) sym_ctrl.getAttribute(prefix + code.operand(0), "value");
			BigInteger right = (BigInteger) sym_ctrl.getAttribute(prefix + code.operand(1), "value");
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
			case RANGE:
				// Take the union of operands
				graph.addConstraint(new Range(target, left, right.subtract(BigInteger.ONE)));
				// Add the size att
				sym_ctrl.putAttribute(target, "size", right.subtract(left).subtract(BigInteger.ONE));
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
	 * Load the tuple values at the given index and assign the bounds of the
	 * operand to the target.
	 * 
	 * @param code
	 */
	private void analyze(CFGraph graph, SymbolFactory sym_ctrl, Codes.TupleLoad code) {
		// Check if the index is that of value field (1).
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
	private void analyze(CFGraph graph, SymbolFactory sym_ctrl, Codes.NewTuple code) {
		// Assing the bounds of value field to the target
		Type.Tuple tuple = code.type();
		int index = 1;
		while (index < code.operands().length) {
			if (TranslatorHelper.isIntType(tuple.element(index))) {
				graph.addConstraint(new Union(prefix + code.target(), prefix + code.operand(index)));
			}
			index += 2;
		}

	}

	/**
	 * Updates an element of a list. But how do we update the bounds???
	 * 
	 * @param code
	 */
	private void analyze(CFGraph graph, SymbolFactory sym_ctrl, Codes.Update code) {

	}

	/**
	 * Checks or creates the goto block and updates the current block to be
	 * null.
	 * 
	 * @param code
	 *            Goto ({@link wyil.lang.Codes.Goto } byte-code
	 */
	private void analyze(CFGraph graph, SymbolFactory sym_ctrl, Codes.Goto code) {
		// Get the label name
		String label = code.target;
		BasicBlock goto_blk = graph.getBasicBlock(label);

		// Set the current blk to null blk
		graph.setCurrentBlock(null);
	}

	private void analyze(CFGraph graph, SymbolFactory sym_ctrl, Codes.FieldLoad code) {
		String target = prefix + code.target();
		String record = prefix + code.operand(0);
		// add the type to the record
		sym_ctrl.putAttribute(record, "type", code.type());
		// Target
		sym_ctrl.putAttribute(target, "type", code.fieldType());
		sym_ctrl.putAttribute(target, "field", code.field);
	}

	private void analyze(CFGraph graph, SymbolFactory sym_ctrl, Codes.Convert code) {
		String target = prefix + code.target();
		sym_ctrl.putAttribute(target, "type", code.result);

		if (code.result instanceof Type.List) {
			// Get the value

		}

	}

	/**
	 * Get the list of bytecode of the invoked function and infer the bounds of
	 * the function in the context of input bounds. And then propagate the
	 * bounds of return value back to the caller.
	 * 
	 * @param caller_name the name of caller function.
	 * @param code
	 */
	private void analyze(Codes.Invoke code, String caller_name) {
		FunctionOrMethod callee = BoundAnalyzerHelper.getFunctionOrMethod(this.config, code.name.name());
		if (callee != null) {
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
			// Promote the status of callee's CF graph to be 'complete'
			BoundAnalyzerHelper.promoteCFGStatus(callee_name);
			BoundAnalyzerHelper.propagateBoundsFromFunctionCall(caller_name, callee_name, prefix + code.target(), code.type().ret(), ret_bnd);

		}
	}

}
