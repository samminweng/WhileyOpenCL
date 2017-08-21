package wyopcl.translator.bound;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Deque;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.Set;
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
import wyopcl.translator.LiveVariablesAnalysis;
import wyopcl.translator.bound.Bounds.Threshold;
import wyopcl.translator.bound.constraint.ArrayUpdate;
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
import wyopcl.translator.bound.constraint.NotEquals;
import wyopcl.translator.bound.constraint.Range;
import wyopcl.translator.cfg.BasicBlock.BlockType;

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
	private boolean isVerbose; // Print out detailed messages
	private boolean isDFTraversal; // Specify tree order (depth-first by default)
	private boolean isNaiveWiden; // Specify widen operator (naive widen by default)
	private final String prefix = "_";
	private Set<String> loop_labels; // Store the loop labels in a function
	// The line number
	private int line;
	private WyilFile module;

	// Keep track of bounds for each function call
	private HashMap<FunctionOrMethod, Set<Bounds>> boundMap;
	private HashMap<FunctionOrMethod, Bounds> unionBound;

	private LiveVariablesAnalysis liveAnalyzer; // Live variable analysis

	/**
	 * Constructor
	 * @param liveAnalyzer 
	 */
	public BoundAnalyzer(WyilFile module, LiveVariablesAnalysis liveAnalyzer, Configuration config) {
		this.module = module;
		this.boundMap = new HashMap<FunctionOrMethod, Set<Bounds>>();
		this.unionBound = new HashMap<FunctionOrMethod, Bounds>();
		this.loop_labels = new HashSet<String>();
		this.liveAnalyzer = liveAnalyzer;
		this.isVerbose = config.isVerbose();
		this.isDFTraversal = config.getOption(Configuration.TRAVERSAL).equals("DF")? true : false;
		this.isNaiveWiden = config.getOption(Configuration.BOUND).equals("naive") ? true:false;
	}

	/**
	 * Build up Control Flow Graph.
	 * 
	 * @param config
	 * @param variableDeclarations
	 * @param code_blk
	 */
	public void buildCFG(FunctionOrMethod function) {
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
			if(!BoundAnalyzerHelper.isCached(function) && isVerbose) {
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
					//analyze((Codes.Convert) code, function);
				} else if (code instanceof Codes.Const) {
					analyze((Codes.Const) code, function);
				} else if (code instanceof Codes.Debug) {
					// Do nothing
				} else if (code instanceof Codes.Dereference) {
					// Do nothing
				} else if (code instanceof Codes.FieldLoad) {
					//analyze((Codes.FieldLoad) code, function);
				} else if (code instanceof Codes.Fail) {
					analyze((Codes.Fail) code, function);
				} else if (code instanceof Codes.Goto) {
					analyze((Codes.Goto) code, function);
				} else if (code instanceof Codes.If) {
					analyze((Codes.If) code, function);
				} else if (code instanceof Codes.IfIs) {
					// Do nothing
				} else if (code instanceof Codes.IndexOf) {
					//Do nothing
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
		String value_reg = prefix + code.operand(0);
		String size_reg = prefix + code.operand(1);

		// Add 'size' attribute to target array
		//BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);

		if(!BoundAnalyzerHelper.isCached(function)){
			// Get the current blok
			BoundBlock cur_blk = BoundAnalyzerHelper.getCurrentBlock(function);
			// Pass value info
			cur_blk.addConstraint(new Assign(target_reg, value_reg));
			// Pass size info
			cur_blk.addConstraint(new Assign(target_reg+"_size", size_reg));

			// Put 'left' variable to 'Vars' set
			cur_blk.addVar(target_reg);
			cur_blk.addVar(target_reg+"_size");
			cur_blk.addCode(code);

		}
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

	/**
	 * Go through each block and compute the dead variables in each block
	 * 
	 * 
	 * @param function
	 */
	private void computeDeadVars(FunctionOrMethod function) {
		BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);

		for(BoundBlock blk : graph.getBlockList()){
			blk.computeDeadVars(liveAnalyzer, function);
		}


	}

	/***
	 * Initialize each variable of a function with an empty domain.
	 * 
	 * 
	 * @param function
	 */
	public void initialize(FunctionOrMethod function) {
		BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);
		// Initialize all block with empty domains
		for(BoundBlock blk: graph.getBlockList()){
			blk.emptyBounds();
		}		
	}
	/**
	 * Create a deque and put Entry and code blocks into the queue
	 * 
	 * @return a deque
	 */
	public Deque<BoundBlock> createDequeAddEntry(FunctionOrMethod function) {
		BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);
		// Create a deque to track all the blocks that have bound changes
		// Deque provides 'pollLast' to get and remove the last block
		// So we can have Last In First Out or First In First Out behaviour.
		Deque<BoundBlock> changed = new LinkedList<BoundBlock>();

		// Get the entry block and add entry and its child nodes to 
		BoundBlock entry = graph.getBasicBlock("entry", BlockType.ENTRY);
		changed.add(entry);
		// Add the first child block of entry node
		changed.add(graph.getBasicBlock("code", BlockType.BLOCK));

		return changed;
	}



	/**
	 * Create a feedback set that contains one block of the graph 
	 * so the widening operator can be applied to the block of this set.
	 * 
	 * @return
	 */
	public LinkedHashSet<BoundBlock> createFeedbackSet(FunctionOrMethod function) {
		BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);
		// Create a hash set that has constant complexity
		LinkedHashSet<BoundBlock> feedback_set = new LinkedHashSet<BoundBlock>();

		// Put all loop headers to the set
		List<BoundBlock> blks = graph.getBasicBlockByType(BlockType.LOOP_HEADER);
		feedback_set.addAll(blks);

		return feedback_set;
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
	public Bounds inferBounds(FunctionOrMethod function) {
		BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);

		if (isVerbose) {
			// Print out bounds along with size information.
			BoundAnalyzerHelper.printCFG(function);
		}

		// Compute the dead variables
		computeDeadVars(function);

		// Initialize the bound set in all blocks.
		initialize(function);
		// Create a deque and put 'entry' and 'code' blocks
		// into the queue as a starting point
		Deque<BoundBlock> changed = createDequeAddEntry(function);		

		// Create a feedback set 
		LinkedHashSet<BoundBlock> feedback_set = createFeedbackSet(function);

		// Repeatedly iterates over all blocks in deque 
		// and infer the bounds consistent with all the constraints in each block.
		int iteration = 0;
		// Stop the loop when the changed is empty
		while (!changed.isEmpty()) {
			// Initialize the flag
			boolean isChanged = false;		

			// Debugging messages
			//if (config.isVerbose() && blk.getType() == BlockType.LOOP_HEADER) {
			if (isVerbose) {
				System.out.println("### Iteration " + iteration + " ### ");
				String str = "'" + changed.size() + "' blocks in queue : ";
				Iterator<BoundBlock> iterator = changed.iterator();
				while(iterator.hasNext()){
					BoundBlock blk1 = iterator.next();
					str += "[" + blk1.getType()+ "]";
				}
				System.out.println(str);
			}


			// Retrieve a block from the 'changed' queue
			BoundBlock blk;	
			if(isDFTraversal){
				// Get the last block of the deque in Depth-First (last in first out) manner
				blk = changed.pollLast();
			}else{
				// Get the first block of the deque in Breath-First (first in first out) manner
				blk = changed.pollFirst();
			}

			// Clone the bounds before the bound inference
			Bounds bnd_before = (Bounds) blk.getBounds().clone();

			// Produce the initial bound of 'blk' before bound inference.
			blk.produceInputBound();			

			// Beginning of bound inference.
			blk.inferBounds();
			// End of bound inference.

			// Check bound change and widen the bound			
			Bounds bnd_after = blk.getBounds();
			// Check bound change and widen the bound after bound inference.	
			if (blk.isReachable() && !bnd_before.equals(bnd_after)) {
				// Widen the bounds for each block iff block is the feedback set
				if(feedback_set.contains(blk)){
					bnd_after.widenBounds(isNaiveWiden, bnd_before);
				}			
				// Check if the blk has any child nodes
				if(!blk.isLeaf()){
					for(BoundBlock child : (List<BoundBlock>)blk.getChildNodes()){
						if (!child.getType().equals(BlockType.EXIT) && changed.contains(child) == false) {
							// If bounds has changed, then add its child nodes to 'changed set'
							changed.add(child);
						}
					}
				}
				isChanged = true;
			}

			// Debug
			//if (config.isVerbose() && blk.getType() == BlockType.LOOP_HEADER) {
			if (isVerbose) {
				// Print out the bounds.
				System.out.println(blk.toString());
				System.out.println("isChanged=" + isChanged);
			}

			iteration++;
		}

		BoundBlock exit_blk = graph.createOrGetExitBlock();// Create the EXIT block
		exit_blk.emptyBounds();

		Bounds bnds = graph.produceFinalBound();

		BoundAnalyzerHelper.printBoundsAndSize(function, bnds);

		if (isVerbose) {
			// Print out bounds along with size information.
			BoundAnalyzerHelper.printCFG(function);
		}


		// Get old bounds
		if(!boundMap.containsKey(function)){
			boundMap.put(function, new LinkedHashSet<Bounds>());
		}
		Set<Bounds> bnd_set = boundMap.get(function);

		// Add the bounds to HashMap
		bnd_set.add(bnds);		

		// Return the inferred bounds of the function
		return bnds;
	}	

	private void analyze(Codes.Assign code, FunctionOrMethod function) {
		// Get the current blok
		BoundBlock cur_blk = BoundAnalyzerHelper.getCurrentBlock(function);
		String left = prefix + code.target(0);
		String right = prefix + code.operand(0);
		// Check if the assigned value is an integer
		if (!BoundAnalyzerHelper.isCached(function)){ 
			if(BoundAnalyzerHelper.isIntType(code.type(0))) {
				// Add the constraint 'target = operand'
				cur_blk.addConstraint(new Assign(left, right));
			}
			if (code.type(0) instanceof Type.Array) {
				// Add the constraint to the size variable of target array
				cur_blk.addConstraint(new Assign(left+"_size", right+"_size"));
			}

		}

		// Put both left and right variables to Vars
		cur_blk.addCode(code);
		cur_blk.addVar(left);
		cur_blk.addVar(right);
	}

	/**
	 * Parses 'Const' bytecode to add the 'Const' constraint to the list.
	 * 
	 * @param code
	 */
	private void analyze(Codes.Const code, FunctionOrMethod function) {
		Constant constant = code.constant;
		String left = prefix + code.target();
		if(!BoundAnalyzerHelper.isCached(function)){
			// Get the current blok
			BoundBlock cur_blk = BoundAnalyzerHelper.getCurrentBlock(function);
			// Check the value is an Constant.Integer
			if (constant instanceof Constant.Integer) {
				// Add the 'Const' constraint.
				BigInteger value = ((Constant.Integer) constant).value;
				cur_blk.addConstraint(new Const(left, value));
			}

			if (constant instanceof Constant.Array) {
				Constant.Array arr = (Constant.Array) constant;
				
				BigInteger max = ((Constant.Integer)arr.values.get(0)).value;
				BigInteger min = ((Constant.Integer)arr.values.get(0)).value;
				// Get max and min
				for(Constant value: arr.values){
					BigInteger val = ((Constant.Integer)value).value;
					if(max.compareTo(val)<0){
						max = val;
					}
					if(min.compareTo(val)>0){
						min = val;
					}
					
				}
				
				cur_blk.addConstraint(new Range(left, min, max));
				// Get the list and extract the size info.
				BigInteger size = BigInteger.valueOf((((Constant.Array) constant).values).size());
				cur_blk.addConstraint(new Const(left+"_size", size));
			}

			// Put 'left' variable to 'Vars' set
			cur_blk.addVar(left);
			cur_blk.addCode(code);

		}



	}

