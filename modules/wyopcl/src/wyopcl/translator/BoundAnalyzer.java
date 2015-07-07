package wyopcl.translator;

//import static wycc.lang.SyntaxError.internalFailure;

import java.math.BigInteger;
import java.util.List;

import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.UnaryOperatorKind;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Type.Tuple;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.translator.bound.BasicBlock;
import wyopcl.translator.bound.CFGController;
import wyopcl.translator.bound.Bounds;
import wyopcl.translator.bound.Domain;
import wyopcl.translator.bound.BasicBlock.BlockType;
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
 * A class to store all the constraints produced in the wyil file and infer the
 * bounds consistent with all the constraints. The class variables
 * 'constraintListMap' and 'label' have only one instance.
 * 
 * 
 * This class is implemented with <a href=
 * "http://www.tutorialspoint.com/design_pattern/abstract_factory_pattern.htm"
 * >Factory design pattern</a>
 * 
 * @author Min-Hsien Weng
 *
 */
public class BoundAnalyzer {
	private Configuration config;
	private final String prefix = "%";
	private final VariableDeclarations variableDeclarations;
	// Stores all the extracted symbols.
	private SymbolController sym_ctrl;
	private CFGController blk_ctrl;

	/**
	 * Constructor of bound analyzer
	 * 
	 * @param config
	 * @param variableDeclarations 
	 * @param code_blk
	 */
	public BoundAnalyzer(Configuration config, VariableDeclarations variableDeclarations) {
		this.config = config;		
		// Initialize the variables
		this.sym_ctrl = new SymbolController();
		this.blk_ctrl = new CFGController(this.config);
		this.variableDeclarations = variableDeclarations;
	}

	
	/**
	 * Build up the control flow graph: iterating each byte-code to extract the constraints, create
	 * the block (e.g. loop structure/if-else branches) or reuse the current block to put the constraints
	 * into the corresponding block.  
	 * 
	 * @param code_blk the list of byte-code
	 */
	public void iterateByteCode(List<Code> code_blk) {
		String func_name = (String) config.getProperty("function_name");
		// The line number
		int line = 0;
		// Parse each byte-code and add the constraints accordingly.
		for (Code code : code_blk) {
			// Get the Block.Entry
			line = BoundAnalyzerHelper.printWyILCode(code, func_name, line, blk_ctrl);
			// Check if the code is outside the assertion or assumption.
			if(!blk_ctrl.checkInvariant()){
				//Extract the constraints from each byte-code.				
				try {					
					if(code instanceof Codes.Invariant){
						analyze((Codes.Invariant)code);
					}else if (code instanceof Codes.Assign) {
						analyze((Codes.Assign) code);
					} else if (code instanceof Codes.BinaryOperator) {
						analyze((Codes.BinaryOperator) code);
					} else if (code instanceof Codes.Convert) {
						analyze((Codes.Convert) code);
					} else if (code instanceof Codes.Const) {
						analyze((Codes.Const) code);
					} else if (code instanceof Codes.Debug) {
						// DebugInterpreter.getInstance().interpret((Codes.Debug)code,
						// stackframe);
					} else if (code instanceof Codes.Dereference) {
						// DereferenceInterpreter.getInstance().interpret((Codes.Dereference)code,
						// stackframe);
					} else if (code instanceof Codes.FieldLoad) {
						analyze((Codes.FieldLoad) code);					
					} else if (code instanceof Codes.Goto) {
						analyze((Codes.Goto) code);
					} else if (code instanceof Codes.If) {
						analyze((Codes.If) code);
					} else if (code instanceof Codes.IfIs) {
						// IfIsInterpreter.getInstance().interpret((Codes.IfIs)code,
						// stackframe);
					} else if (code instanceof Codes.IndexOf) {
						analyze((Codes.IndexOf) code);
					} else if (code instanceof Codes.IndirectInvoke) {
						// IndirectInvokeInterpreter.getInstance().interpret((Codes.IndirectInvoke)code,
						// stackframe);
					} else if (code instanceof Codes.Invoke) {
						analyze((Codes.Invoke) code);
					} else if (code instanceof Codes.Invert) {
						// InvertInterpreter.getInstance().interpret((Codes.Invert)code,
						// stackframe);
					} else if (code instanceof Codes.ListOperator) {
						analyze((Codes.ListOperator) code);
					} else if (code instanceof Codes.Loop) {
						analyze((Codes.Loop) code);
					} else if (code instanceof Codes.Label) {
						analyze((Codes.Label) code);
					} else if (code instanceof Codes.Lambda) {
						// LambdaInterpreter.getInstance().interpret((Codes.Lambda)code,
						// stackframe);
					} else if (code instanceof Codes.LengthOf) {
						analyze((Codes.LengthOf) code);
					} else if (code instanceof Codes.Move) {
						throw new RuntimeException("Not implemented!");
					} else if (code instanceof Codes.NewList) {
						analyze((Codes.NewList) code);
					} else if (code instanceof Codes.NewRecord) {
						// NewRecordInterpreter.getInstance().interpret((Codes.NewRecord)code,
						// stackframe);
					} else if (code instanceof Codes.NewTuple) {
						analyze((Codes.NewTuple) code);
					} else if (code instanceof Codes.Return) {
						analyze((Codes.Return) code);
					} else if (code instanceof Codes.NewObject) {
						// NewObjectInterpreter.getInstance().interpret((Codes.NewObject)code,
						// stackframe);
					} else if (code instanceof Codes.Nop) {
						// NopInterpreter.getInstance().interpret((Codes.Nop)code,
						// stackframe);
					} else if (code instanceof Codes.SubList) {
						analyze((Codes.SubList) code);
					} else if (code instanceof Codes.Switch) {
						// SwitchInterpreter.getInstance().interpret((Codes.Switch)code,
						// stackframe);
					} else if (code instanceof Codes.TupleLoad) {
						analyze((Codes.TupleLoad) code);
					} else if (code instanceof Codes.UnaryOperator) {
						analyze((Codes.UnaryOperator) code);
					} else if (code instanceof Codes.Update) {
						analyze((Codes.Update) code);
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
	 * Given the register, get the variable name from variable declarations.
	 * 
	 * @param domain
	 *            the domain that contains the register and bounds.
	 * @return the variable name (starting with "%")
	 */
	private String getVarName(Domain domain) {
		int reg = domain.getReg();
		// Check if the register has been kept in the functional variable
		// declarations.
		if (reg < variableDeclarations.size()) {
			Declaration declaration = variableDeclarations.get(reg);
			if (declaration != null) {
				String name = declaration.name();
				if (name != null && !name.isEmpty()) {
					return name;
				}
			}
		}
		return domain.getName();
	}
	
	
	/**
	 * Print out the bounds.
	 * @param bnd the bounds
	 */
	protected void printBounds(List<Symbol> sortedSymbols, Bounds bnds){
		String str = "";
		//Print out the bounds
		for(Symbol symbol : sortedSymbols){
			//String str_symbols = "";
			String name = symbol.getName();
			if(bnds.isExisting(name)){
				Domain d = bnds.getDomain(name);
				str+="\tdomain("+getVarName(d)+")\t="+d.getBounds()+"\n";
			}			
		}

		//Print out the values of available variables
		for(Symbol symbol : sortedSymbols){
			//String str_symbols = "";
			String name = symbol.getName();					
			//print the 'value' attribute
			Object val = symbol.getAttribute("value");
			if(val != null){
				str += "\tvalue("+name+")\t= "+val+"\n";
			}			
		}

		//Print out the size of available variables
		for(Symbol symbol : sortedSymbols){
			//String str_symbols = "";
			String name = symbol.getName();
			//get the 'type' attribute
			Type type = (Type) symbol.getAttribute("type");						
			//print the 'size' att
			if(type instanceof Type.List){
				Object size = symbol.getAttribute("size");
				str += "\tsize("+name+")\t= "+size+"\n";
			}			
		}
		str += "Consistency="+bnds.checkBoundConsistency();
		System.out.println(str);		
	}
	
	/**
	 * Repeatedly iterates over all blocks, starting from the entry block to the
	 * exit block, and infer the bounds consistent with all the constraints in
	 * each block.
	 * 
	 * @return the bounds
	 */
	public Bounds inferBounds() {
		// Sort the blks
		blk_ctrl.sortedList();
		// The least common multiple of naive (4) and graduate (12) widening
		// strategies plus one.
		int MaxIteration = 5;
		if(config.isGradualWiden()){
			MaxIteration = 20;
		}		

		boolean isFixedPointed = false;
		int iteration = 1;
		// Stop the loop when the program reaches the fixed point or
		// max-iterations
		// by using AND operator to combine these two condition.
		// If both of two conditions are evaluated to be true, then enter the
		// loop.
		while (!isFixedPointed && iteration <= MaxIteration) {
			if (config.isVerbose()) {
				System.out.println("Iteration " + iteration + " => ");
			}
			// Initialize the isFixedPointed
			isFixedPointed = true;
			// If bounds has changed, then isChanged = false.
			boolean isChanged = false;
			// Iterate all the blocks, except Exit block.
			for (BasicBlock blk : blk_ctrl.getList()) {
				// Take the union of all blocks for exit block
				if (!blk.getType().equals(BlockType.EXIT)) {
					// Take the union of parents' bounds.
					for (BasicBlock parent : blk.getParentNodes()) {
						blk.unionBounds(parent);
					}
					isChanged = blk_ctrl.inferBlockBounds(blk, isChanged, iteration);
					// Use bitwise 'AND' to combine all the results
					isFixedPointed &= (!isChanged);
				}
			}// End of bound inference for all constraints in all blks.
			if (config.isVerbose()) {
				System.out.println("isFixedPointed=" + isFixedPointed);
			}
			iteration++;
		}

		// Take the union of all blocks to produce the functional result
		BasicBlock exit_blk = blk_ctrl.getBasicBlock("exit", BlockType.EXIT);
		for (BasicBlock blk : blk_ctrl.getList()) {
			// Consider the consistent bounds without taking into the
			// inconsistent bounds.
			if (blk.isConsistent() && blk.getType() != BlockType.EXIT) {
				exit_blk.unionBounds(blk);
			}
		}

		Bounds bnd = exit_blk.getBounds();
		// check the verbose to determine whether to print out the CFG
		if (config.isVerbose()) {
			BoundAnalyzerHelper.printCFG(blk_ctrl.getList(), config.getFilename(),
					(String) config.getProperty("function_name"));
		}
		printBounds(sym_ctrl.sortedSymbols(), bnd);
		return bnd;
	}

	

	/**
	 * Analyze the invariant
	 * 
	 * @param code
	 */
	private void analyze(Codes.Invariant code) {
		blk_ctrl.enabledInvariant();
		this.iterateByteCode(code.bytecodes());
		blk_ctrl.disabledInvariant();

	}

	private void analyze(Codes.Assign code) {
		String target = prefix + code.target();
		String operand = prefix + code.operand(0);
		sym_ctrl.putAttribute(target, "type", code.type());
		// Check if the assigned value is an integer
		if (BoundAnalyzerHelper.isIntType(code.type())) {
			// Add the constraint 'target = operand'
			blk_ctrl.addConstraint(new Assign(target, operand));
		}

		if (code.type() instanceof Type.List) {
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
	private void analyze(Codes.Const code) {

		Constant constant = code.constant;
		String target = prefix + code.target();
		// Add type attribute
		sym_ctrl.putAttribute(target, "type", code.assignedType());

		// Check the value is an Constant.Integer
		if (constant instanceof Constant.Integer) {
			// Add the 'Const' constraint.
			BigInteger value = ((Constant.Integer) constant).value;
			blk_ctrl.addConstraint(new Const(target, value));
			sym_ctrl.putAttribute(target, "value", value);
		}

		if (constant instanceof Constant.List) {
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
	private void analyze(Codes.IndexOf code) {
		if (BoundAnalyzerHelper.isIntType((Type) code.type())) {
			String target = prefix + code.target();
			String op = prefix + code.operand(0);
			String index = prefix + code.operand(1);
			blk_ctrl.addConstraint(new Equals(target, op));
		}
	}

	/**
	 * Parses the 'If' bytecode to add the constraints to the list.
	 * 
	 * @param code
	 * @throws CloneNotSupportedException
	 */
	private void analyze(Codes.If code) {
		String left = prefix + code.leftOperand;
		String right = prefix + code.rightOperand;

		Constraint c = null;
		Constraint neg_c = null;
		if (BoundAnalyzerHelper.isIntType(code.type)) {
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
				throw new RuntimeException("Un-implemented comparator ("+code+")");			
			default:
				throw new RuntimeException("Unknow operator ("+code+")");	

			}
			
			// Check if the 'if' bytecode is the loop condition.
			if (blk_ctrl.isLoop()) {
				// Create a loop body and loop exit.
				blk_ctrl.createLoopStructure(code.target, c, neg_c);
			} else {
				// Create if and else branches.
				blk_ctrl.createIfElseBranch(code.target, c, neg_c);
			}
		}
		
	}

	/**
	 * Propagate the input bounds to the called function.
	 * 
	 * @param invokeboundAnalyzer
	 *            the analyzer of invoked function.
	 * @param operands
	 *            the operands of calling function
	 * @param bnd
	 *            the bounds of calling function
	 */
	private void propagateBoundsToFunctionCall(BoundAnalyzer invokeboundAnalyzer, List<Type> params, int[] operands,
			Bounds bnd) {
		int index = 0;
		// Pass the bounds of input parameters.
		for (Type paramType : params) {
			String param = prefix + index;
			String operand = prefix + operands[index];
			// Check parameter type
			if (BoundAnalyzerHelper.isIntType(paramType)) {
				invokeboundAnalyzer.blk_ctrl.addParamBounds(paramType, param, bnd.getLower(operand),
						bnd.getUpper(operand));
			}
			// pass the symbol
			Symbol symbol = sym_ctrl.getSymbol(operand).clone();
			// Update the name
			symbol.setName(param);
			invokeboundAnalyzer.sym_ctrl.putSymbol(param, symbol);
			index++;
		}
	}

	/**
	 * Propagate the bounds of return value to the caller.
	 * 
	 * @param invokeboundAnalyzer
	 * @param ret_reg
	 * @param ret_type
	 * @param bnd
	 */
	private void propagateBoundsFromFunctionCall(BoundAnalyzer invokeboundAnalyzer, String ret_reg, Type ret_type,
			Bounds bnd) {
		// put the 'type' attribute of 'return_reg'
		sym_ctrl.putAttribute(ret_reg, "type", ret_type);

		if (BoundAnalyzerHelper.isIntType(ret_type)) {
			// propagate the bounds of return value.
			blk_ctrl.addConstraint(new Range(ret_reg, bnd.getLower("return"), bnd.getUpper("return")));
			// Add 'type' attribute
			sym_ctrl.putAttribute(ret_reg, "type", ret_type);
		}

		// Add 'size' attribute
		if (ret_type instanceof Type.List) {
			BigInteger size = (BigInteger) invokeboundAnalyzer.sym_ctrl.getAttribute("return", "size");
			sym_ctrl.putAttribute(ret_reg, "size", size);
		}
	}

	/**
	 * Get the list of bytecode of the invoked function and infer the bounds of the function 
	 * in the context of input bounds. And then propagate the bounds of return value back to
	 * the caller.
	 * 
	 * @param code
	 */
	private void analyze(Codes.Invoke code) {
		WyilFile module = (WyilFile) config.getProperty("module");
		FunctionOrMethod functionOrMethod = module.functionOrMethod(code.name.name(), code.type());
		if (functionOrMethod != null) {
			List<Type> params = functionOrMethod.type().params();
			// The list of bytecode
			List<Code> code_blk = functionOrMethod.body().bytecodes();
			// Infer the bounds
			Bounds bnd = this.inferBounds();
			// Create the bound analyzer for the invoked function.
			// Get the function
			String function_name = (String) config.getProperty("function_name");
			// Set the function name
			config.setProperty("function_name", functionOrMethod.name());
			BoundAnalyzer invokeboundAnalyzer = new BoundAnalyzer(config, functionOrMethod.attribute(VariableDeclarations.class));
			// Propagate the bounds of input parameters to the function.
			propagateBoundsToFunctionCall(invokeboundAnalyzer, params, code.operands(), bnd);
			invokeboundAnalyzer.iterateByteCode(code_blk);
			// Infer the bounds at the end of invoked function.
			Bounds ret_bnd = invokeboundAnalyzer.inferBounds();
			propagateBoundsFromFunctionCall(invokeboundAnalyzer, prefix + code.target(), code.type().ret(), ret_bnd);
			invokeboundAnalyzer = null;
			// Set the function name with
			config.setProperty("function_name", function_name);
		}
	}

	/**
	 * Get the block by the label from Label byte-code.
	 * If the block is not found, then create a new block with the given label.
	 * And set the current block to that block.
	 * 
	 * @param code {@link wyil.lang.Codes.Label} byte-code
	 */
	private void analyze(Codes.Label code) {
		String label = code.label;
		// Get the target blk. If it is null, then create a new block.
		BasicBlock blk = blk_ctrl.getBasicBlock(label);
		//Get the current block 
		BasicBlock c_blk = blk_ctrl.getCurrentBlock();
		if(c_blk != null && !(c_blk.equals(blk))){
			c_blk.addChild(blk);			
		}		
		// Switch the current block
		blk_ctrl.setCurrentBlock(blk);
	}

	/**
	 * Add the 'equal' constraints of the target and operand register.
	 * 
	 * @param code
	 */
	private void analyze(Codes.NewList code) {
		String target = prefix + code.target();
		sym_ctrl.putAttribute(target, "type", code.type());
		if (BoundAnalyzerHelper.isIntType(code.type())) {
			for (int operand : code.operands()) {
				blk_ctrl.addConstraint(new Union(prefix + code.target(), prefix + operand));
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
	private void analyze(Codes.Return code) {
		// Get the return operand
		String retOp = prefix + code.operand;
		BasicBlock c_blk = blk_ctrl.getCurrentBlock();
		// Check if the current blk exits. If so, then proceed the following
		// procedure.
		if (c_blk != null) {
			// Check if the return type is integer.
			if (BoundAnalyzerHelper.isIntType(code.type)) {
				// Add the 'Equals' constraint to the return (ret) variable.
				c_blk.addConstraint((new Assign("return", retOp)));
			}
			Type type = code.type;
			sym_ctrl.putAttribute("return", "type", type);
			if (type instanceof Type.List) {
				// Get 'size' att from ret op
				BigInteger size = (BigInteger) sym_ctrl.getAttribute(retOp, "size");
				sym_ctrl.putAttribute("return", "size", size);
			}
			// Connect the current block with exit block.
			c_blk.addChild(blk_ctrl.getBasicBlock("exit", BlockType.EXIT));
			blk_ctrl.setCurrentBlock(null);
		}

	}

	private void analyze(Codes.ListOperator code) {
		String target = prefix + code.target();
		sym_ctrl.putAttribute(target, "type", code.type());
		switch (code.kind) {
		case APPEND:
			BigInteger size = BigInteger.ZERO;
			for (int operand : code.operands()) {
				String op = prefix + operand;
				size = size.add((BigInteger) sym_ctrl.getAttribute(op, "size"));
				blk_ctrl.addConstraint(new Equals(target, prefix + operand));
			}
			// put 'size' attribute
			sym_ctrl.putAttribute(target, "size", size);
			break;
		default:
			throw new RuntimeException("unknown list operator encountered ("+code+")");
		}
	}

	/**
	 * Parse 'Unary Operator' bytecode and add the constraints in accordance
	 * with operator kind. For example, add the 'Negate' constraint for the
	 * negated operator.
	 * 
	 * @param code
	 */
	private void analyze(Codes.UnaryOperator code) {
		UnaryOperatorKind kind = code.kind;
		String x = prefix + code.operand(0);
		String y = prefix + code.target();
		//
		switch (kind) {
		case NEG:
			blk_ctrl.addConstraint(new Negate(x, y));
			break;
		case NUMERATOR:
			throw new RuntimeException("Unimplemeted unary operator encountered ("+code+")");
		case DENOMINATOR:
			throw new RuntimeException("Unimplemeted unary operator encountered ("+code+")");
		default:
			throw new RuntimeException("unknown unary operator encountered ("+code+")");
		}

	}

	

	/**
	 * Add the range to the target register.
	 * 
	 * @param code
	 */
	private void analyze(Codes.LengthOf code) {
		// Get the size att
		String op = prefix + code.operand(0);
		BigInteger size = (BigInteger) sym_ctrl.getAttribute(op, "size");
		String target = prefix + code.target();
		Type type = code.assignedType();
		// Add 'type' att
		sym_ctrl.putAttribute(target, "type", type);
		// Add 'value' att
		sym_ctrl.putAttribute(target, "value", size);
		blk_ctrl.addConstraint(new Const(target, size));
	}

	/**
	 * Creates a loop loop header
	 * 
	 * @param code
	 */
	private void analyze(Codes.Loop code) {
		// Loop header
		String label = code.toString();
		for (int op : code.modifiedOperands) {
			blk_ctrl.addLoopVar(prefix + op);
		}
		BasicBlock loopheader = blk_ctrl.createLoopHeader(label);
		blk_ctrl.setCurrentBlock(loopheader);
		//Set the loop flag to be true.
		blk_ctrl.setLoop(true);
		// Get the list of byte-code and iterate through the list.
		this.iterateByteCode(code.bytecodes());
	}

	/**
	 * The bounds of a list/map shall be propagated from the operand to the
	 * target.
	 * 
	 * @param code
	 */
	private void analyze(Codes.SubList code) {
		if (code.type().element() instanceof Type.Int) {
			for (int operand : code.operands()) {
				blk_ctrl.addConstraint(new Equals(prefix + code.target(), prefix + operand));
			}
		}

	}

	/**
	 * Implemented the propagation rule for <code>Codes.BinaryOperator</code>
	 * code to add the 'Plus' constraints of operands and target registers.
	 * 
	 * @param code
	 */
	private void analyze(Codes.BinaryOperator code) {
		String target = prefix + code.target();
		// Add the type att
		Type type = code.assignedType();
		sym_ctrl.putAttribute(target, "type", type);
		if (BoundAnalyzerHelper.isIntType(code.type())) {
			// Get the values
			BigInteger left = (BigInteger) sym_ctrl.getAttribute(prefix + code.operand(0), "value");
			BigInteger right = (BigInteger) sym_ctrl.getAttribute(prefix + code.operand(1), "value");
			switch (code.kind) {
			case ADD:
				// Use the left plus to represent the addition
				blk_ctrl.addConstraint(new LeftPlus(prefix + code.operand(0), prefix + code.operand(1), target));
				break;
			case SUB:
				// Negated the operand
				blk_ctrl.addConstraint(new Negate(prefix + code.operand(1), prefix + code.operand(1)));
				// Use the left plus to represent the subtraction.
				blk_ctrl.addConstraint(new LeftPlus(prefix + code.operand(0), prefix + code.operand(1), target));
				break;
			case MUL:
				break;
			case DIV:
				break;
			case REM:
				break;
			case RANGE:
				// Take the union of operands
				blk_ctrl.addConstraint(new Range(target, left, right.subtract(BigInteger.ONE)));
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
				throw new RuntimeException("unknown binary expression encountered ("+code+")");
			}
		}

	}

	/**
	 * Propagate the bounds of a new Map by taking the union of values.
	 * 
	 * @param code
	 *            the <code>Codes.NewMap</code> byte-code.
	 */
	/*private void analyze(Codes.NewMap code) {
		Type.Map map = code.type();
		int index = 1;
		while (index < code.operands().length) {
			// Consider The values field
			if (BoundAnalyzerHelper.isIntType(map.value())) {
				addConstraint(new Union(prefix + code.target(), prefix + code.operand(index)));
			}
			index += 2;
		}
	}*/

	/**
	 * Load the tuple values at the given index and assign the bounds of the
	 * operand to the target.
	 * 
	 * @param code
	 */
	private void analyze(Codes.TupleLoad code) {
		// Check if the index is that of value field (1).
		int index = code.index;
		if (index % 2 == 1) {
			Type.Tuple tuple = (Tuple) code.type();
			if (BoundAnalyzerHelper.isIntType(tuple.element(index))) {
				blk_ctrl.addConstraint(new Equals(prefix + code.target(), prefix + code.operand(0)));
			}
		}

	}

	/**
	 * Take the union of bounds from operands and target
	 * 
	 * @param code
	 */
	private void analyze(Codes.NewTuple code) {

		// Assing the bounds of value field to the target
		Type.Tuple tuple = code.type();
		int index = 1;
		while (index < code.operands().length) {
			if (BoundAnalyzerHelper.isIntType(tuple.element(index))) {
				blk_ctrl.addConstraint(new Union(prefix + code.target(), prefix + code.operand(index)));
			}
			index += 2;
		}

	}

	/**
	 * Updates an element of a list. But how do we update the bounds???
	 * 
	 * @param code
	 */
	private void analyze(Codes.Update code) {

	}

	/**
	 * Checks or creates the goto block and updates the current block to 
	 * be null. 
	 * 
	 * @param code Goto ({@link wyil.lang.Codes.Goto } byte-code
	 */
	private void analyze(Codes.Goto code) {
		// Get the label name
		String label = code.target;
		BasicBlock goto_blk = blk_ctrl.getBasicBlock(label);
		
		//Set the current blk to null blk
		blk_ctrl.setCurrentBlock(null);
	}

	private void analyze(Codes.FieldLoad code) {
		String target = prefix + code.target();
		String record = prefix + code.operand(0);
		// add the type to the record
		sym_ctrl.putAttribute(record, "type", code.type());
		// Target
		sym_ctrl.putAttribute(target, "type", code.fieldType());
		sym_ctrl.putAttribute(target, "field", code.field);
	}

	private void analyze(Codes.Convert code) {
		String target = prefix + code.target();
		sym_ctrl.putAttribute(target, "type", code.result);

		if (code.result instanceof Type.List) {
			// Get the value

		}

	}

}
