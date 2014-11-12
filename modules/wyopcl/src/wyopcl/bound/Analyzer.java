package wyopcl.bound;

import static wycc.lang.SyntaxError.internalFailure;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Stack;

import wycc.lang.SyntaxError;
import wyil.lang.Code;
import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Codes.UnaryOperatorKind;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Type.Tuple;
import wyopcl.bound.BasicBlock.BlockType;
import wyopcl.bound.constraint.Const;
import wyopcl.bound.constraint.Constraint;
import wyopcl.bound.constraint.Equals;
import wyopcl.bound.constraint.GreaterThan;
import wyopcl.bound.constraint.GreaterThanEquals;
import wyopcl.bound.constraint.LessThan;
import wyopcl.bound.constraint.LessThanEquals;
import wyopcl.bound.constraint.Negate;
import wyopcl.bound.constraint.RightPlus;
import wyopcl.bound.constraint.Union;
/***
 * A class to store all the constraints produced in the wyil file and infer the bounds consistent
 * with all the constraints. Due to the singleton design pattern, the class variables 'constraintListMap'
 * and 'label' has one instance.
 *    
 * @author Min-Hsien Weng
 *
 */
public class Analyzer {
	//The stack is used to store the assertion's labels.
	private Stack<String> stackOfAssertOrAssume;

	//private String branch;
	private final int depth;
	private final String GRAY = (char)27 +"[30;1m";
	private final String BLUE = (char)27 +"[34;1m";
	private final String RED = (char)27 + "[31;1m";
	private final String RESET = (char)27 + "[0m";

	//The variables are used in the control flow graph (CFG).
	//Root node of CFG
	private BasicBlock entry;
	private BasicBlock current_blk;
	//The exit node of CFG
	private BasicBlock exit;
	//The list of basic block;
	private List<BasicBlock> list = new ArrayList<BasicBlock>();
	//The label name of the loop condition
	private String loop_condition = "";

	private boolean isGoto = false;

	public Analyzer(int depth){
		this.depth = depth;
		this.stackOfAssertOrAssume = new Stack<String>();
		this.entry = createBasicBlock("entry", BlockType.ENTRY);
		this.exit = createBasicBlock("exit", BlockType.EXIT);
		this.current_blk = this.entry;
	}

	public void createEntryNode(Type paramType, String param, BigInteger min, BigInteger max){
		if(isIntType(paramType)){
			this.entry.addBounds(param, min, max);
		}
	}

	/**
	 * Creates the entry node
	 * @param paramTypes
	 */
	public void createEntryNode(List<Type> paramTypes){
		int index = 0;
		for(Type paramType: paramTypes){
			createEntryNode(paramType, "%"+index, null, null);
			index++;
		}	
	}



	/**
	 * Check if the asserted or assumed flag is enabled.
	 * @return true if assertion/assume is on. Otherwise, return false
	 */
	private boolean isAssertOrAssume(){
		if(!stackOfAssertOrAssume.empty()){
			return true;
		}		
		return false;
	}

	/**
	 * Enable/Disable the flag of assert or assume 
	 * to avoid adding or branching the constraints to the list. 
	 * @param label the label name of assertion or assumption 
	 * @param enable boolean value to enable or disable the flag.
	 */
	private void enableAssertOrAssume(String label, boolean enabled){
		if(enabled){
			stackOfAssertOrAssume.push(label);
		}else{
			if(!stackOfAssertOrAssume.empty() &&
					stackOfAssertOrAssume.peek().equals(label)){
				stackOfAssertOrAssume.pop();
			}			
		}
	}

