package wyopcl.translator.bound;


import static wycc.lang.SyntaxError.internalFailure;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Stack;
import java.util.TreeMap;

import wycc.lang.SyntaxError;
import wyil.lang.Code;
import wyil.lang.Code.Block;
import wyil.lang.Codes;
import wyil.lang.Codes.Assert;
import wyil.lang.Codes.UnaryOperatorKind;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Type.Record;
import wyil.lang.WyilFile;
import wyil.lang.Type.Tuple;
import wyil.lang.WyilFile.Case;
import wyil.lang.WyilFile.FunctionOrMethodDeclaration;
import wyopcl.translator.Configuration;
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
import wyopcl.translator.bound.constraint.Plus;
import wyopcl.translator.bound.constraint.Range;
import wyopcl.translator.bound.constraint.Union;
/***
 * A class to store all the constraints produced in the wyil file and infer the bounds consistent
 * with all the constraints. The class variables 'constraintListMap' and 'label' have only one instance.
 * 
 * 
 * This class is implemented with <a href="http://www.tutorialspoint.com/design_pattern/abstract_factory_pattern.htm">Factory design pattern</a>
 *    
 * @author Min-Hsien Weng
 *
 */
public class BoundAnalyzer {
	private final Configuration config;
	private final FunctionOrMethodDeclaration functionOrMethod;
	private final WyilFile module;
	private final String GRAY = (char)27 +"[30;1m";
	private final String BLUE = (char)27 +"[34;1m";
	private final String RED = (char)27 + "[31;1m";
	private final String RESET = (char)27 + "[0m";	
	private final String prefix = "%";

	//The boolean flag is used to show whether the code is inside an assertion or assumption.	
	private String assertOrAssume_label;
	private final int depth;
	//The variables are used in the control flow graph (CFG).	
	private BasicBlock current_blk;		
	//The list of basic block;
	private List<BasicBlock> list;
	//The label name of the loop condition
	private String loop_condition;
	private class BoundChange{
		private String name;
		private boolean isUBIncreasing = false;
		private boolean isLBDecreasing = false;
		public BoundChange(String name){
			this.name = name;
			this.isUBIncreasing = false;
			this.isLBDecreasing = false;
		}
		
		public boolean isUBIncreasing() {
			return isUBIncreasing;
		}

		public void setUBIncreasing(boolean isIncreasing) {
			this.isUBIncreasing = isIncreasing;
		}

		public boolean isLBDecreasing() {
			return isLBDecreasing;
		}

		public void setLBDecreasing(boolean isDecreasing) {
			this.isLBDecreasing = isDecreasing;
		}		
	}	
	//A list of loop variables.
	private HashMap<String, BoundChange> loop_variables;
	private boolean isGoto;
	private final PrintWriter writer;

	//The symbol table of variables
	private HashMap<String, Symbol> symbols;
	//The line number
	private int line;

	private void initialize(){
		//Initialize the variables
		this.list = new ArrayList<BasicBlock>();
		this.assertOrAssume_label = null;
		this.symbols = new HashMap<String, Symbol>();
		//Initialize
		//this.entry = createBasicBlock("entry", BlockType.ENTRY);
		createBasicBlock("exit", BlockType.EXIT);
		//this.exit = createBasicBlock("exit", BlockType.EXIT);
		this.current_blk = createBasicBlock("entry", BlockType.ENTRY);
		this.loop_variables = new HashMap<String, BoundChange>();
		this.isGoto = false;
		this.line = 0;
	}


	public BoundAnalyzer(int depth,
			Configuration config,
			FunctionOrMethodDeclaration functionOrMethod,
			WyilFile module,
			PrintWriter writer){
		this.depth = depth;
		this.config = config;
		this.functionOrMethod = functionOrMethod;
		this.module = module;
		this.writer = writer;
		initialize();		
	}

