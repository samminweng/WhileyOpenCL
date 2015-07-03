package wyopcl.translator.symbolic.pattern;

import java.math.BigInteger;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.Codes.Loop;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.pattern.expression.Expr;
import wyopcl.translator.symbolic.pattern.expression.LinearExpr;
import wyopcl.translator.symbolic.pattern.expression.RangeExpr;

/**
 * The 'ForAll' pattern is similar to 'WhileLoop' pattern. It includes the
 * 'init_before', 'init', 'init_after', 'loop_header', 'loop_body' and
 * 'loop_exit'. For example, a 'forall' loop iterates over a range (%1), as
 * shown as follows:
 * 
 * <pre>
 * <code>
 * init_before:
 * 	const %4 = 0 : int
 * 	assign %3 = %4  : int
 * init:
 * 	assign %1 = %3  : int
 * init_after:
 * 	const %5 = 0 : int
 * 	range %6 = %5, %0 : [int]
 * loop_header:
 * 	forall %2 in %6 (%1, %7) : [int]
 * loop_body:
 * 	add %7 = %1, %2 : int
 * 	assign %1 = %7  : int
 * loop_exit:
 * 	.blklab1
 * return:
 * 	return %1 : int
 * 	return
 * </code>
 * </pre>
 * 
 * The loop variable is the range ('%1') and then the 'init' is the assignment
 * byte-code of the new list value ('assign %1 = %3 : [int]').
 * 
 * @author Min-Hsien Weng
 *
 */
@Deprecated
public class ForAllRangePattern extends LoopPattern {
	protected String sourceOp;

	public ForAllRangePattern(Configuration config, FunctionOrMethod functionOrMethod) {
		super(config, functionOrMethod);
		// Check If the forall bytecode contains the loop and source variables.
		if (this.loop_var != null && this.sourceOp != null) {
			List<Code> blk = functionOrMethod.body().bytecodes();
			// Split the code before loop byte into three parts: init_before,
			// init, init_after.
			this.line = this.init(blk, this.sourceOp, this.line);
			// Check if the loop pattern is constructed successfully.
			if (this.init != null) {
				/*Codes.ForAll forall = (Codes.ForAll) blk.get(this.line);
				this.line = this.forall(forall, this.line);*/
				if (this.loop_bound != null) {
					this.line = this.loop_exit(blk, this.line);
					this.pattern_name = "ForAllRange";
					this.isNil = false;
				}
			}
		}
	}

	/**
	 * Put the forall byte-code onto 'loop_header' part and put the list of
	 * byte-code to 'loop_body' part.
	 * 
	 * @param forall
	 * @param line
	 * @return
	 */
	/*protected int forall(Codes.ForAll forall, int line) {
		AddCodeToPatternPart(forall, "loop_header");
		if (forall.modifiedOperands.length >= 2) {
			// Get the expression
			this.comparatorOp = "<";
			RangeExpr range = (RangeExpr) factory.getExpr(prefix + forall.sourceOperand);
			if (range != null) {
				this.loop_bound = range.getUpper();
				// Put the list of byte-code of a forall
				this.loopbody(forall.bytecodes(), 0);
			}
		}
		return ++line;
	}*/

	/**
	 * Iterate over the list of byte-code inside a forall loop and put the code
	 * onto 'loop_body' part.
	 * 
	 * @param code_blk
	 * @param loop_var
	 * @param line
	 * @return
	 */
	@Override
	protected void loopbody(List<Code> code_blk, int line) {
		int index = line;
		// Iterate the byte-code in a loop.
		for (;index < code_blk.size(); index++) {
			Code code = code_blk.get(index);
			// Add the code to 'loop_body' part.
			AddCodeToPatternPart(code, "loop_body");
		}
	}

	@Override
	public String toString() {
		String result = super.toString();
		result += "\n" + pattern_name + " " + loop_var + " in the range "+this.sourceOp+" from " + this.init + " to " + this.loop_bound
				+ "\n=>loop_iters(" + loop_var+ ", " + getNumberOfIterations() + ")";
		return result;
	}

	@Override
	@Deprecated
	protected String loop_var(List<Code> blk) {
		for (int index = 0; index < blk.size(); index++) {
			Code code = blk.get(index);
			/*if (code instanceof Codes.ForAll) {
				// Forall loop
				Codes.ForAll forall = (Codes.ForAll) code;
				this.sourceOp = prefix + forall.sourceOperand;
				// The loop variable is the index operand
				return prefix + forall.indexOperand;
			}*/
		}
		return null;
	}

	
	/**
	 * Get the expression that assigns the initial value the loop variable and
	 * split the list of code in 'init_pre',' 'init' and 'init_after' parts.
	 * 
	 * @param code_blk
	 *            the list of code.
	 * @param var
	 *            the variable that is updated by the initial assignment.
	 * @param line
	 *            the starting line of code
	 * @return the next line number after initial value assignment
	 */
	protected int init(List<Code> code_blk, String var, int line) {
		// Search for the initial value assignment.
		int index = line;
		for (; index < code_blk.size(); index++) {
			Code code = code_blk.get(index);
			// Check if this code assigns the value to the loop variable.
			if (!isInvariant(code)) {
				// check if the loop variable is used in the assignment for
				// while loop pattern
				if(code instanceof Codes.BinaryOperator && var.equals(prefix+((Codes.BinaryOperator)code).target())){
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
			if (!isInvariant(code) && (code instanceof Codes.Loop)) {
				break;
			}
			AddCodeToPatternPart(code, "init_after");
		}
		
		
		// Get the expression for loop variable.
		RangeExpr range = (RangeExpr) factory.rewriteExpr(factory.getExpr(this.sourceOp));
		this.init = range.getLower();
		return index;
	}

	@Override
	protected Expr getNumberOfIterations() {
		if (numberOfIterations == null) {
			numberOfIterations = (LinearExpr) loop_bound.clone();
			numberOfIterations = numberOfIterations.subtract((LinearExpr) init);
		}
		return numberOfIterations;
	}
}
