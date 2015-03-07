package wyopcl.translator.symbolic;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import wyc.builder.CodeGenerator;
import wyil.lang.Code;
import wyil.lang.CodeUtils;
import wyil.lang.Codes;
import wyil.lang.Codes.Assign;
import wyil.lang.Codes.Comparator;
import wyil.lang.Codes.IndexOf;
import wyil.lang.Codes.LengthOf;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Codes.BinaryOperatorKind;
import wyopcl.translator.symbolic.pattern.BuildListFirstPattern;
import wyopcl.translator.symbolic.pattern.BuildListPattern;
import wyopcl.translator.symbolic.pattern.NullPattern;
import wyopcl.translator.symbolic.pattern.Pattern;
import wyopcl.translator.symbolic.pattern.ForAllPattern;
import wyopcl.translator.symbolic.pattern.WhileLoopDecrPattern;
import wyopcl.translator.symbolic.pattern.WhileLoopIncrPattern;
import wyopcl.translator.symbolic.pattern.WhileLoopPattern;

/**
 * The abstract class for the pattern transformer. The transformer takes a pattern of one type as input, make the transformation
 * and set the resulting pattern as the output.
 * @author Min-Hsien Weng
 *
 */
public class Transformer extends Object{
	private Pattern before;
	private List<Code> result;
	
	/**
	 * Constructor for 'BuildListPattern'
	 * @param before
	 */
	public Transformer(BuildListPattern before){
		this.before = before;
		this.result = transform((BuildListPattern) this.before);
	}	

	/**
	 * Constructor 
	 * @param before the original pattern (While-Loop pattern type)
	 */
	private Transformer(WhileLoopPattern before){
		this.before = before;
		this.result = transform((WhileLoopPattern) this.before);
	}	

	/**
	 * Constructor
	 * @param before the original pattern ('WhileLoopIncrPattern' pattern type)
	 */
	private Transformer(WhileLoopIncrPattern before){
		this((WhileLoopPattern)before);
	}	
	/**
	 * Constructor.
	 * @param before the original pattern ('WhileLoopDecrPattern' pattern type)
	 */
	private Transformer(WhileLoopDecrPattern before){
		this((WhileLoopPattern)before);
	}

	/**
	 * Transform the WhileLoop pattern to the 'forall' pattern. The transformation can be expressed as below:
	 *		A; v=I; B; while (v > L) { C; v = u; D} E => A; B; for v in range (I, L) {C; D} E
	 *		where:
	 *		A, B, C, D, E is the list of code.
	 *		v is the loop variable.
	 *		u is the update of loop variable.
	 *		I is the initial value.
	 *		L is the loop lower bound.	
	 */
	private List<Code> transform(WhileLoopPattern p) {

		//Store all the bytecode for the new pattern.
		List<Code> blk = new ArrayList<Code>();	
		//Add the code in the 'init_before'
		blk.addAll(p.getPartByName("init_before"));
		//Add the code in the 'init_after'
		blk.addAll(p.getPartByName("init_after"));
		//Get the loop var
		int loop_var = Integer.parseInt(p.loop_var.replace("%", ""));

		//Create a forall bytecode that requires the loop var and range.

		//Get the init var bytecode
		List<Code> init = p.getPartByName("init"); 
		Codes.Assign init_assign = (Codes.Assign) init.get(0);
		//Get the loop condition
		List<Code> loop_header = p.getPartByName("loop_header");
		Codes.Loop loop = (Codes.Loop)loop_header.get(0);
		Codes.If loop_bound = (Codes.If)loop_header.get(1);
		Codes.BinaryOperator binOp;
		//Construct the range = (init, loop_bound)
		binOp = Codes.BinaryOperator(init_assign.type(),  p.factory.getAvailableReg(),
				init_assign.operand(0), loop_bound.rightOperand, BinaryOperatorKind.RANGE);
		blk.add(binOp);

		Collection<Integer> modifiedOp = new ArrayList<Integer>();
		modifiedOp.add(loop.modifiedOperands[1]);

		//Create the forall bytecode
		Codes.ForAll forall
		= Codes.ForAll(Type.List(init_assign.type(), false),
				binOp.target(),
				loop_var,
				modifiedOp,
				loop.target);
		blk.add(forall);		

		blk.addAll(p.getPartByName("loopbody_before"));
		blk.addAll(p.getPartByName("loopbody_after"));
		blk.addAll(p.getPartByName("loopbody_exit"));

		return blk;
	}
	
