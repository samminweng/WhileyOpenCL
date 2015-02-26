package wyopcl.translator.symbolic.pattern;

import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.Codes.Comparator;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.expression.Expr;
import wyopcl.translator.symbolic.expression.LinearExpr;
/**
 * The while-loop pattern searches for the loop condition and split the list of code into
 * 'init_after', 'loop_header'
 * 'loopbody_update', 'loopbody_after' and 'loop_exit' parts. 
 * 
 * @author Min-Hsien Weng
 *
 */
public abstract class WhileLoopPattern extends LoopPattern{
	//Expressions related to the loop condition.
	public String comparatorOp;
	public LinearExpr loop_bound;

	public WhileLoopPattern(Configuration config, List<Type> params, List<Code> blk) {
		super(config, params, blk);
		this.type = "WhileLoop";
		//Check if the loop var is inferred
		if(this.init != null){
			//this.init = init(blk, this.loop_var, this.line);
			this.loop_bound = while_cond(blk, this.loop_var, this.line);
		}		
	}

	
	/**
	 * Output a canonical loop condition from a if bytecode.
	 * That is that the loop variable is on the left and the comparing op is on the right.  
	 * @param before_code the original if byte-code
	 * @param loop_var the loop variable
	 * @return the if byte-code in a canonical form. If the bytecode is not about the loop var, then return null;
	 */
	private Codes.If standardizeLoopCondition(Codes.If before_code, String loop_var){
		//Check if the loop exist in left or right
		if(!loop_var.equals(prefix+before_code.rightOperand) 
				&& !loop_var.equals(prefix+before_code.leftOperand)){
			return null;
		}
		//Check if the loop var is on the right-hand side of the condition. If not, then
		//This bytecode does not need any transformation.
		if(loop_var.equals(prefix+before_code.rightOperand)){
			//Change the comparing operator
			Comparator new_op = null;
			switch(before_code.op){
			case LTEQ:
				new_op = Comparator.GTEQ;
				break;
			case LT:
				new_op = Comparator.GT;
				break;
			case GTEQ:
				new_op = Comparator.LTEQ;
				break;
			case GT:
				new_op = Comparator.LT;
				break;
			default:
				break;
			}
			
			if(new_op != null){
				//The loop var is on the right.
				return Codes.If(before_code.type,
						before_code.rightOperand, 
						before_code.leftOperand, 
						new_op,
						before_code.target);
			}			
		}

		return before_code;
	}



	/**
	 * Get the lower or upper bound of loop condition.
	 * @param loop_var the loop variable
	 * @param compareOp the type of comparator 
	 * @return the expression of bound.
	 */
	protected LinearExpr while_cond(List<Code> code_blk, String loop_var, int line) {
		LinearExpr loop_bound = null;
		int index = line;
		//Search for the loop condition
		while(index< code_blk.size()){
			Code code = code_blk.get(index);
			index++;
			//Search for loop bytecode
			if(!checkAssertOrAssume(code)&&code instanceof Codes.Loop){
				//Check if the loop variable is used in the loop
				if(loop_var.equals(prefix+((Codes.Loop)code).modifiedOperands[0])){
					//Stop the iteration.
					//Add the code to loop header	
					AddCodeToPatternPart(code, "loop_header");
					break;
				}
			}
			AddCodeToPatternPart(code, "init_after");
		}
		
		//Search for the loop condition
		while(index< code_blk.size()){
			Code code = code_blk.get(index);
			index++;
			//Search for the loop condition and put it into the 'loop_header'.
			if(!checkAssertOrAssume(code)){
				if(code instanceof Codes.If){
					Codes.If if_code = (Codes.If)code;
					if_code = standardizeLoopCondition(if_code, loop_var);
					//Check if the bytecode is the loop condition.					
					if(if_code != null){					
						String cop = prefix+if_code.rightOperand;
						if(if_code.op.equals(Comparator.LTEQ) ){
							comparatorOp = ">";													
						}else if(if_code.op.equals(Comparator.LT)){
							comparatorOp = ">=";
						}else if(if_code.op.equals(Comparator.GTEQ)){
							comparatorOp = "<";
						}else if(if_code.op.equals(Comparator.GT)){
							comparatorOp = "<=";
						}else{
							//Do nothing
						}
						//Get the expression
						loop_bound = (LinearExpr) factory.getExpr(cop);
						//Add the code to loop header	
						AddCodeToPatternPart(if_code, "loop_header");
						break;	
					}
				}
			}
			//Add the other code to the init_after
			AddCodeToPatternPart(code, "init_after");
			
		}

		this.line = index;
		return loop_bound;
	}


}
