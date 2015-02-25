package wyopcl.translator.symbolic.pattern;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.expression.LinearExpr;
/**
 * The abstract class extends the Pattern class and adds the 'numberofIteration', 'loop_var' and 'loop_label' variables.
 * 
 * @author Min-Hsien Weng
 *
 */
public abstract class LoopPattern extends BasePattern{
	protected LinearExpr numberOfIterations;// the number of loop iterations in affine form.	
	//The variable (loop variable or list variable).
	public String loop_var;
	public String loop_label;

	public LoopPattern(Configuration config, List<Type> params, List<Code> blk){
		super(config, params);
		this.type = "LoopPattern";
		//If the list of code contains the loop bytecode, then proceed the inference 
		if(this.isLoop(blk)){
			//Get the loop variable.
			this.loop_var = loop_var(blk);
		}
	}

	/**
	 * Infer the number of iterations.
	 * @return
	 */
	public abstract LinearExpr getNumberOfIterations();
	/**
	 * Infer the loop variable.
	 * @param blk the list of bytecode
	 * @return the loop variable/
	 */
	protected abstract String loop_var(List<Code> blk);
	/**
	 * Check if the code block contains the loop bytecode. 
	 * @param blk the list of code blk
	 * @return true if the code blk contains the loop bytecode. Otherwise, return false.
	 */
	protected boolean isLoop(List<Code> blk){
		int index;
		for(index=0;index<blk.size();index++){
			Code code = blk.get(index);
			if(!checkAssertOrAssume(code) && code instanceof Codes.Loop){
				return true;
			}			
		}
		return false;
	}	
	
}
