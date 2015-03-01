package wyopcl.translator.symbolic.pattern;

import java.math.BigInteger;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.Codes.Comparator;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.expression.Expr;
import wyopcl.translator.symbolic.expression.LinearExpr;
/**
 * The while-loop pattern gets the loop header, loop condition and loop update.
 * and splits the list of code into 'init_after', 'loop_header', 'loopbody_before' and 'loopbody_update' parts.
 * 
 * @author Min-Hsien Weng
 *
 */

public abstract class WhileLoopPattern extends LoopPattern{
	//Expressions related to the while-loop condition.
	public String comparatorOp;
	public Expr loop_bound;
	public BigInteger decr;
	public BigInteger incr;

	public WhileLoopPattern(Configuration config, List<Type> params, List<Code> blk) {
		super(config, params, blk);
		this.type = "WhileLoop";
		this.loop_bound = while_cond(blk, this.loop_var, this.line);
		if(this.loop_bound != null){
			//Simplify the expressions.
			this.loop_bound = factory.rewriteExpr(this.loop_bound);
			this.line = this.loopbody_before(blk, this.line);
			this.line = this.loopbody_update(blk, this.loop_var, this.line);
		}
	}	
	
	/**
	 * Search for the code of re-assigning values to the loop variable and put the prior code to the 'loopbody_update' part.
	 * @param blk the list of code.
	 * @param loop_var the loop variable.
	 * @param line the starting line number
	 * @return the ending line number.
	 */
	protected int loopbody_update(List<Code> blk, String loop_var, int line){
		int index = line;
		while(index<blk.size()){
			Code code = blk.get(index);
			index++;
			AddCodeToPatternPart(code, "loopbody_update");
			//Create the expression and put it into the table.
			if(!checkAssertOrAssume(code)){
				//Search for the decrement that assigns the value to the loop var.
				if(code instanceof Codes.Assign){
					//Check if the assignment bytecode is to over-write the value of loop variable.
					Codes.Assign assign = (Codes.Assign)code;
					//Check if the target is the loop variable.
					if((prefix+assign.target()).equals(loop_var)){
						//Get the increment and decrement.
						incr = factory.extractIncrement(assign, loop_var);
						decr = factory.extractDecrement(assign, loop_var);
						break;				
					}
				}
			}			
						
		}

		return index;
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
	 * Find the bytecode of loop blk and loop condition and put them into the 'loop_header'
	 * @param loop_var the loop variable
	 * @param compareOp the type of comparator 
	 * @return the expression of bound.
	 */
	protected LinearExpr while_cond(List<Code> blk, String loop_var, int line) {
		LinearExpr loop_bound = null;
		int index = line;
		//Search for the loop condition
		while(index<blk.size()){
			Code code = blk.get(index);
			index++;
			//Search for the loop condition and put it into the 'loop_header'.
			if(!checkAssertOrAssume(code)){
				if(code instanceof Codes.Loop){
					Codes.Loop loop = (Codes.Loop)code;
					//Check if the loop variable is used in the loop
					if(this.loop_label.equals(loop.target)){
						//Stop the iteration.
						AddCodeToPatternPart(code, "loop_header");
					}
				}else if(code instanceof Codes.If){
					Codes.If if_code = (Codes.If)code;
					if_code = standardizeLoopCondition(if_code, loop_var);
					//Check if the bytecode is the loop condition.					
					if(if_code != null){
						//Add the code to loop header	
						AddCodeToPatternPart(if_code, "loop_header");
						String cop = prefix+if_code.rightOperand;
						switch(if_code.op){
						case LTEQ:
							comparatorOp = ">";
							break;
						case LT:
							comparatorOp = ">=";
							break;
						case GTEQ:
							comparatorOp = "<";
							break;
						case GT:
							comparatorOp = "<=";
							break;
						default:
							break;
						}
						//Get the expression
						loop_bound = (LinearExpr) factory.getExpr(cop);
						//Stop the iteration
						break;	
					}
				}else{
					//Add the other code to the init_after
					AddCodeToPatternPart(code, "init_after");
				}
			}else{
				//Add the other code to the init_after
				AddCodeToPatternPart(code, "init_after");
			}
			
		}
		this.line = index;
		return loop_bound;
	}

	


	/**
	 * Searches for the loop_update and put the searched code into 'loopbody_before'.
	 * @param blk the list of code
	 * @param line the starting line number.
	 */
	protected int loopbody_before(List<Code> blk, int line){
		int index = line;
		//Put the code in 'loopbody_before' part.
		while(index<blk.size()){
			Code code = blk.get(index);
			//Create the expression and put it into the table.
			if(!checkAssertOrAssume(code)){
				//Search for the binOp that subtracts the loop variable with a constant.
				if(code instanceof Codes.BinaryOperator){
					Codes.BinaryOperator binOp = (Codes.BinaryOperator)code;
					//Search for the decrement
					if(loop_var.equals(prefix+binOp.operand(0))){
						return index;
					}					
				}
			}
			AddCodeToPatternPart(code, "loopbody_before");
			index++;
		}

		return index;
	}

	/**
	 * Search for loop end and put the code to 'loopbody_after' part.  
	 * @param blk
	 * @param line
	 */
	protected int loopbody_after(List<Code> blk, int line){
		int index = line;
		while(index<blk.size()){
			Code code = blk.get(index);
			index++;
			//Create the expression and put it into the table.
			AddCodeToPatternPart(code, "loopbody_after");
			if(!checkAssertOrAssume(code)){
				if(code instanceof Codes.LoopEnd){
					//Get the loop end to see if the 
					if(((Codes.LoopEnd)code).label.equals(this.loop_label)){
						break;				
					}				
				}
			}
		}
		return index;
	}
	
	
	@Override
	public LinearExpr getNumberOfIterations() {
		if(numberOfIterations==null){
			LinearExpr result = null;
			switch(comparatorOp){
			case "<":
				result = (LinearExpr)loop_bound.clone();
				result = result.subtract((LinearExpr) init);
				break;
			case "<=":
				result = (LinearExpr)loop_bound.clone();
				result = result.subtract((LinearExpr) init).add((LinearExpr) factory.putExpr(BigInteger.ONE));
				break;
			case ">":
				result = (LinearExpr)init.clone();
				result = result.subtract((LinearExpr) loop_bound);
				break;
			case ">=":
				result = (LinearExpr)init.clone();
				result = result.subtract((LinearExpr) loop_bound).add((LinearExpr) factory.putExpr(BigInteger.ONE));
				break;
			}
			
			numberOfIterations = result;
		}		
		return numberOfIterations;
	}
	
}
