package wyopcl.translator.symbolic.pattern.transform;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.Codes.BinaryOperatorKind;
import wyopcl.translator.symbolic.pattern.BuildListPattern;
import wyopcl.translator.symbolic.pattern.Pattern;
import wyopcl.translator.symbolic.pattern.WhileLoopDecrPattern;
import wyopcl.translator.symbolic.pattern.WhileLoopIncrPattern;
import wyopcl.translator.symbolic.pattern.WhileLoopPattern;
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
public class WhileLoopIncrPatternTransformer extends Transformer {

	public WhileLoopIncrPatternTransformer(){

	}

	
	/**
	 * Takes a 'WhileLoopIncrPattern' as input and outputs a list of byte-code that matches
	 * with 'ForallPattern'.
	 * @param p
	 * @return
	 */
	private List<Code> transform(WhileLoopIncrPattern p){

		List<Code> blk = new ArrayList<Code>();//Store all the bytecode for the new pattern.

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
	 * Check if the input pattern is an instance of 'WhileLoopIncrPattern' pattern.
	 * If so, then perform pattern transformation. This generalizes the pattern transformation.
	 * For example, the extra argument can be added to this function to allow the pattern
	 * transformer to transform a while-loop pattern into another pattern.
	 * 
	 * @param pattern
	 * @return
	 */
	@Override
	public List<Code> transform(Pattern pattern) {
		if(!(pattern instanceof WhileLoopIncrPattern)) return null;
		return transform((WhileLoopIncrPattern)pattern);
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
