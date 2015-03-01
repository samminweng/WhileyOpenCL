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
		//Get the increment
		this.incr = incr(blk, this.loop_var, this.line);
		if(this.incr != null){
			this.line = this.loopbody_after(blk, this.line);
			this.line = this.loop_exit(blk, this.line);
			this.isNil = false;			
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
						incr = factory.extractIncrement(assign, loop_var);
						break;				
					}
				}
			}			
		}

		this.line = index;
		return incr;
	}
}
