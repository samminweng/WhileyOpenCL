package wyopcl.translator.generator;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.List;

import wyil.attributes.VariableDeclarations;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.Comparator;
import wyil.lang.Codes.Dereference;
import wyil.lang.Codes.IfIs;
import wyil.lang.Codes.ListGenerator;
import wyil.lang.Codes.Loop;
import wyil.lang.Codes.NewObject;
import wyil.lang.Codes.NewRecord;
import wyil.lang.Codes.UnaryOperator;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyil.transforms.LiveVariablesAnalysis.Env;
import wyopcl.translator.Configuration;
import wyopcl.translator.CopyEliminationAnalyzer;
import wyopcl.translator.bound.BasicBlock;
import wyopcl.translator.generator.CodeStores.CodeStore;

/**
 * Takes a list of functional byte-code and converts it into C code.
 * 
 * @author Min-Hsien Weng
 *
 */
public class CodeGenerator extends AbstractCodeGenerator {
	private CopyEliminationAnalyzer copyAnalyzer = null;

	/**
	 * Constructor
	 * 
	 * @param config
	 * @param functionOrMethod
	 */
	public CodeGenerator(Configuration config) {
		super(config);
	}

	public CodeGenerator(Configuration config, CopyEliminationAnalyzer analyzer) {
		this(config);
		this.copyAnalyzer = analyzer;
	}

	/**
	 * Local variables are defined and initialized with values at the top of the code block.
	 */
	protected String declareVariables(FunctionOrMethod function) {
		// Get variable declaration
		VariableDeclarations vars = function.attribute(VariableDeclarations.class);
		// Get code storage
		CodeStore store = stores.getCodeStore(function);
		// The string declaration.
		String del = "";
		// Skip the input parameters
		// Iterate over the list of registers.
		int inputs = function.type().params().size();
		for (int reg = inputs; reg < vars.size(); reg++) {
			Type type = vars.get(reg).type();
			// Get the variable name.
			String var = store.getVar(reg);
			String s_type = CodeGeneratorHelper.translateType(type, stores);
			if (s_type != null) {
				if (type instanceof Type.Array || (type instanceof Type.Reference
						&& ((Type.Reference) type).element() instanceof Type.Array)) {
					// Type declaration and initial value assignment.
					// Assign 'null' to a list
					del += "\t" + CodeGeneratorHelper.translateType(type, stores) + " " + var + " = NULL;\n";
					// Add the extra 'size' variable.
					int dimension = CodeGeneratorHelper.computeArrayDimension(type);
					String size_var = var;
					for(int d= dimension;d>0;d--){
						size_var += "_size";
						del += "\tlong long " + size_var + " = 0;\n";
					}
				} else if (type instanceof Type.Int) {
					del += "\t" + CodeGeneratorHelper.translateType(type, stores) + " " + var + " = 0;\n";
				} else {
					// Type declaration without any initialization.
					del += "\t" + CodeGeneratorHelper.translateType(type, stores) + " " + var + ";\n";
				}
			}
		}
		return del;
	}

	/**
	 * Translate the input parameters for the given function.
	 * 
	 * @param function
	 * @return
	 */
	private String translateInputParameter(FunctionOrMethod function) {
		// Get the code storage
		CodeStore store = stores.getCodeStore(function);
		List<Type> params = function.type().params();
		
		// Generate input parameters 
		boolean isfirst = true;
		String statement = "";
		for (int op=0;op<params.size();op++) {
			Type param = params.get(op);
			String var = store.getVar(op);
			
			//Check if the param is Console. If so, skip it.
			if (isfirst) {
				isfirst = false;
			} else {
				statement += ", ";
			}
			
			if(param instanceof Type.Int || param instanceof Type.Nominal){
				statement += CodeGeneratorHelper.translateType(param, stores) + " " + var;				
			}else if (param instanceof Type.Array
					|| (param instanceof Type.Reference && ((Type.Reference) param).element() instanceof Type.Array)) {
				// Add the additional 'size' variable.
				statement += CodeGeneratorHelper.translateType(param, stores) + " " + var;
				String var_size = var;
				// Generate size variables according to the dimensions, e.g. 2D array has two 'size' variables.
				int d = CodeGeneratorHelper.computeArrayDimension(param);
				while(d>0){
					var_size += "_size";
					statement += ", long long " + var_size;
					d--;
				}
			}else{
				throw new RuntimeException("Not Implemented!");
			}
		}
		return statement;
	}

	/**
	 * Translates the function or method declaration (e.g. <code>int* play(int* _0, int _0_size){</code>)
	 * 
	 * @param functionOrMethod
	 *            the code block of a function
	 * @return func_declartion the function signature.
	 */
	protected String declareFunction(FunctionOrMethod function) {
		// Function declaration.
		String del = "";
		// Get the name
		String name = function.name();
		if (name.equals("main")) {
			del = "int main(int argc, char** args)";
		} else {
			del = "";
			// Get the type info
			// Get the return type
			del += CodeGeneratorHelper.translateType(function.type().ret(), stores) + " ";
			del += name + "(";
			del += translateInputParameter(function);
			del += ")";
		}

		if (config.isVerbose()) {
			System.out.println(del);
		}
		return del;
	}

