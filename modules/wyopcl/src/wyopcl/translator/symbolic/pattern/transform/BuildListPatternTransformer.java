package wyopcl.translator.symbolic.pattern.transform;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import wyil.lang.Code;
import wyil.lang.CodeUtils;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Codes.Assign;
import wyil.lang.Codes.BinaryOperatorKind;
import wyil.lang.Codes.Comparator;
import wyil.lang.Codes.IndexOf;
import wyil.lang.Codes.LengthOf;
import wyopcl.translator.symbolic.pattern.BuildListPattern;
import wyopcl.translator.symbolic.pattern.Pattern;

/**
 * 
 * Transforms the 'BuildListPattern' to 'BuildListFirstPattern'. The differences
 * on parts of 'BuildListPattern' and 'BuildListFirstPattern' patterns are
 * listed as below:
 * <p>
 * <table>
 * <tr>
 * <th>BuildListPattern</th>
 * <th>BuildListFirstPattern</th>
 * </tr>
 * <tr>
 * <td>init_before</td>
 * <td>init_before</td>
 * </tr>
 * <tr>
 * <td>init</td>
 * <td>init</td>
 * </tr>
 * <tr>
 * <td>init_after</td>
 * <td>init_after</td>
 * </tr>
 * <tr>
 * <td>list_init</td>
 * <td>list_init</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>list_size_init</td>
 * </tr>
 * *
 * <tr>
 * <td>loop_header</td>
 * <td>loop_header</td>
 * </tr>
 * <tr>
 * <td>loopbody_before</td>
 * <td>loopbody_before</td>
 * </tr>
 * <tr>
 * <td>loopbody_update</td>
 * <td>loopbody_update</td>
 * </tr>
 * <tr>
 * <td>list_update</td>
 * <td>list_update</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>list_size_update</td>
 * </tr>
 * <tr>
 * <td>loopbody_after</td>
 * <td>loopbody_after</td>
 * </tr>
 * <tr>
 * <td>loop_exit</td>
 * <td>loop_exit</td>
 * </tr>
 * <tr>
 * <td>return</td>
 * <td>return</td>
 * </tr>
 * </table>
 * </p>
 * The parts that require changes are 'list_init', 'loop_header' and
 * 'list_update'. The new parts are 'list_size_init', 'list_size_update' and
 * 'list_assertion'.
 * 
 */
public class BuildListPatternTransformer extends Transformer {
	private int available_reg;
	private int reg_input_list;
	private int reg_loop_var;
	private int reg_list;
	private int reg_list_size;
	private int reg_list_capacity;

	/**
	 * Constructor
	 */
	public BuildListPatternTransformer() {
	}

	/**
	 * Get the unallocated register.
	 * 
	 * @param p
	 * @return
	 */
	private int getAvailableReg() {
		return ++available_reg;
	}

	/**
	 * Creates the 'init_before' part and copy all the byte-code from the
	 * 'init_before' part of p pattern.
	 * 
	 * @param blk
	 * @param p
	 */
	private void init_before(List<Code> blk, BuildListPattern p) {
		blk.addAll(p.getPartByName("init_before"));
		// Infer the register of input list from lengthof bytecode of
		// 'init_before' part.
		// The register of input list
		this.reg_input_list = ((LengthOf) p.getPartByName("init_before").get(0)).operand(0);
	}

	/**
	 * Creates the 'init' part and copy all the byte-code from 'init' part of
	 * 'p' pattern.
	 * 
	 * @param blk
	 * @param p
	 */
	private void init(List<Code> blk, BuildListPattern p) {
		Codes.Assign assign = (Codes.Assign) (p.getPartByName("init")).get(0);
		this.reg_loop_var = assign.target();
		blk.add(assign);
	}

	/**
	 * Create the 'init_after' part and adds the initial assignment of
	 * list_capacity. For example,
	 * 
	 * <pre>
	 * <code>
	 * lengthof %8 = %0 : [int]
	 * assign %2 = %8  : int
	 * </code>
	 * </pre>
	 * 
	 * where %2 is the register of list capacity, %0 is the input list and %8
	 * are the registers of temporary.
	 * 
	 * @param blk
	 * @param p
	 */
	private void init_after(List<Code> blk, BuildListPattern p) {
		// Add the initial assignment of list capacity.
		// Get the length of the input list
		int reg_target = getAvailableReg();
		blk.add(Codes.LengthOf(Type.List(Type.Int.T_INT, false), reg_target, this.reg_input_list));
		this.reg_list_capacity = getAvailableReg();
		blk.add(Codes.Assign(Type.Int.T_INT, this.reg_list_capacity, reg_target));
	}

