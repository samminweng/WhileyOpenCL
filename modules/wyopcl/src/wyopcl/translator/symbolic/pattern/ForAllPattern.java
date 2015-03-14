package wyopcl.translator.symbolic.pattern;

import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.ForAll;
import wyil.lang.Type;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.pattern.expression.LinearExpr;
import wyopcl.translator.symbolic.pattern.expression.RangeExpr;

/**
 * The 'ForAll' pattern is similar to 'WhileLoop' pattern. It includes the 'init_before', 'init', 'init_after', 
 * 'loop_header', 'loop_body' and 'loop_exit'. For example, a 'forall' loop iterates over the range (%7).
 * The loop variable is the range ('%7') and then the 'init' is the assignment byte-code of the range value ('range %7 = %5, %0 : [int]').
 * 
 * @author Min-Hsien Weng
 *
 */
public class ForAllPattern extends LoopPattern {
	
	private RangeExpr range;	
	public ForAllPattern(Configuration config, List<Type> params, List<Code> blk) {
		super(config, params, blk);
		this.type = "forall";
		//Check if the super class is constructed successfully.
		if(this.init != null ){
			this.range = forall(blk, this.loop_var, this.line);
			if(this.range != null){
				this.loop_body(blk, this.line);
				this.loop_exit(blk, this.line);
				this.isNil = false;
			}
		}
		
	}

	
	/**
	 * Search the loop end of the given loop label and put the code in the 'loopbody_after' part.
	 * @param blk
	 * @param line
	 */
	protected void loop_body(List<Code> blk, int line){
		int index = line;
		//Search for loop end and put the code to 'loop_post' part.
		while(index<blk.size()){
			Code code = blk.get(index);
			index++;
			//Create the expression and put it into the table.
			AddCodeToPatternPart(code, "loop_body");
			if(!checkAssertOrAssume(code)){
				if(code instanceof Codes.LoopEnd){
					//Get the loop end to see if the 
					if(((Codes.LoopEnd)code).label.equals(this.loop_label)){
						break;				
					}				
				}
			}
		}
		this.line = index;
	}
	
	/**
	 * Get the range that 
	 * @param code_blk
	 * @param loop_var
	 * @param line
	 * @return
	 */
	private RangeExpr forall(List<Code> code_blk, String loop_var, int line){
		RangeExpr rangeOp = null;
		int index = line;	
		//Search for the 'forall' bytecode
		while(index<code_blk.size()){
			Code code = code_blk.get(index);
			++index;
			if(!checkAssertOrAssume(code) && code instanceof Codes.ForAll){
				AddCodeToPatternPart(code, "loop_header");
				ForAll forall = (ForAll)code;
				rangeOp = (RangeExpr) factory.getExpr(prefix+forall.sourceOperand);
				break;
			}
		}		

		this.line = index;
		return rangeOp;
	}




	@Override
	public LinearExpr getNumberOfIterations() {
		if(this.numberOfIterations == null){				
			LinearExpr upperExpr = (LinearExpr) this.range.getUpper().clone();
			//Get the range expr
			this.numberOfIterations = upperExpr.subtract(this.range.getLower());
		}
		return this.numberOfIterations;
	}

	@Override
	public String toString() {
		String result = super.toString();		
		result += "\n" + type + " " +loop_var+" in range"+this.range+
				"\n=>loop_iters("+loop_var+", " + getNumberOfIterations()+")";
		return result;
	}

	

	

}
