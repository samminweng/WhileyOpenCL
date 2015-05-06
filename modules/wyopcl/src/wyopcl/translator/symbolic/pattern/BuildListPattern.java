package wyopcl.translator.symbolic.pattern;

import java.util.List;

import wyil.attributes.VariableDeclarations;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.Loop;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyil.lang.Type;
import wyopcl.translator.Configuration;
import wyopcl.translator.symbolic.pattern.expression.Expr;
import wyopcl.translator.symbolic.pattern.transform.Transformable;
import wyopcl.translator.symbolic.pattern.transform.Transformer;


/**
 * The BuildList pattern contains 'init_before', 'init', 'init_after',
 * 'loop_header', 'loopbody_before'
 * 
 * @author Min-Hsien Weng
 *
 */
public final class BuildListPattern extends WhileLoopPattern implements Transformable {
	public String list_var;
	public Expr list_init;
	public Expr list_update;

	public BuildListPattern(Configuration config, FunctionOrMethod functionOrMethod) {
		super(config, functionOrMethod);
		// Check if the inferred increment or decrement is null. If not, then
		// continue iterating the list of code.
		// Otherwise, stop constructing the BuildListPattern.
		if (this.list_var != null && this.list_init != null && (this.incr != null || this.decr != null) && this.list_update != null) {
			this.line = this.loop_exit(functionOrMethod.body().bytecodes(), this.line);
			this.pattern_name = "BuildList";
			this.isNil = false;
		}
	}

	/**
	 * Infer the loop var, list_var, list_size variable
	 */
	@Override
	protected String loop_var(List<Code> blk) {
		for (int index = 0; index < blk.size(); index++) {
			Code code = blk.get(index);
			if(code instanceof Codes.Loop) {
				// Check if the list of bytecode contains a loop bytecode.
				// While loop
				Codes.Loop loop = (Codes.Loop) code;
				// Iterate the modified operands. By default, the loop
				// variable is the first modified operands.
				if (loop.modifiedOperands.length >= 2) {
					this.list_var = prefix+loop.modifiedOperands[1];
					return prefix + loop.modifiedOperands[0];
				}
			}
		}
		return null;
	}
	
	
	/**
	 * Search the loop byte-code and put the code to the 'init_after' part. If
	 * the code is related to the list , then put it to the 'list_init' part.
	 * 
	 * @param blk
	 *            the list of code
	 * @param line
	 *            the starting line number
	 */
	@Override
	protected int init(List<Code> code_blk, String var, int line) {
		// Search for the initial value assignment.
		int index = line;
		for (; index < code_blk.size(); index++) {
			Code code = code_blk.get(index);
			// Check if this code assigns the value to the loop variable.
			if (!isInvariant(code)) {
				// check if the loop variable is used in the assignment for
				// while loop pattern
				if (code instanceof Codes.Assign && var.equals(prefix + ((Codes.Assign) code).target())) {
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
			if (code instanceof Codes.Loop || code instanceof Codes.ForAll) {
				break;
			} else if(code instanceof Codes.Assign){
				Codes.Assign assign = (Codes.Assign)code;
				//Check if the right operand is list var.
				if(this.list_var != null && this.list_var.equals(prefix+assign.target())){
					//Reassign the list var
					AddCodeToPatternPart(code, "list_init");
				}else{
					AddCodeToPatternPart(code, "init_after");
				}				
			} else {
				AddCodeToPatternPart(code, "init_after");
			}
		}
		// Get the initial expression for the list var
		this.list_init = factory.rewriteExpr(factory.getExpr(this.list_var));
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
	protected void loopbody(List<Code> loop_blk, int line) {
		int index = line;
		// Put the code in 'loopbody_before' part.
		for (; index < loop_blk.size(); index++) {
			Code code = loop_blk.get(index);			
			// Search for the binOp that subtracts the loop variable with a
			// constant.
			if (code instanceof Codes.Assign) {
				// Check if the assignment bytecode is to over-write the
				// value of loop variable.
				Codes.Assign assign = (Codes.Assign) code;
				// Check if the target is the loop variable.
				if ((prefix + assign.target()).equals(loop_var)) {
					AddCodeToPatternPart(code, "loopbody_update");
					// Get the increment and decrement.
					incr = factory.extractIncrement(assign, loop_var);
					decr = factory.extractDecrement(assign, loop_var);
					++index;
					break;
				}
			}
			AddCodeToPatternPart(code, "loopbody_before");	
		}

		// Search for 'list_update'
		for (; index < loop_blk.size(); index++) {
			Code code = loop_blk.get(index);
			AddCodeToPatternPart(code, "list_update");
			// Check if the code initializes the list.
			if (code instanceof Codes.Assign) {
				Codes.Assign assign = (Codes.Assign) code;
				if (this.list_var != null && this.list_var.equals(prefix + assign.target())) {	
					this.list_update = factory.getExpr(prefix + assign.operand(0));
					++index;
					break;
				}
			} 		
		}

		// Put the remaining code to 'loopbody_after' part.
		for (; index < loop_blk.size(); index++) {
			Code code = loop_blk.get(index);
			// Create the expression and put it into the table.
			AddCodeToPatternPart(code, "loopbody_after");
		}

	}

	@Override
	public String toString() {
		String result = super.toString();
		result += "\n" + pattern_name + " && loop_var(" + loop_var + ") && list_var(" + list_var + ") && ";
		if (incr != null) {
			result += "incr(" + loop_var + ", " + incr + ")";
		}
		if (decr != null) {
			result += "decr(" + loop_var + ", " + decr + ")";
		}
		result += " && init(" + loop_var + ", " + init + ") && list_init(" + list_var + ", " + this.list_init + ") " + "&&  while_cond(" + loop_var
				+ ", " + comparatorOp + ", " + loop_bound + ")" + "\n=>loop_iters(" + loop_var + ", " + getNumberOfIterations() + ")";
		return result;

	}

	@Override
	public FunctionOrMethod accept(Transformer transformer) {
		return transformer.transform((Pattern) this);
	}

}