	private String castDeclarationtoString(FunctionOrMethodDeclaration functionOrMethod){
		String declaration ="";
		declaration += functionOrMethod.type().ret() + " "+functionOrMethod.name()+"(";
		if(!functionOrMethod.name().equals("main")){			
			boolean isFirst = true;
			int index=0;
			for(Type paramType : functionOrMethod.type().params()){
				//input parameter
				if(isFirst){
					declaration += paramType+" "+prefix+index;
				}else{
					declaration += ", "+paramType+ " "+prefix+index;
				}
				isFirst = false;
				index++;
			}		
		}else{
			boolean isFirst = true;
			Type.Record paramType = (Type.Record) functionOrMethod.type().params().get(0);
			for(Entry<String, Type> entry :paramType.fields().entrySet()){
				if(isFirst){
					declaration += entry.getValue() + " "+entry.getKey();
				}else{
					declaration += ", " +entry.getValue() + " "+entry.getKey();
				}
				isFirst = false;
			}			
		}
		declaration +=")";
		return declaration;
	}


	/**
	 * Iterate each bytecode
	 * @param analyzer
	 * @param functionOrMethod
	 */
	public void iterateByteCode(){		
		//Print the function declaration
		writer.println(castDeclarationtoString(functionOrMethod));
		for(Case mcase : functionOrMethod.cases()){
			createEntryNode(functionOrMethod.type().params());
			//Parse each byte-code and add the constraints accordingly.
			for(Block.Entry entry :mcase.body()){
				//Get the Block.Entry
				line = printWyILCode(entry.code, functionOrMethod.name(), line);
				dispatch(entry);				
			}
		}
	}


	private void createEntryNode(Type paramType, String param, BigInteger min, BigInteger max){
		if(isIntType(paramType)){
			getCurrentBlock().addBounds(param, min, max);
		}
	}