	/**
	 * Transform the 'BuildListPattern' to 'BuildListFirstPattern'.
	 * BuidListPattern has 'init_before', 'init', 'list_init', 'init_after', 'loop_header', 'loopbody_before', 'loopbody_update', 'list_update_before'
	 * 'list_update', 'loopbody_after', 'loop_exit' and 'return'.
	 * 
	 * BuildListFirstPattern has 'init_before', 'init', 'list_init', 'init_after', 'loop_header', 'loopbody_before', 'loopbody_update', 'list_update_before'
	 * 'list_update', 'list_size_update', 'loopbody_after', 'loop_exit' 'list_assertion' and 'return'.
	 * 
	 * The parts that require change are 'list_init', 'loop_header', 'list_update' and 'list_size_update'.
	 * The new parts are 'list_size_init' and 'list_assertion'.
	 * 
	 * @param p the 'BuildListPattern'
	 * @return the list of transformed code.
	 */
	public List<Code> transform(BuildListPattern p){		
		//Store all the bytecode for the new pattern.
		List<Code> blk = new ArrayList<Code>();	
		blk.addAll(p.getPartByName("init_before"));
		blk.addAll(p.getPartByName("init"));
		//Make change to the 'list_init' part
		List<Code> list_init = p.getPartByName("list_init");
		//Add the list_capacity, e.g lengthof %6 = %0 : [int]
		//This lengthof bytecode is referred to 'init_before' part.
		Codes.LengthOf lengthof = (LengthOf) p.getPartByName("init_before").get(0);
		//The register of existing list
		int reg_existing_list = lengthof.operand(0);
		int reg_list_capacity = p.factory.getAvailableReg();
		blk.add(Codes.LengthOf(lengthof.type(), reg_list_capacity, reg_existing_list));
		
		//Get the list_var from list_init part
		Codes.Convert list = (Codes.Convert)list_init.get(1);
		int reg_list = list.target();
		//Create an Assign byte-code 
		blk.add(Codes.Assign(list.result, list.target(), reg_existing_list));
		
		//Add the new 'list_size_init'
		int reg_zero = p.factory.getAvailableReg();
		blk.add(Codes.Const(reg_zero, Constant.V_INTEGER(BigInteger.ZERO)));
		int reg_list_size = p.factory.getAvailableReg();
		blk.add(Codes.Assign(Type.Int.T_INT, reg_list_size, reg_zero));
		
		//Add all the code in 'init_after'
		blk.addAll(p.getPartByName("init_after"));
		
		//Get the loop header
		List<Code> loop_header = p.getPartByName("loop_header");
		Codes.Loop loop = (Codes.Loop)loop_header.get(0);		
		
		//Convert the array to int[]
		int[] modifiedOps = new int[loop.modifiedOperands.length+1];
		int index;
		for(index=0; index<loop.modifiedOperands.length; index++){
			modifiedOps[index]= loop.modifiedOperands[index];
		}
		modifiedOps[index]=reg_list_size;
		
		//Create a new loop byte-code with loop var, list_var and list_size
		blk.add(Codes.Loop(loop.target, modifiedOps));
		
		//Add the loop condition
		blk.add(loop_header.get(1));
		blk.addAll(p.getPartByName("loopbody_before"));
		blk.addAll(p.getPartByName("loopbody_update"));
		blk.addAll(p.getPartByName("list_update_before"));
		
		//Change the list_update part
		List<Code> list_update = p.getPartByName("list_update");
		//Get the existing indexof bytecode
		Codes.IndexOf indexof = (IndexOf) list_update.get(0);
		blk.add(indexof);
		int eleOp = indexof.target();
		//Get the assignment of list
		Codes.Assign list_assign = (Assign) list_update.get(list_update.size()-1);
		Collection<Integer> operands = new ArrayList<Integer>();
		operands.add(reg_list_size);
		//Create an update byte-code, update %7[%9] = %32 : [int] -> [int]
		blk.add(Codes.Update(list_assign.type(), list_assign.target(), operands, eleOp, list_assign.assignedType(), new ArrayList<String>()));
		//Add the 'list_size_update' part
		//Create an constant 1, const %34 = 1 : int 
		int reg_one = p.factory.getAvailableReg();
		blk.add(Codes.Const(reg_one, Constant.Integer.V_INTEGER(BigInteger.ONE)));
		//Create a binary operator to add the list_size to one, add %35 = %9, %34 : int
		int reg_add_list_size = p.factory.getAvailableReg();
		blk.add(Codes.BinaryOperator(Type.Int.T_INT, reg_add_list_size, reg_list_size, reg_one, BinaryOperatorKind.ADD));
		//Assign the above result to the list_size
		blk.add(Codes.Assign(Type.Int.T_INT, reg_list_size, reg_add_list_size));

		blk.addAll(p.getPartByName("loopbody_after"));
		blk.addAll(p.getPartByName("loop_exit"));
		
		//Add the list_assertion to check if list_capacity == list_size
		String endLab = CodeUtils.freshLabel();
		blk.add(Codes.Assert(endLab));
		//Create a ifeq byte-code, ifeq %9, %6 goto blklab13 : int
		blk.add(Codes.If(Type.Int.T_INT, reg_list_size, reg_list_capacity, Comparator.EQ, endLab));
		blk.add(Codes.Fail("assertion failed"));
		blk.add(Codes.Label(endLab));
		
		blk.addAll(p.getPartByName("return"));
		
		return blk;
	}
	
	
	/**
	 * Get the original pattern.
	 * @return
	 */
	public Pattern getBeforePattern(){
		return this.before;
	}