	/**
	 * Check if the type is instance of Integer by inferring the type from 
	 * <code>wyil.Lang.Type</code> objects, including the effective collection types.
	 * @param type 
	 * @return true if the type is or contains an integer type. 
	 */
	private boolean isIntType(Type type){
		if(type instanceof Type.Int){
			return true;
		}

		if(type instanceof Type.Map){
			Type.Map map = (Type.Map)type;
			//Check the type of values in the map.
			return isIntType(map.key()) || isIntType(map.value());			
		}

		if(type instanceof Type.List){
			return isIntType(((Type.List)type).element());
		}

		if (type instanceof Type.Tuple){
			//Check the type of value field. 
			Type element = ((Type.Tuple)type).element(1);
			return isIntType(element);	
		}

		return false;
	}

	/**
	 * Prints out each bytecode with line number and indentation.
	 * @param name
	 * @param line
	 * @see <a href="http://en.wikipedia.org/wiki/ANSI_escape_code">ANSI escape code</a>
	 */
	public int printWyILCode(Code code, String name, int line){
		//Print out the bytecode with the format (e.g. 'main.9 [const %12 = 2345 : int]')
		String font_color_start = "";
		String font_color_end = "";
		//Use the ANSI escape color to distinguish the set of bytecode of the assertion.
		if(isAssertOrAssume()){
			font_color_start = GRAY;
			font_color_end = RESET;
		}

		if(code instanceof Codes.Label){
			//System.out.println(font_color_start+name+"."+line+"."+depth+" ["+code+"]"+font_color_end);
			System.out.println(font_color_start+name+"."+line+" ["+code+"]"+font_color_end);
		}else{
			//System.out.println(font_color_start+name+"."+line+"."+depth+" [\t"+code+"]"+font_color_end);
			System.out.println(font_color_start+name+"."+line+" [\t"+code+"]"+font_color_end);
		}	

		return ++line;
	}	

	/**
	 * Print out the bounds.
	 * @param bnd
	 */
	public void printBounds(Bounds bnd){
		System.out.print(BLUE+"Bounds"+RESET);
		System.out.println(bnd.toString());
		if(bnd.checkBoundConsistency()){
			System.out.println(BLUE+"Consistency=true"+RESET);
		}else{
			System.out.println(RED+"Consistency=false"+RESET);
		}
	}


	/**
	 * Repeatedly iterates over all blocks, starting from the entry block to the exit block,
	 * and infer the bounds consistent with all the constraints in each block.
	 * @param verbose 
	 * @param iterations optional parameter. iterations[0] specifies the number of iterations. If not specifies, 
	 * the default value is 5.
	 * @return the bounds
	 */
	public Bounds inferBounds(boolean verbose, int... iterations){
		//Sort the blks
		Collections.sort(list);		
		int MaxIteration = iterations.length >0 ? iterations[0] : 5;
		boolean isFixedPointed = true;
		//Stop until there is no change in bounds.
		for(int i=0;i<MaxIteration;i++){
			if(verbose){
				System.out.println(BLUE+"Iteration "+i+" => "+RESET);
			}
			//Initialize the isFixedPointed
			isFixedPointed = true;
			//Iterate all the blocks
			for(BasicBlock blk : list){
				//Take the union of parents' bounds as the initial bounds
				if(blk.hasParent()){
					for(BasicBlock parent: blk.getParentNodes()){
						blk.unionBounds(parent);
					}
				}
				//If bounds has no change, then isChanged = true.
				boolean isChanged = blk.inferBounds(verbose);
				//Use bitwise 'AND' to combine all the results
				isFixedPointed &= (!isChanged);
				//Print out the bounds.
				if(verbose){
					System.out.println(blk);
					System.out.println("isChanged="+isChanged);
				}
			}			
			System.out.println("isFixedPointed="+isFixedPointed);
			//Check if the bounds in the block remains the same. If it is true, then go to loop exit.
			if(isFixedPointed){
				break;
			}
			
		}
		return exit.getBounds();
	}

	/**
	 * Keep track of the current basic block
	 * @return
	 */
	private BasicBlock getCurrentBlock(){
		//If the current block is null, throw out an Runtime exception
		if(current_blk == null){
			throw new RuntimeException("Current block is null.");
			//current_blk = entry;
		}

		return current_blk;
	}

