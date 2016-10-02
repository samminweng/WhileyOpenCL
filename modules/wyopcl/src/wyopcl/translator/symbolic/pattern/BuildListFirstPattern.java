package wyopcl.translator.symbolic.pattern;

import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.Codes.Comparator;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.symbolic.pattern.expression.Expr;

/**
 * This pattern creates a new list (r) with an existing list and initializes the
 * array size (r_size) and capacity (r_capacity). Then it iterates over the
 * existing list to gradually fill up the new list.
 * 
 * @author Min-Hsien Weng
 *
 */
public final class BuildListFirstPattern extends WhileLoopPattern {
	public String list_var;
	public String list_size;
	public String list_capacity;
	public Expr list_init;
	public Expr list_update;
	public Expr list_size_init;
	public Expr list_size_update;

	public BuildListFirstPattern(Configuration config, FunctionOrMethod functionOrMethod) {
		super(config, functionOrMethod);
		
		// Check if the inferred increment or decrement is null. If not, then
		// continue iterating the list of code.
		// Otherwise, stop constructing the BuildListPattern.
		if (this.list_var != null && this.list_size != null && this.list_init != null && this.list_size_init != null
				&& (this.incr != null || this.decr != null)) {
			// this.line = this.loopbody_after(blk, this.line);
			if (this.list_update != null && this.list_size_update != null) {
				this.line = this.loop_exit(functionOrMethod.body().bytecodes(), this.line);
				if (this.list_capacity != null) {
					this.pattern_name = "BuildListFirst";
					this.isNil = false;
				}
			}
		}
	}

	/**
	 * Infer the loop var, list_var, list_size variable
	 */
	@Override
	protected String loop_var(List<Code> blk) {
		for (int index = 0; index < blk.size(); index++) {
			Code code = blk.get(index);
			if (code instanceof Codes.Loop) {
				// Check if the list of bytecode contains a loop bytecode.
				// While loop
				Codes.Loop loop = (Codes.Loop) code;
				// Iterate the modified operands. By default, the loop
				// variable is the first modified operands.
				if (loop.modifiedOperands.length >= 3) {
					this.list_var = prefix + loop.modifiedOperands[1];
					this.list_size = prefix + loop.modifiedOperands[2];
					return prefix + loop.modifiedOperands[0];
				}
			}
		}
		return null;
	}

	/**
	 * Search the loop bytecode and put the code to the 'init_after' part. If
	 * the code assigns the value to the list, then put it to the 'list_init'
	 * part. If the code assigns the value to the r_size, then put it to the
	 * 'r_size_init' part.
	 * 
	 * @param code_blk
	 *            the list of code
	 * @param line
	 *            the starting line number
	 * @return the line number that the code contains the loop bytecode
	 */
	@Override
	protected int init(List<Code> code_blk, String var) {
		// Search for the initial value assignment.
		int index;
		for (index = 0; index < code_blk.size(); index++) {
			Code code = code_blk.get(index);
			// Check if this code assigns the value to the loop variable.
			if (!isInvariant(code)) {
				// check if the loop variable is used in the assignment for
				// while loop pattern
				if (code instanceof Codes.Assign && var.equals(prefix + ((Codes.Assign) code).target(0))) {
					// Add the code to the 'init' part
					AddCodeToPatternPart(code, "init");
					break;
				}
			}
			// Otherwise, add the code to the 'init_before' part
			AddCodeToPatternPart(code, "init_before");
		}

		// Search for the loop condition
		for (index += 1; index < code_blk.size(); index++) {
			Code code = code_blk.get(index);
			// Search for loop bytecode
			if (code instanceof Codes.Loop) {
				break;
			} else if (code instanceof Codes.Assign) {
				Codes.Assign assign = (Codes.Assign) code;
				// Search for the initial assignment for the array and array
				// size.
				// Check if the right operand is list var.
				if (this.list_var != null && this.list_var.equals(prefix + assign.target(0))) {
					// Add the code to the 'list_init' part
					AddCodeToPatternPart(code, "list_init");
				} else if (this.list_size != null && this.list_size.equals(prefix + assign.target(0))) {
					// Add the code to the 'list_size_init' part
					AddCodeToPatternPart(code, "list_size_init");
				} else {
					// Add the code to the 'init' part
					AddCodeToPatternPart(code, "init_after");
				}
			} else {
				AddCodeToPatternPart(code, "init_after");
			}
		}
		// Get the initial expression for the list var
		this.list_init = factory.rewriteExpr(factory.getExpr(this.list_var));
		this.list_size_init = factory.rewriteExpr(factory.getExpr(this.list_size));
		this.init = factory.rewriteExpr(factory.getExpr(loop_var));
		return index;
	}