//	/**
//	 * Implements the propagation rule for <code>Codes.IndexOf</code> bytecode
//	 * to assign the bounds from the source operator register to the target
//	 * operator.
//	 * 
//	 * @param code
//	 */
//	private void analyze(Codes.IndexOf code, FunctionOrMethod function) {
////		if (BoundAnalyzerHelper.isIntType((Type) code.type(0))
////				&& !BoundAnalyzerHelper.isCached(function)) {
////			String target = prefix + code.target(0);
////			String op = prefix + code.operand(0);
////			String index = prefix + code.operand(1);
////			// Get the CFGraph
////			BoundGraph graph = BoundAnalyzerHelper.getCFGraph(function);
////			graph.addConstraint(new Equals(target, op));
////		}
//	}

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
			// Get the label 
			String label = code.target;

			if (BoundAnalyzerHelper.isIntType(code.type(0))) {
				switch (code.op) {
				case EQ:
					c = new Equals(left, right);
					neg_c = new NotEquals(left, right);
					break;
				case NEQ:
					c = new NotEquals(left, right);
					neg_c = new Equals(left, right);
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
				if (this.loop_labels.contains(label)) {
					// Create a loop body and loop exit.
					graph.createLoopStructure(code, c, neg_c);
				} else {
					// Create if and else branches.
					graph.createIfElseBranch(code, c, neg_c);
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
					// Add the bounds of size variable
					if(type instanceof Type.Array){
						return_block.addConstraint((new Assign("return_size", retOp+"_size")));
					}

					// Put return op to 'Vars' set
					return_block.addVar(retOp);
					// Put the code to return blk
					return_block.addCode(code);
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
	 * Get the first ifelse 
	 * 
	 * 
	 * @param code
	 * @param function
	 * @return
	 */
	private String getFindLoopLabel(List<Code> bytecodes){
		for(Code code : bytecodes){
			if(code instanceof Codes.If){
				return ((Codes.If)code).target;
			}
		}
		return null;
	}


	/**
	 * Creates a loop structure, including loop header, loop body and loop exit.
	 * 
	 * @param code
	 */
	private void analyze(Codes.Loop code,  FunctionOrMethod function) {

		// Get the label byte code at the exit of loop codes
		String loop_label = getFindLoopLabel(code.bytecodes());
		loop_labels.add(loop_label);
		// in order to identify the bytecode is inside a loop
		// Get the list of byte-code and iterate through the list.
		iterateBytecode(function, code.bytecodes());

	}



	/**
	 * Implemented the propagation rule for <code>Codes.BinaryOperator</code>
	 * code to add the 'Plus' constraints of operands and target registers.
	 * 
	 * @param code
	 */
	private void analyze(Codes.BinaryOperator code, FunctionOrMethod function) {
		String left = prefix + code.target(0);
		// Add the type att
		if (BoundAnalyzerHelper.isIntType(code.type(0)) 
				&& !BoundAnalyzerHelper.isCached(function)) {
			// Get the current blok
			BoundBlock cur_blk = BoundAnalyzerHelper.getCurrentBlock(function);
			// Get the two right ops
			String right0 = prefix + code.operand(0);
			String right1 = prefix + code.operand(1);
			switch (code.kind) {
			case ADD:
				// Use the left plus to represent the addition
				cur_blk.addConstraint(new LeftPlus(right0, right1, left));
				break;
			case SUB:
				// Negated the operand
				cur_blk.addConstraint(new Negate(right1, right1));
				// Use the left plus to represent the subtraction.
				cur_blk.addConstraint(new LeftPlus(right0, right1, left));
				//graph.addConstraint(new Plus(prefix + code.operand(0), prefix + code.operand(1), target));
				break;
			case MUL:
				cur_blk.addConstraint(new LeftMultiply(right0, right1, left));	
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
			// left, right0, and right1 are use variable
			cur_blk.addVar(left);
			cur_blk.addVar(right0);
			cur_blk.addVar(right1);
			// Add code
			cur_blk.addCode(code);
		}

	}


	/**
	 * Updates an element of an array. 
	 * 
	 * @param code
	 */
	private void analyze(Codes.Update code, FunctionOrMethod function) {

		// Get the current blok
		BoundBlock cur_blk = BoundAnalyzerHelper.getCurrentBlock(function);
		String left = prefix + code.target(0);
		String value = prefix + code.operand(1);
		// Check if the assigned value is an integer
		if (!BoundAnalyzerHelper.isCached(function)){ 
			// Use 'equal' constraint to pass bound to left array
			cur_blk.addConstraint(new ArrayUpdate(left, value));
		}

		// Put 'left' variable to 'Vars' set
		cur_blk.addVar(left);
		cur_blk.addVar(left+"_size");
		cur_blk.addVar(value);
		cur_blk.addCode(code);

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
			// Add the current blk to goto blk
			BoundBlock c_blk = graph.getCurrentBlock();
			if(c_blk != null){
				// Link current blk with 'goto' blk
				c_blk.addChild(goto_blk);
			}

			graph.setCurrentBlock(null);
		}
	}

	


	/**
	 * Take union of bound of all function calls
	 * 
	 * @param function
	 * @return
	 */
	public Bounds computeUnionBounds(FunctionOrMethod function) {
		// Get union bounds from 
		if(!this.unionBound.containsKey(function)){
			// Get the bounds
			if(!this.boundMap.containsKey(function)){
				this.inferBounds(function);
			}

			Set<Bounds> bnd_set = this.boundMap.get(function);
			// Produce final bound as an union of all bounds
			Bounds union_bnd = new Bounds();
			Iterator<Bounds> iterator = bnd_set.iterator();
			while(iterator.hasNext()){
				Bounds bnd = iterator.next();
				union_bnd.union(bnd);
			}

			System.out.println("Final bounds of "+function.name() + " :");
			BoundAnalyzerHelper.printBoundsAndSize(function, union_bnd);

			// Put union bound to map
			this.unionBound.put(function, union_bnd);

		}
		// Return union bound
		return this.unionBound.get(function);
	}




	/**
	 * Obtain the inferred domain of given register in the function
	 * 
	 * If passed register == -1, then return the type of return value
	 * 
	 * @param register
	 * @param function
	 * @return
	 */
	public Domain getInferredDomain(int register, FunctionOrMethod function) {
		// Get the bounds
		Bounds bounds = computeUnionBounds(function);
		
		if(register == -1){
			return bounds.getDomain("return");		
		}
		
		
		return bounds.getDomain(prefix+register);	
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
		// Get the domain of register
		Domain d = getInferredDomain(register, function);
		// Check the register is empty or not.
		if(!d.isEmpty()){
			// Use unsigned type if lower bound >= 0
			if(d.getLower() != null && d.getLower().compareTo(BigInteger.ZERO)>=0){
				// Check upper bound 
				if(d.getUpper() != null){
					// Unsigned 16-bit integer
					if(d.getUpper().compareTo(Threshold._UI16_MAX.getValue())<=0){
						return "uint16_t";
					}

					// Unsigned 32-bit integer
					if(d.getUpper().compareTo(Threshold._UI32_MAX.getValue())<=0){
						return "uint32_t";
					}
				}

				// Unsigned 64-bit integers
				return "uint64_t";

			}else{
				// In the case of signed integers
				// Upper/Lower is NOT +- infty
				if(!d.isUnbound()){
					// Limit to 16-bit integers (16_min < domain < 16_max)  
					if(d.getLower().compareTo(Threshold._I16_MIN.getValue())>=0
							&& d.getUpper().compareTo(Threshold._I16_MAX.getValue())<=0){
						return "int16_t";
					}

					// Limit to 32-bit integers (32_min < domain < 32_max)
					if(d.getLower().compareTo(Threshold._I32_MIN.getValue())>=0
							&& d.getUpper().compareTo(Threshold._I32_MAX.getValue())<=0){
						return "int32_t";
					}
				}	
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
			Bounds input_bnds = inferBounds(caller);

			// Build CFGraph for callee.
			buildCFG(callee);


			// Propagate the bounds of input parameters to the function.
			BoundAnalyzerHelper.propagateBoundsToCallee(callee, code, input_bnds);


			// Infer the bounds of callee function.
			Bounds ret_bnd = inferBounds(callee);

			// check if there is any return
			BoundAnalyzerHelper.propagateBoundsBackCaller(caller, code, ret_bnd);

			// Promote the status of callee's CF graph to be 'complete'
			BoundAnalyzerHelper.promoteCFGStatus(callee);

			//Reset the line number
			this.line = caller_line;
		}
	}

}
