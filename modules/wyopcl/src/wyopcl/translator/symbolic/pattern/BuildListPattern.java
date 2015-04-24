package wyopcl.translator.symbolic.pattern;

import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyopcl.translator.symbolic.pattern.expression.Expr;
import wyopcl.translator.symbolic.pattern.transform.Transformable;
import wyopcl.translator.symbolic.pattern.transform.Transformer;
/**
 * The BuildList pattern contains 'init_before', 'init', 'init_after', 'loop_header', 'loopbody_before'
 * @author Min-Hsien Weng
 *
 */
public final class BuildListPattern extends WhileLoopPattern implements Transformable {
	protected String list_var;
	protected Expr list_init;
	protected Expr list_update;

	public BuildListPattern(boolean isVerbose, List<Type> params, List<Code> blk) {
		super(isVerbose, params, blk);
		this.pattern_name ="BuildList";
		//Check if the inferred increment or decrement is null. If not, then continue iterating the list of code.
		//Otherwise, stop constructing the BuildListPattern.
		if(this.list_var != null && this.list_init != null && (this.incr != null || this.decr != null)){	
			if(this.list_update != null){
				this.line = this.loopbody_after(blk, this.line);
				this.line = this.loop_exit(blk, this.line);
				this.isNil = false;	
			}			
		}
	}


	/**
	 * Search the loop bytecode and put the code to the 'init_after' part.
	 * If the code is related to the list , then put it to the 'list_init' part.
	 * @param blk the list of code
	 * @param line the starting line number
	 */
	@Override
	protected int init_after(List<Code> blk, int line){		
		int index = line;
		//Check if the loop contains the operand of modifying the list.
		if(this.modified_Ops!= null && this.modified_Ops.length>1){
			this.list_var = this.modified_Ops[1];
			//Search for the loop condition
			while(index< blk.size()){
				Code code = blk.get(index);
				index++;
				//Search for loop bytecode
				if(!checkAssertOrAssume(code)){
					//Search for the initial assignment for the modified operand.
					if(code instanceof Codes.Const){
						Codes.Const constant = (Codes.Const)code;
						if(this.list_var.equals(prefix+constant.target())){
							AddCodeToPatternPart(code, "list_init");
						}
					}else if(code instanceof Codes.Convert){
						Codes.Convert convert = (Codes.Convert)code;
						if(this.list_var.equals(prefix+convert.target())){
							AddCodeToPatternPart(code, "list_init");
							break;
						}
					}
				}			
				
			}
			//Get the initial expression for the list var
			this.list_init = factory.getExpr(this.list_var);
		}		
		return super.init_after(blk, index);
	}


	/**
	 * Search for the update for the list and put the code to the 'list_update' part.
	 * And extract the expression of the newly appended list from the assignment bytecode. 
	 * @param blk the list of code
	 * @param loop_var the loop variable
	 * @param r the list variable
	 * @param line
	 * @return
	 */
	@Override
	protected int loopbody_update(List<Code> blk, String loop_var, int line){		
		int index = super.loopbody_update(blk, loop_var, line);
		//Search for 'list_update'
		while(index<blk.size()){
			Code code = blk.get(index);
			index++;			
			if(!checkAssertOrAssume(code)){
				//Check if the code initializes the list.
				if(code instanceof Codes.Assign){
					Codes.Assign assign = (Codes.Assign)code;
					if(this.list_var!= null && this.list_var.equals(prefix+assign.target())){
						AddCodeToPatternPart(code, "list_update");
						this.list_update = factory.getExpr(prefix+assign.operand(0));
						break;
					}
				}else if(code instanceof Codes.IndexOf || code instanceof Codes.NewList
						|| code instanceof Codes.ListOperator){
					AddCodeToPatternPart(code, "list_update");
				}else{
					AddCodeToPatternPart(code, "list_update_before");
				}
			}else{
				AddCodeToPatternPart(code, "list_update_before");
			}			
		}		
		return index;
	}


	@Override
	public String toString() {
		String result = super.toString();	
		result += "\n" + pattern_name + " && loop_var("+loop_var+") && list_var("+list_var+") && ";
		if(incr != null){
			result += "incr("+loop_var+", "+incr+")";
		}
		if(decr != null){
			result += "decr("+loop_var+", "+decr+")";
		}
		result +=" && init("+loop_var+", "+init+") && list_init("+list_var+", " +this.list_init +") "
				+ "&&  while_cond("+loop_var+", "+comparatorOp+", "+loop_bound+")"
				+ "\n=>loop_iters("+loop_var+", " + getNumberOfIterations()+")";
		return result;

	}


	@Override
	public List<Code> accept(Transformer transformer) {
		return transformer.transform((Pattern)this);
	}

}
