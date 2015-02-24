package wyopcl.translator.symbolic.pattern;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Type;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.expression.LinearExpr;
/**
 * The abstract class extends the Pattern class and adds the 'numberofIteration' and 'loop_var'
 * @author Min-Hsien Weng
 *
 */
public abstract class LoopPattern extends BasePattern{
	protected LinearExpr numberOfIterations;// the number of loop iterations in affine form.	
	//The variable (loop variable or list variable).
	public String loop_var;
	public String loop_label;

	public LoopPattern(Configuration config, List<Type> params){
		super(config, params);
		this.type = "LoopPattern";
	}

	public abstract LinearExpr getNumberOfIterations();	
	protected abstract String loop_var(List<Code> blk);

}
