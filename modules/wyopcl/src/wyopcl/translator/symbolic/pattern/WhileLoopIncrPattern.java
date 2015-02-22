package wyopcl.translator.symbolic.pattern;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.expression.LinearExpr;
/**
 * Implemented the while-loop patterns, as follows:
 * <ul>
 * <li>while_loop && loop_var(V)  && incr(V,+1) && init(V,Init) && while_cond(V, "<", UpperExpr) => loop_iters(V, UpperExpr - Init)
 * <li>while_loop && loop_var(V)  && incr(V,+1) && init(V,Init) && while_cond(V, "<=", UpperExpr) => loop_iters(V, UpperExpr - Init +1 )
 * </ul>
 * @author Min-Hsien Weng
 *
 */
public class WhileLoopIncrPattern extends WhileLoopPattern{
	private BigInteger incr;
	/**
	 * Constructor 
	 * @param param_size
	 * @param blk
	 */
	public WhileLoopIncrPattern(List<Type> params, List<Code> blk, Configuration config) {
		super(params, blk, config);	
		//Get the increment
		this.line = incr(blk, this.V, this.line);

		if(V != null && this.init != null && this.loop_bound != null && this.incr != null){
			this.isNil = false;
		}else{
			this.isNil = true;
		}			
	}


	@Override
	public String toString() {
		String result = super.toString();	
		result += "\n" + type + " && loop_var("+V+") && incr("+V+", "+incr+")"
				+ " && init("+V+", "+init+") &&  while_cond("+V+", "+comparatorOp+", "+loop_bound+")"
				+ "\n=>loop_iters("+V+", " + getNumberOfIterations()+")";
		return result;
	}

	@Override
	public LinearExpr getNumberOfIterations() {
		if(numberOfIterations==null){
			LinearExpr result = (LinearExpr)loop_bound.clone();
			if(comparatorOp.equals("<")){
				numberOfIterations = result.subtract(init);
			}else{
				numberOfIterations = result.subtract(init).add((LinearExpr) factory.putExpr(BigInteger.ONE));
			}			
		}		
		return numberOfIterations;
	}

	/**
	 * Extract the increment value from the re-assignment bytecode of the loop variable. 
	 * @param assign
	 * @param loop_var
	 * @return
	 */
	private BigInteger extractIncrement(Codes.Assign assign, String loop_var){
		//Get the temporary variable, e.g. %16
		LinearExpr linearExpr = (LinearExpr) factory.getExpr(prefix+assign.operand(0));
		//Check if the loop variable is used in the expression for the tmp variable.
		String[] vars = linearExpr.getVars();
		if(linearExpr.getVarIndex(V) == 0 && vars.length == 2){
			String incr_op = vars[1];
			//Find the coefficient of the incremental variable in the expr 
			BigInteger coefficient = linearExpr.getCoefficient(incr_op);
			//Check if the op kind is a addition
			if(coefficient.signum()>0){
				LinearExpr increment = (LinearExpr) factory.getExpr(incr_op);
				return increment.getConstant();
			}
		}
		return null;
	}

	/**
	 * Get the incremental value for the given loop variable. The conditions are
	 * <ul>
	 * 	<li>reassign the value of loop variable
	 *  <li>increment the value by the constant ONE
	 * </ul>
	 * For example, the loop variable is assigned to a temporary variable (%3 = %14)  
	 * which performs the subtraction on the loop variable (%14 = %3 + %13 and %13 = 1) 
	 * 
	 * @return increment value (Expr). If not matched, return null;
	 */
	private int incr(List<Code> code_blk, String loop_var, int line){
		//Check if the loop variable is inferred.
		if(loop_var == null) return line;
		//Search for the decrement.
		//The flag that specifies the pattern part.
		int index;
		//Search for the increment
		for(index=line; index<code_blk.size();index++){
			Code code = code_blk.get(index);
			String pattern_part = "loopbody_before";//The default pattern part
			if(!checkAssertOrAssume(code)){
				if(code instanceof Codes.Assign){
					//Check if the assignment bytecode is to over-write the value of loop variable.
					Codes.Assign assign = (Codes.Assign)code;
					//Check if the assignment bytecode is to over-write the value of loop variable.
					if(loop_var.equals(prefix+assign.target())){
						this.incr = extractIncrement(assign, loop_var);
						AddCodeToPatternPart(assign, "loopbody_update");
						index++;
						break;	
					}
				}

				if(code instanceof Codes.BinaryOperator){
					Codes.BinaryOperator binOp = (Codes.BinaryOperator)code;
					if(loop_var.equals(prefix+binOp.operand(0))){
						//Add this code to the loopbody_update
						pattern_part = "loopbody_update";						
					}				
				}			
			}			
			AddCodeToPatternPart(code, pattern_part);
		}

		//Get loop label
		String loop_label = ((Codes.Loop)getPartByName("loop_header").get(0)).target;
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

		//Put the remaining code into the 'loopexit' part
		for(; index<code_blk.size();index++){
			//Create the expression and put it into the table.
			AddCodeToPatternPart(code_blk.get(index), "loop_exit");
		}
		return index;
	}
}
