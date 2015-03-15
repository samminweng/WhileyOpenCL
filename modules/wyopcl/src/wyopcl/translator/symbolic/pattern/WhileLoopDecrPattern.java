package wyopcl.translator.symbolic.pattern;
import java.util.List;
import wyil.lang.Code;
import wyil.lang.Type;
/**
 * The final class that implemented the while-loop pattens, as follows:
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
public final class WhileLoopDecrPattern extends WhileLoopPattern{
	public WhileLoopDecrPattern(boolean isVerbose, List<Type> params, List<Code> blk) {
		super(isVerbose, params, blk);
		this.type = "WhileLoopDecrPattern";
		//Get the decrement
		if(this.decr != null){
			this.line = this.loopbody_after(blk, this.line);
			this.line = this.loop_exit(blk, this.line);
			
			this.isNil = false;	
		}
	}
	/**
	 * Print out all the code sequentially in accordance with the PARTS.
	 */
	@Override
	public String toString() {
		String result = super.toString();		
		result += "\nwhile_loop && loop_var("+loop_var+") && decr("+loop_var+", "+decr+")"
				+ " && init("+loop_var+", "+init+") &&  while_cond("+loop_var+", "+comparatorOp+", "+loop_bound+")"
				+ "\n=>loop_iters("+loop_var+", " + getNumberOfIterations()+")";
		return result;
	}
	
	
}
