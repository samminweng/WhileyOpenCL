package wyopcl.translator.symbolic.pattern;

import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.ForAll;
import wyil.lang.Type;
import wyil.lang.Codes.BinaryOperatorKind;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.expression.Expr;
import wyopcl.translator.symbolic.expression.LinearExpr;
import wyopcl.translator.symbolic.expression.RangeExpr;

/**
 * The 'ForAll' pattern is similar to 'WhileLoop' pattern. It includes the 'init_before', 'init', 'init_after', 
 * 'loop_header', 'loop_body' and 'loop_exit'. For example, a 'forall' loop iterates over the range (%7).
 * The loop variable is the range ('%7') and then the 'init' is the assignment byte-code of the range value ('range %7 = %5, %0 : [int]').
 * 
 * @author Min-Hsien Weng
 *
 */
public class ForAllPattern extends LoopPattern {	
	private RangeExpr rangeExpr;	
	public ForAllPattern(Configuration config, List<Type> params, List<Code> blk) {
		super(config, params, blk);
		this.type = "forall";
		if(this.init != null){
			this.rangeExpr = loop_range(blk, this.loop_var, this.line);
			if(this.rangeExpr != null){
				this.isNil = false;
			}		
		}
	}
	
	/**
	 * Get the range that 
	 * @param code_blk
	 * @param loop_var
	 * @param line
	 * @return
	 */
	private RangeExpr loop_range(List<Code> code_blk, String loop_var, int line){
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
			AddCodeToPatternPart(code, "init_after");
		}		
		
		//Search for the 'loopend' bytecode
		while(index<code_blk.size()){
			Code code = code_blk.get(index);
			index++;
			AddCodeToPatternPart(code, "loop_body");
			if(code instanceof Codes.LoopEnd){
				break;
			}			
		}		
		//Put all the remaining code into the loop exit.
		while(index<code_blk.size()){
			Code code = code_blk.get(index);
			index++;
			AddCodeToPatternPart(code, "loop_exit");
		}
		
		return rangeOp;
	}
	

	

	@Override
	public LinearExpr getNumberOfIterations() {
		if(this.numberOfIterations == null){				
			LinearExpr upperExpr = (LinearExpr) this.rangeExpr.getUpper().clone();
			//Get the range expr
			this.numberOfIterations = upperExpr.subtract(this.rangeExpr.getLower());
		}
		return this.numberOfIterations;
	}

	@Override
	public String toString() {
		String result = super.toString();		
		result += "\n" + type + " " +loop_var+" in range"+this.rangeExpr+
			      "\n=>loop_iters("+loop_var+", " + getNumberOfIterations()+")";
		return result;
	}
	
}