	/**
	 * Generates the C code for Codes.Const byte-code. For example,
	 * 
	 * <pre>
	 * <code>const %1 = 10 : int</code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>_1 = 10;</code>
	 * </pre>
	 * 
	 * @param code
	 * @see Codes.Const
	 */
	protected void translate(Codes.Const code, FunctionOrMethod function) {
		String stat = null;
		CodeStore store = stores.getCodeStore(function);
		String target = store.getVar(code.target());
		Constant constant = code.constant;
		String indent = store.getIndent();
		if (code.assignedType() instanceof Type.Array) {
			// Convert it into a constant list
			Constant.List list = (Constant.List) constant;
			// Initialize an array
			if (list.values.isEmpty()) {
				stat = indent + target + "=(long long*)malloc(1*sizeof(long long));\n";
				stat += indent + "if(" + target + " == NULL) {fprintf(stderr,\"fail to malloc\");\n " + "exit(-1);}\n";
				stat += indent + target + "_size = 0;";
			} else {
				// E.g. 'const %8 = [0,1,2,3,4,5,6,7,8] : int[]' wyil code can be translated into
				// Trim '[' and ']' from the array string.
				String array_values = list.values.toString().replace("[", "").replace("]", "");
				// long long _8_value[] = {0, 1, 2, 3, 4, 5, 6, 7, 8}; // Introduce 'value' variable.
				stat = indent + CodeGeneratorHelper.translateType(list.type().element(), stores) + " " + target + "_value[] = {" + array_values
						+ "};\n";
				// _8 = _8_value;
				stat += indent + target + " = " + target + "_value;\n";
				// _8_size = 9;
				stat += indent + target + "_size = " + list.values.size() + ";";
			}
		} else {
			// Add a statement
			stat = indent + target + " = " + constant + ";";
		}
		store.addStatement(code, stat);
	}

	/**
	 * Generates the code for <code>Codes.Assign</code> code. For example,
	 * 
	 * <pre>
	 * <code>
	 * long long* _2 = NULL;
	 * void* _3 = NULL;
	 * assign %2 = %3  : [void]
	 * </code>
	 * </pre>
	 * 
	 * can be translated into:
	 * <p>
	 * <code>
	 * _2 = (long long*)_3;
	 * </code>
	 * </pre>
	 * Note that the operand needs the type casting.
	 * 
	 * When we need to assign the input parameter(_0) to the new register, we need to copy the input and return the
	 * result pointer. For example,
	 * <p>
	 * <code>assign %4 = %0  : [int]</code>
	 * </p>
	 * can be translated into:
	 * <p>
	 * <code>_4 = copy(_0, _0_size);//call the copy method.</code><br>
	 * <code>_4_size = _0_size;//specify the array size</code><br>
	 * </p>
	 * 
	 * Special cases:
	 * <ul>
	 * <li>Referenced array: reference type is free of array copies in nature as it extracts the value from the register
	 * and assigns to target register. But if the referenced value is an array, we still need to propagate the array
	 * size to new register.</li>
	 * 
	 * </ul>
	 * 
	 * @param code
	 */
	protected void translate(Codes.Assign code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String lhs = store.getVar(code.target());
		String rhs = store.getVar(code.operand(0));
		String statement = "";
		String indent = store.getIndent();
		// Check if the assigned type is an array.
		if (code.type() instanceof Type.Array) {			
			//int dimension = CodeGeneratorHelper.computeArrayDimension(code.type());
			// copy the array and assign the cloned to the target.
			/**
			 * 
			 * For example, the below bytecode assign %3 = %0 : [bool] can be translated in the C code: <code>
			 *  _3_size = _board_size; 
			 *  _3 = copy(_board, _board_size);
			 * </code>
			 */
			if (!isCopyEliminated(code.operand(0), code, function)) {
				// Check the types of left is an integers
				if (!CodeGeneratorHelper.isIntType(store.getVarType(code.operand(0)))) {
					throw new RuntimeException("Not implemented");
				} else {
					/** Make a copy of right operand. */
					statement += CodeGeneratorHelper.generateArrayCopy(code.type(), indent, lhs, rhs);
				}
			} else {
				// Do not need to make a copy and have in-place update
				statement += indent + lhs + " = (" + CodeGeneratorHelper.translateType(store.getVarType(code.target()), stores) + ")" + rhs + ";";
				statement += CodeGeneratorHelper.generateSizeAssign(code.type(), indent, lhs, rhs);
			}
		} else if (code.type() instanceof Type.Reference
				&& ((Type.Reference) code.type()).element() instanceof Type.Array) {
			statement += indent + lhs + " = " + rhs + ";\n";
			statement += indent + lhs + "_size = " + rhs + "_size;";
		} else if (code.type() instanceof Type.Record){
			statement += indent + lhs + " = copy_"+CodeGeneratorHelper.translateType(code.type(), stores)+"(" + rhs + ");";
		} else {
			statement = indent + lhs + " = " + rhs + ";";
		}
		// Add the statement to the list of statements.
		store.addStatement(code, statement);
	}

	/**
	 * Generates the C code <code>Codes.Length</code> code. For example,
	 * 
	 * <pre>
	 * <code>
	 * lengthof %4 = %0 : [int]
	 * </code>
	 * </pre>
	 * 
	 * can be translated into
	 * 
	 * <pre>
	 * <code>
	 * _4 = _0_size;
	 * </code>
	 * </pre>
	 * 
	 * @param code
	 */
	protected void translate(Codes.LengthOf code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String stat = store.getIndent() + store.getVar(code.target()) + " = " + store.getVar(code.operand(0))
		+ "_size;";
		store.addStatement(code, stat);
	}

	/**
	 * Generates the code for <code>Codes.BinaryOperator</code> code. For example,
	 * 
	 * <pre>
	 * <code>
	 * add %8 = %2, %1 : int
	 * </code>
	 * </pre>
	 * 
	 * can be translated into
	 * 
	 * <pre>
	 * <code>
	 * _8=_2+_1;
	 * </code>
	 * </pre>
	 * 
	 * @param code
	 */
	protected void translate(Codes.BinaryOperator code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		// Type type = code.type();
		String target = store.getVar(code.target());
		String left = store.getVar(code.operand(0));
		String right = store.getVar(code.operand(1));
		// vars.put(target, CodeGeneratorHelper.translate(type));
		// addDeclaration(type, target);
		String stat = store.getIndent();
		stat += target + "=" + left;
		switch (code.kind) {
		case ADD:
			stat += "+" + right + ";";
			break;
		case SUB:
			stat += "-" + right + ";";
			break;
		case MUL:
			stat += "*" + right + ";";
			break;
		case DIV:
			stat += "/" + right + ";";
			break;
		case REM:
			stat += "%" + right + ";";
			break;
			/*
			 * case RANGE: // Assign the range with input code for the translation of 'forall' // byte-code. // this.range =
			 * code; stat = null; break;
			 */
		case BITWISEOR:
			break;
		case BITWISEXOR:
			break;
		case BITWISEAND:
			break;
		case LEFTSHIFT:
			break;
		case RIGHTSHIFT:
			break;
		}
		store.addStatement(code, stat);
	}

	

