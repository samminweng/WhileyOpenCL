package wyopcl.translator.symbolic;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import wycc.lang.NameID;
import wyfs.lang.Path.ID;
import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
import wyil.lang.Attribute;
import wyil.lang.Code;
import wyil.lang.CodeUtils;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.Codes.ArrayGenerator;
import wyil.lang.Codes.Assign;
import wyil.lang.Codes.BinaryOperator;
import wyil.lang.Codes.BinaryOperatorKind;
import wyil.lang.Codes.Comparator;
import wyil.lang.Codes.Const;
import wyil.lang.Codes.IndexOf;
import wyil.lang.Codes.LengthOf;
import wyil.lang.Type.Int;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyil.util.AttributedCodeBlock;
import wyopcl.Configuration;
import wyopcl.translator.symbolic.pattern.AppendArrayPattern;
import wyopcl.translator.symbolic.pattern.Pattern;

/**
 * 
 * Transforms the 'AppendArrayPattern' to 'resizeArrayPattern'. 
 * The 'AppendArrayPattern'
 * <pre><code>
 * int pos = 0
 * // Initialize the output array
 * output = [0;0]
 * // Iterate each integer in 'data' array
 * while pos < |data|:
 *	// Append an item from 'data' to 'output'
 *	output = append(output, data[pos]+10)
 *	output = append(output, data[pos]+10)
 *	pos = pos + 1
 * </code></pre>
 * can be transformed into 'resizeArrayPattern'
 * <pre><code>
 * int pos = 0
 * // Initialize the output array
 * output = [0;2*|data|]
 * // The size of output array
 * int size = 0
 * // Iterate each integer in 'data' array
 * while pos < |data|:
 *	// Update the output array
 *	output[size] = data[pos]+10
 *	// Increment the size
 *	size = size + 1
 *	output[size] = data[pos]+10
 *	size = size + 1
 *	pos = pos + 1
 * // Create the output array with actual array size
 * output = resize(output, size)
 * </code></pre>
 * 
 */
public class AppenArrayPatternTransformer extends Transformer {
	private Configuration config;
	private int r_input_arr;
	private int r_array;
	private int r_array_size;
	private int r_array_capacity;
	private String prefix = "_";
	private List<Declaration> declarations;
	/**
	 * Constructor
	 */
	public AppenArrayPatternTransformer(Configuration config) {
		this.config = config;
	}

	/**
	 * Get the unallocated register and put the declaration to the variable declarations.
	 * 
	 * @param p
	 * @return
	 */
	private int getNextRegister(Type type) {
		// The next register is the size of declarations
		int next_reg =declarations.size();
		// Add the declaration for next register
		this.declarations.add(new Declaration(type, null));
		return next_reg;
	}
	
	/**
	 * Copy 'init_before' part of p pattern.
	 * 
	 * @param blk
	 * @param p
	 */
	private void init_before(List<Code> blk, AppendArrayPattern p) {
		blk.addAll(p.getPartByName("init_before"));
	}

	/**
	 * Copy all the  'init' part of 'p' pattern.
	 * 
	 * @param blk
	 * @param p
	 */
	private void init(List<Code> blk, AppendArrayPattern p) {
		blk.addAll(p.getPartByName("init"));
	}

	/**
	 * Create the 'init_after' part and 
	 * 
	 * @param blk
	 * @param p
	 */
	private void init_after(List<Code> blk, AppendArrayPattern p) {
		// Get the arr_init
		Codes.ArrayGenerator array_gen = p.array_gen;
		// Get register of array variable, initial value and length
		int r_var = array_gen.target(0); 
		int r_init = array_gen.operand(0);
		int r_len = array_gen.operand(1);
		
		List<Code> init_after = p.getPartByName("init_after");
		
		// Go through each code
		for(Code code: init_after){
			if(code instanceof Codes.ArrayGenerator){
				Codes.ArrayGenerator c_arr_gen = (Codes.ArrayGenerator) code;
				// Compare if the code is array initial assignment.
				if(c_arr_gen.target(0) == r_var && c_arr_gen.operand(0) == r_init 
						&& c_arr_gen.operand(1) == r_len){
					// Make a new 'array_gen' part
					array_gen(blk, p);
					// Make a new 'array_size_init' part
					array_size_init(blk, p);
					continue;
				}
			}
			// Add the code to blk	
			blk.add(code);
		}
	}

