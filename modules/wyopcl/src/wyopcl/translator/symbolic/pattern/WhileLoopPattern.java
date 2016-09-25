package wyopcl.translator.symbolic.pattern;

import java.math.BigInteger;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.Invariant;
import wyil.lang.Codes.Loop;
import wyil.lang.Type;
import wyil.lang.Codes.Comparator;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.symbolic.pattern.expression.LinearExpr;

/**
 * The while-loop pattern gets the loop header, loop condition and loop update.
 * and splits the list of code into 'loop_header', 'loopbody_before',
 * 'loopbody_update' and 'loopbody_after' parts.
 * 
 * @author Min-Hsien Weng
 *
 */
public abstract class WhileLoopPattern extends LoopPattern {
	// Expressions related to the while-loop condition.
	protected BigInteger decr;
	protected BigInteger incr;

	/**
	 * Constructor of while loop pattern.
	 * 
	 * @param config
	 * @param params
	 * @param blk
	 */
	public WhileLoopPattern(Configuration config, FunctionOrMethod functionOrMethod) {
		super(config, functionOrMethod);
		// If the list of code contains the loop variable, then proceed the
		// pattern matching.
		if (loop_var != null) {
			// Split the code before loop byte into three parts: init_before, init, init_after.
			List<Code> blk = functionOrMethod.body().bytecodes();
			this.line = this.init(blk, this.loop_var);
			// Check if the loop pattern is constructed successfully.
			if (this.init != null) {
				this.line = while_cond((Loop) blk.get(this.line));
				if (this.loop_bound != null) {
					// Simplify the expressions.
					this.loop_bound = factory.rewriteExpr(this.loop_bound);
				}
			}
		}

	}

	/**
	 * Extract the loop variable from the list of code by searching for the
	 * 'Codes.Loop' bytecode
	 *
	 * @return the variable (string). If not found, return null.
	 */
	protected String loop_var(List<Code> blk) {
		String loop_var = null;
		for (int index = 0; index < blk.size(); index++) {
			Code code = blk.get(index);
			if (code instanceof Codes.Loop) {
				// Check if the list of bytecode contains a loop bytecode.
				Codes.Loop loop = (Codes.Loop) code;				 
				boolean isFound = false;
				// The left and right operand
				int left=-1, right = -1;
				// Iterate each byte-code inside the loop to find the loop variable
				for(Code c: loop.bytecodes()){
					// Find the loop condition 
					if(isFound == false && c instanceof Codes.If){
						Codes.If if_code = (Codes.If)c;
						// Get the left and right operands
						left = if_code.operand(0);
						right = if_code.operand(1);
						isFound = true;
					}
					
					// Get the assignment to update the loop variable
					if(isFound == true && c instanceof Codes.Assign){
						// Update the left or right operand
						Codes.Assign assign = (Codes.Assign)c;
						int target = assign.target(0);
						// Check the target appears on the condition
						if(target == left || target == right){
							// loop variable is the target 
							loop_var = prefix+target;
							break;// Exit the loop
						}
					}
				}
			}
		}
		return loop_var;
	}

	/**
	 * Get the expression that assigns the initial value the loop variable and
	 * split the list of code in 'init_pre',' 'init' and 'init_after' parts.
	 * 
	 * @param blk
	 *            the list of code.
	 * @param var
	 *            the variable that is updated by the initial assignment.
	 * @param line
	 *            the starting line of code
	 * @return the next line number after initial value assignment
	 */
	protected int init(List<Code> blk, String loop_var) {
		// Search for the initial value assignment.
		int index;
		for (index = 0; index < blk.size(); index++) {
			Code code = blk.get(index);
			// Check if this code assigns the value to the loop variable.
			if (!(code instanceof Codes.Invariant)) {
				// Get the assignment for loop variable
				if (code instanceof Codes.Assign){
					Codes.Assign assign = (Codes.Assign)code;
					String var = prefix +assign.target(0);
					
					if(loop_var.equals(var)){
						// Add the code to the 'init' part
						AddCodeToPatternPart(code, "init");
						break;
					}
				}
			}
			// Otherwise, add the code to the 'init_before' part
			AddCodeToPatternPart(code, "init_before");
		}

		// Search for the loop condition
		for (index += 1; index < blk.size(); index++) {
			Code code = blk.get(index);
			// Search for loop bytecode
			if (!isInvariant(code) && (code instanceof Codes.Loop)) {
				break;
			}
			AddCodeToPatternPart(code, "init_after");
		}

		// Get the expression for loop variable.
		this.init = factory.rewriteExpr(factory.getExpr(loop_var));

		return index;
	}

