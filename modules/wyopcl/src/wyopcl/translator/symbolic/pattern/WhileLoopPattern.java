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
		super(config, params);
		//Add each list of code into the list of pattern parts
		//Construct each part in the pattern.
		this.type = "WhileLoop";		
		this.loop_var = loop_var(blk);
		this.line = init(blk, this.loop_var, this.line);
		this.line = while_cond(blk, this.loop_var, this.line);		
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
	 * @param loop_var the loop variable
	 * @param line the starting line of code
	 * @return the ending line of code of 'init' part.
	 */
	protected int init(List<Code> code_blk, String loop_var, int line) {
		//No loop variables
		if(loop_var == null) return line;

		//Put the code to init_before and init.
		int index;
		for(index = line; index<code_blk.size(); index++){
			Code code = code_blk.get(index);			
			//Check if this code assigns the value to the loop variable. 
			if(!checkAssertOrAssume(code)&& code instanceof Codes.Assign){
				Codes.Assign assign = (Codes.Assign)code;
				//check if the loop variable is used in the assignment.
				if(loop_var.equals(prefix+assign.target())){
					//Put the assignment bytecode of loop variable into the 'init' part.
					//Get the expression for loop variable.	
					LinearExpr linearExpr = (LinearExpr) factory.getExpr(loop_var);
					if(linearExpr == null){
						linearExpr = (LinearExpr) factory.putExpr(assign);
					}			
					this.init= factory.replaceLinearExpr(linearExpr);
					//Add the code to 'init' part that assigns the initial values to the loop variable.
					AddCodeToPatternPart(code, "init");					
					break;
				}
			}
			//Otherwise, add the code to the 'init_before' part
			AddCodeToPatternPart(code, "init_before");
		}
		
		//Search for the loop condition
		for(index=index+1; index< code_blk.size(); index++){
			Code code = code_blk.get(index);
			//Search for loop bytecode
			if(!checkAssertOrAssume(code)&&code instanceof Codes.Loop){
				//Check if the loop variable is used in the loop
				Codes.Loop loop = (Codes.Loop)code;
				if(loop_var.equals(prefix+loop.modifiedOperands[0])){
					//Stop the iteration.
					break;
				}
			}
			AddCodeToPatternPart(code, "init_after");
		}
		
		
		return index;
	}


	/**
	 * Get the lower or upper bound of loop condition.
	 * @param loop_var the loop variable
	 * @param compareOp the type of comparator 
	 * @return the expression of bound.
	 */
	protected int while_cond(List<Code> code_blk, String loop_var, int line) {
		if(loop_var == null) return line;
		//Search for the loop condition
		int index;
		//Search for the loop condition
		for(index=line; index< code_blk.size(); index++){
			Code code = code_blk.get(index);
			//Add the code to loop header	
			AddCodeToPatternPart(code, "loop_header");
			if(!checkAssertOrAssume(code)&&code instanceof Codes.If){
				Codes.If if_code = (Codes.If)code;
				String op = null;
				//Check if the loop var exists in the condition
				if(loop_var.equals(prefix+if_code.leftOperand)){
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
					op = prefix+if_code.rightOperand;								
				}

				if(loop_var.equals(prefix+if_code.rightOperand)){						
					if(if_code.op.equals(Comparator.LTEQ) ){
						comparatorOp = "<";													
					}else if(if_code.op.equals(Comparator.LT)){
						comparatorOp = "<=";
					}else if(if_code.op.equals(Comparator.GTEQ)){
						comparatorOp = ">";
					}else if(if_code.op.equals(Comparator.GT)){
						comparatorOp = ">=";
					}else{
						//Do nothing
					}			
					op = prefix+if_code.leftOperand;						
				}

				if(op != null){
					//Get the expression 
					this.loop_bound = (LinearExpr) factory.getExpr(op);
					break;	
				}
			}
		}
		return index;
	}

	
}