	/**
	 * Calls copy analyzer to check if the variable (reg) is alive afterwards, or passed as a read-only parameter.
	 * 
	 * @param reg
	 *            the register of array variable
	 * @param code
	 *            the byte-code of function call.
	 * @param f
	 *            the caller function
	 * @return ture if the copy is un-needed and can be avoid. Otherwise, return false.
	 */
	private boolean isCopyEliminated(int reg, Code code, FunctionOrMethod f) {
		if (this.copyAnalyzer != null) {
			return this.copyAnalyzer.isCopyEliminated(reg, code, f);
		}
		return false;
	}

	/**
	 * Translate the lhs of a function call.
	 * 
	 * @param code
	 * @param f
	 * @return
	 */
	private String translateLHSFunctionCall(Codes.Invoke code, FunctionOrMethod f) {
		CodeStore store = stores.getCodeStore(f);
		String statement = store.getIndent();
		// Translate the return value of a function call.
		// If no return value, no needs for translation.
		if (code.target() >= 0) {
			Type return_type = code.type().ret();
			String ret = store.getVar(code.target());
			// Assign both of lists to have the same array size, e.g.
			// '_12_size=_xs_size;'
			// Check if the return is also an array.
			if (return_type instanceof Type.Array) {
				for (int index = 0; index < code.operands().length; index++) {
					Type type = code.type().params().get(index);
					if (type instanceof Type.Array) {
						statement += (ret + "_size") + "=" + store.getVar(code.operand(index)) + "_size;\n";
					}
				}
			}
			// Call the function and assign the return value to lhs register.
			statement += ret + " = ";
		}
		return statement;
	}

	
	
	
	
	/**
	 * Translate the rhs of a function call
	 * 
	 * @param code
	 * @param f
	 * @return
	 */
	private String translateRHSFunctionCall(Codes.Invoke code, FunctionOrMethod f) {
		// Get code store of f function
		CodeStore store = stores.getCodeStore(f);		
		boolean isFirst = true;
		String statement = "";
		for (int index = 0; index < code.operands().length; index++) {
			if (!isFirst) {
				statement += " ,";
			}
			int reg = code.operand(index);
			String param = store.getVar(reg);
			Type paramType = store.getVarType(reg);
			// Add the '*_size' parameter
			if (paramType instanceof Type.Array) {
				if (!isCopyEliminated(reg, code, f)) {
					int dimension = CodeGeneratorHelper.computeArrayDimension(paramType);
					statement += "copy";
					if(dimension>1){
						statement += dimension+"DArray";
					}
					statement += "(";
					// Generate size variables according to dimensions.
					String size_vars = CodeGeneratorHelper.generateArraySizeVars(param, dimension);
					statement += param + ","+ size_vars + "), "+ size_vars;
					
				} else {
					// Do not need any copy
					statement += param + ", " + param + "_size";
				}
			} else if ((paramType instanceof Type.Reference
					&& ((Type.Reference) paramType).element() instanceof Type.Array)) {
				statement += param + ", " + param + "_size";
			} else if(paramType instanceof Type.Record){
				//wyil.lang.WyilFile.Type userType = this.getUserDefinedType((Type.Record)paramType);
				//statement += "clone_"+userType.name()+"("+param+")";
				statement += "copy_"+CodeGeneratorHelper.translateType(paramType, stores)+"("+param+")";
			} else if(paramType instanceof Type.Nominal){
				Type.Nominal nomial = ((Type.Nominal)paramType);
				if(nomial.name().name().equals("Console")){
					statement += "stdout";
				}else{
					statement += param;
					//String userType = nomial.name().name();
					//statement += "copy_"+userType+"("+param+")";
				}
			} else {
				statement += param;
			}
			isFirst = false;
		}
		// Pass the array size into the function to mutate the array size.
		return statement;
	}

	/**
	 * Produces the code for <code>Codes.Invoke</code> code. For example, the following WyIL code:
	 * 
	 * <pre>
	 * <code>invoke %12 = (%1) While_Valid_1:reverse : function([int]) -> [int]</code>
	 * </pre>
	 * 
	 * can be translated into the following C code:
	 * 
	 * <pre>
	 * <code>
	 * _12_size=_xs_size;
	 * _12=reverse(copy(_xs, _xs_size), _xs_size);
	 * </code>
	 * </pre>
	 * 
	 * Before invoking the function, copy the array ('xs') first and then pass the cloned array to the function. So
	 * that the original array will not be overwritten and its value is safely preserved.
	 * 
	 * Special cases:
	 * <ul>
	 * <li>Parse Integer<br>
	 * <code>invoke %5 = (%8) whiley/lang/Int:parse : function(whiley/lang/ASCII:string) -> null|int</code><br>
	 * can translate this into <br>
	 * <code>_5=parseInteger(_8);</code>
	 * <li>Slice Array<br>
	 * <code>invoke %16 = (_items, _start, _pivot) whiley/lang/Array:slice : function(int[],int,int) -> int[]<code><br>
	 * can translate this into <br>
	 * <code>
	 * _16 = slice(_items, _items_size, _start,  _pivot);<br>
	 * _16_size = _pivot - _start;
	 * </code>
	 * <li>Any.toString<br>
	 * <code>invoke %18 = (%1) whiley/lang/Any:toString </code>
	 * 
	 * 
	 * @param code
	 *            the Invoked Wyil code
	 * 
	 */
	protected void translate(Codes.Invoke code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String statement = "";
		// Check if the called function is whiley/lang/Int
		if (code.name.module().toString().contains("whiley/lang")) {
			switch (code.name.name()) {
			// Parse a string into an integer.
			case "parse":
				statement += store.getIndent() + store.getVar(code.target()) + " = " + "parseInteger("
						+ store.getVar(code.operand(0)) + ");";
				break;
				// Slice an array into a new sub-array at given starting and ending index.
			case "slice":
				// Call the 'slice' function.
				String arr_name = store.getVar(code.operand(0));
				String start = store.getVar(code.operand(1));
				String end = store.getVar(code.operand(2));
				// Add 'slice' function call.
				statement += store.getIndent() + store.getVar(code.target()) + " = slice(" + arr_name + ", " + arr_name
						+ "_size, " + start + "," + end + ");\n";
				// Add array size.
				statement += store.getIndent() + store.getVar(code.target()) + "_size = " + end + " - " + start + ";";
				break;
			case "toString":
				String target = store.getVar(code.target());
				statement += store.getIndent() + target + " = " + code.operand(0) + ";";
				break;
			default:
				throw new RuntimeException("Un-implemented code:" + code);
			}
		} else {
			// Translate the function call, e.g.
			// '_12=reverse(_xs , _xs_size);'
			statement += translateLHSFunctionCall(code, function);
			// call the function/method
			statement +=  code.name.name() + "(";
			statement += translateRHSFunctionCall(code, function);
			statement += ");";
		}
		// add the statement
		store.addStatement(code, statement);
	}

