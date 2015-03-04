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
 * This abstract pattern splits the list of code into 'init_before', 'init' and 'init_after' parts.
 * 
 * @author Min-Hsien Weng
 *
 */
public abstract class LoopPattern extends Pattern{
	protected LinearExpr numberOfIterations;// the number of loop iterations in affine form.	
	//The variable (loop variable or list variable).
	public String loop_var;
	public String loop_label;
	public String[] modified_Ops;//Store all the operands modified inside the loop.
	public Expr init;
	
	public LoopPattern(Configuration config, List<Type> params, List<Code> blk){
		super(config, params);
		this.type = "LoopPattern";
		//If the list of code contains the loop bytecode, then proceed the inference 
		if(this.isLoop(blk)){
			//Get the loop variable.
			this.loop_var = loop_var(blk);
			if(this.loop_var != null){
				this.line = this.init_before(blk, this.line);
				this.init = init(blk, this.loop_var, this.line);
				if(this.init != null){
					this.init = factory.rewriteExpr(this.init);
					this.line = this.init_after(blk, this.line);
				}				
			}
		}
	}

	/**
	 * Infer the number of iterations.
	 * @return
	 */
	public abstract LinearExpr getNumberOfIterations();
	
	/**
	 * Get the expression that assigns the initial value the loop variable and record the list of code in 'init_pre','
	 * 'init' and 'init_after' parts.
	 * @param code_blk the list of code.
	 * @param loop_var the loop variable
	 * @param line the starting line of code
	 * @return the expression of the initial value for the loop variable.
	 */
	protected int init_before(List<Code> code_blk, int line) {
		//Put the code to init_before and init.
		int index = line;
		//Search for the initial value assignment.
		while(index<code_blk.size()){
			Code code = code_blk.get(index);
			//Check if this code assigns the value to the loop variable. 
			if(!checkAssertOrAssume(code)){
				if(code instanceof Codes.Assign){
					//check if the loop variable is used in the assignment.
					if(loop_var.equals(prefix+((Codes.Assign)code).target())){
						break;
					}
				}else if(code instanceof Codes.BinaryOperator){
					//Check if the loop variable is assigned with a range
					if(loop_var.equals(prefix+((Codes.BinaryOperator)code).target())){
						break;
					}
				}
			}
			//Otherwise, add the code to the 'init_before' part
			AddCodeToPatternPart(code, "init_before");
			index++;
		}	
		return index;		
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
		Code code = code_blk.get(line);
		//Add the code to the 'init' part
		AddCodeToPatternPart(code, "init");
		line++;
		//Increment the 
		this.line = line;
		//Get the expression for loop variable.	
		return factory.getExpr(loop_var);
	}
	
	
	/**
	 * Search the loop bytecode and put the code to the 'init_after' part.
	 * If the code is related to the list , then put it to the 'init_list' part.
	 * to the ''
	 * @param blk the list of code
	 * @param line the starting line number
	 */
	protected int init_after(List<Code> blk, int line){
		int index = line;
		//Search for the loop condition
		while(index< blk.size()){
			Code code = blk.get(index);
			String part = "init_after";
			//Search for loop bytecode
			if(!checkAssertOrAssume(code)){
				if(code instanceof Codes.Loop){
					Codes.Loop loop = (Codes.Loop)code;
					//Check if the loop variable is used in the loop
					if(this.loop_label.equals(loop.target)){
						//Stop the iteration.
						break;
					}
				}				
			}
			AddCodeToPatternPart(code, part);
			index++;
		}
		return index;
	}
	
	/**
	 *  Extract the list variable from the list of code by searching for the 'Codes.Loop'  or 'Forall' bytecode
	 * @param code_blk the code block.
	 * @return the variable (string). If not found, return null.
	 */
	protected String loop_var(List<Code> code_blk) {
		int index;
		//Search for the 'loop' bytecode
		for(index=0; index<code_blk.size(); index++){
			Code code = code_blk.get(index);
			//Find the loop bytecode	
			if(!checkAssertOrAssume(code)){
				if(code instanceof Codes.ForAll){
					Codes.ForAll forall = (Codes.ForAll)code;
					this.loop_label = forall.target;
					//Return the source operand that the forall loop iterates over.
					return prefix+forall.sourceOperand;
				}else if(code instanceof Codes.Loop){
					Codes.Loop loop = (Codes.Loop)code;
					this.loop_label = loop.target;
					//Initialize the modified operands from the loop bytecode 
					this.modified_Ops = new String[loop.modifiedOperands.length];
					index = 0;
					while(index<loop.modifiedOperands.length){
						this.modified_Ops[index] = prefix+loop.modifiedOperands[index];
						index++;
					}
					//By default, the loop variable is the first modified operands.
					return modified_Ops[0];	
				}
			}							
		}		
		return null;
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
			if(!checkAssertOrAssume(code)){
				if(code instanceof Codes.Loop){
					return true;
				}				
			}			
		}
		return false;
	}	

	
	
	
	/**
	 * Adds the code to the loop exit
	 * @param blk
	 * @param line
	 */
	protected int loop_exit(List<Code>blk, int line){
		int index = line;
		//Put the remaining code into the 'loop_exit' part
		while(index<blk.size()){
			Code code = blk.get(index);
			index++;
			if(!checkAssertOrAssume(code)){
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
	
	
	
	
}
