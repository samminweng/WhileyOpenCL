package wyopcl.translator.symbolic.pattern;

import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.Codes.Comparator;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.expression.LinearExpr;
/**
 * A while-loop pattern includes 'init_before', 'init', 'init_after', 'loop_header', 'loopbody_before',
 * 'loopbody_update', 'loopbody_after' and 'loop_exit' parts. 
 * 
 * @author Min-Hsien Weng
 *
 */
public abstract class WhileLoopPattern extends LoopPattern{
	//Expressions related to the loop variable.
	public LinearExpr init;
	public String comparatorOp;
	public LinearExpr loop_bound;

	public WhileLoopPattern(Configuration config, List<Type> params, List<Code> blk) {
		super(config, params, blk);
		//Add each list of code into the list of pattern parts
		//Construct each part in the pattern.
		this.type = "WhileLoop";
		if(this.loop_var!=null){
			this.loop_var = loop_var(blk);
			this.init = init(blk, this.loop_var, this.line);
			this.loop_bound = while_cond(blk, this.loop_var, this.line);
		}		
	}

	/**
	 * Find the loop variable
	 * @param code_blk the code block.
	 * @return the variable (string). If not found, return null.
	 */
	protected String loop_var(List<Code> code_blk) {		
		String var = null;
		Codes.Loop loop = null;
		int index;
		//Search for the 'loop' bytecode
		for(index=0; index<code_blk.size(); index++){
			//Get the loop bytecode	
			Code code = code_blk.get(index);
			//Loop header
			if(!checkAssertOrAssume(code) && code instanceof Codes.Loop && 
					!(code instanceof Codes.ForAll)){
				loop = (Codes.Loop)code;
				//The loop variable is the first modified operands.
				var = prefix+loop.modifiedOperands[0];				
				break;
			}			
		}
		//Search for the loop condition
		for(;index<code_blk.size();index++){
			Code code = code_blk.get(index);
			//Get the following code to see if the loop variable is used in the loop condition
			if(!checkAssertOrAssume(code) && code instanceof Codes.If){
				Codes.If if_code = (Codes.If)code;
				//Check if the var is left-handed operand. If so, then this is the loop variable.
				if(var != null && (var.equals(prefix+if_code.leftOperand) || var.equals(prefix+if_code.rightOperand))){
					break;
				}
			}
		}

		//Search for the update(increment/decrement)
		for(;index<code_blk.size();index++){
			Code code = code_blk.get(index);
			//Get the following code to see if the loop variable is used in the update
			if(!checkAssertOrAssume(code) && code instanceof Codes.BinaryOperator){
				Codes.BinaryOperator binOp = (Codes.BinaryOperator)code;
				//Check if the loop var is used in the operands
				if(var != null && var.equals(prefix+binOp.operand(0)) || var.equals(prefix+binOp.operand(1))){
					return var;
				}
			}
		}

		if(loop != null){
			this.loop_label = loop.target;
		}		
		return null;
	}


	/**
	 * Get the expression that assigns the initial value the loop variable and record the list of code in 'init_pre','
	 * 'init' and 'init_after' parts.
	 * @param code_blk the list of code.
	 * @param loop_var the loop variable
	 * @param line the starting line of code
	 * @return the expression of 'init' part.
	 */
	protected LinearExpr init(List<Code> code_blk, String loop_var, int line) {
		LinearExpr init = null;
		//Put the code to init_before and init.
		int index = line;
		//Search for the initial value assignment.
		while(index<code_blk.size()){
			Code code = code_blk.get(index);
			index++;
			//Check if this code assigns the value to the loop variable. 
			if(!checkAssertOrAssume(code)&& code instanceof Codes.Assign){
				//check if the loop variable is used in the assignment.
				if(loop_var.equals(prefix+((Codes.Assign)code).target())){
					//Add the code to 'init' part that assigns the initial values to the loop variable.
					AddCodeToPatternPart(code, "init");
					//Get the expression for loop variable.	
					init = factory.replaceLinearExpr((LinearExpr) factory.getExpr(loop_var));
					break;
				}
			}
			//Otherwise, add the code to the 'init_before' part
			AddCodeToPatternPart(code, "init_before");	
		}
		//Set the current line number to 'line' flag.
		this.line = index;
		return init;		
	}


	/**
	 * Output a canonical loop condition from a if bytecode.
	 * That is that the loop variable is on the left and the comparing op is on the right.  
	 * @param before_code the original if byte-code
	 * @param loop_var the loop variable
	 * @return the if byte-code in a canonical form. If the bytecode is not about the loop var, then return null;
	 */
	private Codes.If standardizeLoopCondition(Codes.If before_code, String loop_var){
		//Check if the loop exist in left or right
		if(!loop_var.equals(prefix+before_code.rightOperand) 
				&& !loop_var.equals(prefix+before_code.leftOperand)){
			return null;
		}

		//Check if the loop var is on the right-hand side of the condition. If not, then
		//This bytecode does not need any transformation.
		if(loop_var.equals(prefix+before_code.rightOperand)){
			//The loop var is on the right.
			return Codes.If(before_code.type,
					before_code.rightOperand, 
					before_code.leftOperand, 
					before_code.op,
					before_code.target);
		}

		return before_code;
	}



	/**
	 * Get the lower or upper bound of loop condition.
	 * @param loop_var the loop variable
	 * @param compareOp the type of comparator 
	 * @return the expression of bound.
	 */
	protected LinearExpr while_cond(List<Code> code_blk, String loop_var, int line) {
		LinearExpr loop_bound = null;
		int index = line;
		//Search for the loop condition
		while(index< code_blk.size()){
			Code code = code_blk.get(index);
			index++;
			//Search for loop bytecode
			if(!checkAssertOrAssume(code)&&code instanceof Codes.Loop){
				//Check if the loop variable is used in the loop
				if(loop_var.equals(prefix+((Codes.Loop)code).modifiedOperands[0])){
					//Stop the iteration.
					//Add the code to loop header	
					AddCodeToPatternPart(code, "loop_header");
					break;
				}
			}
			AddCodeToPatternPart(code, "init_after");
		}
		
		//Search for the loop condition
		while(index< code_blk.size()){
			Code code = code_blk.get(index);
			//Search for the loop condition and put it into the 'loop_header'.
			if(!checkAssertOrAssume(code)){
				if(code instanceof Codes.If){
					Codes.If if_code = (Codes.If)code;
					if_code = standardizeLoopCondition(if_code, loop_var);
					if(if_code != null){					
						String cop = prefix+if_code.rightOperand;
						if(if_code.op.equals(Comparator.LTEQ) ){
							comparatorOp = ">";													
						}else if(if_code.op.equals(Comparator.LT)){
							comparatorOp = ">=";
						}else if(if_code.op.equals(Comparator.GTEQ)){
							comparatorOp = "<";
						}else if(if_code.op.equals(Comparator.GT)){
							comparatorOp = "<=";
						}else{
							//Do nothing
						}
						//Get the expression
						loop_bound = (LinearExpr) factory.getExpr(cop);
						//Add the code to loop header	
						AddCodeToPatternPart(code, "loop_header");
						break;	
					}
				}
			}
			//Add the other code to the init_after
			AddCodeToPatternPart(code, "init_after");
			index++;
		}

		this.line = index;
		return loop_bound;
	}


}