	/**
	 * Translated the Whiley comparator into C comparison operators, e.g. EQ := '=='. If the negated option is provided,
	 * then the comparator is first negated and then converted into C code.
	 * 
	 * @param op
	 *            Whiley comparator
	 * @param isNegated
	 *            true if the comparator needs the negation.
	 * @return the C comparsion operator.
	 */
	private String translate(Codes.Comparator op, boolean isNegated) {
		if (isNegated) {
			// The negated operator
			switch (op) {
			case EQ:
				return "!=";
			case NEQ:
				return "==";
			case LT:
				return ">=";
			case LTEQ:
				return ">";
			case GT:
				return "<=";
			case GTEQ:
				return "<";
			default:
				return null;
			}
		} else {
			// The condition
			switch (op) {
			case EQ:
				return "==";
			case NEQ:
				return "!=";
			case LT:
				return "<";
			case LTEQ:
				return "<=";
			case GT:
				return ">";
			case GTEQ:
				return ">=";
			default:
				return null;
			}
		}

	}

	/**
	 * Generates the code for <code>Codes.If</code> code. For example,
	 * 
	 * <pre>
	 * <code>
	 * ifge %0, %1 goto blklab0 : int
	 * </code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>
	 * if( _0 >= _1) { goto blklab0;}
	 * </code>
	 * </pre>
	 * 
	 * @param code
	 *            <code>Codes.If</code> code
	 */
	protected void translate(Codes.If code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String statement = store.getIndent();
		String left = store.getVar(code.leftOperand);
		String right = store.getVar(code.rightOperand);

		// Added a special case to compare two arrays.
		if (code.type instanceof Type.Array) {
			/**
			 * 
			 * For example, the byte-code: <code> ifeq %1, %38 goto blklab2 : [int]</code> can be translated into C
			 * code: if(isArrayEqual(_xs,_xs_size,_38,_38_size)==1){goto blklab2;}
			 * 
			 * Note that isArrayEqual function checks if both of arrays are the same (1: true, 0:false).
			 * 
			 */
			if (code.op.equals(Comparator.EQ)) {
				// get the type of left/right
				Type left_type = store.getVarType(code.leftOperand);
				Type right_type = store.getVarType(code.rightOperand);
				// Check the left type is an array of integers.
				if (CodeGeneratorHelper.isIntType(left_type)) {
					statement += "if(isArrayEqual(" + left + ", " + left + "_size";
				} else {
					// If not, use type casting.
					statement += "if(isArrayEqual((" + CodeGeneratorHelper.translateType(right_type, stores) + ")" + left + ", " + left + "_size";
				}

				// Check the right type is an array
				if (CodeGeneratorHelper.isIntType(right_type)) {
					statement += "," + right + ", " + right + "_size)==1";
				} else {
					// Cast the right to an array.
					statement += ", (" + CodeGeneratorHelper.translateType(left_type, stores) + ")" + right + ", " + right + "_size)==1";
				}
			}
		} else {
			statement += "if(" + left;
			// The condition
			statement += translate(code.op, false);
			statement += right;

		}

		// The goto statement
		statement += "){";
		statement += "goto " + code.target + ";";
		statement += "}";

		store.addStatement(code, statement);
	}

	/**
	 * Translates the <code>Codes.AssertOrAssume</code> byte-code. This function iterates over the list of byte-code in
	 * each assertion or assumption and translated each byte-code. The translated C code is surrounded by two brackets
	 * ('{' and '}') with an indentation.
	 * 
	 * @param code
	 */
	protected void translate(Codes.AssertOrAssume code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		// Add the starting clause for the assertion
		store.addStatement(code, store.getIndent() + "{");
		// Increase the indent
		store.increaseIndent();
		iterateCodes(code.bytecodes(), function);
		store.decreaseIndent();
		store.addStatement(code, store.getIndent() + "}");

	}

	protected void translate(Codes.Goto code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String stat = store.getIndent() + "goto " + code.target + ";";
		store.addStatement(code, stat);
	}

	/**
	 * Translated the <code>Codes.Label</code> byte-code into C code. For example,
	 * 
	 * <pre>
	 * <code>
	 * .blklab0
	 * </code>
	 * </pre>
	 * 
	 * can be translated into
	 * 
	 * <pre>
	 * <code>
	 * blklab0:
	 * </code>
	 * </pre>
	 * 
	 * @param code
	 *            Codes.Lable byte-code
	 * 
	 */
	protected void translate(Codes.Label code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		store.addStatement(code, code.label + ":;");
	}