	/**
	 * Transform the 'array_gen' part of the 'ResizeArrayPattern'. For example,
	 * <pre><code>
	 * const %7 = 00000000b : byte             
     * const %8 = 0 : int
	 * arraygen %9 = [7; 8] : byte[] 
	 * </code></pre>
	 * can be transformed into:
	 * <pre><code>
	 * const %7 = 00000000b : byte             
     * const %28 = 2 : int                      
     * lengthof %29 = %0 : byte[]              
     * mul %30 = %28, %29 : int                 
     * arraygen %9 = [7; 30] : byte[]
	 * </code></pre>
	 * 
	 * where %9 is the register of array variable and %0 is the input array.
	 * 
	 * @param blk
	 *            the list of transformed code.
	 * @param p
	 *            AppendArray pattern.
	 */
	private void array_gen(List<Code> blk, AppendArrayPattern p) {
		// Add 'Const' code  (the number of 'append' function calls)
		int r_const = getNextRegister(Type.Int.T_INT);
		Const const_num = Codes.Const(r_const, Constant.V_INTEGER(BigInteger.valueOf(p.array_append.size())));
		blk.add(const_num);
		
		// Add 'lengthof' code to obtain the size of input array
		int r_lengthof = getNextRegister(Type.Int.T_INT);
		LengthOf lengthof = Codes.LengthOf(Type.Array(Type.Byte.T_BYTE, false), r_lengthof, this.r_input_arr);
		blk.add(lengthof);
		
		// Add 'mul' code  (r_const * r_lengthof)
		this.r_array_capacity = getNextRegister(Type.Int.T_INT);
		BinaryOperator binOp = Codes.BinaryOperator(Type.Int.T_INT, this.r_array_capacity, r_const, r_lengthof, BinaryOperatorKind.MUL);
		blk.add(binOp);
		
		// Add new 'array_gen' code (r_var = [r_init; r_mul])
		int r_var = p.array_gen.target(0);
		int r_init = p.array_gen.operand(0);
		ArrayGenerator new_array_gen = Codes.ArrayGenerator(Type.Array(Type.Byte.T_BYTE, false), r_var, r_init, this.r_array_capacity);
		blk.add(new_array_gen);
	}

	/**
	 * Create the 'array_size_init' part. For example,
	 * 
	 * <pre>
	 * <code>
	 *  const %11 = 0 : int
	 *  assign %4 = %11 : int
	 * </code>
	 * </pre>
	 * 
	 * where %4 is the register of array size 
	 * 
	 * @param blk
	 *            the list of transformed code.
	 * @param p
	 *            the original pattern.
	 */
	private void array_size_init(List<Code> blk, AppendArrayPattern p) {
		int r_const = getNextRegister(Type.Int.T_INT);
		blk.add(Codes.Const(r_const, Constant.V_INTEGER(BigInteger.ZERO)));
		this.r_array_size = getNextRegister(Type.Int.T_INT);
		blk.add(Codes.Assign(Type.Int.T_INT, r_array_size, r_const));
	}