	/**
	 * Creates the entry node
	 * @param paramTypes
	 */
	private void createEntryNode(List<Type> paramTypes){
		int index = 0;
		for(Type paramType: paramTypes){
			createEntryNode(paramType, prefix+index, null, null);
			index++;
		}
		//Create the default basic block and adds it to the child of entry node.
		BasicBlock blk = createBasicBlock("code", BlockType.BLOCK, getCurrentBlock());
		setCurrentBlock(blk);
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
	private int printWyILCode(Code code, String name, int line){
		//Print out the bytecode with the format (e.g. 'main.9 [const %12 = 2345 : int]')
		String font_color_start = "";
		String font_color_end = "";
		//Use the ANSI escape color to distinguish the set of bytecode of the assertion.
		if(assertOrAssume_label != null){
			font_color_start = GRAY;
			font_color_end = RESET;
		}
		if(code instanceof Codes.Label){
			//System.out.println(font_color_start+name+"."+line+"."+depth+" ["+code+"]"+font_color_end);
			writer.println(font_color_start+name+"."+line+" ["+code+"]"+font_color_end);
		}else{
			//System.out.println(font_color_start+name+"."+line+"."+depth+" [\t"+code+"]"+font_color_end);
			writer.println(font_color_start+name+"."+line+" [\t"+code+"]"+font_color_end);
		}
		return ++line;
	}	

	/**
	 * Print out the bounds.
	 * @param func_name the name of function or method
	 * @param bnd the bounds
	 * @param isEnd indicates whether it is called at the end of function.
	 */
	private void printBounds(Bounds bnd, boolean isEnd){
		if(isEnd){
			writer.print("Bounds at the end of function "+functionOrMethod.name()+":\n");
		}else{
			writer.print("Bounds at the "+(line-1)+"th line number of function "+functionOrMethod.name()+":\n");
		}

		//Sort the symbol tables		
		List<Symbol> sortedSymbols = new ArrayList<Symbol>(symbols.values());
		Collections.sort(sortedSymbols);
		//Print out the type
		/*for(Symbol symbol : sortedSymbols){
			String str_symbols = "";
			String name = symbol.getName();
			//get the 'type' attribute
			Type type = (Type) symbol.getAttribute("type");						
			//print the 'size' att
			str_symbols += "\ttype("+name+")\t= "+type+"\n";			
			System.out.print(str_symbols);
		}*/

		//Print out the bounds
		for(Symbol symbol : sortedSymbols){
			String str_symbols = "";
			String name = symbol.getName();
			if(bnd.isExisting(name)){
				Domain d = bnd.getDomain(name);
				str_symbols+="\t"+d+"\n";
			}			
			if(!str_symbols.equals("")){
				writer.print(str_symbols);
			}
		}

		//Print out the values of available variables
		for(Symbol symbol : sortedSymbols){
			String str_symbols = "";
			String name = symbol.getName();					
			//print the 'value' attribute
			Object val = symbol.getAttribute("value");
			if(val != null){
				str_symbols += "\tvalue("+name+")\t= "+val+"\n";
			}

			if(!str_symbols.equals("")){
				writer.print(str_symbols);
			}
		}

		//Print out the size of available variables
		for(Symbol symbol : sortedSymbols){
			String str_symbols = "";
			String name = symbol.getName();
			//get the 'type' attribute
			Type type = (Type) symbol.getAttribute("type");						
			//print the 'size' att
			if(type instanceof Type.List){
				Object size = symbol.getAttribute("size");
				str_symbols += "\tsize("+name+")\t= "+size+"\n";
			}
			if(!str_symbols.equals("")){
				writer.print(str_symbols);
			}
		}
		sortedSymbols = null;
		writer.println("Consistency="+bnd.checkBoundConsistency());		
	}

	
	/**
	 * Infer the bounds for a block. 
	 * @param blk the target block.
	 * @param isChanged the bound
	 * @param iteration the iteration number.
	 * @return true if bounds are unchanged. Otherwise, return false.
	 */
	private boolean inferBlockBounds(BasicBlock blk, boolean isChanged, int iteration){
		Bounds bnd_before = null, bnd_after = null;
		//Before the bound inference
		//The bound before bound inference. 
		if(blk.getType().equals(BlockType.LOOP_BODY)){
			bnd_before = (Bounds) blk.getBounds().clone();		
		}
		//If bounds remain unchanged, then isChanged = true.
		isChanged |= blk.inferBounds();	

		if(blk.getType().equals(BlockType.LOOP_BODY)){
			bnd_after = (Bounds) blk.getBounds().clone();
			//check loop variable is increasing
			for(String loop_var: loop_variables.keySet()){			
				//Upper bounds
				BigInteger upper_before = bnd_before.getUpper(loop_var);
				BigInteger upper_after = bnd_after.getUpper(loop_var);								
				BoundChange boundChange = loop_variables.get(loop_var);
				if(upper_before!= null && upper_after!=null){
					//Check if the upper bounds is increasing
					if(upper_before.compareTo(upper_after)<0){
						boolean isIncreasing = boundChange.isUBIncreasing();
						isIncreasing |= true;
						boundChange.setUBIncreasing(isIncreasing);
						loop_variables.put(loop_var, boundChange);
					}					
				}
				
				//Lower bounds
				BigInteger lower_before = bnd_before.getLower(loop_var);
				BigInteger lower_after = bnd_after.getLower(loop_var);
				if(lower_before!= null && lower_after != null){
					//Check if the lower bound is decreasing
					if(lower_before.compareTo(lower_after)>0){
						boolean isDecreasing = boundChange.isLBDecreasing();
						isDecreasing |= true;
						boundChange.setLBDecreasing(isDecreasing);
						loop_variables.put(loop_var, boundChange);
					}					
				}
				
				//After three iterations, the bounds is still increasing.
				if(iteration%3==0){
					//Widen the upper bound
					if(boundChange.isUBIncreasing()){
						if(config.isMultiWiden()){
							isChanged |= blk.getBounds().widenUpperBoundsAgainstThresholds(loop_var);
						}else{
							isChanged |= blk.getBounds().widenUpperBoundsToInf(loop_var);
						}
					}
					//Reset the increasing flag
					boundChange.setUBIncreasing(false);
					//Widen the lower bound
					if(boundChange.isLBDecreasing()){
						if(config.isMultiWiden()){
							isChanged |= blk.getBounds().widenLowerBoundsAgainstThresholds(loop_var);
						}else{
							isChanged |= blk.getBounds().widenLowerBoundsToInf(loop_var);
						}
					}
					//Reset the decreasing flag
					boundChange.setLBDecreasing(false);					
					loop_variables.put(loop_var, boundChange);
				}
			}
		}

		//Print out the bounds.
		if(config.isVerbose()){
			System.out.println(blk);
			System.out.println("isChanged="+isChanged);
		}
		return isChanged;
	}



	/**
	 * Repeatedly iterates over all blocks, starting from the entry block to the exit block,
	 * and infer the bounds consistent with all the constraints in each block.
	 * @param isEnd indicates if it is called at the end of a function.
	 * @return the bounds
	 */
	public Bounds inferBounds(boolean isEnd){
		//Sort the blks
		Collections.sort(list);
		//The least common multiple of naive (3) and graduate (12) widening strategies plus one. 
		int MaxIteration = 13;
		boolean isFixedPointed = false;
		int iteration=1;
		//Stop the loop when the program reaches the fixed point or max-iterations 
		//by using AND operator to combine these two condition.
		//If both of two cond are evaluated to be true, then enter the loop.
		while(!isFixedPointed && iteration <= MaxIteration){
			if(config.isVerbose()){
				System.out.println(BLUE+"Iteration "+iteration+" => "+RESET);
			}			
			//Initialize the isFixedPointed
			isFixedPointed = true;
			//If bounds has changed, then isChanged = false.
			boolean isChanged = false;
			//Iterate all the blocks, except Exit block.
			for(BasicBlock blk : list){
				//Take the union of all blocks for exit block
				if(!blk.getType().equals(BlockType.EXIT)){
					//Take the union of parents' bounds.
					for(BasicBlock parent: blk.getParentNodes()){						
						blk.unionBounds(parent);																		
					}					
					isChanged = inferBlockBounds(blk, isChanged, iteration);				
					//Use bitwise 'AND' to combine all the results
					isFixedPointed &= (!isChanged);	
				}
			}//End of bound inference for all constraints in all blks.	
			if(config.isVerbose()){
				System.out.println("isFixedPointed="+isFixedPointed);
			}
			iteration++;
		}
		
		//Take the union of all blocks to produce the functional result 
		BasicBlock exit_blk = getBasicBlock("exit", BlockType.EXIT);
		for(BasicBlock blk: list){
			//Consider the consistent bounds without taking into the inconsistent bounds.
			if(blk.isConsistent()&&blk.getType()!= BlockType.EXIT){
				exit_blk.unionBounds(blk);					
			}			
		}
		
		Bounds bnd = exit_blk.getBounds();
		//check the verbose to determine whether to print out the CFG
		if(config.isVerbose()){
			printCFG(functionOrMethod.name());
		}		
		printBounds(bnd, isEnd);		
		return bnd;
	}

	/**
	 * Keep track of the current basic block
	 * @return
	 */
	private BasicBlock getCurrentBlock(){
		//If the current block is null, throw out an Runtime exception
		if(current_blk == null){
			//throw new RuntimeException("Current block is null.");
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
		BasicBlock blk = getBasicBlock(label, BlockType.BLOCK);
		if(blk == null){
			//Get the block of If branch
			blk = getBasicBlock(label, BlockType.IF_BRANCH);
		}
		if(blk == null){
			//Get the block of Loop Exit
			blk = getBasicBlock(label, BlockType.LOOP_EXIT);
		}
		return blk;


	}

	/***
	 * Finds the block by the branch name and block types
	 * @param label
	 * @param type
	 * @return
	 */
	private BasicBlock getBasicBlock(String label, BlockType type){
		for(BasicBlock blk : list){
			if(blk.getBranch().equals(label)){
				if(blk.getType().equals(type)){
					return blk;
				}
			}
		}		
		return null;

	}

	/**
	 * Create a basic block with the specific label name
	 * @param label the branch name
	 * @param type the blk type
	 * @param parents the parent blk
	 * @return the blk
	 */
	private BasicBlock createBasicBlock(String label, BlockType type, BasicBlock... parents){
		BasicBlock blk = new BasicBlock(label, type);
		//Check if the block exists
		if(!list.contains(blk)){
			list.add(blk);
			BasicBlock parent = parents.length > 0 ? parents[0] : null;
			if(parent != null){
				parent.addChild(blk);
			}
			return blk;
		}else{
			for(BasicBlock block: list){
				if(blk.equals(block)){
					return block;
				}				
			}
		}
		return null;
	}	

	/**
	 * Outputs the control flow graphs.
	 * @param name
	 */
	private void printCFG(String func_name){
		//Sort the blks.
		Collections.sort(list);
		String dot_string= "digraph "+func_name+"{\n";		

		for(BasicBlock blk: list){
			if(!blk.isLeaf()){
				for(BasicBlock child: blk.getChildNodes()){
					dot_string += "\""+blk.getBranch()+" [" +blk.getType()+"]\"->\""+ child.getBranch() +" ["+child.getType() + "]\";\n";
				}
			}
		}
		dot_string += "\n}";
		//Write out the CFG-function_name.dot
		try {
			PrintWriter cfg_writer = new PrintWriter(config.getFilename()+"-"+func_name+".dot", "UTF-8");
			cfg_writer.println(dot_string);
			cfg_writer.close();
		} catch (FileNotFoundException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * Adds the constraint to the current constraint list.
	 * @param c
	 */
	private void addConstraint(Constraint c){		
		getCurrentBlock().addConstraint(c);		
	}

	/**
	 * Get the symbol info for a variable.
	 * @param name
	 * @return
	 */
	private Symbol getSymbol(String name){
		if(!symbols.containsKey(name)){
			Symbol var = new Symbol(name);
			symbols.put(name, var);
		}
		return symbols.get(name);
	}

	/**
	 * Add the variable attribute to the hashmap.
	 * @param name the variable name
	 * @param att_name the attribute name
	 * @param att_value the attribute value
	 * @return
	 */
	private void putAttribute(String name, String att_name, Object att_value){
		Symbol symbol = getSymbol(name);
		symbol.setAttribute(att_name, att_value);
	}

	public void putSymbol(String name, Symbol symbol){
		symbols.put(name, symbol);
	}

	/**
	 * Get the attribute of a variable
	 * @param name
	 * @param att_name
	 * @return the attribute value. Return null if the variable does not contain the attribute.
	 */
	private Object getAttribute(String name, String att_name){
		Symbol symbol = getSymbol(name);
		return symbol.getAttribute(att_name);
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
		//Branch out the block 
		//The left block does not have the name
		BasicBlock leftBlock = createBasicBlock(new_label, BlockType.ELSE_BRANCH, c_blk);
		BasicBlock rightBlock = createBasicBlock(new_label, BlockType.IF_BRANCH, c_blk);

		//Add the constraint to the left block
		leftBlock.addConstraint(neg_c);
		rightBlock.addConstraint(c);						
		//Set the current block to the left
		setCurrentBlock(leftBlock);
	}


	/**
	 * Branches the current block and adds the loop header, loop body and loop exit. And set the current
	 * block to the .
	 * @param new_label the name of new branch.
	 * @param c constraint
	 */
	private void createLoopStructure(String new_label, Constraint c, Constraint neg_c){
		BasicBlock c_blk = getCurrentBlock();
		//Check whether to add if-else blocks or loop-condition blocks.
		BasicBlock loop_body = createBasicBlock(new_label, BlockType.LOOP_BODY, c_blk);
		BasicBlock loop_exit = createBasicBlock(new_label, BlockType.LOOP_EXIT, c_blk);
		//put the opposite constraint to current blk(loopbody)			
		loop_body.addConstraint(neg_c);	
		//put the original constraint to the loop_exit			
		loop_exit.addConstraint(c);	
		setCurrentBlock(loop_body);
		//Reset the loop condition flag.
		loop_condition = null;
	}


	/**
	 * Checks the type of the wyil code and dispatches the code to the analyzer for
	 * being executed by the <code>analyze(code)</code> 
	 * @param entry
	 */
	private void dispatch(Block.Entry entry){		
		Code code = entry.code; 
		try{
			//Ignore the bytecode inside an assertion or assumption.
			if(assertOrAssume_label!=null&& !(code instanceof Codes.Label)){
				return;
			}			
			//Start analyzing the bytecode.
			if (code instanceof Codes.AssertOrAssume) {
				//enable the assertion
				analyze((Codes.AssertOrAssume)code);
			}else if (code instanceof Codes.Assign) {			
				analyze((Codes.Assign)code);
			} else if (code instanceof Codes.BinaryOperator) {			
				analyze((Codes.BinaryOperator)code);
			} else if (code instanceof Codes.StringOperator) {
				//StringOperatorInterpreter.getInstance().interpret((Codes.StringOperator)code, stackframe);
			} else if (code instanceof Codes.Convert) {			
				analyze((Codes.Convert)code);
			} else if (code instanceof Codes.Const) {			
				analyze((Codes.Const)code);
			} else if (code instanceof Codes.Debug) {
				//DebugInterpreter.getInstance().interpret((Codes.Debug)code, stackframe);
			} else if (code instanceof Codes.Dereference) {
				//DereferenceInterpreter.getInstance().interpret((Codes.Dereference)code, stackframe);
			} else if (code instanceof Codes.Fail) {
				//FailInterpreter.getInstance().interpret((Codes.Fail)code, stackframe);
			} else if (code instanceof Codes.FieldLoad) {		
				analyze((Codes.FieldLoad)code);			
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

		} catch (SyntaxError ex) {
			throw ex;	
		} catch (Exception ex) {		
			internalFailure(ex.getMessage(), "", entry, ex);
		}

	}


	private void analyze(Codes.AssertOrAssume code){
		assertOrAssume_label = code.target;
	}

	private void analyze(Codes.Assign code){	
		String target = prefix+code.target();
		String operand = prefix+code.operand(0);		
		putAttribute(target, "type", code.type());
		//Check if the assigned value is an integer
		if(isIntType(code.type())){
			//Add the constraint 'target = operand'			
			addConstraint(new Assign(target, operand));
		}

		if(code.type() instanceof Type.List){
			//Get the 'size' attribute from 
			BigInteger size = (BigInteger) getAttribute(operand, "size");
			putAttribute(target, "size", size);
		}


	}


	/**
	 * Parses 'Const' bytecode to add the 'Const' constraint to the list. 
	 * @param code
	 */
	private void analyze(Codes.Const code){

		Constant constant = code.constant;
		String target = prefix+code.target();
		//Add type attribute
		putAttribute(target, "type", code.assignedType());

		//Check the value is an Constant.Integer
		if(constant instanceof Constant.Integer){
			//Add the 'Const' constraint.
			BigInteger value = ((Constant.Integer)constant).value;
			addConstraint(new Const(target, value));
			putAttribute(target, "value", value);
		}
		
		if(constant instanceof Constant.List){
			List<Constant> list = ((Constant.List)constant).values;
			putAttribute(target, "value", list);
			putAttribute(target, "size", BigInteger.valueOf(list.size()));
		}
		

	}
	/**
	 * Implements the propagation rule for <code>Codes.IndexOf</code> bytecode
	 * to assign the bounds from the source operator register to the target operator.
	 * @param code
	 */
	private void analyze(Codes.IndexOf code){
		if(isIntType((Type) code.type())){
			String target = prefix+code.target();
			String op = prefix+code.operand(0);
			String index = prefix+code.operand(1);			
			addConstraint(new Equals(target, op));
		}
	}


	/**
	 * Parses the 'If' bytecode to add the constraints to the list.
	 * @param code
	 * @throws CloneNotSupportedException
	 */
	private void analyze(Codes.If code) {
		String left = prefix+code.leftOperand;
		String right = prefix+code.rightOperand;

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
		
		if(loop_condition != null){
			createLoopStructure(code.target, left_c, right_c);
		}else{
			createIfElseBranch(code.target, left_c, right_c);
		}
		
		//Instead of creating if-else branches, we put the condition to the current blk
		//	BasicBlock current_blk = getCurrentBlock();
		//	current_blk.addConstraint(left_c);				
		//}


	}

	/**
	 *Parses the invoke bytecode and adds the constraints to the list.
	 * The possible constraints include: none....
	 * @param code
	 */
	private void analyze(Codes.Invoke code){
		FunctionOrMethodDeclaration functionOrMethod = module.functionOrMethod(code.name.name(), code.type());					
		if(functionOrMethod != null){
			//Infer the bounds						
			Bounds bnd = this.inferBounds(false);
			BoundAnalyzer invokeboundAnalyzer = new BoundAnalyzer(depth+1, config, functionOrMethod, module, writer);
			int index = 0;
			//Pass the bounds of input parameters.
			for(Type paramType: functionOrMethod.type().params()){
				String param = prefix+index;
				String operand = prefix+code.operand(index);
				//Check parameter type
				if(isIntType(paramType)){
					invokeboundAnalyzer.createEntryNode(paramType, param, bnd.getLower(operand), bnd.getUpper(operand));					
				}
				//pass the symbol 
				Symbol symbol = getSymbol(operand).clone();
				//Update the name
				symbol.setName(param);
				invokeboundAnalyzer.putSymbol(param, symbol);
				index++;
			}
			invokeboundAnalyzer.iterateByteCode();						
			//Infer the bounds at the end of invoked function.
			bnd = invokeboundAnalyzer.inferBounds(true);
			String return_reg = prefix+code.target();
			Type return_type = code.type().ret();
			//put the 'type' attribute of 'return_reg'
			putAttribute(return_reg, "type", return_type);

			if(isIntType(return_type)){
				//propagate the bounds of return value.						
				addConstraint(new Range(return_reg, bnd.getLower("return"), bnd.getUpper("return")));
				//Add 'type' attribute
				putAttribute(return_reg, "type", return_type);
			}

			//Add 'size' attribute
			if(return_type instanceof Type.List){
				BigInteger size = (BigInteger) invokeboundAnalyzer.getAttribute("return", "size");
				putAttribute(return_reg, "size", size);
			}


			invokeboundAnalyzer = null;
		}
	}

	/**
	 * Parse the 'label' bytecode, get the constraint list by the label and set it to the current
	 * constraint list. If the constraint list does not exist, then create a constraint list and
	 * put it to the map with the key of label and value of the newly created list. 
	 * @param code
	 */
	private void analyze(Codes.Label code){
		String label = code.label;
		//Check and determine whether to disable the assertion.
		if(assertOrAssume_label != null){
			if(assertOrAssume_label.equals(label)){
				//Reset the value of label
				assertOrAssume_label = null;
			}						
		}else{
			//Get the target blk. If it is null, then create a new block.
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

	}

	/**
	 * Add the 'equal' constraints of the target and operand register.
	 * @param code
	 */
	private void analyze(Codes.NewList code){
		String target = prefix+code.target();
		putAttribute(target, "type", code.type());		
		if(isIntType(code.type())){
			for(int operand: code.operands()){
				addConstraint(new Union(prefix+code.target(), prefix+operand));				
			}
		}		
		//Add the 'size' attribute
		putAttribute(target, "size", BigInteger.valueOf(code.operands().length));
	}

	/**
	 * Parse the 'return' bytecode and add the constraint 
	 * @param code
	 */
	private void analyze(Codes.Return code){		
		//Get the return operand
		String retOp = prefix+code.operand;
		BasicBlock blk = getCurrentBlock();		
		//Check if the return type is integer.
		if(isIntType(code.type)){
			//Add the 'Equals' constraint to the return (ret) variable.	
			blk.addConstraint((new Assign("return", retOp)));
		}		
		Type type = code.type;
		putAttribute("return", "type", type);
		if(type instanceof Type.List){
			//Get 'size' att from ret op
			BigInteger size = (BigInteger) getAttribute(retOp, "size");
			putAttribute("return", "size", size);
		}
		//Connect the current block with exit block.		
		blk.addChild(getBasicBlock("exit", BlockType.EXIT));
		setCurrentBlock(null);
		isGoto = true;
	}

	private void analyze(Codes.ListOperator code){		
		String target = prefix+code.target();
		putAttribute(target, "type", code.type());	
		switch(code.kind){
		case APPEND:
			BigInteger size = BigInteger.ZERO;
			for(int operand : code.operands()){
				String op = prefix+operand;
				size = size.add((BigInteger) getAttribute(op, "size"));
				addConstraint(new Equals(target, prefix+operand));
			}
			//put 'size' attribute 
			putAttribute(target, "size", size);			
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
		String x = prefix+code.operand(0);
		String y = prefix+code.target();
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
			String indexOp = prefix+code.indexOperand;
			putAttribute(indexOp, "type", code.type.element());			
			String sourceOp = prefix+code.sourceOperand;			
			//Propagate the range of source register to the index reg 
			loopbody.addConstraint(new Equals(indexOp, sourceOp));
			//Do not add any constraint to loop exit.
		}

		setCurrentBlock(loopbody);
	}

	/**
	 * Add the [0..32767] range to the target register. We use the max value of
	 * short integer as the length of a list.  
	 * @param code
	 */
	private void analyze(Codes.LengthOf code){
		//Get the size att
		String op = prefix+code.operand(0);
		BigInteger size = (BigInteger) getAttribute(op, "size");
		String target = prefix+code.target();
		Type type = code.assignedType();
		//Add 'type' att
		putAttribute(target, "type", type);
		//Add 'value' att
		putAttribute(target, "value", size);
		addConstraint(new Const(target, size));		
	}

	/**
	 * Creates a loop loop header
	 * @param code
	 */
	private void analyze(Codes.Loop code){		
		String label = code.target;
		for(int op: code.modifiedOperands){
			if(!loop_variables.containsKey(prefix+op)){
				loop_variables.put(prefix+op, new BoundChange(prefix+op));
			}			
		}
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
				addConstraint(new Equals(prefix+code.target(), prefix+operand));
			}			
		}

	}
	/**
	 * Implemented the propagation rule for <code>Codes.BinaryOperator</code> code
	 * to add the 'Plus' constraints of operands and target registers. 
	 * @param code
	 */
	private void analyze(Codes.BinaryOperator code){
		String target = prefix+code.target(); 
		//Add the type att
		Type type = code.assignedType();
		putAttribute(target, "type", type);		
		if(isIntType(code.type())){
			//Get the values
			BigInteger left = (BigInteger)getAttribute(prefix+code.operand(0), "value");
			BigInteger right = (BigInteger)getAttribute(prefix+code.operand(1), "value");			
			switch (code.kind) {
			case ADD:
				//addConstraint(new Plus(target, prefix+code.operand(0), prefix+code.operand(1)));
				addConstraint(new LeftPlus(prefix+code.operand(0), prefix+code.operand(1), target));	
				break;
			case SUB:
				//target = op(0) + (- op(1)) 
				addConstraint(new Negate(prefix+code.operand(1), prefix+code.operand(1)));
				addConstraint(new Plus(target, prefix+code.operand(0), prefix+code.operand(1)));				
				break;
			case MUL:		
				break;
			case DIV:			
				break;			
			case REM:
				break;			
			case RANGE:
				//Take the union of operands
				addConstraint(new Range(target, left, right.subtract(BigInteger.ONE)));
				//Add the size att
				putAttribute(target, "size", right.subtract(left).subtract(BigInteger.ONE));				
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
			//Consider The values field
			if(isIntType(map.value())){
				addConstraint(new Union(prefix+code.target(), prefix+code.operand(index)));
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
				addConstraint(new Equals(prefix+code.target(), prefix+code.operand(0)));
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
				addConstraint(new Union(prefix+code.target(), prefix+code.operand(index)));
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

	private void analyze(Codes.FieldLoad code){
		String target = prefix+code.target();
		String record = prefix+code.operand(0);
		//add the type to the record
		putAttribute(record, "type", code.type());		
		//Target 
		putAttribute(target, "type", code.fieldType());
		putAttribute(target, "field", code.field);
	}

	private void analyze(Codes.Convert code){
		String target = prefix+code.target();
		putAttribute(target, "type", code.result);
		
		if(code.result instanceof Type.List){
			//Get the value
			
			
		}

	}



}