	/**
	 * Prints out the message and Generates the stderr, followed by exit
	 * 
	 * @param code
	 */
	protected void translate(Codes.Fail code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String indent = store.getIndent();
		String stat = indent + "fprintf(stderr,\"" + code + "\");\n";
		stat += indent + "exit(-1);";// Exit value (-1) means the failure of assertions.
		store.addStatement(code, stat);
	}

	/**
	 * Translates the update byte-code into C code. For example,
	 * 
	 * <pre>
	 * <code>
	 * update %0.pieces[%1] = %7 : {int move,[int] pieces} -> {int move,[int] pieces}
	 * </code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>
	 * _0.pieces[_1] = _7;
	 * </code>
	 * </pre>
	 * 
	 * 
	 * Special cases
	 * <ul>
	 * <li>Referenced array: the update of reference is different, for example,
	 * <code>update (*%0)[%6] = %51 : &[int] -> &[int]</code> can transform this to: <code>(*_0)[_6] = _51;</code>
	 * 
	 * 
	 * @param code
	 */
	protected void translate(Codes.Update code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String indent = store.getIndent();
		String s = "";
		// For List type only
		if (code.type() instanceof Type.Array) {
			s += indent + store.getVar(code.target());
			// Iterates operands to increase the depths. 
			for(int i=0;i<code.operands().length-1;i++){
				s += "[" + store.getVar(code.operand(i)) + "]";
			}
			s += " = " + store.getVar(code.result()) + ";";
		} else if (code.type() instanceof Type.Record) {
			s += indent + store.getVar(code.target()) + "." + code.fields.get(0);
			// check if there are two or more operands. If so, then add the
			// index operand.
			if (code.operands().length > 1) {
				s += "[" + store.getVar(code.operand(0)) + "]";
			}
			s += " = " + store.getVar(code.result()) + ";";
		} else if (code.type() instanceof Type.Reference
				&& ((Type.Reference) code.type()).element() instanceof Type.Array) {
			s += indent + "(*" + store.getVar(code.target()) + ")[" + store.getVar(code.operand(0)) + "]" + " = "
					+ store.getVar(code.result()) + ";";
		} else {
			throw new RuntimeException("Not implemented" + code);
		}

		store.addStatement(code, s);
	}

	protected void translate(Codes.Nop code, FunctionOrMethod function) {
		// Do nothing
		CodeStore store = stores.getCodeStore(function);
		store.addStatement(code, store.getIndent() + ";");
	}

	/**
	 * Translates the <code>Codes.Return</code> byte-code into C code. For example,
	 * 
	 * <pre>
	 * <code>
	 * return %4 : int
	 * </code>
	 * </pre>
	 * 
	 * can be translated into
	 * 
	 * <pre>
	 * <code>
	 * return _4;
	 * </code>
	 * </pre>
	 * 
	 * @param code
	 */
	protected void translate(Codes.Return code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String statement = store.getIndent();
		if (code.operand >= 0) {
			// Translate the Return code.
			statement += "return " + store.getVar(code.operand) + ";";
		} else {
			// Negative register means this function/method does not have return value.
			// So we do need to generate the code, except for main method.
			if (function.name().equals("main")) {
				// If the method is "main", then add a simple exit code with value
				statement += "exit(0);";
			}
		}
		store.addStatement(code, statement);
	}

	/**
	 * Translates the <code>Codes.IndexOf</code> byte-code. For example,
	 * 
	 * <pre>
	 * <code>
	 * indexof %11 = %0, %1 : [int]
	 * </code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>
	 * _11=_ls[_i];
	 * </code>
	 * </pre>
	 * 
	 * @param code
	 */
	protected void translate(Codes.IndexOf code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String stat = store.getIndent() + store.getVar(code.target()) + "=" + store.getVar(code.operand(0)) + "["
				+ store.getVar(code.operand(1)) + "];";
		store.addStatement(code, stat);
	}

	/**
	 * Translates the <code>Codes.NewList</code> byte-code. For example,
	 * 
	 * <pre>
	 * <code>
	 * newlist %11 = (%6, %7, %8, %9, %10) : int[]
	 * </code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>
	 *_11_size = 5;
	 *long long _11_value[5] = {_6, _7, _8, _9, _10};
	 *_11 = _11_value;
	 * </code>
	 * </pre>
	 * _11_value is an array with 5 elements and it is assigned to array pointer '_11'.     
	 * 
	 * Note that if the new list is an empty list, then its element type is a 'void', which is not supposed to store any
	 * value. For example,
	 * 
	 * <pre>
	 * <code>
	 * newlist %5 = () : [void]
	 * </code>
	 * </pre>
	 * 
	 * In this case, the void type is converted into integer type by default because there is no type mapping to the
	 * 'void' type in C. And there is no translation either.
	 * 
	 * @param code
	 */
	protected void translate(Codes.NewList code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String indent = store.getIndent();

		// Get array names
		String array_name = store.getVar(code.target());
		// Add the 'size' variable to store the array length
		String array_size = array_name + "_size";
		// Assign array size with the number of operands.
		String statement = indent + array_size + " = " + code.operands().length + ";\n";
		// Construct array value
		String elmType = CodeGeneratorHelper.translateType(code.type().element(), stores);
		int length = code.operands().length;
		if(length > 0 ){			
			// Add the 'value' variable to store array values 
			String array_value = array_name + "_value";
			// Assign array value 
			statement += indent + elmType + " "+ array_value + "["+length+"] = {"; 
			boolean isFirst = true;
			for (int operand : code.operands()) {
				if(isFirst){
					isFirst = false;
				}else{
					statement += ", ";
				}
				statement += store.getVar(operand);
			}
			statement += "};\n";

			// Assign the pointer to array values 
			statement += indent + array_name + " = " + array_value+";";			
		}else{
			// For empty array, we initialize the array with one element. 
			statement += indent + array_name + " = malloc(sizeof(" +elmType+"));";
		}

		store.addStatement(code, statement);
	}

