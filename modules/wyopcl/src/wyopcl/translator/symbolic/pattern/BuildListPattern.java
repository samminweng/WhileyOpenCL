package wyopcl.translator.symbolic.pattern;

import java.math.BigInteger;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.expression.Expr;
import wyopcl.translator.symbolic.expression.LinearExpr;
/**
 * The BuildList pattern contains 'init_before', 'init', 'init_after', 'loop_header', 'loopbody_before'
 * @author Min-Hsien Weng
 *
 */
public final class BuildListPattern extends WhileLoopPattern {
	private String list_var;
	private Expr list_init;
	private Expr list_update;

	public BuildListPattern(Configuration config, List<Type> params, List<Code> blk) {
		super(config, params, blk);
		this.type ="BuildList";
		//Check if the inferred increment or decrement is null. If not, then continue iterating the list of code.
		//Otherwise, stop constructing the BuildListPattern.
		if(this.incr != null || this.decr != null){
			
			this.line = this.loopbody_after(blk, this.line);
			this.line = this.loop_exit(blk, this.line);
			
			this.isNil = false;	
		}
	}


	/**
	 * Search the loop bytecode and put the code to the 'init_after' part.
	 * If the code is related to the list , then put it to the 'init_list' part.
	 * to the ''
	 * @param blk the list of code
	 * @param line the starting line number
	 */
	@Override
	protected int init_after(List<Code> blk, int line){
		this.list_var = this.modified_Op;
		int index = line;
		//Search for the loop condition
		while(index< blk.size()){
			Code code = blk.get(index);
			//Search for loop bytecode
			if(!checkAssertOrAssume(code)){
				//Search for the initial assignment for the modified operand.
				if(code instanceof Codes.Const){
					Codes.Const constant = (Codes.Const)code;
					if(constant.constant.type() instanceof Type.List &&
							this.list_var.equals(prefix+constant.target())){
						AddCodeToPatternPart(code, "list_init");
					}
				}

				if(code instanceof Codes.Convert){
					Codes.Convert convert = (Codes.Convert)code;
					if(convert.result instanceof Type.List && 
							this.list_var.equals(prefix+convert.target())){
						AddCodeToPatternPart(code, "list_init");
						break;
					}
				}				
			}			
			index++;
		}
		//Get the initial expression for the list var
		this.list_init = factory.getExpr(this.list_var);
				
		index = super.init_after(blk, index);
		return index;
	}


	/**
	 * Search for the update for the list and put the code to the 'list_update' part.
	 * And extract the expression of the newly appended list from the assignment bytecode. 
	 * @param blk the list of code
	 * @param loop_var the loop variable
	 * @param list_var the list variable
	 * @param line
	 * @return
	 */
	@Override
	protected int loopbody_update(List<Code> blk, String loop_var, int line){		
		int index = super.loopbody_update(blk, loop_var, line);
		while(index<blk.size()){
			Code code = blk.get(index);
			index++;
			AddCodeToPatternPart(code, "list_update");
			if(!checkAssertOrAssume(code)){
				//Check if the code initializes the list.
				if(code instanceof Codes.Assign){
					Codes.Assign assign = (Codes.Assign)code;
					if(this.list_var!= null && this.list_var.equals(prefix+assign.target())){
						this.list_update = factory.getExpr(prefix+assign.operand(0));
						break;
					}
				}			
			}
		}	
		return index;
	}


	@Override
	public String toString() {
		String result = super.toString();	
		result += "\n" + type + " && loop_var("+loop_var+") && list_var("+list_var+") && ";
		if(incr != null){
			result += "incr("+loop_var+", "+incr+")";
		}
		if(decr != null){
			result += "decr(\"+loop_var+\", "+decr+")";
		}
		result +=" && init("+loop_var+", "+init+") && list_init("+list_var+", " +this.list_init +") "
				+ "&&  while_cond("+loop_var+", "+comparatorOp+", "+loop_bound+")"
				+ "\n=>loop_iters("+loop_var+", " + getNumberOfIterations()+")";
		return result;

	}

}
