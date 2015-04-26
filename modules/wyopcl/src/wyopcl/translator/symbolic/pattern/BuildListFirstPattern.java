package wyopcl.translator.symbolic.pattern;

import java.util.List;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyopcl.translator.symbolic.pattern.expression.Expr;
/**
 * This pattern creates a new list (r) with an existing list and initializes the array size (r_size) and capacity (r_capacity).
 * Then it iterates over the existing list to gradually fill up the new list.   
 * @author Min-Hsien Weng
 *
 */
public final class BuildListFirstPattern extends WhileLoopPattern {
	protected String list_var;
	protected String list_size;
	protected String list_capacity;
	protected Expr list_init;
	protected Expr list_update;
	protected Expr list_size_init;
	protected Expr list_size_update;

	public BuildListFirstPattern(boolean isVerbose, List<Type> params, List<Code> blk) {
		super(isVerbose, params, blk);
		this.pattern_name ="BuildListFirst";
		//Check if the inferred increment or decrement is null. If not, then continue iterating the list of code.
		//Otherwise, stop constructing the BuildListPattern.
		if(this.list_var != null && this.list_size!= null && this.list_init != null && this.list_size_init != null
				&& (this.incr != null || this.decr != null)){
			this.line = this.loopbody_after(blk, this.line);
			if(this.list_update != null && this.list_size_update != null){
				this.line = this.loop_exit(blk, this.line);
				if(this.list_capacity != null){
					this.isNil = false;	
				}				
			}			
		}
	}

	/**
	 * Search the loop bytecode and put the code to the 'init_after' part.
	 * If the code assigns the value to the list, then put it to the 'list_init' part.
	 * If the code assigns the value to the r_size, then put it to the 'r_size_init' part.
	 * @param blk the list of code
	 * @param line the starting line number
	 * @return the line number that the code contains the loop bytecode 
	 */
	@Override
	protected int init_after(List<Code> blk, int line){
		int index = line;		
		//Check if the loop contains the operand of modifying the list.
		if(this.modified_Ops!= null && this.modified_Ops.length>2){
			this.list_var = this.modified_Ops[1];
			this.list_size = this.modified_Ops[2];
			//Search for the initial value for list
			while(index< blk.size()){
				Code code = blk.get(index);
				AddCodeToPatternPart(code, "list_init");
				index++;
				//Search for loop bytecode
				if(!isInvariant(code)){
					//Search for the initial assignment for the array and array size.
					if(code instanceof Codes.Assign){
						Codes.Assign assign = (Codes.Assign)code;
						if(this.list_var.equals(prefix+assign.target())){							
							//Get the initial value of the list.
							this.list_init = factory.getExpr(this.list_var);
							break;
						}
					}
				}				
			}
			
			//Search for the initial value for list_size
			while(index< blk.size()){
				Code code = blk.get(index);
				index++;
				AddCodeToPatternPart(code, "list_size_init");
				//Search for the assignment of 'list_size' variable. 
				if(!isInvariant(code)){
					//Search for the initial assignment for the array and array size.
					if(code instanceof Codes.Assign){
						Codes.Assign assign = (Codes.Assign)code;
						if(this.list_size.equals(prefix+assign.target())){
							//Get the initial expression for the list_size
							this.list_size_init = factory.getExpr(this.list_size);
							break;
						}
					}
				}				
			}			
		}		 
		return super.init_after(blk, index);
	}


	@Override
	protected int loopbody_after(List<Code> blk, int line) {
		int index = line;
		//Search for the list_update
		while(index<blk.size()){
			Code code = blk.get(index);
			index++;			
			if(!isInvariant(code)){
				if(code instanceof Codes.Update){
					Codes.Update update = (Codes.Update)code;
					//Check if the target is the list
					if(this.list_var.equals(prefix+update.target())
							&& update.afterType instanceof Type.List){
						//Check if the index is the list_size
						if(this.list_size.equals(prefix+update.operand(0))){
							String updateOp = prefix+update.operand(1);
							//Create the expression and put it into the table.
							AddCodeToPatternPart(code, "list_update");
							this.list_update = factory.getExpr(updateOp);
							break;
						}

					}				
				}else if(code instanceof Codes.IndexOf){
					//Create the expression and put it into the table.
					AddCodeToPatternPart(code, "list_update");					
				}
			}else{
				//Create the expression and put it into the table.
				AddCodeToPatternPart(code, "list_update_before");
			}			
		}

		//Search for the list_size_update
		while(index<blk.size()){
			Code code = blk.get(index);
			index++;
			//Create the expression and put it into the table.
			AddCodeToPatternPart(code, "list_size_update");
			if(!isInvariant(code)){
				if(code instanceof Codes.Assign){
					Codes.Assign assign = (Codes.Assign)code;
					//Check if the target is the list_size
					if(this.list_size.equals(prefix+assign.target())){						
						this.list_size_update = factory.getExpr(prefix+assign.operand(0));
						break;
					}				
				}
			}	
		}
		return super.loopbody_after(blk, index);
	}
	
	@Override
	protected int loop_exit(List<Code> blk, int line) {
		int index = line;
		while(index<blk.size()){
			Code code = blk.get(index);
			index++;			
			if(isInvariant(code)){
				//Create the expression and put it into the table.
				AddCodeToPatternPart(code, "list_assertion");
				if(code instanceof Codes.If){
					//Get the list_capacity
					Codes.If if_code = (Codes.If)code;
					//Check if the target is the list_size
					if(this.list_size.equals(prefix+if_code.leftOperand)){						
						this.list_capacity = prefix+if_code.rightOperand;
					}					
					if(this.list_size.equals(prefix+if_code.rightOperand)){
						this.list_capacity = prefix+if_code.leftOperand;
					}
				}
			}else{
				if(code instanceof Codes.Return){
					AddCodeToPatternPart(code, "return");
				}else{
					//Create the expression and put it into the table.
					AddCodeToPatternPart(code, "loop_exit");
				}
			}
		}		
		
		return index;
	}
	

	@Override
	public String toString() {
		String result = super.toString();	
		result += "\n" + pattern_name + " && loop_var("+loop_var+") && list_var("+list_var+") && list_size("+list_size+") && list_capacity("+list_capacity+") &&"
				+ "\n" ;
		if(incr != null){
			result += "incr("+loop_var+", "+incr+")";
		}
		if(decr != null){
			result += "decr("+loop_var+", "+decr+")";
		}
		result +=" && init("+loop_var+", "+init+") && list_init("+list_var+", " +this.list_init +") && list_size_init("+list_size+", "+list_size_init+") &&"
				+ "\nwhile_cond("+loop_var+", "+comparatorOp+", "+loop_bound+")"
				+ "\n=>loop_iters("+loop_var+", " + getNumberOfIterations()+")";
		return result;
	}

	

}