	/**
	 * Translates FieldLoad byte-code into C code, e.g.
	 * 
	 * <pre>
	 * <code>
	 * fieldload %14 = %1 pieces : {int move,[int] pieces}
	 * </code>
	 * </pre>
	 * 
	 * can be translated into
	 * 
	 * <pre>
	 * <code>
	 * _14 = _1.pieces;
	 * </code>
	 * </pre>
	 * 
	 * Special case:
	 * <ul>
	 * <li>Note that at this stage, the field load code that loads <code>System.out.println</code> is not translated
	 * into any C code.</li>
	 * <li>The field code, that loads <code>fieldload %6 = %0 args</code> is translated into
	 * <code>_6 = convertArgsToIntArray(argc, args, _6_size);</code>
	 * 
	 * @param code
	 * @throws Exception
	 */
	protected void translate(Codes.FieldLoad code, FunctionOrMethod function) {
		String field = code.field;
		CodeStore store = stores.getCodeStore(function);
		String target = store.getVar(code.target());
		String indent = store.getIndent();
		String statement = "";
		// Skip printing statements, e.g. 'print_s'
		if (field.equals("out") || field.equals("print") || field.equals("println") || field.equals("print_s") || field.equals("println_s")) {
			// Load the field to the target register.
			store.loadField(code.target(), field);
			statement = null;
		} else if (field.equals("args")) {
			// Convert the arguments into an array of integer array (long long**).
			statement = indent + target + " = convertArgsToIntArray(argc, args);\n";
			statement += indent + target + "_size = argc - 1;";
		} else {
			// Check if field type is an array.
			if (code.fieldType() instanceof Type.Array){
				// 'fieldload %34 = %3 pieces : {int move,int[] pieces}'
				// _34_size = _b.pieces_size;
				// _34 = copy(_b.pieces, _b.pieces_size);
				String var = store.getVar(code.operand(0))+ "." + code.field;
				//int dimension = CodeGeneratorHelper.computeArrayDimension(code.fieldType());
				statement += CodeGeneratorHelper.generateArrayCopy(code.fieldType(), indent, target, var);	
			}else{
				// Get the target
				statement = indent + target + " = " + store.getVar(code.operand(0)) + "." + code.field + ";";
			}
		}
		store.addStatement(code, statement);
	}

	/**
	 * TODO: Not implemented.
	 * 
	 * @param code
	 */
	protected void translate(Codes.Convert code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		store.addStatement(code, null);
	}

	

	/**
	 * Generates the C code for <code>Codes.IndirectInvoke</code>. For example,
	 * 
	 * <pre>
	 * <code>
	 * fieldload %2 = %1 println : {method(any) -> void print,method([int]) -> void print_s,method(any) -> void println,method([int]) -> void println_s}
	 * invoke %3 = (%4) IfElse_Valid_2:f : function(int) -> int
	 * indirectinvoke %2 (%3) : method(any) -> void
	 * </code>
	 * </pre>
	 * 
	 * can be translated into
	 * 
	 * <pre>
	 * <code>
	 * indirect_printf(_3);
	 * </code>
	 * </pre>
	 * 
	 * where 'indirect_printf' function is defined in 'Util.c'.
	 * 
	 * If the input type is an instance of user defined type, then get the type declaration first and convert it into
	 * the corresponding type.
	 * 
	 * @param code
	 *            Codes.IndirectInvoke byte-code
	 * 
	 */
	protected void translate(Codes.IndirectInvoke code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String statement = store.getIndent();
		if (code.type() instanceof Type.FunctionOrMethod) {
			// Get the function name, e.g. 'printf'.
			String print_name = store.getField(code.operand(0));
			// Get the input
			String input = store.getVar(code.operand(1));
			switch (print_name) {
			case "print_s":
				// E.g. 'println("%s", str);'
				statement += "printf_s(" + input + ", " + input + "_size);";
				break;
			case "println_s":
				statement += "println_s(" + input + ", " + input + "_size);";
				break;
			case "println":
				if(code.target()>0){
					// Check input's type to call different println function.
					Type type = store.getVarType(code.operand(1));
					if (type instanceof Type.Int) {
						statement += "printf(\"%d\\n\", " + input + ");";
					} else if (type instanceof Type.Array) {
						// Print out an array with given array size.
						statement += "printf_array(" + input + ", " + input + "_size);";
					} else if (type instanceof Type.Nominal) {
						Type.Nominal nominal = (Type.Nominal) type;
						// Print out a user-defined type structure
						statement += "printf_" + nominal.name().name() + "(" + input + ");";
					} else {
						throw new RuntimeException("Not implemented." + code);
					}
				}
				break;
			}

		}
		store.addStatement(code, statement);
	}

	protected void translate(UnaryOperator code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String target = prefix + code.target();
		// vars.put(target, CodeGeneratorHelper.translate(code.type()));
		// store.addDeclaration(code.type(), target);
		String stat = store.getIndent() + target + "= -" + prefix + code.operand(0) + ";";
		store.addStatement(code, stat);
	}