	/**
	 * Output a canonical loop condition from a if bytecode. That is that the
	 * loop variable is on the left and the comparing op is on the right.
	 * 
	 * @param before_code
	 *            the original if byte-code
	 * @param loop_var
	 *            the loop variable
	 * @return the if byte-code in a canonical form. If the bytecode is not
	 *         about the loop var, then return null;
	 */
	private Codes.If standardizeLoopCondition(Codes.If before_code, String loop_var) {
		// Check if the loop exist in left or right
		if (!loop_var.equals(prefix + before_code.operand(1)) && !loop_var.equals(prefix + before_code.operand(0))) {
			return null;
		}
		// Check if the loop var is on the right-hand side of the condition. If
		// not, then
		// This bytecode does not need any transformation.
		if (loop_var.equals(prefix + before_code.operand(1))) {
			// Change the comparing operator
			Comparator new_op = null;
			switch (before_code.op) {
			case LTEQ:
				new_op = Comparator.GTEQ;
				break;
			case LT:
				new_op = Comparator.GT;
				break;
			case GTEQ:
				new_op = Comparator.LTEQ;
				break;
			case GT:
				new_op = Comparator.LT;
				break;
			default:
				break;
			}

			if (new_op != null) {
				// The loop var is on the right.
				return Codes.If(before_code.type(0), before_code.operand(1), before_code.operand(0), new_op, before_code.target);
			}
		}

		return before_code;
	}


	/**
	 * Find the bytecode of loop blk and loop condition and put them into the
	 * 'loop_header'
	 * 
	 * @param loop_blk
	 * @return the ending line number.
	 */
	protected int while_cond(Codes.Loop loop) {
		// Get the list of byte-code inside a loop
		List<Code> loop_blk = loop.bytecodes();
		int index;
		// Search for the loop condition
		for (index = 0; index < loop_blk.size(); index++) {
			Code code = loop_blk.get(index);
			// Search for the loop condition and put it into the 'loop_header'.
			if (code instanceof Codes.If) {
				Codes.If if_code = (Codes.If) code;
				if_code = standardizeLoopCondition(if_code, loop_var);
				// Check if the bytecode is the loop condition.
				if (if_code != null) {
					// Add the code to loop header
					AddCodeToPatternPart(if_code, "loop_header");
					String cop = prefix + if_code.operand(1);
					switch (if_code.op) {
					case LTEQ:
						comparatorOp = ">";
						break;
					case LT:
						comparatorOp = ">=";
						break;
					case GTEQ:
						comparatorOp = "<";
						break;
					case GT:
						comparatorOp = "<=";
						break;
					default:
						break;
					}
					// Get the expression
					this.loop_bound = (LinearExpr) factory.getExpr(cop);
					// Increment the index of loop block and stop the iteration
					index++;
					break;
				}
			} else {
				// Add the code to loop header
				AddCodeToPatternPart(code, "loop_header");
			}
		}

		loopbody(loop_blk, index);

		return ++this.line;
	}

	/**
	 * Infer the number of iterations.
	 * 
	 * @return
	 */
	@Override
	protected LinearExpr getNumberOfIterations() {
		if (numberOfIterations == null) {
			LinearExpr result = null;
			switch (comparatorOp) {
			case "<":
				result = (LinearExpr) loop_bound.clone();
				result = result.subtract((LinearExpr) init);
				break;
			case "<=":
				result = (LinearExpr) loop_bound.clone();
				result = result.subtract((LinearExpr) init).add((LinearExpr) factory.putExpr(BigInteger.ONE));
				break;
			case ">":
				result = (LinearExpr) init.clone();
				result = result.subtract((LinearExpr) loop_bound);
				break;
			case ">=":
				result = (LinearExpr) init.clone();
				result = result.subtract((LinearExpr) loop_bound).add((LinearExpr) factory.putExpr(BigInteger.ONE));
				break;
			}

			numberOfIterations = result;
		}
		return numberOfIterations;
	}

	@Override
	protected void loopbody(List<Code> loop_blk, int line) {
		int index;
		// Put the code in 'loopbody_before' part.
		for (index = line; index < loop_blk.size(); index++) {
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
		//Search for the code of re-assigning values to the loop variable and put the prior code to the 'loopbody_update' part.
		for (; index < loop_blk.size(); index++) {
			Code code = loop_blk.get(index);
			AddCodeToPatternPart(code, "loopbody_update");
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
					break;
				}
			}
		}

		//Put the remaining code to 'loopbody_after' part.
		for (; index < loop_blk.size(); index++) {
			Code code = loop_blk.get(index);
			// Create the expression and put it into the table.
			AddCodeToPatternPart(code, "loopbody_after");
		}

	}

}
