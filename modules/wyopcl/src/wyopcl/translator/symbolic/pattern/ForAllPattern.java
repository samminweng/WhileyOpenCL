package wyopcl.translator.symbolic.pattern;

import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.Codes.BinaryOperatorKind;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.expression.Expr;
import wyopcl.translator.symbolic.expression.LinearExpr;
import wyopcl.translator.symbolic.expression.RangeExpr;

/**
 * The 'For' pattern includes the 'loop_before', 'loop_header', 'loop_body' and 'loop_exit'. 
 * 
 * @author Min-Hsien Weng
 *
 */
public class ForAllPattern extends LoopPattern {	
	private String rangeOp;
	private RangeExpr rangeExpr;
	
	public ForAllPattern(Configuration config, List<Type> params, List<Code> blk) {
		super(config, params, blk);
		this.type = "forall";
		if(this.loop_var != null){
			this.line = loop_range(blk, this.loop_var, this.line);	
			this.rangeExpr = (RangeExpr) factory.getExpr(rangeOp);		
			this.isNil = false;
		}
	}
	
	@Override
	protected String loop_var(List<Code> blk) {
		int index;
		for(index=0;index<blk.size();index++){
			Code code = blk.get(index);
			if(code instanceof Codes.ForAll){
				Codes.ForAll forall = (Codes.ForAll)code;
				this.rangeOp = prefix+forall.sourceOperand;
				this.loop_label = forall.target;
				return prefix+forall.indexOperand;
			}			
		}
		return null;
	}
	
	
	/*public String loop_var(List<Code> blk){
		
	}	*/
	
	public int loop_range(List<Code> code_blk, String loop_var, int line){
		if(loop_var == null) return line;
		
		int index;		
		//Search for the 'forall' bytecode
		for(index=line;index<code_blk.size();index++){
			Code code = code_blk.get(index);
			if(code instanceof Codes.ForAll){
				AddCodeToPatternPart(code, "loop_header");
				++index;
				break;
			} 
			AddCodeToPatternPart(code, "loop_before");
		}
		//Search for the 'loopend' bytecode
		for(;index<code_blk.size();index++){
			Code code = code_blk.get(index);
			if(code instanceof Codes.LoopEnd){
				AddCodeToPatternPart(code, "loop_end");
				++index;
				break;
			}
			AddCodeToPatternPart(code, "loop_body");
		}		
		//Put all the remaining code into the loop exit.
		for(; index<code_blk.size(); index++){
			Code code = code_blk.get(index);
			AddCodeToPatternPart(code, "loop_exit");
		}
		
		return index;
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