	/**
	 * Creates the 'list_init' part of the 'BuildListFirstPattern'. For example,
	 * 
	 * <pre>
	 * <code>
	 * list_init:
	 * 				assign %3 = %0  : [int]
	 * </code>
	 * </pre>
	 * 
	 * where %3 is the copied list variable and %0 is the output list.
	 * 
	 * @param blk
	 *            the list of transformed code.
	 * @param p
	 *            the original pattern.
	 */
	private void list_init(List<Code> blk, BuildListPattern p) {
		this.reg_list = getAvailableReg();
		// Create an Assign byte-code
		blk.add(Codes.Assign(Type.List(Type.Int.T_INT, false), reg_list, reg_input_list));
	}

	/**
	 * Create the 'list_size_init' part. For example,
	 * 
	 * <pre>
	 * <code>
	 *  const %11 = 0 : int
	 *  assign %4 = %11 : int
	 * </code>
	 * </pre>
	 * 
	 * where %11 is initial value of list_size and %4 is the list_size.
	 * 
	 * @param blk
	 *            the list of transformed code.
	 * @param p
	 *            the original pattern.
	 */
	private void list_size_init(List<Code> blk, BuildListPattern p) {
		int reg_zero = getAvailableReg();
		blk.add(Codes.Const(reg_zero, Constant.V_INTEGER(BigInteger.ZERO)));
		this.reg_list_size = getAvailableReg();
		blk.add(Codes.Assign(Type.Int.T_INT, reg_list_size, reg_zero));
	}

	/**
	 * Creates the 'loop' part. For example,
	 * 
	 * <pre>
	 * <code>
	 * loop (%1, %7, %9)
	 * </code>
	 * </pre>
	 * 
	 * where %1 the loop variable, %7 is the list and %9 is the list_size. The
	 * major change to loop block is the 'list_update' and 'list_size_update'
	 * parts. The 'list_update' part is as follows:
	 * 
	 * <pre>
	 * <code>
	 * indexof %17 = %0, %1 : [int]
	 * update %3[%4] = %18 : [int] -> [int]
	 * </code>
	 * </pre>
	 * 
	 * The 'list_size_update' part is as follows:
	 * 
	 * <pre>
	 * <code>
	 * const %19 = 1 : int
	 * add %20 = %4, %19 : int
	 * assign %4 = %20  : int
	 * </code>
	 * </pre>
	 * 
	 * @param blk
	 *            the list of transformed code.
	 * @param p
	 *            the original pattern.
	 */
	private void loop(List<Code> blk, BuildListPattern p) {
		// ArrayList maintains the order.
		ArrayList<Integer> ops = new ArrayList<Integer>();
		ops.add(this.reg_loop_var);
		ops.add(this.reg_list);
		ops.add(this.reg_list_size);

		List<Code> loop_blk = new ArrayList<Code>();
		// Get the loop condition
		for (Code code : p.getPartByName("loop_header")) {
			if (!(code instanceof Codes.Loop) && !(code instanceof Codes.Invariant)) {
				loop_blk.add(code);
			}
		}
		// Add the 'loopbody_before' and 'loopbody_update' part without changes.
		loop_blk.addAll(p.getPartByName("loopbody_before"));
		loop_blk.addAll(p.getPartByName("loopbody_update"));

		// Get the list_update code
		for (Code code : p.getPartByName("list_update")) {
			loop_blk.add(code);
			if (code instanceof Codes.IndexOf) {
				Codes.IndexOf indexof = (Codes.IndexOf) code;
				int[] indexOp = new int[1];
				indexOp[0] = this.reg_list_size;
				// Add the update byte-code
				Codes.Update update = Codes.Update(Type.List(Type.Int.T_INT, false), this.reg_list, indexOp, indexof.target(),
						Type.List(Type.Int.T_INT, false), new ArrayList<String>());
				loop_blk.add(update);
				// Stop adding the code.
				break;
			}
		}
		// Add the list_size_update part
		// const %19 = 1 : int
		int reg_one = getAvailableReg();
		loop_blk.add(Codes.Const(reg_one, Constant.V_INTEGER(BigInteger.ONE)));
		// add %20 = %4, %19 : int
		int reg_inc = getAvailableReg();
		loop_blk.add(Codes.BinaryOperator(Type.Int.T_INT, reg_inc, this.reg_list_size, reg_one, BinaryOperatorKind.ADD));
		// assign %4 = %20 : int
		loop_blk.add(Codes.Assign(Type.Int.T_INT, this.reg_list_size, reg_inc));

		// Convert the array list to an integer array.
		int[] modifiedOps = new int[ops.size()];
		for (int i = 0; i < ops.size(); i++) {
			if (ops.get(i) != null) {
				modifiedOps[i] = ops.get(i);
			}
		}
		// Create a new loop byte-code with loop var, list_var and list_size
		Code loop = Codes.Loop(modifiedOps, loop_blk);
		blk.add(loop);
	}

