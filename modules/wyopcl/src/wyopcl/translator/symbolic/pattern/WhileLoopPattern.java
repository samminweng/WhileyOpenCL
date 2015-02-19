package wyopcl.translator.symbolic.pattern;

import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.Comparator;
import wyopcl.translator.symbolic.expression.LinearExpr;
/**
 * A while-loop pattern includes 'init_before', 'init', 'init_after', 'loop_header', 'loopbody_before',
 * 'loopbody_update', 'loopbody_after' and 'loop_exit' parts. 
 * 
 * @author Min-Hsien Weng
 *
 */
public class WhileLoopPattern extends Pattern{
	//Expressions related to the loop variable.
	public String V;
	public LinearExpr initLinearExpr;
	public String comparatorOp;
	public LinearExpr loop_boundLinearExpr;

	public WhileLoopPattern(int param_size, List<Code> blk) {
		super(param_size, blk);
		//Add each list of code into the list of pattern parts
		//Construct each part in the pattern.
		this.line = 0;
		this.V = loop_var(blk);
		this.line = init(blk, this.V, this.line);
		this.line = while_cond(blk, this.V, this.line);		
	}

	/**
	 * Find the loop variable
	 * @param code_blk the code block.
	 * @return the variable (string). If not found, return null.
	 */
	protected String loop_var(List<Code> code_blk) {		
		String var = null;
		int index;
		//Search for the 'loop' bytecode
		for(index=0; index<code_blk.size(); index++){
			//Get the loop bytecode	
			Code code = code_blk.get(index);
			//Loop header
			if(!checkAssertOrAssume(code) && code instanceof Codes.Loop && 
					!(code instanceof Codes.ForAll)){
				Codes.Loop loop = (Codes.Loop)code;
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

		return null;
	}


	/**
	 * Extract the expression from the bytecode of assigning the initial value to the loop variable. 
	 * @param loop_var the loop variable.
	 * @return the expression. If not found, return null.
	 */
	public LinearExpr extractInitLinearExpr(Codes.Assign assign, String loop_var){
		//check if the loop variable is used in the assignment.
		if(loop_var.equals(prefix+assign.target())){
			//Get the expression for loop variable.	
			LinearExpr linearExpr = (LinearExpr) factory.getExpr(loop_var);
			if(linearExpr == null){
				linearExpr = factory.putExpr(assign);
			}			
			String[] vars = linearExpr.getVars();
			for(String var: vars){
				linearExpr= factory.replaceLinearExpr(var, linearExpr);  
			}
			return linearExpr;
		}
		return null;
	}
	

	/**
	 * Get the expression that assigns the initial value the loop variable and record the list of code in 'init_pre' and 'init' part.
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
				//Get the expression for loop variable.	
				initLinearExpr = extractInitLinearExpr((Codes.Assign)code, loop_var);
				if(initLinearExpr != null){
					//Add the code to 'init' part that assigns the initial values to the loop variable.
					AddCodeToPatternPart(code, "init");
					return index++;
				}
			}
			//Otherwise, add the code to the 'init_before' part
			AddCodeToPatternPart(code, "init_before");
		}			
		return index;
	}

	
	/**
	 * Get the lower or upper bound of loop condition.
	 * @param V the loop variable
	 * @param compareOp the type of comparator 
	 * @return the expression of bound.
	 */
	protected int while_cond(List<Code> code_blk, String loop_var, int line) {
		if(loop_var == null) return line;
		//Search for the loop condition
		int index;
		for(index=line; index< code_blk.size(); index++){
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
		
		//Search for the loop condition
		for(; index< code_blk.size(); index++){
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
					 this.loop_boundLinearExpr = (LinearExpr) factory.getExpr(op);
					 return ++index;	
				}
				
			}
		}
		return index;
	}

	@Override
	public LinearExpr getNumberOfIterations() {
		return null;
	}
}