	public List<Code> getResult() {
		return result;
	}


	/*
	 *//**
	 * Construct  the 'init_pre' and 'init' parts  from one pattern type to another.
	 * @param p1
	 * @param loop_var
	 * @param blk
	 * @return
	 *//*
	private Codes.Assign getInitAssign(Pattern p, int loop_var, List<Code> blk){
		//Put all the other code in the p's loop header into the code block.
		for(Code code: p.getPartByName("loop_header")){
			if(!(code instanceof Codes.Loop)){
				if(code instanceof Codes.If){
					Codes.If if_code = (Codes.If)code;
					//Get the comparing operand
					if(loop_var==if_code.leftOperand){
						//Construct an assignment for loop variable 
						return Codes.Assign(if_code.type, loop_var, if_code.rightOperand);	
					}else if(loop_var == if_code.rightOperand){
						//Construct an assignment for loop variable 
						return Codes.Assign(if_code.type, loop_var, if_code.leftOperand);
					}
				}
				blk.add(code);
			}
		}		
		return null;
	}


	  *//**
	  * Construct the loop condition from one pattern type to another
	  * @param p pattern
	  * @param loop_var the loop variable
	  * @param blk the code block
	  * @return the bytecode of loop condition.
	  *//*
	private Codes.If getLoopCondition(Pattern p, int loop_var, List<Code> blk){
		List<Code> loop_header = p.getPartByName("loop_header");
		Codes.Loop loop = (Codes.Loop)loop_header.get(0);
		//Add the loop bytecode
		blk.add(loop);
		//Add all the code in the 'init_before'
		blk.addAll(p.getPartByName("init_before"));
		//Get the initial assignment code 
		int init_assignOp = ((Codes.Assign) p.getPartByName("init").get(0)).operand(0);
		Codes.If condition = (Codes.If) loop_header.get(loop_header.size()-1);
		switch (condition.op){
		case LTEQ:
			return Codes.If(Type.Int.T_INT, loop_var, init_assignOp, Comparator.GTEQ, condition.target);
		case LT:
			return Codes.If(Type.Int.T_INT, loop_var, init_assignOp, Comparator.GT, condition.target);
		case GTEQ:
			return Codes.If(Type.Int.T_INT, loop_var, init_assignOp, Comparator.LTEQ, condition.target);
		case GT:
			return Codes.If(Type.Int.T_INT, loop_var, init_assignOp, Comparator.LT, condition.target);
		default:
			return null;
		}
	}

	   *//**
	   * Get the increment for P2 pattern or the decrement for P1
	   * @param p1
	   * @param loop_var
	   * @param blk
	   * @return
	   *//*
	private Codes.BinaryOperator getIncrOrDecr(Pattern p, int loop_var, List<Code> blk){
		List<Code> loopbody_before = p.getPartByName("loopbody_before");
		Codes.BinaryOperator binOp = (Codes.BinaryOperator)loopbody_before.get(loopbody_before.size()-1);
		switch(binOp.kind){
		case ADD:
			//Construct a 'sub' bin
			return Codes.BinaryOperator(binOp.type(), binOp.target(), binOp.operand(0), binOp.operand(1), BinaryOperatorKind.SUB);
		case SUB:
			//Construct a 'add' binOp
			return Codes.BinaryOperator(binOp.type(), binOp.target(), binOp.operand(0), binOp.operand(1), BinaryOperatorKind.ADD);
		default:
			return null;	
		}		
	}*/


