package wyopcl.translator.symbolic.pattern;

import java.util.ArrayList;
import java.util.List;

import wyil.attributes.VariableDeclarations;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.Loop;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyil.lang.Type;
import wyopcl.Configuration;
import wyopcl.translator.symbolic.Transformable;
import wyopcl.translator.symbolic.Transformer;
import wyopcl.translator.symbolic.pattern.expression.Expr;
/**
 * The AppendArray pattern initializes an empty array and then go through a
 * while-loop to append one item to the array. This pattern 
 * 
 * The AppendArray pattern extends 
 * 
 * @author Min-Hsien Weng
 *
 */
public final class AppendArrayPattern extends WhileLoopPattern implements Transformable {
	public String array_var;
	public Code array_init;
	public List<Code> array_append;

	public AppendArrayPattern(Configuration config, FunctionOrMethod functionOrMethod) {
		super(config, functionOrMethod);
		// Check if the function contains the while-loop
		if (this.incr != null || this.decr != null) {
			// Get the code block
			List<Code> blk = functionOrMethod.body().bytecodes();
			// Find the array variable
			this.array_var = array_var(blk);
			// If not, then continue iterating the list of code.
			// Otherwise, stop constructing the BuildListPattern.
			if (this.array_var != null && this.array_init != null) {
				this.array_append = array_append((Codes.Loop) blk.get(this.line));
				if (this.array_append != null) {
					this.pattern_name = "AppendArray";
					this.isNil = false;
				}
			}
		}
	}

	/**
	 * Get the array variable, which is defined by 'ArrayGenerator code
	 * The array variable must be prior to loop byte-code.
	 *  
	 * @param blk
	 * @return
	 */
	private String array_var(List<Code> blk){
		int array_register = -1;
		for (int index = 0; index < blk.size(); index++) {
			Code code = blk.get(index);
			if (code instanceof Codes.ArrayGenerator) {
				Codes.ArrayGenerator array_gen = (Codes.ArrayGenerator) code;
				// Get the register of array variable
				array_register = array_gen.target(0);
				// Check the next code is an assignment, which re-assign to the array register
				Code next_code = blk.get(index+1);
				if (next_code instanceof Codes.Assign) {
					// Check if the array register is re-assigned to an register
					Codes.Assign assign = (Codes.Assign) next_code;
					// Get left and right operators
					int left = assign.target(0);
					int right = assign.operand(0);
					if (right == array_register) {
						// Re-assign the register of array variable
						array_register = left;
						this.array_init = array_gen;
					}
				}
			} else if (code instanceof Codes.Loop) {
				this.line = index;
				// Stop the search
				break;
			}
		}

		if (array_register < 0) {
			return null;
		}

		return prefix + array_register;
	}
	
	/**
	 * Search for the array update inside the loop byte-code
	 * 
	 * @param blk
	 * @return
	 */
	private List<Code> array_append(Codes.Loop loop){
		List<Code> appends = new ArrayList<Code>();		
		// Get the loop byte-codes
		List<Code> blk = loop.bytecodes();
		// Iterate each byte-code inside the loop
		for (int index = 0; index < blk.size(); index++) {
			Code code = blk.get(index);
			if(code instanceof Codes.Invoke){
				Codes.Invoke invoke = (Codes.Invoke)code;
				// Check the code is a 'append' function call 
				if(invoke.targets().length>0 && invoke.name.name().equals("append")){
					// Get the next code
					Code next_code = loop.get(index+1);
					// Check if the next code is the re-assignment
					if(next_code instanceof Codes.Assign){
						Codes.Assign assign = (Codes.Assign)next_code;
						int left = assign.target(0);
						if(array_var.equals(prefix+left)){
							// Add the 
							appends.add(invoke);
						}
					}					
				}
			}
		}
		if(appends.isEmpty()){
			return null;
		}
		
		return appends;
	}

	@Override
	public String toString() {
		String result = super.toString();
		result += "\n" + pattern_name + " && loop_var(" + loop_var + ") && array_var(" + array_var + ") && ";
		if (incr != null) {
			result += "incr(" + loop_var + ", " + incr + ")";
		}
		if (decr != null) {
			result += "decr(" + loop_var + ", " + decr + ")";
		}
		result += " && init(" + loop_var + ", " + init + ") && array_init(" + this.array_init + ")\n " 
				+ " && array_append (" + this.array_append.size() + " 'append' function call)\n"
				+ " && while_cond(" + loop_var + ", " + comparatorOp + ", " + loop_bound + ")\n"
				+ "\n=>loop_iters(" + loop_var + ", " + getNumberOfIterations() + ")";
		return result;

	}

	@Override
	public FunctionOrMethod accept(Transformer transformer) {
		return transformer.transform((Pattern) this);
	}

}
