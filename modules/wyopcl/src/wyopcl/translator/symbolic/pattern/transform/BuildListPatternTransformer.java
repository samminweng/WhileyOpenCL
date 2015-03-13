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
import wyopcl.translator.symbolic.pattern.WhileLoopPattern;
/**
 * 
 * Transforms the 'BuildListPattern' to 'BuildListFirstPattern'. The differences on parts of 'BuildListPattern' and 'BuildListFirstPattern'
 * patterns are listed as below:
 * <p>
 * <table>
 * <tr><th>BuildListPattern</th><th>BuildListFirstPattern</th></tr>
 * <tr><td>init_before</td><td>init_before</td></tr>
 * <tr><td>init</td><td>init</td></tr>
 * <tr><td>list_init</td><td>list_init</td></tr>
 * <tr><td></td><td>list_size_init</td></tr>
 * <tr><td>init_after</td><td>init_after</td></tr>
 * <tr><td>loop_header</td><td>loop_header</td></tr>
 * <tr><td>loopbody_before</td><td>loopbody_before</td></tr>
 * <tr><td>loopbody_update</td><td>loopbody_update</td></tr>
 * <tr><td>list_update_before</td><td>list_update_before</td></tr>
 * <tr><td>list_update</td><td>list_update</td></tr>
 * <tr><td></td><td>list_size_update</td></tr>
 * <tr><td>loopbody_after</td><td>loopbody_after</td></tr>
 * <tr><td>loop_exit</td><td>loop_exit</td></tr>
 * <tr><td></td><td>list_assertion</td></tr>
 * <tr><td>return</td><td>return</td></tr>
 * </table>
 * </p>
 * The parts that require changes are 'list_init', 'loop_header' and 'list_update'. The new parts are
 * 'list_size_init', 'list_size_update' and 'list_assertion'.
 * 
 */
public class BuildListPatternTransformer extends Transformer{
	private int available_reg;
	private int reg_input_list;
	private int reg_list;
	private int reg_list_size;
	private int reg_list_capacity;

	/**
	 * Constructor
	 */
	public BuildListPatternTransformer(){
	}

	/**
	 * Get the unallocated register.
	 * @param p
	 * @return
	 */
	private int getAvailableReg(){		
		return ++available_reg;
	}

	/**
	 * Creates the 'list_init' part of the 'BuildListFirstPattern'. For example,
	 * 		lengthof %6 = %0 : [int]
	 * 		assign %7 = %0  : [int]
	 * where %6 is the list_capacity, %0 is the input list and %7 is the output list.
	 * @param blk the list of transformed code.
	 * @param p 
	 */
	private void list_init(List<Code> blk, BuildListPattern p){
		//Make change to the 'list_init' part
		List<Code> list_init = p.getPartByName("list_init");
		//Add the list_capacity, e.g lengthof %6 = %0 : [int]
		//This lengthof bytecode is referred to 'init_before' part.
		Codes.LengthOf lengthof = (LengthOf) p.getPartByName("init_before").get(0);
		//The register of input list
		reg_input_list = lengthof.operand(0);

		reg_list_capacity = getAvailableReg();
		blk.add(Codes.LengthOf(lengthof.type(), reg_list_capacity, reg_input_list));

		//Get the list var from list_init part
		Codes.Convert list = (Codes.Convert)list_init.get(1);
		reg_list = list.target();
		//Create an Assign byte-code 
		blk.add(Codes.Assign(list.result, reg_list, reg_input_list));
	}

	/**
	 * Create the 'list_size_init' part. For example,
	 * 		const %10 = 0 : int
	 * 		assign %9 = %10  : int
	 * where %10 is initial value of list_size and %9 is the list_size.
	 * 
	 */
	private void list_size_init(List<Code> blk, BuildListPattern p){
		//Add the new 'list_size_init'
		int reg_zero = getAvailableReg();
		blk.add(Codes.Const(reg_zero, Constant.V_INTEGER(BigInteger.ZERO)));
		reg_list_size = getAvailableReg();
		blk.add(Codes.Assign(Type.Int.T_INT, reg_list_size, reg_zero));
	}