	/**
	 * Adds an assertion to restrict the range of list size and list capacity.
	 * For example,
	 * 
	 * <pre>
	 * <code>
	 * assert
	 * ifeq %4, %2 goto blklab5 : int
	 * fail
	 * .blklab5
	 * </code>
	 * </pre>
	 */
	private void loop_exit(List<Code> blk, BuildListPattern p) {
		blk.addAll(p.getPartByName("loop_exit"));
		// Add an assertion to ensure the range of list size.
		List<Code> assertion_blk = new ArrayList<Code>();
		String gotoLabel = CodeUtils.freshLabel();
		// ifeq %4, %2 goto blklab5 : int
		assertion_blk.add(Codes.If(Type.Int.T_INT, this.reg_list_size, this.reg_list_capacity, Comparator.EQ, gotoLabel));
		// fail ""index out of bounds (negative)""
		assertion_blk.add(Codes.Fail());
		// .blklab5
		assertion_blk.add(Codes.Label(gotoLabel));
		blk.add(Codes.Assert(assertion_blk));

	}

	/**
	 * Create the 'list_assertion' part. For example,
	 * <p>
	 * assert blklab13 ifeq %9, %6 goto blklab13 : int fail ""assertion failed""
	 * .blklab13
	 * </p>
	 * 
	 * @param blk
	 * @param p
	 */
	/*
	 * private void list_assertion(List<Code> blk, BuildListPattern p) { // Add
	 * the list_assertion to check if list_capacity == list_size String endLab =
	 * CodeUtils.freshLabel(); blk.add(Codes.Assert(endLab)); // Create a ifeq
	 * byte-code, ifeq %9, %6 goto blklab13 : int
	 * blk.add(Codes.If(Type.Int.T_INT, reg_list_size, reg_list_capacity,
	 * Comparator.EQ, endLab)); blk.add(Codes.Fail("assertion failed"));
	 * blk.add(Codes.Label(endLab)); }
	 */

	/**
	 * Takes a 'BuildListPattern' and outputs a list of transformed byte-code
	 * that matches with 'BuildListFirstPattern'.
	 * 
	 * @param p
	 * @return
	 */
	private List<Code> transform(BuildListPattern p) {

		List<Code> blk = new ArrayList<Code>();// Store all the bytecode for the
												// new pattern.
		this.available_reg = p.factory.getAvailableReg();
		// Make 'init_before' part.
		init_before(blk, p);
		// Make the 'init' part.
		init(blk, p);
		// Make the 'init_after' part.
		init_after(blk, p);
		// Make the 'list_init' part
		list_init(blk, p);
		// Make the 'list_size_init' part
		list_size_init(blk, p);
		// Make the 'loop' part.
		loop(blk, p);
		// Make the 'loop_exit' part.
		loop_exit(blk, p);
		// Make the 'return' part
		blk.addAll(p.getPartByName("return"));

		return blk;
	}

	/**
	 * Transform a pattern of 'BuildListPattern' type to that of
	 * 'BuildListFirstPattern' type.
	 * 
	 * @param pattern
	 * @return a list of code based on the design of 'BuildListFirstPattern'.
	 */
	@Override
	public List<Code> transform(Pattern pattern) {
		// Check if the input pattern is a BuildListPattern. If not, return
		// null.
		if (!(pattern instanceof BuildListPattern))
			return null;

		return transform((BuildListPattern) pattern);
	}

}
