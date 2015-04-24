package wyopcl.translator.symbolic.pattern;

import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.Loop;
import wyil.lang.Type;
import wyopcl.translator.symbolic.pattern.expression.Expr;
import wyopcl.translator.symbolic.pattern.expression.LinearExpr;

/**
 * The abstract class extends the Pattern class and infer the 'loop_var',
 * 'loop_label' and 'init' variables. This abstract pattern splits the list of
 * code into 'init_before', 'init' and 'init_after' parts.
 * 
 * @author Min-Hsien Weng
 *
 */
public abstract class LoopPattern extends Pattern {
	protected LinearExpr numberOfIterations;// the number of loop iterations in a linear form.
	// The loop variable
	protected String loop_var;
	protected Expr init;

	public LoopPattern(boolean isVerbose, List<Type> params, List<Code> blk) {
		super(isVerbose, params, blk);		
		// Get the loop variable.
		this.loop_var = loop_var(blk);
		// If the list of code contains the loop variable, then proceed the pattern matching.
		if (loop_var != null) {
			// Split the code before loop byte into three parts: init_before, init, init_after.
			this.line = this.init_before(blk, this.line);
			this.line = this.init(blk, this.line);
			this.line = this.init_after(blk, this.line);
			// Get the expression for loop variable.
			this.init = factory.rewriteExpr(factory.getExpr(loop_var));
			// Set the pattern name.
			this.pattern_name = "LoopPattern";
		}

	}

	/**
	 * Infer the number of iterations.
	 * 
	 * @return
	 */
	public abstract LinearExpr getNumberOfIterations();

	/**
	 * Get the expression that assigns the initial value the loop variable and
	 * record the list of code in 'init_pre',' 'init' and 'init_after' parts.
	 * 
	 * @param code_blk
	 *            the list of code.
	 * @param loop_var
	 *            the loop variable
	 * @param line
	 *            the starting line of code
	 * @return the expression of the initial value for the loop variable.
	 */
	protected int init_before(List<Code> code_blk, int line) {
		// Search for the initial value assignment.
		int index = line;
		for (; index < code_blk.size(); index++) {
			Code code = code_blk.get(index);
			// Check if this code assigns the value to the loop variable.
			if (!checkAssertOrAssume(code)) {
				// check if the loop variable is used in the assignment for
				// while loop pattern
				if (code instanceof Codes.Assign && loop_var.equals(prefix + ((Codes.Assign) code).target())) {
					return index;
				} else if (code instanceof Codes.BinaryOperator
						&& loop_var.equals(prefix + ((Codes.BinaryOperator) code).target())) {
					// Check if the loop variable is assigned with a range for
					// the forall loop pattern.
					return index;
				}
			}
			// Otherwise, add the code to the 'init_before' part
			AddCodeToPatternPart(code, "init_before");
		}
		return index;
	}

	/**
	 * Get the expression that assigns the initial value the loop variable and
	 * split the list of code in 'init_pre',' 'init' and 'init_after' parts.
	 * 
	 * @param code_blk
	 *            the list of code.
	 * @param line
	 *            the starting line of code
	 * @return the next line number after initial value assignment
	 */
	protected int init(List<Code> code_blk, int line) {
		Code code = code_blk.get(line);
		// Add the code to the 'init' part
		AddCodeToPatternPart(code, "init");
		// Increment the line number
		return ++line;
	}

	/**
	 * Search the loop bytecode and put the code to the 'init_after' part. If
	 * the code is related to the list , then put it to the 'init_list' part. to
	 * the ''
	 * 
	 * @param blk
	 *            the list of code
	 * @param line
	 *            the starting line number
	 */
	protected int init_after(List<Code> blk, int line) {
		int index = line;
		// Search for the loop condition
		while (index < blk.size()) {
			Code code = blk.get(index);
			String part = "init_after";
			// Search for loop bytecode
			if (!checkAssertOrAssume(code)) {
				if (code instanceof Codes.Loop) {
					break;
				}
			}
			AddCodeToPatternPart(code, part);
			index++;
		}
		return index;
	}

	/**
	 * Extract the list variable from the list of code by searching for the
	 * 'Codes.Loop' bytecode
	 *
	 * @return the variable (string). If not found, return null.
	 */
	protected String loop_var(List<Code> blk) {
		for (int index = 0; index < blk.size(); index++) {
			Code code = blk.get(index);
			if (!checkAssertOrAssume(code)) {
				if (code instanceof Codes.Loop) {
					// Get the code block
					Codes.Loop loop = (Codes.Loop) code;
					// Iterate the modified operands.
					// By default, the loop variable is the first modified
					// operands.
					if (loop.modifiedOperands.length >= 1) {
						return prefix + loop.modifiedOperands[0];
					}
				}
			}
		}
		return null;
	}

	/**
	 * Adds the code to the loop exit
	 * 
	 * @param blk
	 * @param line
	 */
	protected int loop_exit(List<Code> blk, int line) {
		int index = line;
		// Put the remaining code into the 'loop_exit' part
		while (index < blk.size()) {
			Code code = blk.get(index);
			index++;
			if (!checkAssertOrAssume(code)) {
				if (code instanceof Codes.Return) {
					AddCodeToPatternPart(code, "return");
				} else {
					// Create the expression and put it into the table.
					AddCodeToPatternPart(code, "loop_exit");
				}
			}
		}

		return index;
	}

}
