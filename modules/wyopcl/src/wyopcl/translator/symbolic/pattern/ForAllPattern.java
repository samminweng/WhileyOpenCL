package wyopcl.translator.symbolic.pattern;

import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.BinaryOperatorKind;
import wyopcl.translator.symbolic.expression.Expr;
import wyopcl.translator.symbolic.expression.LinearExpr;
import wyopcl.translator.symbolic.expression.RangeExpr;

/**
 * The 'For' pattern includes the 'loop_before', 'loop_header', 'loop_body' and 'loop_exit'. 
 * 
 * @author Min-Hsien Weng
 *
 */
public class ForAllPattern extends Pattern {
	private String V;
	private String rangeOp;
	private RangeExpr rangeExpr;
	
	public ForAllPattern(int param_size, List<Code> blk) {
		super(param_size, blk);
		this.type = "forall";
		this.V = loop_var(blk);
		this.line = loop_range(blk, this.V, 0);		
		if(this.V != null && this.rangeOp != null){
			this.rangeExpr = (RangeExpr) factory.getExpr(rangeOp);		
			this.isNil = false;
		}else{
			this.isNil = true;
		}		
	}
	
	public String loop_var(List<Code> blk){
		int index;
		for(index=0;index<blk.size();index++){
			Code code = blk.get(index);
			System.out.println(code);
			if(code instanceof Codes.ForAll){
				Codes.ForAll forall = (Codes.ForAll)code;
				this.rangeOp = prefix+forall.sourceOperand;
				return prefix+forall.indexOperand;
			}			
		}
		return null;
	}	
	
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
		result += "\n" + type + " " +V+" in range"+this.rangeExpr+
			      "\n=>loop_iters("+V+", " + getNumberOfIterations()+")";
		return result;
	}
	

}
