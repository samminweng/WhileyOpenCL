package wyopcl.translator.symbolic.pattern;

import java.math.BigInteger;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.Codes.BinaryOperatorKind;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.expression.LinearExpr;
/**
 * The class that implemented the while-loop patterns, as follows:
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
	 * @param config configuration 
	 * @param params the list of parameter types
	 * @param blk the list of code block.
	 */
	public WhileLoopIncrPattern(Configuration config, List<Type> params, List<Code> blk) {
		super(config, params, blk);
		if(this.loop_bound != null){
			this.loopbody_before(blk, this.line);
			//Get the increment
			this.incr = incr(blk, this.loop_var, this.line);
			if(this.incr != null){
				this.loopbody_after(blk, this.line);
				this.loop_exit(blk, this.line);
				this.isNil = false;
			}	
		}		
	}


	@Override
	public String toString() {
		String result = super.toString();	
		result += "\n" + type + " && loop_var("+loop_var+") && incr("+loop_var+", "+incr+")"
				+ " && init("+loop_var+", "+init+") &&  while_cond("+loop_var+", "+comparatorOp+", "+loop_bound+")"
				+ "\n=>loop_iters("+loop_var+", " + getNumberOfIterations()+")";
		return result;
	}

	@Override
	public LinearExpr getNumberOfIterations() {
		if(numberOfIterations==null){
			LinearExpr result = (LinearExpr)loop_bound.clone();
			if(comparatorOp.equals("<")){				
				numberOfIterations = result.subtract((LinearExpr) init);
			}else{
				numberOfIterations = result.subtract((LinearExpr) init).add((LinearExpr) factory.putExpr(BigInteger.ONE));
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
		if(linearExpr.getVarIndex(loop_var) == 0 && vars.length == 2){
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
	private BigInteger incr(List<Code> code_blk, String loop_var, int line){
		BigInteger incr = null;
		int index = line;
		while(index<code_blk.size()){
			Code code = code_blk.get(index);
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
						incr = extractIncrement(assign, loop_var);
						break;				
					}
				}
			}			
		}

		this.line = index;
		return incr;
	}
}