	/**
	 * Search for the update for the list and put the code to the 'list_update'
	 * part. And extract the expression of the newly appended list from the
	 * assignment byte-code.
	 * 
	 * @param blk
	 *            the list of code
	 * @param line
	 * @return
	 */
	@Override
	protected void loop_body(List<Code> loop_blk, int line) {
		int index = line;
		// Put the code in 'loopbody_before' part.
		for (; index < loop_blk.size(); index++) {
			Code code = loop_blk.get(index);
			// Search for the binOp that subtracts the loop variable with a
			// constant.
			if (code instanceof Codes.BinaryOperator) {
				Codes.BinaryOperator binOp = (Codes.BinaryOperator) code;
				// Search for the decrement
				if (loop_var.equals(prefix + binOp.operand(0))) {
					break;
				}
			} else {
				AddCodeToPatternPart(code, "loopbody_before");
			}
		}
		// Search for the code of re-assigning values to the loop variable and
		// put the prior code to the 'loopbody_update' part.
		for (; index < loop_blk.size(); index++) {
			Code code = loop_blk.get(index);			
			// Search for the decrement that assigns the value to the loop
			// var.
			if (code instanceof Codes.Assign) {
				// Check if the assignment bytecode is to over-write the
				// value of loop variable.
				Codes.Assign assign = (Codes.Assign) code;
				// Check if the target is the loop variable.
				if ((prefix + assign.target(0)).equals(loop_var)) {
					// Get the increment and decrement.
					incr = factory.extractIncrement(assign, loop_var);
					decr = factory.extractDecrement(assign, loop_var);
					AddCodeToPatternPart(code, "loopbody_update");
					// Increment the index
					++index;
					break;
				}
			}else{
				AddCodeToPatternPart(code, "loopbody_before");
			}
		}

		// Search for 'list_update'
		for (; index < loop_blk.size(); index++) {
			Code code = loop_blk.get(index);
			AddCodeToPatternPart(code, "list_update");
			if (code instanceof Codes.Update) {
				Codes.Update update = (Codes.Update) code;
				if (this.list_var != null && this.list_var.equals(prefix + update.target(0))) {
					this.list_update = factory.getExpr(prefix + update.operand(0));
					++index;
					break;
				} 
			} 
		}

		// Search for list_size_update and put the remaining code to
		// 'list_size_update_before' part.
		for (; index < loop_blk.size(); index++) {
			Code code = loop_blk.get(index);
			AddCodeToPatternPart(code, "list_size_update");
			// Check if the code initializes the list.
			if (code instanceof Codes.Assign) {
				Codes.Assign assign = (Codes.Assign) code;
				if (this.list_size != null && this.list_size.equals(prefix + assign.target(0))) {		
					this.list_size_update = factory.getExpr(prefix + assign.operand(0));
					++index;
					break;
				}  
			}
		}		

		// Put the remaining code to
		// 'loopbody_after' part.
		for (; index < loop_blk.size(); index++) {
			Code code = loop_blk.get(index);
			// Create the expression and put it into the table.
			AddCodeToPatternPart(code, "loopbody_after");
		}
	}

	/**
	 * Adds the code to the loop exit
	 * 
	 * @param blk
	 * @param line
	 */
	@Override
	protected int loop_exit(List<Code> blk, int line) {
		int index = line;
		// Put the remaining code into the 'loop_exit' part
		for (; index < blk.size(); index++) {
			Code code = blk.get(index);
			if (code instanceof Codes.Return) {
				AddCodeToPatternPart(code, "return");
			} else {
				//Get the list_capacity
				if(code instanceof Codes.Assert){
					Codes.Assert assertion = (Codes.Assert)code;
					for(Code at_code :assertion.bytecodes()){
						if(at_code instanceof Codes.If){
							Codes.If if_code = (Codes.If)at_code;
							//Check if the comparator operand is EQ
							if(if_code.op.equals(Comparator.EQ)){
								//Check if list_size is left or right operand.
								if(this.list_size.equals(prefix+if_code.operand(0))){
									this.list_capacity = prefix+if_code.operand(1);
								}else if(this.list_size.equals(prefix+if_code.operand(1))){
									this.list_capacity = prefix+if_code.operand(0);
								}
							}							
						}
					}
				}
				// Create the expression and put it into the table.
				AddCodeToPatternPart(code, "loop_exit");
			}
		}
		return index;
	}
	

	@Override
	public String toString() {
		String result = super.toString();
		result += "\n" + pattern_name + " && loop_var(" + loop_var + ") && list_var(" + list_var + ") && list_size(" + list_size
				+ ") && list_capacity(" + list_capacity + ") &&";
		if (incr != null) {
			result += " incr(" + loop_var + ", " + incr + ")";
		}
		if (decr != null) {
			result += " decr(" + loop_var + ", " + decr + ")";
		}
		result += " && init(" + loop_var + ", " + init + ") && list_init(" + list_var + ", " + this.list_init + ") && list_size_init(" + list_size
				+ ", " + list_size_init + ") &&" + " while_cond(" + loop_var + ", " + comparatorOp + ", " + loop_bound + ")" + "\n=>loop_iters("
				+ loop_var + ", " + getNumberOfIterations() + ")";
		return result;
	}

}