	/**
	 * Iterate over the list of loop byte-code and translate each code into C code. To separate the bytecode inside a
	 * loop from the main byte-code, the loop flag is enabled and the indentation is increased.
	 * 
	 * @param code
	 */
	protected void translate(Loop code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
	
		String indent = store.getIndent();
		String statement = indent + "while(true){";
		store.addStatement(code, statement);


		// Increase the indent for loop body.
		store.increaseIndent();
		// Translate the loop body
		iterateCodes(code.bytecodes(), function);

		// Decrease the indentation after loop body.
		store.decreaseIndent();
		// Add the ending bracket.
		store.addStatement(null, store.getIndent() + "}");
	}
	
	
	/**
	 * Translates the new record byte-code. For example,
	 * 
	 * <pre>
	 * <code>newrecord %11 = (%10, %0) : {int move,[int] pieces}</code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>
	 * _11.move = _0;
	 * _11.pieces = _10;
	 * _11.pieces_size = _10_size;
	 * </code>
	 * </pre>
	 * 
	 * @TODO Fix the sequence of fields in a record type as the order of fields is in the reversed direction of
	 *       operands.
	 * 
	 * @param code
	 */
	protected void translate(NewRecord code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String indent = store.getIndent();
		String lhs = store.getVar(code.target());

		// Creates a list of member names
		String[] members = CodeGeneratorHelper.getMemebers(code.type());
		int[] operands = code.operands();

		String statement = "";
		for(int i=0;i<operands.length; i++){
			// Get operand 
			String op = store.getVar(operands[i]);
			String member = members[i];
			//Type type = store.getVarType(code.operand(i));
			Type type = code.type().field(member);
			// Propagate '_size' variable.
			if (type instanceof Type.Array) {
				// Get array dimension
				int dimension = CodeGeneratorHelper.computeArrayDimension(type);
				String size_var = member;
				String op_size = op;
				for(int d= dimension;d>0;d--){
					size_var += "_size";
					op_size += "_size";
					statement += indent + lhs  + "." + size_var + " = " + op_size + ";\n";
				}
				if(dimension >1){
					statement += indent + lhs + "." + member + " = copy"+dimension+"DArray(" + op;
					op_size = op;
					for(int d= dimension;d>0;d--){
						op_size += "_size";
						statement += ", " +op_size;
					}
					statement += ");\n";
				}else{
					statement += indent + lhs + "." + member + " = copy(" + op+ ", "+op + "_size);\n";
				}
				
			}else if(type instanceof Type.Int){
				statement += indent + lhs + "." + member + " = " + op + ";\n";
			}else {
				throw new RuntimeException("Not Implemented!");
			}
		}
		// Get the set of field names and convert it to an array of string.
		store.addStatement(code, statement);
	}

	/**
	 * Write out the generated C code, which starts with variable declarations, followed by a list of statements and a
	 * list of free statements at the end.
	 * 
	 * @param writer
	 */
	protected void writeFunction(FunctionOrMethod function) {
		// Get the code store
		CodeStore store = stores.getCodeStore(function);
		// Write out the header file
		String filename = config.getFilename();
		FileWriter writer;
		try {
			// Check if the header file exits.
			File f = new File(filename + ".h");
			if (!f.exists()) {
				writer = new FileWriter(f);
				// If no such a file, write the include files to include Util.h
				writer.append("#include \"Util.h\"\n");
			} else {
				writer = new FileWriter(f, true);
			}
			// Write out function declaration.
			writer.append(this.declareFunction(function) + ";\n");
			writer.close();
			f = null;
		} catch (IOException e1) {
			throw new RuntimeException("Error occurrs in writing " + filename + ".h");
		}

		// Create a writer to write the C code to a *.c file.
		try {
			// Chekc if the C file exist.
			File f = new File(filename + ".c");
			if (!f.exists()) {
				writer = new FileWriter(f);
				// If no such a file, write the include files to include Util.h
				writer.append("#include \"" + filename + ".h\"\n");
			} else {
				writer = new FileWriter(f, true);
			}
			// Write function declaration
			writer.append(this.declareFunction(function) + "{\n");
			// Write Variable declaration with initial values.
			writer.append(this.declareVariables(function));
			// Get all Statments
			List<String> statements = store.getStatements();
			for (String statement : statements) {
				writer.append(statement + "\n");
			}
			// Ending clause
			writer.append("}\n");
			// Close the file writer.
			writer.close();
		} catch (IOException e) {
			throw new RuntimeException("Error occurs in writing " + filename + ".c");
		}
	}


	/**
	 * Translate ifis Wyil code into C code. This code checks that the register is the given value.
	 * 
	 * For example, the ifis Wyil code <code>ifis %1, null goto blklab6 : null|int</code> can be translated int C code
	 * <code>if(_1 == NULL) {goto blklab6;}
	 * 
	 */
	@Override
	protected void translate(IfIs code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String statement = "";
		// The ifis code checks if the register is NULL or not.
		if (code.rightOperand instanceof Type.Null) {
			statement += store.getIndent() + "if(" + store.getVar(code.operand) + " == NULL) { goto " + code.target
					+ ";}";
		} else {
			throw new RuntimeException("Not implemented!" + code);
		}
		store.addStatement(code, statement);
	}

	/**
	 * Translate deference Wyil code into C code. Deference in C is to use '*' operator to get the value of lhs operand
	 * and assign it to rhs operand.
	 * 
	 * For example, <code>
	 * deref %16 = %0 : &[int]
	 * </code> can translate this into <code>
	 * _16 = *(_0);
	 * </code>
	 * 
	 * 
	 * @param code
	 *            Dereference Wyil code
	 * @param function
	 *            function
	 */
	@Override
	protected void translate(Dereference code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String statement = store.getIndent() + store.getVar(code.target()) + " = *(" + store.getVar(code.operand(0))
		+ ");";
		// Check if the value in the rhs register is an array.
		if (code.type().element() instanceof Type.Array) {
			// Assign the array size to lhs register
			statement += "\n" + store.getIndent() + store.getVar(code.target()) + "_size = "
					+ store.getVar(code.operand(0)) + "_size;";
		}
		store.addStatement(code, statement);
	}

