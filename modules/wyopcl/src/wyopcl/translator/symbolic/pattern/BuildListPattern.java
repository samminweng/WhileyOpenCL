package wyopcl.translator.symbolic.pattern;

import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.expression.LinearExpr;
/**
 * The BuildList pattern contains 'init_before', 'init', 'init_after', 'loop_header', 'loopbody_before'
 * @author Min-Hsien Weng
 *
 */
public class BuildListPattern extends Pattern {
	private String list_var;
	private String loop_label;
	
	public BuildListPattern(List<Type> params, List<Code> blk, Configuration config) {
		super(params, blk, config);
		this.list_var = list_var(blk);
		this.line = init(blk, this.list_var, 0);
		this.line = while_cond(blk, this.list_var, this.line);
		this.line = loop_update(blk, this.list_var, this.line);
		if(this.V == null){
			this.isNil = true;
		}else{
			this.isNil = false;
		}
	}

	/**
	 * Extract the variable of a modified list from the list of code.
	 * @param blk the list of code
	 * @return the variable name of the modified list.
	 */
	private String list_var(List<Code> blk){
		int[] modifiedOps = null;
		int index;
		//Check if there is a loop
		for(index=0; index<blk.size(); index++){
			Code code = blk.get(index);
			//Check if there is the code that converts a list
			if(!checkAssertOrAssume(code) && code instanceof Codes.Loop){
				Codes.Loop loop = (Codes.Loop)code;
				this.loop_label = loop.target;
				modifiedOps = loop.modifiedOperands;
				//The loop variable.
				this.V = prefix+modifiedOps[0];
				break;
			}			
		}

		for(; index<blk.size(); index++){
			Code code = blk.get(index);			
			//Check if there is the assignment code that assign a list to the modifiedOp
			if(!checkAssertOrAssume(code) && code instanceof Codes.Assign){
				Codes.Assign assign = (Codes.Assign)code;
				//Check if the assign a list to one of modified ops.		
				if(assign.assignedType() instanceof Type.List){
					//check if the target is 
					for(int modifiedOp: modifiedOps){
						if(assign.target() == modifiedOp){
							//The list variable.
							return prefix+modifiedOp;
						}
					}					
				}
			}			
		}

		return null;
	}

	/**
	 * Split the list of code into 'init_before' and 'init' pattern part.
	 * @param blk the list of code
	 * @param var the variable of the list.
	 * @param line the starting line number
	 * @return ending line number
	 */
	private int init(List<Code> blk, String var, int line){
		if(var == null) return line;

		int index;
		for(index=line;index<blk.size();index++){
			Code code = blk.get(index);
			AddCodeToPatternPart(code, "init_before");
			if(!checkAssertOrAssume(code)){
				//Check if the code initializes the list.
				if(code instanceof Codes.Const){
					Codes.Const constant = (Codes.Const)code;
					if(var.equals(prefix+constant.target())){
						break;
					}				
				}								
			}			
		}
		
		for(index++;index<blk.size();index++){
			Code code = blk.get(index);
			AddCodeToPatternPart(code, "init");
			if(!checkAssertOrAssume(code)){
				//Check if the byte converts the [void] into the [int]
				if(code instanceof Codes.Convert){					
					Codes.Convert convert = (Codes.Convert)code;
					if(var.equals(prefix+convert.target())){
						break;
					}
				}				
			}			
		}
		
		return index;
	}



	private int while_cond(List<Code> blk, String var, int line){
		if(var == null) return line;

		int index;
		for(index=line+1;index<blk.size();index++){
			Code code = blk.get(index);
			if(!checkAssertOrAssume(code)){
				//Check if the code initializes the list.
				if(code instanceof Codes.Loop){
					Codes.Loop loop = (Codes.Loop)code;
					if(loop.target.equals(this.loop_label)){
						break;
					}
				}
								
			}			
			AddCodeToPatternPart(code, "init_after");
		}
		
		for(;index<blk.size();index++){
			Code code = blk.get(index);
			AddCodeToPatternPart(code, "loop_header");
			if(!checkAssertOrAssume(code)){
				//Check if the byte is the condition followed by the loop
				if(code instanceof Codes.If){					
					break;
				}				
			}	
		}		
		
		return ++index;
	}

	private int loop_update(List<Code> blk, String var, int line){		
		if(var == null) return line;

		int index;
		for(index=line;index<blk.size();index++){
			Code code = blk.get(index);
			AddCodeToPatternPart(code, "loopbody_before");
			if(!checkAssertOrAssume(code)){
				//Check if the code initializes the list.
				if(code instanceof Codes.Assign){
					Codes.Assign assign = (Codes.Assign)code;
					if(this.V.equals(prefix+assign.target())){
						break;
					}									
				}			
			}
		}
		
		for(index++;index<blk.size();index++){
			Code code = blk.get(index);
			AddCodeToPatternPart(code, "loopbody_update");
			if(!checkAssertOrAssume(code)){
				//Check if the code initializes the list.
				if(code instanceof Codes.Assign){
					Codes.Assign assign = (Codes.Assign)code;
					if(this.list_var.equals(prefix+assign.target())){
						break;
					}					
				}			
			}
		}
		
		for(index++;index<blk.size();index++){
			Code code = blk.get(index);
			AddCodeToPatternPart(code, "loopbody_after");
			if(!checkAssertOrAssume(code)){
				//Check if the code initializes the list.
				if(code instanceof Codes.LoopEnd){
					Codes.LoopEnd loopend = (Codes.LoopEnd)code;
					if(this.loop_label.equals(loopend.label)){
						break;
					}
				}								
			}
		}		
		
		return index;
		
		
	}

	@Override
	public LinearExpr getNumberOfIterations() {
		// TODO Auto-generated method stub
		return null;
	}

}
