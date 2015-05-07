package wyopcl.translator.symbolic.pattern;

import java.util.List;

import wyil.lang.Code;
import wyil.lang.Type;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.translator.Configuration;
/**
 * The class that implemented the while-loop patterns, as follows:
 * <ul>
 * <li>while_loop && loop_var(V)  && incr(V,+1) && init(V,Init) && while_cond(V, "<", UpperExpr) => loop_iters(V, UpperExpr - Init)
 * <li>while_loop && loop_var(V)  && incr(V,+1) && init(V,Init) && while_cond(V, "<=", UpperExpr) => loop_iters(V, UpperExpr - Init +1 )
 * </ul>
 * @author Min-Hsien Weng
 *
 */
//public class WhileLoopIncrPattern extends WhileLoopPattern implements Transformable{
public class WhileLoopIncrPattern extends WhileLoopPattern{
	/**
	 * Constructor	  
	 * @param params the list of parameter types
	 * @param blk the list of code block.
	 */
	public WhileLoopIncrPattern(Configuration config, FunctionOrMethod functionOrMethod) {
		super(config, functionOrMethod);
		//Get the increment and check if it is null.
		if(this.incr != null){
			this.line = this.loop_exit(functionOrMethod.body().bytecodes(), this.line);
			this.pattern_name = "WhileLoopIncrPattern";
			this.isNil = false;			
		}
	}

	@Override
	public String toString() {
		String result = super.toString();	
		result += "\n" + pattern_name + " && loop_var("+loop_var+") && incr("+loop_var+", "+incr+")"
				+ " && init("+loop_var+", "+init+") &&  while_cond("+loop_var+", "+comparatorOp+", "+loop_bound+")"
				+ "\n=>loop_iters("+loop_var+", " + getNumberOfIterations()+")";
		return result;
	}


	/*@Override
	public List<Code> accept(Transformer transformer) {
		return transformer.transform(this);
	}*/
	
}
