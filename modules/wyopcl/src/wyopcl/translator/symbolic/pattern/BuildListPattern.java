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
	private Expr list_update;
	
	public BuildListPattern(Configuration config, List<Type> params, List<Code> blk) {
		super(config, params, blk);
		this.list_var = this.modified_Op;
		this.list_update = list_update(blk, this.loop_var, this.list_var, this.line);
		if(this.list_update != null){
			this.line = this.loopbody_after(blk, this.line);
			this.line = this.loop_exit(blk, this.line);
			this.isNil = false;	
		}
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
	protected Expr list_update(List<Code> blk, String loop_var, String list_var, int line){
		Expr expr = null;
		int index = line;
		while(index<blk.size()){
			Code code = blk.get(index);
			index++;
			AddCodeToPatternPart(code, "list_update");
			if(!checkAssertOrAssume(code)){
				//Check if the code initializes the list.
				if(code instanceof Codes.Assign){
					Codes.Assign assign = (Codes.Assign)code;
					if(this.loop_var.equals(prefix+assign.target())){
						expr = factory.getExpr(prefix+assign.operand(0));
						break;
					}
				}			
			}
		}	
		return expr;
	}


	@Override
	public String toString() {
		return "BuildListPattern [list_var=" + list_var + "]";
	}

}
