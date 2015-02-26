package wyopcl.translator.symbolic.pattern;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.expression.Expr;
import wyopcl.translator.symbolic.expression.LinearExpr;
/**
 * The abstract class extends the Pattern class and infer the 'loop_var', 'loop_label' and 'init' variables.
 * This abstract pattern splits the list of code into 'init_before' and 'init' parts.
 * 
 * @author Min-Hsien Weng
 *
 */
public abstract class LoopPattern extends BasePattern{
	protected LinearExpr numberOfIterations;// the number of loop iterations in affine form.	
	//The variable (loop variable or list variable).
	public String loop_var;
	protected String loop_label;
	protected Expr init;

	public LoopPattern(Configuration config, List<Type> params, List<Code> blk){
		super(config, params);
		this.type = "LoopPattern";
		//If the list of code contains the loop bytecode, then proceed the inference 
		if(this.isLoop(blk)){
			//Get the loop variable.
			this.loop_var = loop_var(blk);
			if(this.loop_var != null){
				this.init = factory.rewriteExpr(init(blk, loop_var, line));
			}			
		}
	}

	/**
	 * Infer the number of iterations.
	 * @return
	 */
	public abstract LinearExpr getNumberOfIterations();
	

	/**
	 * Find the loop variable
	 * @param code_blk the code block.
	 * @return the variable (string). If not found, return null.
	 */
	protected String loop_var(List<Code> code_blk) {
		Codes.Loop loop = null;
		int index;
		//Search for the 'loop' bytecode
		for(index=0; index<code_blk.size(); index++){
			Code code = code_blk.get(index);
			//Find the loop bytecode	
			if(!checkAssertOrAssume(code) && code instanceof Codes.Loop){
				if(code instanceof Codes.ForAll){
					loop = (Codes.ForAll)code;
					Codes.ForAll forall = (Codes.ForAll)code;
					this.loop_label = forall.target;
					//Return the source operand that the forall loop iterates over.
					return prefix+forall.sourceOperand;
				}else{
					loop = (Codes.Loop)code;
					this.loop_label = loop.target;
					//The loop variable is the first modified operands.
					return prefix+loop.modifiedOperands[0];	
				}
			}							
		}
		
		return null;
	}
	

	/**
	 * Get the expression that assigns the initial value the loop variable and record the list of code in 'init_pre','
	 * 'init' and 'init_after' parts.
	 * @param code_blk the list of code.
	 * @param loop_var the loop variable
	 * @param line the starting line of code
	 * @return the expression of the initial value for the loop variable.
	 */
	protected Expr init(List<Code> code_blk, String loop_var, int line) {
		//Put the code to init_before and init.
		int index = line;
		//Search for the initial value assignment.
		while(index<code_blk.size()){
			Code code = code_blk.get(index);
			index++;
			//Check if this code assigns the value to the loop variable. 
			if(!checkAssertOrAssume(code)){
				if(code instanceof Codes.Assign){
					//check if the loop variable is used in the assignment.
					if(loop_var.equals(prefix+((Codes.Assign)code).target())){
						//Add the code to 'init' part that assigns the initial values to the loop variable.
						AddCodeToPatternPart(code, "init");
						break;
					}
				}else if(code instanceof Codes.BinaryOperator){
					//Check if the loop variable is assgined with a range
					if(loop_var.equals(prefix+((Codes.BinaryOperator)code).target())){
						AddCodeToPatternPart(code, "init");
						break;
					}
				}			
			}
			//Otherwise, add the code to the 'init_before' part
			AddCodeToPatternPart(code, "init_before");	
		}
		//Set the current line number to 'line' flag.
		this.line = index;
		//Get the expression for loop variable.	
		return factory.getExpr(loop_var);		
	}

	/**
	 * Check if the code block contains the loop bytecode. 
	 * @param blk the list of code blk
	 * @return true if the code blk contains the loop bytecode. Otherwise, return false.
	 */
	protected boolean isLoop(List<Code> blk){
		int index;
		for(index=0;index<blk.size();index++){
			Code code = blk.get(index);
			if(!checkAssertOrAssume(code) && code instanceof Codes.Loop){
				return true;
			}			
		}
		return false;
	}	

	/**
	 * Adds the code to the loop exit
	 * @param blk
	 * @param line
	 */
	protected void loop_exit(List<Code>blk, int line){
		int index = line;
		//Put the remaining code into the 'loop_exit' part
		while(index<blk.size()){
			Code code = blk.get(index);
			index++;
			//Create the expression and put it into the table.
			AddCodeToPatternPart(code, "loop_exit");
		}
	}
	
}
