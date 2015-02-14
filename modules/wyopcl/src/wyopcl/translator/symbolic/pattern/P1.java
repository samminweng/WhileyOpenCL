package wyopcl.translator.symbolic.pattern;

import java.math.BigInteger;
import java.util.ArrayList;
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
	public P1(List<Code> blk, HashMap<String, Expr> expressiontable) {
		super(blk, expressiontable);
		this.type = "P1";
		this.loopbody_decr = new ArrayList<Code>();

		this.line = decr(blk, this.V, loopbody_pre, loopbody_decr, loopbody_post, loopexit, this.line);
		if(V != null && this.initExpr != null && this.loop_boundExpr != null && this.decr != null){
			this.isNil = false;
		}else{
			this.isNil = true;
		}		
	}

	@Override
	public String toString() {
		return type + ":while_loop && loop_var("+V+") && decr("+V+", "+decr+")"
				+ " && init("+V+", "+initExpr+") &&  while_cond("+V+", "+comparatorOp+", "+loop_boundExpr+")"
				+ "\n=>loop_iters("+V+", " + getNumberOfIterations()+")";
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
			if(!checkAssertOrAssume(code) && code instanceof Codes.Assign){
				//Check if the assignment bytecode is to over-write the value of loop variable.
				Codes.Assign assign = (Codes.Assign)code;				
				this.decr = getDecrement(assign, loop_var);
				if(this.decr != null){
					loopbody_decr.add(assign);
					break;
				}
			}
			loopbody_pre.add(code);
		}

		//Get loop label
		Codes.Loop loop = (Codes.Loop)loop_header.get(0);
		String loop_label = loop.target;
		//Search for loop end and put the code to 'loop_post' part.
		for(; index<code_blk.size();index++){
			Code code = code_blk.get(index);
			loopbody_post.add(code);
			if(!checkAssertOrAssume(code)){
				if(code instanceof Codes.LoopEnd){
					//Get the loop end to see if the 
					Codes.LoopEnd loopend = (Codes.LoopEnd)code;
					if(loopend.label.equals(loop_label)){
						break;				
					}				
				}
			}
		}
		
		//Put the remaining code into the 'loopexit' part
		for(; index<code_blk.size();index++){
			loopexit.add(code_blk.get(index));
		}

		return index;
	}








}
