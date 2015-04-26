package wyopcl.translator.symbolic.pattern;

import java.math.BigInteger;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.Invariant;
import wyil.lang.Codes.Loop;
import wyil.lang.Type;
import wyil.lang.Codes.Comparator;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.pattern.expression.Expr;
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
	public String comparatorOp;
	public Expr loop_bound;
	public BigInteger decr;
	public BigInteger incr;

	public WhileLoopPattern(Configuration config, List<Type> params, List<Code> blk) {
		super(config, params, blk);
		// Check if the loop pattern is constructed successfully.
		if (this.init != null) {
			this.line = while_cond((Loop) blk.get(this.line));
			// this.line = while_cond((Loop) blk.get(this.line), this.loop_var,
			// this.line);
			if (this.loop_bound != null) {
				// Simplify the expressions.
				this.loop_bound = factory.rewriteExpr(this.loop_bound);

			}
		}
	}

	/**
	 * Search for the code of re-assigning values to the loop variable and put
	 * the prior code to the 'loopbody_update' part.
	 * 
	 * @param blk
	 *            the list of code.
	 * @param loop_var
	 *            the loop variable.
	 * @param line
	 *            the starting line number
	 * @return the ending line number.
	 */
	private int loopbody_update(List<Code> blk, int line) {
		int index = line;
		for (; index < blk.size(); index++) {
			Code code = blk.get(index);
			AddCodeToPatternPart(code, "loopbody_update");
			// Search for the decrement that assigns the value to the loop
			// var.
			if (code instanceof Codes.Assign) {
				// Check if the assignment bytecode is to over-write the
				// value of loop variable.
				Codes.Assign assign = (Codes.Assign) code;
				// Check if the target is the loop variable.
				if ((prefix + assign.target()).equals(loop_var)) {
					// Get the increment and decrement.
					incr = factory.extractIncrement(assign, loop_var);
					decr = factory.extractDecrement(assign, loop_var);
					//Increment the index
					++index;
					break;
				}
			}

		}

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
		if (!loop_var.equals(prefix + before_code.rightOperand) && !loop_var.equals(prefix + before_code.leftOperand)) {
			return null;
		}
		// Check if the loop var is on the right-hand side of the condition. If
		// not, then
		// This bytecode does not need any transformation.
		if (loop_var.equals(prefix + before_code.rightOperand)) {
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
				return Codes.If(before_code.type, before_code.rightOperand, before_code.leftOperand, new_op,
						before_code.target);
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
		// Add the loop bytecode to loop_header
		AddCodeToPatternPart(loop, "loop_header");
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
					String cop = prefix + if_code.rightOperand;
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

		index = this.loopbody_before(loop_blk, index);
		index = this.loopbody_update(loop_blk, index);
		index = this.loopbody_after(loop_blk, index);

		return ++this.line;
	}

	/**
	 * Searches for the loop_update and put the searched code into
	 * 'loopbody_before'.
	 * 
	 * @param blk
	 *            the list of code
	 * @param line
	 *            the starting line number.
	 */
	private int loopbody_before(List<Code> blk, int line) {
		int index = line;
		// Put the code in 'loopbody_before' part.
		for (; index < blk.size(); index++) {
			Code code = blk.get(index);
			// Search for the binOp that subtracts the loop variable with a
			// constant.
			if (code instanceof Codes.BinaryOperator) {
				Codes.BinaryOperator binOp = (Codes.BinaryOperator) code;
				// Search for the decrement
				if (loop_var.equals(prefix + binOp.operand(0))) {
					return index;
				}
			} else {
				AddCodeToPatternPart(code, "loopbody_before");
			}
		}

		return index;
	}

	/**
	 * Search for loop end and put the code to 'loopbody_after' part.
	 * 
	 * @param blk
	 * @param line
	 */
	private int loopbody_after(List<Code> blk, int line) {
		int index = line;
		for (;index < blk.size();index++) {
			Code code = blk.get(index);
			// Create the expression and put it into the table.
			AddCodeToPatternPart(code, "loopbody_after");
		}
		return index;
	}

	@Override
	public LinearExpr getNumberOfIterations() {
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

}