	private void setCurrentBlock(BasicBlock blk){
		current_blk = blk;
	}

	/**
	 * Iterates over all nodes in a list to get the block,
	 * whose branch name is matched with label.
	 * @param label
	 * @return blk
	 */
	private BasicBlock getBasicBlock(String label){

		Iterator<BasicBlock> iterator = list.iterator();
		while(iterator.hasNext()){
			BasicBlock blk = iterator.next();
			if(blk.getBranch().equals(label)){
				if(blk.getType().equals(BlockType.BLOCK)){
					return blk;
				}
				//Get the block of If branch
				if(blk.getType().equals(BlockType.IF_BRANCH)){
					return blk;
				}
				//Get the block of Loop Exit
				if(blk.getType().equals(BlockType.LOOP_EXIT)){
					return blk;
				}
			}
		}		

		//Not found
		return null;


	}

	/***
	 * Finds the block by the branch name and block types
	 * @param label
	 * @param type
	 * @return
	 */
	private BasicBlock getBasicBlock(String label, BlockType type){
		Iterator<BasicBlock> iterator = list.iterator();
		while(iterator.hasNext()){
			BasicBlock blk = iterator.next();
			if(blk.getBranch().equals(label)){
				if(blk.getType().equals(type)){
					return blk;
				}
			}
		}		
		return null;

	}


	private BasicBlock createBasicBlock(String label, BlockType type){
		BasicBlock blk = new BasicBlock(label, type);
		list.add(blk);
		return blk;
	}


	/**
	 * Create a basic block with the specific label name
	 * @param label the branch name
	 * @return the blk
	 */
	private BasicBlock createBasicBlock(String label, BlockType type, BasicBlock parent){
		BasicBlock blk = createBasicBlock(label, type);
		parent.addChild(blk);
		return blk;
	}	