	/**
	 * Transform the WhileLoop pattern to the 'forall' pattern. The transformation can be expressed as below:
	 *		A; v=I; B; while (v > L) { D; v = u; E} => A; B; for v in range (I, L) {D; E}
	 *		where:
	 *		A, B, D, E is the list of code.
	 *		v is the loop variable.
	 *		I is the initial value.
	 *		L is the loop lower bound. 
	 *		u is the update of loop variable.
	 * @param p
	 * @return
	 *//*
	public List<Code> transformWhileToForAll(WhileLoopPattern p){
		//Store all the bytecode for the new pattern.
		List<Code> blk = new ArrayList<Code>();	
		//Add the code in the 'init_before'
		blk.addAll(p.getPartByName("init_before"));
		//Add the code in the 'init_after'
		blk.addAll(p.getPartByName("init_after"));
		//Create a forall bytecode that requires the loop var and range.

		//Construct the range
		//Get the loop var
		int loop_var = Integer.parseInt(p.V.replace("%", ""));
		//Get the init var bytecode
		Codes.Assign assign = (Codes.Assign) p.getPartByName("init").get(0);
		int leftOperand = assign.operand(0);
		//Get the loop condition
		List<Code> loop_header = p.getPartByName("loop_header");
		//Take out the first and last bytecode, put the remaining code into the code block.
		int index=1;
		while(index<loop_header.size()-1){
			Code code = loop_header.get(index);
			blk.add(code);
			index++;
		}

		Codes.If loop_condition = (Codes.If)loop_header.get(loop_header.size()-1);
		int rightOperand;
		if(loop_var == loop_condition.leftOperand){
			rightOperand = loop_condition.rightOperand;		
		}else{
			rightOperand = loop_condition.leftOperand;
		}
		int target = p.factory.getAvailableReg();
		Codes.BinaryOperator binOp = Codes.BinaryOperator(assign.type(),
				target,
				leftOperand,
				rightOperand, 
				BinaryOperatorKind.RANGE);
		blk.add(binOp);


		Collection<Integer> modifiedOp = new ArrayList<Integer>();
		Codes.Loop loop = (Codes.Loop)loop_header.get(0);
		modifiedOp.add(loop.modifiedOperands[1]);

		//Create the forall bytecode
		Codes.ForAll forall = Codes.ForAll(Type.List(assign.type(), false),
				target,
				loop_var,
				modifiedOp,
				loop.target);
		blk.add(forall);
		blk.addAll(p.getPartByName("loopbody_before"));
		blk.addAll(p.getPartByName("loopbody_after"));
		blk.addAll(p.getPartByName("loopbody_exit"));
		return blk;
	}
	  */
	/**
	 * Transform the pattern of P1 or P2 type to the other type.
	 * @param pattern
	 * @return
	 *//*
	private Pattern transformbetweenWhileLoopIncrToDecr(Pattern p){
		//No transformation 
		if(p instanceof NullPattern || !(p instanceof WhileLoopPattern)) return p;


		//Store all the bytecode for the new pattern.
		List<Code> blk = new ArrayList<Code>();		
		//Get the loop var
		int loop_var = Integer.parseInt(p.V.replace("%", ""));
		blk.add(getInitAssign(p, loop_var, blk));
		//Get the 'init_after'
		blk.addAll(p.getPartByName("init_after"));			

		//Get the loop header
		blk.add(getLoopCondition(p, loop_var, blk));

		//Add the code in the 'loopbody_pre'
		List<Code> loopbody_pre = p.getPartByName("loopbody_before");
		int index;
		for(index=0;index<loopbody_pre.size()-1;index++){
			blk.add(loopbody_pre.get(index));
		}

		//Get the increment or decrement
		blk.add(getIncrOrDecr(p, loop_var, blk));
		//Add the loop_decr
		blk.addAll(p.getPartByName("loopbody_update"));
		blk.addAll(p.getPartByName("loopbody_after"));
		blk.addAll(p.getPartByName("loop_exit"));
		//For debugging
		if(config.isVerbose()){
			for(Code code: blk){
				System.out.println(code);
			}
		}
		//Analyze the transformed list of code.
		return analyzePattern(p.param_size, blk);
	}*/


}