	/**
	 * Translate newobject Wyil code into C code. The newObject code creates a new object from the value of 'rhs' and
	 * assign the address of new object to 'lhs'.
	 * 
	 * For example, <code>
	 * newobject %4 = %3 : &[void]
	 * </code> can translate this into <code>
	 * long long* _3_value = copy(_3, _3_size);
	 * _4 =(void**)&(_3_value);
	 * _4_size = _3_size;
	 * </code>
	 * 
	 * 
	 */
	@Override
	protected void translate(NewObject code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String statement = "";
		// Check that the given value is an array.
		if (code.type().element() instanceof Type.Array) {
			String rhs = store.getVar(code.operand(0));
			Type rhs_type = store.getVarType(code.operand(0));
			// Get the value of rhs operand
			if (!isCopyEliminated(code.operand(0), code, function)) {
				// long long* _3_value = copy(_3, _3_size);
				statement += store.getIndent() + CodeGeneratorHelper.translateType(rhs_type, stores) + " " + rhs + "_value" + " = copy(" + rhs
						+ ", " + rhs + "_size);\n";
			} else {
				// No copies is needed, e.g. 'long long _3_value = _3;'
				statement += store.getIndent() + CodeGeneratorHelper.translateType(rhs_type, stores) + " " + rhs + "_value" + " = " + rhs + ";\n";
			}

			// Get the address of rhs and assign it to lhs with type casting.
			String lhs = store.getVar(code.target());
			Type lhs_type = store.getVarType(code.target());
			// _4 =(void**)&(_3_value);
			statement += store.getIndent() + lhs + " = (" + CodeGeneratorHelper.translateType(lhs_type, stores) + ")" + "&(" + rhs + "_value);\n";
			// Propagate array size from rhs to lhs
			statement += store.getIndent() + lhs + "_size = " + rhs + "_size;";
		} else {
			throw new RuntimeException("Not implemented! " + code);
		}
		store.addStatement(code, statement);
	}

	

	/***
	 * Translate 'ListGenerator' wyil code into C code. For example,
	 * 
	 * <code>
	 * listgen %69 = [66; 68] : int[]
	 * </code> can translate this into <code>
	 * _69 = genArray(_66, _68);
	 * _69_size = _68;
	 * </code> The array is initialized with '_66' and allocated with '_68' size.
	 */
	@Override
	protected void translate(ListGenerator code, FunctionOrMethod function) {
		CodeStore store = stores.getCodeStore(function);
		String indent = store.getIndent();
		String array_name = store.getVar(code.target());
		String size = store.getVar(code.operand(1));
		Type type = store.getVarType(code.operand(0));
		int dimension = CodeGeneratorHelper.computeArrayDimension(type) + 1;
		// Call genArray function to generate the array
		String statement ="";
		
		
		
		// Assign size to size variable
		String size_var = array_name +"_size";
		statement += indent + size_var + " = "+size+";\n";
		String extra_size = array_name;
		// Propagate additional array size (>= 2D array)
		for(int d=dimension;d>1;d--){
			size_var += "_size";
			extra_size += "_size";
			statement += indent + size_var+ " = " +extra_size+";\n";
		}
		
		// Call 'gen' function to generate an array of given dimension.
		statement += indent + array_name + " = gen"+dimension+"DArray("+store.getVar(code.operand(0));
		statement += ", " + CodeGeneratorHelper.generateArraySizeVars(array_name, dimension)+");";
		store.addStatement(code, statement);
	}

	

	/**
	 * Write the user defined data types to *.h file, e.g. <code>
	 * typedef struct{
	 *		Square* pieces;
	 *		long long pieces_size;
	 * 		nat move;
	 * } Board;<br>
	 * </code> Also, add a 'print' function to print out the structure.
	 */
	@Override
	protected void writeUserTypes(List<wyil.lang.WyilFile.Type> userTypes) {
		String filename = this.config.getFilename();
		List<String> structs = new ArrayList<String>();
		List<String> statements = new ArrayList<String>();

		// Iterate each user type and write out code to source and header files.
		for (wyil.lang.WyilFile.Type userType : userTypes) {
			String struct = userType.name();
			// Check if userType is a typedef structure.
			if(userType.type() instanceof Type.Int){
				structs.add("typedef " + CodeGeneratorHelper.translateType(userType.type(), stores) + " " + struct + ";");
			}else if(userType.type() instanceof Type.Record){
				structs.addAll(CodeGeneratorHelper.generateStruct(userType, stores));
				statements.addAll(CodeGeneratorHelper.generatePrintfFunction(userType, stores));
				statements.addAll(CodeGeneratorHelper.generateCopyFunction(userType, stores));
				statements.addAll(CodeGeneratorHelper.generateFreeFunction(userType, stores));
			}else{
				throw new RuntimeException("Not Implemented!");
			}
		}

		// Write out user-defined structures to *.h
		try {
			Files.write(Paths.get(filename + ".h"), structs, StandardOpenOption.APPEND);
		} catch (IOException e) {
			throw new RuntimeException("Errors occurs in writing "+structs+" to "+filename+".h");
		}

		// Write out statements to *.c
		try {
			Files.write(Paths.get(filename + ".c"), statements, StandardOpenOption.APPEND);
		} catch (IOException e) {
			throw new RuntimeException("Errors in writing "+statements+" to "+filename + ".c");
		}
	}

	/**
	 * Defines constants, e.g. <code>
	 * #define BLANK 0
	 * </code>
	 * 
	 * 
	 */
	@Override
	protected void writeConstants(List<wyil.lang.WyilFile.Constant> constants) {
		// Generates declarations
		List<String> declarations = new ArrayList<String>();
		for (wyil.lang.WyilFile.Constant constant : constants) {
			declarations.add("#define " + constant.name() + " " + constant.constant());
		}
		
		String filename = config.getFilename();
		
		try {
			Files.write(Paths.get(filename + ".h"), declarations, StandardOpenOption.APPEND);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	/**
	 * Write out 'includes' both in 'test_case.c' and 'test_case.h'
	 */
	@Override
	protected void writeIncludes() {
		String file_name = this.config.getFilename();
		// Writes out #include "Util.h" to test_case.h 
		String includes = "#include \"Util.h\"\n";
		try {
			// Create a new one or over-write an existing one.
			Files.write(Paths.get(file_name+".h"), includes.getBytes(), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);
		} catch (IOException e) {
			throw new RuntimeException("Errors occur in writeIncludes()");
		}
		
		// Writes out #include "test_case.h" to test_case.c
		includes = "#include \""+file_name+".h\"\n";
		try {
			Files.write(Paths.get(file_name+".c"), includes.getBytes(), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);
		} catch (IOException e) {
			throw new RuntimeException("Errors occur in writeIncludes()");
		}
	}
}
