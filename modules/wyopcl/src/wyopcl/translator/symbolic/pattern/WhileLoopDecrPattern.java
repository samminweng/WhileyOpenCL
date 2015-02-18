package wyopcl.translator.symbolic.pattern;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.LoopEnd;
import wyopcl.translator.symbolic.Expr;
/**
 * Implemented the while-loop pattens, as follows:
 * <ul>
 * <li>while_loop && loop_var(V) && decr(V, 1) && init(V, Init) &&  while_cond(V, ">", LowerExpr) => loop_iters(V, Init - LowerExpr)
 * <li>while_loop && loop_var(V) && decr(V, 1) && init(V, Init) &&  while_cond(V, ">=", LowerExpr) => loop_iters(V, Init - LowerExpr + 1)
 * </ul>
 * <p>
 * This class takes the loop block and expression table as input and, if the block is matched the conditions, then produce the pattern as output.
 * 
 * @author Min-Hsien Weng
 *
 */
public class WhileLoopDecrPattern extends WhileLoopPattern{	
	private BigInteger decr;
	public WhileLoopDecrPattern(int param_size, List<Code> blk) {
		super(param_size, blk);
		this.type = "P1";
		//Get the decrement
		this.line = decr(blk, this.V, this.line);
		if(V != null && this.initExpr != null && this.loop_boundExpr != null && this.decr != null){
			this.isNil = false;			
		}else{
			this.isNil = true;
		}		
	}
	/**
	 * Print out all the code sequentially in accordance with the PARTS.
	 */
	@Override
	public String toString() {
		String result = "";
		result += "{";
		//Print out all the bytecode
		int index = 0;
		for(List<Code> part_code: this.parts){
			result += "\n"+this.part_names.get(index)+":";
			for(Code code: part_code){
				result += "\n\t"+code;
			}
			index++;
		}
		result += "\n}";		
		result += type + ":while_loop && loop_var("+V+") && decr("+V+", "+decr+")"
				  + " && init("+V+", "+initExpr+") &&  while_cond("+V+", "+comparatorOp+", "+loop_boundExpr+")"
				  + "\n=>loop_iters("+V+", " + getNumberOfIterations()+")";
		
		return result;
	}

	@Override
	public Expr getNumberOfIterations() {
		if(numberOfIterations==null){
			Expr result = (Expr)initExpr.clone();
			if(comparatorOp.equals(">")){
				numberOfIterations = result.subtract(loop_boundExpr);
			}else{
				numberOfIterations = result.subtract(loop_boundExpr).add(new Expr(BigInteger.ONE));
			}			
		}		
		return numberOfIterations;
	}

	/**
	 * Extract the decrement value from the 'assignment' bytecode of loop variable. 
	 * @param assign the 'assignment' bytecode
	 * @param loop_var the loop variable
	 * @return the decrement (BigInteger). If not found, return null.
	 */
	private BigInteger extractDecrement(Codes.Assign assign, String loop_var){
		//Check if the target is the loop variable.
		if((prefix+assign.target()).equals(loop_var)){
			//Get the temporary variable, e.g. %16
			Expr expr = getExpr(prefix+assign.operand(0));
			//Check if the loop variable is used in the expression for the tmp variable.
			String[] vars = expr.getVars();
			if(expr.getVarIndex(loop_var) == 0 && vars.length == 2){
				String decr_op = vars[1];
				//Find the coefficient of the decremental variable in the expr 
				BigInteger coefficient = expr.getCoefficient(decr_op);
				//Check if the op kind is a subtraction
				if(coefficient.signum()<0){
					Expr decrement = getExpr(decr_op);
					return decrement.getConstant();
				}
			}
		}
		return null;
	}



	/**
	 * Get the decremental value for the given loop variable. The conditions are
	 * <ul>
	 * 	<li>reassigned the value of loop variable
	 *  <li>decrement the value by the constant ONE
	 * </ul>
	 * For example, the loop variable is assigned to a temporary variable (%3 = %16)  
	 * which performs the subtraction on the loop variable (%16 = %3 - %15 and %15 = 1) 
	 * 
	 * @return decrement value (Expr). If not matched, return null;
	 */
	private int decr(List<Code> code_blk, String loop_var, int line){
		//Check if the loop variable is inferred.
		if(loop_var == null) return line;
		
		int index;
		//Search for the decrement
		for(index=line; index<code_blk.size();index++){
			Code code = code_blk.get(index);
			//Create the expression and put it into the table.
			if(!checkAssertOrAssume(code) && code instanceof Codes.Assign){
				//Check if the assignment bytecode is to over-write the value of loop variable.
				Codes.Assign assign = (Codes.Assign)code;				
				this.decr = extractDecrement(assign, loop_var);
				if(this.decr != null){
					AddCodeToPatternPart(assign, "loopbody_update");
					index++;
					break;
				}
			}
			AddCodeToPatternPart(code, "loopbody_before");
		}

		//Get loop label
		List<Code> loop_header = getPartByName("loop_header");
		String loop_label = ((Codes.Loop)loop_header.get(0)).target;
		//Search for loop end and put the code to 'loop_post' part.
		for(; index<code_blk.size();index++){
			Code code = code_blk.get(index);
			//Create the expression and put it into the table.
			AddCodeToPatternPart(code, "loopbody_after");
			if(!checkAssertOrAssume(code)){
				if(code instanceof Codes.LoopEnd){
					//Get the loop end to see if the 
					Codes.LoopEnd loopend = (Codes.LoopEnd)code;
					if(loopend.label.equals(loop_label)){
						index++;
						break;				
					}				
				}
			}
		}
		
		//Put the remaining code into the 'loop_exit' part
		for(; index<code_blk.size();index++){
			//Create the expression and put it into the table.
			AddCodeToPatternPart(code_blk.get(index), "loop_exit");
		}
		return index;
	}
}
