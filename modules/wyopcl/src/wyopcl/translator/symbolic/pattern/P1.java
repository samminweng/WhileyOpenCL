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
public class P1 extends Pattern{	
	private BigInteger decr;
	public P1(int param_size, List<Code> blk) {
		super(param_size, blk);
		this.type = "P1";
		//Get the decrement
		this.line = decr(blk, this.V,
						this.parts.get(PART.LOOPBODY_PRE.index),
						this.parts.get(PART.LOOPBODY_DECR.index),
						this.parts.get(PART.LOOPBODY_POST.index),
						this.parts.get(PART.LOOP_EXIT.index),
						this.line);
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
		//Print out all the bytecode in accordance with the sequence of PART
		for(PART part: this.set){
			result += "\n"+part+":";
			List<Code> part_code = this.parts.get(part.index);
			for(Code code: part_code){
				result += "\n\t"+code;
			}
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
	private BigInteger getDecrement(Codes.Assign assign, String loop_var){
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
	private int decr(List<Code> code_blk, String loop_var,
			List<Code> loopbody_pre,
			List<Code> loopbody_decr,
			List<Code> loopbody_post,
			List<Code> loopexit, int line){
		//Check if the loop variable is inferred.
		if(loop_var == null) return line;

		//Search for the decrement.
		//The flag that specifies the pattern part.
		int index;
		//Search for the decrement
		for(index=line; index<code_blk.size();index++){
			Code code = code_blk.get(index);
			//Create the expression and put it into the table.
			if(!checkAssertOrAssume(code) && code instanceof Codes.Assign){
				//Check if the assignment bytecode is to over-write the value of loop variable.
				Codes.Assign assign = (Codes.Assign)code;				
				this.decr = getDecrement(assign, loop_var);
				if(this.decr != null){
					AddCodeToPatternPart(assign, loopbody_decr);
					index++;
					break;
				}
			}
			AddCodeToPatternPart(code, loopbody_pre);
		}

		//Get loop label
		Codes.Loop loop = (Codes.Loop)this.parts.get(PART.LOOP_HEADER.index).get(0);
		String loop_label = loop.target;
		//Search for loop end and put the code to 'loop_post' part.
		for(; index<code_blk.size();index++){
			Code code = code_blk.get(index);
			//Create the expression and put it into the table.
			AddCodeToPatternPart(code, loopbody_post);
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
		
		//Put the remaining code into the 'loopexit' part
		for(; index<code_blk.size();index++){
			//Create the expression and put it into the table.
			AddCodeToPatternPart(code_blk.get(index), loopexit);
		}

		return index;
	}








}