	/**
	 * 
	 * Create 'array_update' part as followings:
	 * 
	 * <pre>
	 * <code>
	 * update %9[%4] = %5 : byte[] -> byte[]   
     * const %26 = 1 : int                     
     * add %27 = %4, %26 : int
     * assign %4 = %27  : int
	 * </code>
	 * </pre>
	 * where
	 *  %9 is the register of array variable 
	 *  %0 is the input array. 
	 *  %4 is the array size.
 	 * 
	 * @param loop_blk a list of loop byte-code
	 * @param p append array pattern
	 */
	private void array_update(List<Code> loop_blk, AppendArrayPattern p) {
		List<Code> loopbody_after = p.getPartByName("loopbody_after");
		int i = 0;
		while (i < loopbody_after.size()) {
			Code code = loopbody_after.get(i);
			// Check if the code is an append function call
			if (code instanceof Codes.Invoke) {
				Codes.Invoke invoke = (Codes.Invoke) code;
				int r_ret = invoke.target(0);
				int r_item = invoke.operand(1);
				// Check the function name
				if (invoke.name.name().equals("append")) {
					// Get the next assignment
					Codes.Assign assign = (Codes.Assign) loopbody_after.get(i+1);
					int r_output = assign.operand(0);
					// Check if the assignment over-write the function return
					if(r_output == r_ret){
						// Replace the function call with 'update'
						// Add the update byte-code
						int[] operands = { r_array_size };
						// update %9[%4] = %5 : byte[] -> byte[]
						Codes.Update update = Codes.Update(Type.Array(Type.Byte.T_BYTE, false), 
								this.r_array, operands , r_item,
								Type.Array(Type.Byte.T_BYTE, false), new ArrayList<String>());
						loop_blk.add(update);

						// Increment the array size
						// const %26 = 1 : int
						int r_const = getNextRegister(Type.Int.T_INT);
						loop_blk.add(Codes.Const(r_const, Constant.V_INTEGER(BigInteger.ONE)));
						// add %27 = %4, %26 : int
						int r_add = getNextRegister(Type.Int.T_INT);
						loop_blk.add(Codes.BinaryOperator(Type.Int.T_INT, r_add, this.r_array_size, r_const,
								BinaryOperatorKind.ADD));
						// assign %4 = %20 : int
						loop_blk.add(Codes.Assign(Type.Int.T_INT, this.r_array_size, r_add));
						// Stop and skip the invoke and next assignment
						i = i + 2;
						continue;
					}
				}
			}
			loop_blk.add(code);
			i++;
		}
	}
	