	/**
	 * Creates the 'loop_header' part. For example,<p>
	 * 		loop (%1, %7, %9)<br>
	 *		ifle %1, %22 goto blklab6 : int</p>
	 * where %1 the loop variable, %7 is the list and %9 is the list_size
	 */
	private void loop_header(List<Code> blk, BuildListPattern p){
		//Get the loop header
		List<Code> loop_header = p.getPartByName("loop_header");
		Codes.Loop loop = (Codes.Loop)loop_header.get(0);		

		//Convert the array to int[]
		int[] modifiedOps = new int[loop.modifiedOperands.length+1];
		int index;
		for(index=0; index<loop.modifiedOperands.length; index++){
			modifiedOps[index]= loop.modifiedOperands[index];
		}
		modifiedOps[index]=reg_list_size;

		//Create a new loop byte-code with loop var, list_var and list_size
		blk.add(Codes.Loop(loop.target, modifiedOps));

		//Add the loop condition
		blk.add(loop_header.get(1));
	}

	/**
	 * Adds an assertion to restrict the range of list size (0<=list_size<lengthof(list))
	 * For example,
	 *      assert blklab14<br>
	 *		const %45 = 0 : int<br>
	 *		ifge %9, %45 goto blklab13 : int<br>
	 *		fail ""index out of bounds (negative)""<br>
	 *		.blklab13<br>
	 *		lengthof %45 = %7 : [int]<br>
	 *		iflt %9, %45 goto blklab14 : int<br>
	 *		fail ""index out of bounds (not less than length)""<br>
	 *	    .blklab14<br>
	 */
	private void list_size_assertion(List<Code> blk, BuildListPattern p){
		//Add a block of assertion or assumption to ensure the range of list size.
		String assertLabel = CodeUtils.freshLabel();
		//assert blklab14
		blk.add(Codes.Assert(assertLabel));
		int reg_zero = getAvailableReg();
		//const %45 = 0 : int
		blk.add(Codes.Const(getAvailableReg(), Constant.V_INTEGER(BigInteger.ZERO)));
		String gotoLabel = CodeUtils.freshLabel();
		//ifge %9, %45 goto blklab13 : int
		blk.add(Codes.If(Type.Int.T_INT, reg_list_size, reg_zero, Comparator.GTEQ, gotoLabel));
		//fail ""index out of bounds (negative)""
		blk.add(Codes.Fail("index out of bounds (negative)"));
		//.blklab13
		blk.add(Codes.Label(gotoLabel));
		//lengthof %45 = %7 : [int]
		blk.add(Codes.LengthOf(Type.List.List(Type.Int.T_INT, false), reg_zero, reg_list));
		//iflt %9, %45 goto blklab14 : int
		blk.add(Codes.If(Type.Int.T_INT, reg_list_size, reg_zero, Comparator.LT, assertLabel));
		//fail ""index out of bounds (not less than length)""
		blk.add(Codes.Fail("index out of bounds (not less than length)"));
		//.blklab14
		blk.add(Codes.Label(assertLabel));
	}


	/**
	 * Creates the 'list_update' part. For example,
	 * <p>
	 * 		indexof %32 = %0, %25 : [int]<br>
	 * 		assert blklab14<br>
	 *		const %45 = 0 : int<br>
	 *		ifge %9, %45 goto blklab13 : int<br>
	 *		fail ""index out of bounds (negative)""<br>
	 *		.blklab13<br>
	 *		lengthof %45 = %7 : [int]<br>
	 *		iflt %9, %45 goto blklab14 : int<br>
	 *		fail ""index out of bounds (not less than length)""<br>
	 *	    .blklab14<br>
	 *		update %7[%9] = %32 : [int] -> [int]<br>
	 * </p>
	 */
	private void list_update(List<Code> blk, BuildListPattern p){
		//Change the list_update part
		List<Code> list_update = p.getPartByName("list_update");
		//Get the existing indexof bytecode
		Codes.IndexOf indexof = (IndexOf) list_update.get(0);		
		int indexOp = indexof.target();
		blk.add(indexof);
		//Add the assertion for list size 
		list_size_assertion(blk, p);

		//Get the assignment of list
		Codes.Assign list_assign = (Assign) list_update.get(list_update.size()-1);
		Collection<Integer> operands = new ArrayList<Integer>();
		operands.add(reg_list_size);
		//Create an update byte-code, update %7[%9] = %32 : [int] -> [int]
		blk.add(Codes.Update(list_assign.type(), reg_list, operands, indexOp, list_assign.assignedType(), new ArrayList<String>()));
	}

