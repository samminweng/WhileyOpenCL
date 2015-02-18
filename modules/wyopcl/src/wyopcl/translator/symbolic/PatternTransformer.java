package wyopcl.translator.symbolic;

import java.util.ArrayList;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.Codes.BinaryOperatorKind;
import wyil.lang.Codes.Comparator;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.pattern.NullPattern;
import wyopcl.translator.symbolic.pattern.Pattern;
import wyopcl.translator.symbolic.pattern.WhileLoopPattern;

public class PatternTransformer {
	private final Configuration config;
	
	public PatternTransformer(Configuration config){
		this.config = config;
	}	
	
	/**
	 * Construct  the 'init_pre' and 'init' parts  from one pattern type to another.
	 * @param p1
	 * @param loop_var
	 * @param blk
	 * @return
	 */
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


	/**
	 * Construct the loop condition from one pattern type to another
	 * @param p pattern
	 * @param loop_var the loop variable
	 * @param blk the code block
	 * @return the bytecode of loop condition.
	 */
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

	/**
	 * Get the increment for P2 pattern or the decrement for P1
	 * @param p1
	 * @param loop_var
	 * @param blk
	 * @return
	 */
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
	}
	
	
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