	/**
	 * Creates the 'loop' part. The major change to loop block is the 'array_update' and 'array_size_update'
	 * parts. The 'array_update' part is as follows:
	 * 
	 * <pre>
	 * <code>
	 * update %9[%3] = %5 : byte[] -> byte[]   
     * const %26 = 1 : int                     
     * add %27 = %3, %26 : int
	 * </code>
	 * </pre>
	 * where %9 is the register of array variable and %0 is the input array.
	 * @param blk
	 *            a list of transformed code.
	 * @param p
	 *            append array pattern.
	 */
	private void loop(List<Code> blk, AppendArrayPattern p) {
		// Get entire loop block
		Codes.Loop loop = p.loop;
		
		// new loop block
		List<Code> loop_blk = new ArrayList<Code>();
		// Add loop header part 
		loop_blk.addAll(p.getPartByName("loop_header"));
		
		// Add the 'loopbody_before' and 'loopbody_update' part without changes.
		loop_blk.addAll(p.getPartByName("loopbody_before"));
		loop_blk.addAll(p.getPartByName("loopbody_update"));

		// Get the loopbody_after code
		array_update(loop_blk, p);
		
		// Convert the array list to an integer array.
		int[] ops = loop.modifiedOperands;
		int[] modifiedOps = new int[ops.length+1];
		int i;
		for (i = 0; i < ops.length; i++) {
			modifiedOps[i] = ops[i];			
		}
		// Put array size to 'modifiedOps' 
		modifiedOps[i] = this.r_array_size;
		// Create a new loop byte-code with loop var, list_var and list_size
		Code new_loop = Codes.Loop(modifiedOps, loop_blk);
		blk.add(new_loop);
	}

	
	/**
	 * Add an extra invariant to ensure array capacity >= array size.
	 * <pre><code>
	 * //assert
	 * {
	 *		//ifge %3, %4 goto blklab16 : int	
	 *		//fail	
	 *		//.blklab16
	 *	//assert
	 * }
	 *</code></pre> 
	 * 
	 * Adds an extra 'resize' function call to resize the input array.
	 * For example,
	 * 
	 * <pre><code>
	 * invoke (%30) = (%1, %3) lz77_2:resize : function(byte[],int)->(byte[])
     * assign %1 = %30  : byte[]
	 * </code></pre>
	 * where %1 is the output array and %3 is the item
	 * * 
	 * @param blk
	 * @param p
	 */
	private void resize_array(List<Code> blk, AppendArrayPattern p) {

		// Add an assertion to ensure array capacity>= array size
		List<Code> assertion_blk = new ArrayList<Code>();
		String gotoLabel = CodeUtils.freshLabel();
		// ifge %3, %4 goto blklab16 : int
		assertion_blk.add(Codes.If(Type.Int.T_INT, this.r_array_capacity, this.r_array_size, Comparator.GTEQ, gotoLabel));
		// fail "insufficient array capacity would lead to 'out-of-bounded' error"
		assertion_blk.add(Codes.Fail());
		// .blklab5
		assertion_blk.add(Codes.Label(gotoLabel));
		blk.add(Codes.Assert(assertion_blk));
				
		// Add 'resize' function call
		int r_ret = getNextRegister(Type.Array(Type.Byte.T_BYTE, false));
		int[] targets = { r_ret };
		int[] operands = { this.r_array, this.r_array_size };

		// Get the path id from config
		NameID name = new NameID(config.getPathID(), "resize");
		// Get the return type
		ArrayList<Type> ret_type = p.functionOrMethod.type().returns();
		// Get the parameter type
		ArrayList<Type> param_type = new ArrayList<Type>();
		param_type.add(Type.Array(Type.Byte.T_BYTE, false));
		param_type.add(Type.Int.T_INT);

		Codes.Invoke invoke = Codes.Invoke(Type.Function(ret_type, param_type), targets, operands, name);
		blk.add(invoke);

		// Add assignment
		Codes.Assign assign = Codes.Assign(Type.Array(Type.Byte.T_BYTE, false), this.r_array, r_ret);
		blk.add(assign);

	}
	
	
	/**
	 * Adds an extra 'resize' function call to resize the output array 
	 * and restrict the range of array size.
	 * For example,
	 * 
	 * <pre><code>
	 * invoke (%30) = (%1, %3) lz77_2:resize : function(byte[],int)->(byte[])
     * assign %1 = %30  : byte[]
	 * </code></pre>
	 * where %1 is the output array and %3 is the item
	 */
	private void loop_exit(List<Code> blk, AppendArrayPattern p) {
		// Get label from 
		List<Code> loop_exit = p.getPartByName("loop_exit");
		// Get the first 'label' code
		int i = 0;
		Codes.Label label = (Codes.Label)loop_exit.get(i);
		blk.add(label);
		i++;
		
		// Generate 'resize' function call
		resize_array(blk, p);		
		
		// Add the remaining code
		while(i < loop_exit.size()){
			blk.add(loop_exit.get(i));
			i++;
		}
		


	}

	
	/**
	 * Takes a 'BuildListPattern' and outputs a list of transformed byte-code
	 * that matches with 'BuildListFirstPattern'.
	 * 
	 * @param p
	 * @return a function block with updated variable declarations.
	 */
	private FunctionOrMethod transform(AppendArrayPattern p) {
		// Get the register of input array
		this.r_input_arr = Integer.parseInt(p.input_array.replace(prefix, ""));
		// Get the register of output array 
		this.r_array = Integer.parseInt(p.output_array.replace(prefix, ""));
		
		// Store all the byte-code for the  new pattern.
		List<Code> blk = new ArrayList<Code>();
		VariableDeclarations p_vars = p.functionOrMethod.attribute(VariableDeclarations.class);
		this.declarations = new ArrayList<Declaration>();
		//Add all the declarations from p pattern.
		for(int i=0;i<p_vars.size();i++){
			this.declarations.add(p_vars.get(i));
		}		
		
		// Create 'init_before' part.
		init_before(blk, p);
		// Create the 'init' part.
		init(blk, p);
		// Create the 'init_after' part.
		init_after(blk, p);
		// Create the 'loop' part.
		loop(blk, p);
		// Create the 'loop_exit' part.
		loop_exit(blk, p);
		//Create a function block.
		List<Attribute> attributes = new ArrayList<Attribute>();
		attributes.add(new VariableDeclarations(this.declarations));
		FunctionOrMethod TransformedFunc = new FunctionOrMethod(p.functionOrMethod.modifiers(), 
				p.functionOrMethod.name(),
				p.functionOrMethod.type(),
				new AttributedCodeBlock(blk),
				p.functionOrMethod.precondition(),
				p.functionOrMethod.postcondition(),
				attributes
				);
		

		return TransformedFunc;
	}

	/**
	 * Transform a pattern of 'BuildListPattern' type to that of
	 * 'BuildListFirstPattern' type.
	 * 
	 * @param pattern
	 * @param declarations the variable declarations.
	 * @return a list of code based on the design of 'BuildListFirstPattern'.
	 */
	@Override
	public FunctionOrMethod transform(Pattern pattern) {
		// Check if the input pattern is a BuildListPattern. If not, return null.
		if (!(pattern instanceof AppendArrayPattern))
			return null;

		return transform((AppendArrayPattern) pattern);
	}

}