	/**
	 * Create the 'list_size_update' part. For example,
	 * <p>
	 * 		const %34 = 1 : int
	 *		add %35 = %9, %34 : int
	 *		assign %9 = %35  : int
	 * </p>
	 * where %9 is the list_size.
	 */
	private void list_size_update(List<Code> blk, BuildListPattern p){
		//Add the 'list_size_update' part
		//Create an constant 1, const %34 = 1 : int 
		int reg_one = getAvailableReg();
		blk.add(Codes.Const(reg_one, Constant.Integer.V_INTEGER(BigInteger.ONE)));
		//Create a binary operator to add the list_size to one, add %35 = %9, %34 : int
		int reg_add_list_size = getAvailableReg();
		blk.add(Codes.BinaryOperator(Type.Int.T_INT, reg_add_list_size, reg_list_size, reg_one, BinaryOperatorKind.ADD));
		//Assign the above result to the list_size
		blk.add(Codes.Assign(Type.Int.T_INT, reg_list_size, reg_add_list_size));
	}

	/**
	 * Create the 'list_assertion' part. For example,
	 * <p>
	 * 		assert blklab13
	 *		ifeq %9, %6 goto blklab13 : int
	 *		fail ""assertion failed""
	 *		.blklab13
	 * </p>
	 * @param blk
	 * @param p
	 */
	private void list_assertion(List<Code> blk, BuildListPattern p){
		//Add the list_assertion to check if list_capacity == list_size
		String endLab = CodeUtils.freshLabel();
		blk.add(Codes.Assert(endLab));
		//Create a ifeq byte-code, ifeq %9, %6 goto blklab13 : int
		blk.add(Codes.If(Type.Int.T_INT, reg_list_size, reg_list_capacity, Comparator.EQ, endLab));
		blk.add(Codes.Fail("assertion failed"));
		blk.add(Codes.Label(endLab));
	}


	/**
	 * Transform a pattern of 'BuildListPattern' type to that of 'BuildListFirstPattern' type.
	 * @param pattern
	 * @return a list of code based on the design of 'BuildListFirstPattern'. 
	 */
	@Override
	public List<Code> transform(Pattern pattern){
		//Check if the input pattern is a BuildListPattern. If not, return null.
		if(!(pattern instanceof BuildListPattern)) return null;
	
		BuildListPattern p = (BuildListPattern)pattern;		
		List<Code> blk = new ArrayList<Code>();//Store all the bytecode for the new pattern.
		this.available_reg = p.factory.getAvailableReg();
		
		blk.addAll(p.getPartByName("init_before"));
		blk.addAll(p.getPartByName("init"));
		//Make change to the 'list_init' part
		list_init(blk, p);
		//Make changes to the 'list_size_init' part
		list_size_init(blk, p);
		//Add all the code in 'init_after'
		blk.addAll(p.getPartByName("init_after"));
		loop_header(blk, p);
		blk.addAll(p.getPartByName("loopbody_before"));
		blk.addAll(p.getPartByName("loopbody_update"));
		blk.addAll(p.getPartByName("list_update_before"));
		//Make changes to 'list_update' part.
		list_update(blk, p);
		//Add the 'list_size_update' part
		list_size_update(blk, p);

		blk.addAll(p.getPartByName("loopbody_after"));
		blk.addAll(p.getPartByName("loop_exit"));

		//Add the 'list_assertion' part
		list_assertion(blk, p);
		blk.addAll(p.getPartByName("return"));

		return blk;
	}

}
