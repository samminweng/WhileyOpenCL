package wyopcl.translator.symbolic;

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
/**
 * 
 * Transform the 'BuildListPattern' to 'BuildListFirstPattern'.
 * BuidListPattern has 'init_before', 'init', 'list_init', 'init_after', 'loop_header', 'loopbody_before', 'loopbody_update', 'list_update_before'
 * 'list_update', 'loopbody_after', 'loop_exit' and 'return'.
 * <p>
 * BuildListFirstPattern has 'init_before', 'init', 'list_init', 'init_after', 'loop_header', 'loopbody_before', 'loopbody_update', 'list_update_before'
 * 'list_update', 'list_size_update', 'loopbody_after', 'loop_exit' 'list_assertion' and 'return'.
 * <p>
 * The parts that require change are 'list_init', 'loop_header', 'list_update' and 'list_size_update'.
 * The new parts are 'list_size_init' and 'list_assertion'.
 * 
 */
public class BuildListPatternTransformer{
	/**
	 * Constructor
	 */
	public BuildListPatternTransformer(){
		
	}
	
	/**
	 * Transform a pattern of 'BuildListPattern' type to that of 'BuildListFirstPattern' type.
	 * @param p
	 * @return
	 */
	public List<Code> transform(BuildListPattern p){		
		//Store all the bytecode for the new pattern.
		List<Code> blk = new ArrayList<Code>();	
		blk.addAll(p.getPartByName("init_before"));
		blk.addAll(p.getPartByName("init"));
		//Make change to the 'list_init' part
		List<Code> list_init = p.getPartByName("list_init");
		//Add the list_capacity, e.g lengthof %6 = %0 : [int]
		//This lengthof bytecode is referred to 'init_before' part.
		Codes.LengthOf lengthof = (LengthOf) p.getPartByName("init_before").get(0);
		//The register of existing list
		int reg_existing_list = lengthof.operand(0);
		int reg_list_capacity = p.factory.getAvailableReg();
		blk.add(Codes.LengthOf(lengthof.type(), reg_list_capacity, reg_existing_list));
		
		//Get the list_var from list_init part
		Codes.Convert list = (Codes.Convert)list_init.get(1);
		int reg_list = list.target();
		//Create an Assign byte-code 
		blk.add(Codes.Assign(list.result, list.target(), reg_existing_list));
		
		//Add the new 'list_size_init'
		int reg_zero = p.factory.getAvailableReg();
		blk.add(Codes.Const(reg_zero, Constant.V_INTEGER(BigInteger.ZERO)));
		int reg_list_size = p.factory.getAvailableReg();
		blk.add(Codes.Assign(Type.Int.T_INT, reg_list_size, reg_zero));
		
		//Add all the code in 'init_after'
		blk.addAll(p.getPartByName("init_after"));
		
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
		blk.addAll(p.getPartByName("loopbody_before"));
		blk.addAll(p.getPartByName("loopbody_update"));
		blk.addAll(p.getPartByName("list_update_before"));
		
		//Change the list_update part
		List<Code> list_update = p.getPartByName("list_update");
		//Get the existing indexof bytecode
		Codes.IndexOf indexof = (IndexOf) list_update.get(0);
		blk.add(indexof);
		int eleOp = indexof.target();
		//Get the assignment of list
		Codes.Assign list_assign = (Assign) list_update.get(list_update.size()-1);
		Collection<Integer> operands = new ArrayList<Integer>();
		operands.add(reg_list_size);
		//Create an update byte-code, update %7[%9] = %32 : [int] -> [int]
		blk.add(Codes.Update(list_assign.type(), list_assign.target(), operands, eleOp, list_assign.assignedType(), new ArrayList<String>()));
		//Add the 'list_size_update' part
		//Create an constant 1, const %34 = 1 : int 
		int reg_one = p.factory.getAvailableReg();
		blk.add(Codes.Const(reg_one, Constant.Integer.V_INTEGER(BigInteger.ONE)));
		//Create a binary operator to add the list_size to one, add %35 = %9, %34 : int
		int reg_add_list_size = p.factory.getAvailableReg();
		blk.add(Codes.BinaryOperator(Type.Int.T_INT, reg_add_list_size, reg_list_size, reg_one, BinaryOperatorKind.ADD));
		//Assign the above result to the list_size
		blk.add(Codes.Assign(Type.Int.T_INT, reg_list_size, reg_add_list_size));

		blk.addAll(p.getPartByName("loopbody_after"));
		blk.addAll(p.getPartByName("loop_exit"));
		
		//Add the list_assertion to check if list_capacity == list_size
		String endLab = CodeUtils.freshLabel();
		blk.add(Codes.Assert(endLab));
		//Create a ifeq byte-code, ifeq %9, %6 goto blklab13 : int
		blk.add(Codes.If(Type.Int.T_INT, reg_list_size, reg_list_capacity, Comparator.EQ, endLab));
		blk.add(Codes.Fail("assertion failed"));
		blk.add(Codes.Label(endLab));
		
		blk.addAll(p.getPartByName("return"));
		
		return blk;
	}	

}