	/**
	 * Outputs the control flow graphs.
	 * @param name
	 */
	public void printCFG(String name){
		//Sort the blks.
		Collections.sort(list);

		String dot_string= "digraph "+name+"{\n";		
		Iterator<BasicBlock> iterator = list.iterator();
		while(iterator.hasNext()){
			BasicBlock blk = iterator.next();
			if(!blk.isLeaf()){
				for(BasicBlock child: blk.getChildNodes()){
					dot_string += "\""+blk.getBranch()+" [" +blk.getType()+"]\"->\""+ child.getBranch()+" ["+child.getType() + "]\";\n";
				}
			}
		}
		dot_string += "\n}";

		//Write out the CFG-function_name.dot
		try {
			PrintWriter writer = new PrintWriter("CFG-"+name+".dot", "UTF-8");
			writer.println(dot_string);
			writer.close();
		} catch (FileNotFoundException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}



	/**
	 * Adds the constraint to the current constraint list.
	 * @param c
	 */
	public void addConstraint(Constraint c){		
		getCurrentBlock().addConstraint(c);		
	}



	/**
	 * Branches the current block and adds the 
	 * if_then_else blocks. And set the current
	 * block to the left one.
	 * @param new_label the name of new branch.
	 * @param c constraint
	 */
	private void createIfElseBranch(String new_label, Constraint c, Constraint neg_c){
		BasicBlock c_blk = getCurrentBlock();
		//Check whether to add if-else blocks or loop-condition blocks.
		if(!loop_condition.equals("")){

			BasicBlock loop_body = createBasicBlock(new_label, BlockType.LOOP_BODY, c_blk);
			BasicBlock loop_exit = createBasicBlock(new_label, BlockType.LOOP_EXIT, c_blk);

			//put the original constraint to current blk(loopbody)
			//loop_body.addConstraint(c);
			loop_body.addConstraint(neg_c);	
			//put the negated constraint to the loop_exit
			//loop_exit.addConstraint(neg_c);
			loop_exit.addConstraint(c);	
			setCurrentBlock(loop_body);
			loop_condition = "";
		}else{
			//Branch out the block 
			//The left block does not have the name
			BasicBlock leftBlock = createBasicBlock(new_label, BlockType.ELSE_BRANCH, c_blk);
			BasicBlock rightBlock = createBasicBlock(new_label, BlockType.IF_BRANCH, c_blk);

			//Add the constraint to the left block
			leftBlock.addConstraint(c);
			rightBlock.addConstraint(neg_c);						
			//Set the current block to the left

			setCurrentBlock(leftBlock);
		}
	}





	/**
	 * Checks the type of the wyil code and dispatches the code to the analyzer for
	 * being executed by the <code>analyze(code)</code> 
	 * @param entry
	 */
	public void dispatch(Block.Entry entry){		
		Code code = entry.code; 
		try{
			//enable the assertion 
			if (code instanceof Codes.AssertOrAssume) {
				//Push the assert_label so that no constraints are added to list.
				enableAssertOrAssume(((Codes.AssertOrAssume)code).target, true);
			}

			//Check if the bytecode is under the assertion or assumption.				
			if(!isAssertOrAssume()){
				if (code instanceof Codes.Assign) {			
					analyze((Codes.Assign)code);
				} else if (code instanceof Codes.BinaryOperator) {			
					analyze((Codes.BinaryOperator)code);
				} else if (code instanceof Codes.StringOperator) {
					//StringOperatorInterpreter.getInstance().interpret((Codes.StringOperator)code, stackframe);
				} else if (code instanceof Codes.Convert) {			
					//ConvertInterpreter.getInstance().interpret((Codes.Convert)code, stackframe);
				} else if (code instanceof Codes.Const) {			
					analyze((Codes.Const)code);
				} else if (code instanceof Codes.Debug) {
					//DebugInterpreter.getInstance().interpret((Codes.Debug)code, stackframe);
				} else if (code instanceof Codes.Dereference) {
					//DereferenceInterpreter.getInstance().interpret((Codes.Dereference)code, stackframe);
				} else if (code instanceof Codes.Fail) {
					//FailInterpreter.getInstance().interpret((Codes.Fail)code, stackframe);
				} else if (code instanceof Codes.FieldLoad) {		
					//FieldLoadInterpreter.getInstance().interpret((Codes.FieldLoad)code, stackframe);			
				} else if (code instanceof Codes.ForAll) {				
					analyze((Codes.ForAll)code);
				} else if (code instanceof Codes.Goto) {	
					analyze((Codes.Goto)code);
				} else if (code instanceof Codes.If) {
					analyze((Codes.If)code);			
				} else if (code instanceof Codes.IfIs) {
					//IfIsInterpreter.getInstance().interpret((Codes.IfIs)code, stackframe);
				} else if (code instanceof Codes.IndexOf) {			
					analyze((Codes.IndexOf)code);
				} else if (code instanceof Codes.IndirectInvoke) {			
					//IndirectInvokeInterpreter.getInstance().interpret((Codes.IndirectInvoke)code, stackframe);
				} else if (code instanceof Codes.Invoke) {			
					analyze((Codes.Invoke)code);
				} else if (code instanceof Codes.Invert) {
					//InvertInterpreter.getInstance().interpret((Codes.Invert)code, stackframe);
				} else if (code instanceof Codes.ListOperator) {
					analyze((Codes.ListOperator)code);
				} else if (code instanceof Codes.Loop) {			
					analyze((Codes.Loop)code);			
				} else if (code instanceof Codes.LoopEnd) {
					analyze((Codes.LoopEnd)code);									
				} else if (code instanceof Codes.Label) {
					analyze((Codes.Label)code);
				} else if (code instanceof Codes.Lambda) {
					//LambdaInterpreter.getInstance().interpret((Codes.Lambda)code, stackframe);
				} else if (code instanceof Codes.LengthOf) {			
					analyze((Codes.LengthOf)code);
				}  else if (code instanceof Codes.Move) {
					internalFailure("Not implemented!", "", entry);
				} else if (code instanceof Codes.NewMap) {
					analyze((Codes.NewMap)code);
				} else if (code instanceof Codes.NewList) {			
					analyze((Codes.NewList)code);
				} else if (code instanceof Codes.NewRecord) {
					//NewRecordInterpreter.getInstance().interpret((Codes.NewRecord)code, stackframe);
				} else if (code instanceof Codes.NewSet) {
					//NewSetInterpreter.getInstance().interpret((Codes.NewSet)code, stackframe);
				} else if (code instanceof Codes.NewTuple) {
					analyze((Codes.NewTuple)code);
				} else if (code instanceof Codes.Return) {			
					analyze((Codes.Return)code);
				} else if (code instanceof Codes.NewObject) {
					//NewObjectInterpreter.getInstance().interpret((Codes.NewObject)code, stackframe);
				} else if (code instanceof Codes.Nop) {
					//NopInterpreter.getInstance().interpret((Codes.Nop)code, stackframe);
				} else if (code instanceof Codes.SetOperator){
					//SetOperatorInterpreter.getInstance().interpret((Codes.SetOperator)code, stackframe);
				} else if (code instanceof Codes.SubList) {
					analyze((Codes.SubList)code);
				} else if (code instanceof Codes.SubString) {
					//SubStringInterpreter.getInstance().interpret((Codes.SubString)code, stackframe);
				} else if (code instanceof Codes.Switch) {
					//SwitchInterpreter.getInstance().interpret((Codes.Switch)code, stackframe);
				} else if (code instanceof Codes.Throw) {
					//ThrowInterpreter.getInstance().interpret((Codes.Throw)code, stackframe);
				} else if (code instanceof Codes.TryCatch) {
					//TryCatchInterpreter.getInstance().interpret((Codes.TryCatch)code, stackframe);
				} else if (code instanceof Codes.TupleLoad) {
					analyze((Codes.TupleLoad)code);
				} else if (code instanceof Codes.UnaryOperator){
					analyze((Codes.UnaryOperator)code);
				} else if (code instanceof Codes.Update) {
					analyze((Codes.Update)code);
				} else {
					internalFailure("unknown wyil code encountered (" + code + ")", "", entry);
				}
			}
			//disable the assertion
			if(code instanceof Codes.Label){
				enableAssertOrAssume(((Codes.Label)code).label, false);
			}

		} catch (SyntaxError ex) {
			throw ex;	
		} catch (Exception ex) {		
			internalFailure(ex.getMessage(), "", entry, ex);
		}

	}


	private void analyze(Codes.Assign code){		
		//Check if the assigned value is an integer
		if(isIntType(code.type())){
			//Add the constraint 'target = operand'
			//addConstraint(new Assign("%"+code.target(), "%"+code.operand(0)));
			addConstraint(new Union("%"+code.target(), "%"+code.operand(0)));
		}

	}

	/**
	 * Parses 'Const' bytecode to add the 'Const' constraint to the list. 
	 * @param code
	 */
	private void analyze(Codes.Const code){	
		Constant constant = code.constant;
		//Check the value is an Constant.Integer
		if(constant instanceof Constant.Integer){
			String name = "%"+code.target();
			//Add the 'Const' constraint.
			addConstraint(new Const(name, ((Constant.Integer)constant).value));
		}

	}
	/**
	 * Implements the propagation rule for <code>Codes.IndexOf</code> bytecode
	 * to assign the bounds from the source operator register to the target operator.
	 * @param code
	 */
	private void analyze(Codes.IndexOf code){
		if(isIntType((Type) code.type())){
			addConstraint(new Equals("%"+code.target(), "%"+code.operand(0)));
		}
	}


	/**
	 * Parses the 'If' bytecode to add the constraints to the list.
	 * @param code
	 * @throws CloneNotSupportedException
	 */
	private void analyze(Codes.If code) throws CloneNotSupportedException{


		String left = "%"+code.leftOperand;
		String right = "%"+code.rightOperand;
		Constraint left_c = null;
		Constraint right_c = null;
		if(isIntType(code.type)){
			switch(code.op){
			case EQ:
				left_c = new Equals(left, right);
				right_c = new Equals(left, right);				
				break;
			case NEQ:				

				break;
			case LT:
				left_c = new LessThan(left, right);
				right_c = new GreaterThanEquals(left, right);			
				break;
			case LTEQ:
				//Add the 'left <= right' constraint to the branched list.
				left_c = new LessThanEquals(left, right);
				right_c = new GreaterThan(left, right);
				break;
			case GT:					
				left_c = new GreaterThan(left, right);
				right_c = new LessThanEquals(left, right);
				break;
			case GTEQ:
				//Branch and add the left >= right constraint to 
				left_c = new GreaterThanEquals(left, right);
				right_c = new LessThan(left, right);
				//Add the constraint 'left< right' to current constraint list.
				break;
			case IN:			
				System.err.println("Not implemented!");		
				break;
			case SUBSET:
				System.err.println("Not implemented!");
				break;
			case SUBSETEQ:
				System.err.println("Not implemented!");
				break;
			default:			
				System.err.println("Not implemented!");

			}
		}

		createIfElseBranch(code.target, left_c, right_c);


	}

	/**
	 *Parses the invoke bytecode and adds the constraints to the list.
	 * The possible constraints include: none....
	 * @param code
	 */
	private void analyze(Codes.Invoke code){
		/*//String func_name = code.name.name();

		Type returnType = code.type().ret();
		if(returnType instanceof Type.Int){
			//String return_reg = "%"+code.target();
			//this.getConstraintList().addConstraint(new Equals(return_reg, func_name));
		}*/

		//Get the fun declaration from module.
		//FunctionOrMethodDeclaration functionOrMethod = module.functionOrMethod(code.name.name(), code.type());		


		/*int index = 0;
		for(Type paramType: code.type().params()){
			//Get the input parameters of integer type
			if(paramType instanceof Type.Int){
				String param = "%"+code.operand(index);
				//Missing the variable name of function input parameters, so we used the function name temporarily.
				//Add the equal constraint for input parameter.
				addConstraint(new Union(functionOrMethod.name(), param));
			}
			index++;			
		}*/



		//Check if the function has been analyzed. If so, the union of bounds shall be used to
		//add the equality 
		/*if(unionOfBoundsMap.containsKey(functionOrMethod)){
			Bounds bounds = unionOfBoundsMap.get(functionOrMethod);
			//Check if the return type is integer
			if(code.type().ret() instanceof Type.Int){
				//Add the range constraint for the return register.
				addConstraint(new Range("%"+code.target(), bounds.getLower("return"), bounds.getUpper("return")));
			}	

		}*/


	}

	/**
	 * Parse the 'label' bytecode, get the constraint list by the label and set it to the current
	 * constraint list. If the constraint list does not exist, then create a constraint list and
	 * put it to the map with the key of label and value of the newly created list. 
	 * @param code
	 */
	private void analyze(Codes.Label code){
		String label = code.label;		
		//Switch the current block by setting the label with new value.
		//Create a block.
		BasicBlock blk = getBasicBlock(label);
		if(blk == null){
			blk = createBasicBlock(label, BlockType.BLOCK);
		}		

		if(!isGoto){
			getCurrentBlock().addChild(blk);
		}

		//Switch the current block
		setCurrentBlock(blk);
		isGoto = false;
	}




	/**
	 * Add the 'equal' constraints of the target and operand register.
	 * @param code
	 */
	private void analyze(Codes.NewList code){		
		if(isIntType(code.type())){
			for(int operand: code.operands()){
				addConstraint(new Union("%"+code.target(), "%"+operand));				
			}
		}


	}

	/**
	 * Parse the 'return' bytecode and add the constraint 
	 * @param code
	 */
	private void analyze(Codes.Return code){		
		//Get the return operand
		String ret = "%"+code.operand;
		BasicBlock blk = getCurrentBlock();
		//Check if the return type is integer.
		if(isIntType(code.type)){
			//Add the 'Equals' constraint to the return (ret) variable.
			//blk.addConstraint((new Assign("return", ret)));
			blk.addConstraint((new Equals("return", ret)));
		}		
		//Connect the current block with exit block.		
		blk.addChild(getBasicBlock("exit", BlockType.EXIT));
		setCurrentBlock(null);
		isGoto = true;
	}

	private void analyze(Codes.ListOperator code){		
		switch(code.kind){
		case APPEND:
			for(int operand : code.operands()){
				addConstraint(new Equals("%"+code.target(), "%"+operand));
			}
			break;
		case LEFT_APPEND:

			break;
		case RIGHT_APPEND:

			break;
		default:
			internalFailure("Not implemented!", "Analyzer.java", null);
			break;
		}



	}


	/**
	 * Parse 'Unary Operator' bytecode and add the constraints in accordance with operator kind.
	 * For example, add the 'Negate' constraint for the negated operator.
	 * 
	 * @param code
	 */
	private void analyze(Codes.UnaryOperator code){
		UnaryOperatorKind kind = code.kind;
		String x = "%"+code.operand(0);
		String y = "%"+code.target();
		//
		switch(kind){
		case NEG:
			addConstraint(new Negate(x, y));
			break;
		case NUMERATOR:
			System.err.println("Not implemented!");
			break;
		case DENOMINATOR:
			System.err.println("Not implemented!");
			break;
		default:
			System.err.println("Not implemented!");
			break;

		}

	}

	/**
	 * Parses the 'ForAll' bytecode and adds the assign constraint, e.g. <br>
	 * <code>forall %5 in %0 () : [int]</code>
	 * adds the constraint '%5 = %0', which propagates the bounds from %0 to %5.
	 * @param code the <code>Codes.Forall</code> bytecode
	 */
	private void analyze(Codes.ForAll code){		
		String label = code.target;
		//Creates a loop structure, including the loop header, loop body and loop exit
		BasicBlock loopheader = createBasicBlock(label, BlockType.LOOP_HEADER, getCurrentBlock());
		int blk_num = Integer.parseInt(label.split("blklab")[1])+1;
		String branch = "blklab"+blk_num;
		BasicBlock loopbody = createBasicBlock(branch, BlockType.LOOP_BODY, loopheader);
		BasicBlock loopexit = createBasicBlock(branch, BlockType.LOOP_EXIT, loopheader);
		//Check if each element is an integer
		if(isIntType((Type) code.type)){			
			//Propagate the range of source register to the index reg 
			loopbody.addConstraint(new LessThanEquals("%"+code.indexOperand, "%"+code.sourceOperand));
			loopexit.addConstraint(new GreaterThan("%"+code.indexOperand, "%"+code.sourceOperand));
		}

		setCurrentBlock(loopbody);
	}

	/**
	 * Not implemented.
	 * @param code
	 */
	private void analyze(Codes.LengthOf code){		
		//addConstraintToCurrentList(new Equals("%"+code.target(), "%"+code.operand(0)));		
	}

	/**
	 * Creates a loop loop header
	 * @param code
	 */
	private void analyze(Codes.Loop code){		
		String label = code.target;
		BasicBlock loopheader = createBasicBlock(label, BlockType.LOOP_HEADER, getCurrentBlock());
		loop_condition = label;
		setCurrentBlock(loopheader);
	}

	/**
	 * 
	 * @param code
	 */
	private void analyze(Codes.LoopEnd code){
		BasicBlock loopheader = getBasicBlock(code.label, BlockType.LOOP_HEADER);
		//connect the loopheader and current blk
		BasicBlock c_blk = getCurrentBlock();
		c_blk.addChild(loopheader);

		setCurrentBlock(null);
		isGoto = true;

	}

	/**
	 * The bounds of a list/map shall be propagated from the operand to the target. 
	 * @param code
	 */
	private void analyze(Codes.SubList code){		
		if(code.type().element() instanceof Type.Int){
			for(int operand: code.operands()){
				addConstraint(new Equals("%"+code.target(), "%"+operand));
			}			
		}

	}
	/**
	 * Implemented the propagation rule for <code>Codes.BinaryOperator</code> code
	 * to add the 'equal' constraints of operands and target registers. 
	 * @param code
	 */
	private void analyze(Codes.BinaryOperator code){
		if(isIntType(code.type())){
			switch (code.kind) {
			case ADD:
				addConstraint(new RightPlus("%"+code.target(), "%"+code.operand(0), "%"+code.operand(1)));
				break;
			case SUB:			
				addConstraint(new RightPlus("%"+code.operand(0), "%"+code.target(), "%"+code.operand(1)));				
				break;
			case MUL:		
				break;
			case DIV:			
				break;			
			case REM:
				break;			
			case RANGE:
				//Take the union of operands
				for(int operand: code.operands()){
					addConstraint(new Union("%"+code.target(), "%"+operand));
				}				
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
				internalFailure("unknown binary expression encountered", "Analyzer.java", null);		
			}
		}

	}

	/**
	 * Propagate the bounds of a new Map by taking the union of values. 
	 * 
	 * @param code the <code>Codes.NewMap</code> byte-code.
	 */
	private void analyze(Codes.NewMap code){		
		Type.Map map = code.type();
		int index =1;
		while(index<code.operands().length){
			//Consider the key field
			//if(isIntType(map.key())){
			//addConstraintToCurrentList(new Union("%"+code.target(), "%"+code.operand(index)));
			//}
			//index++;

			//Consider The values field
			if(isIntType(map.value())){
				addConstraint(new Union("%"+code.target(), "%"+code.operand(index)));
			}
			index+=2;
		}


	}

	/**
	 * Load the tuple values at the given index and assign the bounds of the operand to the target.
	 * @param code
	 */
	private void analyze(Codes.TupleLoad code){
		//Check if the index is that of value field (1).
		int index = code.index;
		if(index%2==1){
			Type.Tuple tuple = (Tuple) code.type();
			if(isIntType(tuple.element(index))){
				addConstraint(new Equals("%"+code.target(), "%"+code.operand(0)));
			}
		}

	}

	/**
	 * Take the union of bounds from operands and target
	 * @param code
	 */
	private void analyze(Codes.NewTuple code){

		//Assing the bounds of value field to the target
		Type.Tuple tuple = code.type();
		int index = 1;
		while(index<code.operands().length){
			if(isIntType(tuple.element(index))){
				addConstraint(new Union("%"+code.target(), "%"+code.operand(index)));
			}
			index+=2;
		}


	}
	/**
	 * Updates an element of a list. But how do we update the bounds??? 
	 * @param code
	 */
	private void analyze(Codes.Update code){

	}

	/**
	 * Update the current block's branch with the given target.
	 * @param code
	 */
	private void analyze(Codes.Goto code){

		//Get the label name
		String label = code.target;

		BasicBlock c_blk = getCurrentBlock();
		BasicBlock new_blk = getBasicBlock(label);
		if(new_blk == null){
			new_blk = createBasicBlock(label, BlockType.BLOCK);
		}
		c_blk.addChild(new_blk);
		//Set isGoto flag to avoid linking the next block with current block.
		isGoto = true;

		setCurrentBlock(null);
	}





}
