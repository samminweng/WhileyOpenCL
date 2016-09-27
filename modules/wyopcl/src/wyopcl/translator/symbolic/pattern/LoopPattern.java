package wyopcl.translator.symbolic.pattern;
import java.util.List;

import wyil.attributes.VariableDeclarations;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.symbolic.pattern.expression.Expr;
import wyopcl.translator.symbolic.pattern.expression.LinearExpr;

/**
 * The abstract class extends the Pattern class and infer the 'loop_var',
 * 'loop_label' and 'init' variables. 
 * 
 * @author Min-Hsien Weng
 *
 */
public abstract class LoopPattern extends Pattern {
	protected LinearExpr numberOfIterations;// the number of loop iterations in
											// a linear form.
	// The loop variable
	protected String loop_var;
	protected Expr init;
	protected String comparatorOp;
	protected Expr loop_bound;

	public LoopPattern(Configuration config, FunctionOrMethod functionOrMethod) {
		super(config, functionOrMethod);
		// Get the loop variable.
		this.loop_var = loop_var(functionOrMethod.body().bytecodes());
	}

	/**
	 * Infer the number of iterations.
	 * 
	 * @return
	 */
	protected abstract Expr getNumberOfIterations();

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
	protected abstract int init(List<Code> code_blk, String var);
	

	/**
	 * Extract the list variable from the list of code by searching for the
	 * 'Codes.Loop' bytecode
	 *
	 * @return the variable (string). If not found, return null.
	 */
	protected abstract String loop_var(List<Code> blk);
	
	/**
	 * Split the list of byte-code in a loop body.
	 * @param loop_blk the code block inside a loop
	 * @return
	 */
	protected abstract void loopbody(List<Code> loop_blk, int line);
	
	
	/**
	 * Split the list of byte-code into 'loop exit'
	 * 
	 * @param blk
	 * @param line
	 */
	protected abstract int loop_exit(List<Code> blk, int line) ;

}
