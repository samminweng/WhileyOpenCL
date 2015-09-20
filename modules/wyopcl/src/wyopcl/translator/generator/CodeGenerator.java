package wyopcl.translator.generator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import wyc.lang.Stmt.VariableDeclaration;
import wycc.lang.SyntaxError;
import wyfs.lang.Path.ID;
import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.Comparator;
import wyil.lang.Codes.Dereference;
import wyil.lang.Codes.If;
import wyil.lang.Codes.IfIs;
import wyil.lang.Codes.Invariant;
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

/**
 * Takes a list of functional byte-code and converts it into C code.
 * 
 * @author Min-Hsien Weng
 *
 */
public class CodeGenerator extends AbstractCodeGenerator {
	private Collection<wyil.lang.WyilFile.Type> userTypes;// Store all the user-defined types, e.g. Board.
	private CopyEliminationAnalyzer analyzer = null;

	/**
	 * Constructor
	 * 
	 * @param config
	 * @param functionOrMethod
	 */
	public CodeGenerator(Configuration config) {
		super(config);
		// this.userTypes = userTypes;
	}

	public CodeGenerator(Configuration config, CopyEliminationAnalyzer analyzer) {
		this(config);
		this.analyzer = analyzer;
	}

	/**
	 * Local variables are defined and initialized with values at the top of the
	 * code block.
	 */
	protected String declareVariables(FunctionOrMethod function) {
		// Get variable declaration
		VariableDeclarations vars = function.attribute(VariableDeclarations.class);
		// Get code storage
		CodeStore store = this.getCodeStore(function);
		// The string declaration.
		String del = "";
		// Skip the input parameters
		// Iterate over the list of registers.
		int inputs = function.type().params().size();
		for (int reg = inputs; reg < vars.size(); reg++) {
			Type type = vars.get(reg).type();
			// Get the variable name.
			String var = store.getVar(reg);
			String s_type = translate(type);
			if (s_type != null) {
				if (type instanceof Type.Array || (type instanceof Type.Reference 
						&& ((Type.Reference)type).element() instanceof Type.Array)) {
					// Type declaration and initial value assignment.
					// Assign 'null' to a list
					del += "\t"+translate(type) + " " + var + " = NULL;\n";
					// If the variable is an array, then add the extra 'size'
					// variable.
					del += "\tlong long " + var + "_size = 0;\n";
				} else if (type instanceof Type.Int) {
					del += "\t"+translate(type) + " " + var + " = 0;\n";
				} else {
					// Type declaration without any initialization.
					del += "\t"+translate(type) + " " + var + ";\n";
				}
			}
		}
		return del;
	}

	protected String translateInputParameter(FunctionOrMethod function) {
		// Get the code storage
		CodeStore store = this.getCodeStore(function);
		boolean isfirst = true;
		int register = 0;
		String stat = "";
		for (Type param : function.type().params()) {
			if (isfirst) {
				stat += translate(param);
			} else {
				stat += ", " + translate(param);
			}
			String var = store.getVar(register);
			// Add the variable names
			stat += " " + var;
			// If the variable is an array or the referenced value is an array,
			//then add the extra 'size' variable.
			if (param instanceof Type.Array || (param instanceof Type.Reference 
					&& ((Type.Reference)param).element() instanceof Type.Array)) {
				String var_size = var + "_size";
				stat += ", long long " + var_size;
			}
			isfirst = false;
			register++;
		}
		return stat;
	}

	/**
	 * Translates the function or method declaration (e.g.
	 * <code>int* play(int* _0, int _0_size){</code>)
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
			del += translate(function.type().ret()) + " ";
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
	 * Get the user defined type by the name
	 * 
	 * @param name
	 * @return
	 */
	private wyil.lang.WyilFile.Type getUserDefinedType(String name) {
		for (wyil.lang.WyilFile.Type user_type : this.userTypes) {
			if (user_type.name().equals(name)) {
				return user_type;
			}
		}
		return null;
	}

	/**
	 * Get the user defined type by checking if the user type has the same
	 * fields as the given record type.
	 * 
	 * @param type
	 *            the record type.
	 * @return the user type. Return null if no type is matched.
	 */
	private wyil.lang.WyilFile.Type getUserDefinedType(Type.Record type) {
		for (wyil.lang.WyilFile.Type user_type : this.userTypes) {
			if (user_type.type() instanceof Type.Record) {
				Type.Record record = (Type.Record) user_type.type();
				// check if record and type have the same fields.
				boolean isTheSame = true;
				for (Entry<String, Type> field : type.fields().entrySet()) {
					Type recordFieldType = record.field(field.getKey());
					if (recordFieldType != null) {
						isTheSame &= true;
					} else {
						isTheSame &= false;
					}
				}

				if (isTheSame) {
					return user_type;
				}
			}
		}
		return null;
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
		CodeStore store = this.getCodeStore(function);
		String target = store.getVar(code.target());
		String indent = store.getIndent();
		if (code.assignedType() instanceof Type.Array) {
			// Initialize an array
			if (((Constant.List) code.constant).values.isEmpty()) {
				stat = indent + target + "=(long long*)malloc(1*sizeof(long long));\n";
				stat += indent + "if(" + target + " == NULL) {fprintf(stderr,\"fail to malloc\");\n "
						+ "exit(-1);}\n";
				stat += indent + target + "_size = 0;";
			}
		} else {
			// Add a statement
			stat = indent + target + " = " + code.constant + ";";
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
	 * When we need to assign the input parameter(_0) to the new register, we
	 * need to clone the input and return the result pointer. For example,
	 * <p>
	 * <code>assign %4 = %0  : [int]</code>
	 * </p>
	 * can be translated into:
	 * <p>
	 * <code>_4 = clone(_0, _0_size);//call the clone method.</code><br>
	 * <code>_4_size = _0_size;//specify the array size</code><br>
	 * </p>
	 * 
	 * Special cases:
	 * <ul><li>Referenced array: reference type is free of array copies in nature  
	 * as it extracts the value from the register and assigns to target register.
	 * But if the referenced value is an array, we still need to propagate the
	 * array size to new register.
	 * </li>
	 * 
	 * </ul>
	 * @param code
	 */
	protected void translate(Codes.Assign code, FunctionOrMethod function) {
		CodeStore store = this.getCodeStore(function);

		String rhs = store.getVar(code.target());
		String lhs = store.getVar(code.operand(0));
		String statement = "";
		String indent = store.getIndent();
		// Check if the assigned type is an array.
		if (code.type() instanceof Type.Array) {
			// Clone the array and assign the cloned to the target.
			statement += indent + (rhs + "_size") + " = " + lhs + "_size;\n";
			/**
			 * 
			 * For example, the below bytecode assign %3 = %0 : [bool] can be
			 * translated in the C code:
			 * <code>
			 *  _3_size = _board_size; 
			 *  _3 = clone(_board, _board_size);
			 * </code>
			 */
			if (!isCopyEliminated(code.operand(0), code, function)) {				
				// Check the types of left is an integers 
				if(!this.isIntType(store.getVarType(code.operand(0)))){
					Type rhs_type = store.getVarType(code.target());					
					//
					/**
					 * If not, the type casting is needed.
					 * 
					 * //assign %9 = %10  : [void]
					 * _9_size = _10_size;
					 * _9 = clone((long long*)_10, _10_size);
					 */
					statement += indent + rhs + " = clone(("+translate(rhs_type) +")"+ lhs + ", " + lhs + "_size);";
				}else{
					/** Make a copy of right operand.*/
					statement += indent + rhs + " = clone(" + lhs + ", " + lhs + "_size);";
				}
			} else {
				// Do not need to make a copy and have in-place update
				statement += indent + rhs + " = (" + translate(store.getVarType(code.target())) + ")" + lhs + ";";
			}
		} else if(code.type() instanceof Type.Reference
				&& ((Type.Reference)code.type()).element() instanceof Type.Array){
			statement += indent + rhs + " = " + lhs + ";\n";
			statement += indent + rhs + "_size = " + lhs + "_size;";
		}else {
			statement = indent + rhs + " = " + lhs + ";";
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
		CodeStore store = this.getCodeStore(function);
		String stat = store.getIndent() + store.getVar(code.target()) + " = " + store.getVar(code.operand(0))
		+ "_size;";
		store.addStatement(code, stat);
	}

	/**
	 * Generates the code for <code>Codes.BinaryOperator</code> code. For
	 * example,
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
		CodeStore store = this.getCodeStore(function);
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
		/*case RANGE:
			// Assign the range with input code for the translation of 'forall'
			// byte-code.
			// this.range = code;
			stat = null;
			break;*/
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
	 * Check if the array 'r' is updated inside the function.
	 * @param r the array 
	 * @param f the function
	 * @return true if the array 'r' is updated.
	 */
	private boolean mutate(String r, FunctionOrMethod f){
		//Get the list of wyil code 
		for(Code code: f.body().bytecodes()){
			// Check the array is updated.
			if(code instanceof Codes.Update){
				String target = this.analyzer.getActualVarName(((Codes.Update) code).target(), f);
				if(target.equals(r)){
					return true;// Modified Array.
				}
			}
		}
		// Read-only array.
		return false;
	}

	/**
	 * Determines whether to make a copy of array by checking liveness information or read-only property.
	 * 
	 * If the array variable is live, then the copy is necessary. Otherwise, the
	 * register can be overwritten safely.
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
		if (this.analyzer != null) {
			CopyEliminationAnalyzer copy_analyzer = this.analyzer;
			// Check the array is read-only.
			boolean isReadOnly = false;
			if(code instanceof Codes.Invoke){
				String r_name = copy_analyzer.getActualVarName(reg, f);
				FunctionOrMethod invoked_function = config.getFunctionOrMethod(((Codes.Invoke)code).name);
				//Check if the array r is modified inside 'invoked_function'.
				isReadOnly = !mutate(r_name, invoked_function);
			}
			// Check the array is live. 
			BasicBlock blk = copy_analyzer.getBlockbyCode(f, code);// Get basic block that contains the given code.
			Env outSet = copy_analyzer.getLiveness(f).getOutSet(blk);
			boolean isLive = outSet.contains(reg);
			return (isReadOnly || !isLive);
		}
		return false;
	}

	/**
	 * Produces the code for <code>Codes.Invoke</code> code. For example, the
	 * following WyIL code:
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
	 * _12=reverse(clone(_xs, _xs_size), _xs_size);
	 * </code>
	 * </pre>
	 * 
	 * Before invoking the function, clone the array ('xs') first and then pass
	 * the cloned array to the function. So that the original array will not be
	 * overwritten and its value is safely preserved.
	 * 
	 * Special cases:
	 * <ul><li>Integer parsing:<br>
	 * <code>invoke %5 = (%8) whiley/lang/Int:parse : function(whiley/lang/ASCII:string) -> null|int</code><br>
	 * can be translated into <br>
	 * <code>_5=parseInteger(_8);</code>
	 * 
	 * 
	 * @param code
	 */
	protected void translate(Codes.Invoke code, FunctionOrMethod function) {
		CodeStore store = this.getCodeStore(function);
		String statement = "";
		//Check if the called function is whiley/lang/Int 
		if(code.name.module().toString().equals("whiley/lang/Int")){
			switch(code.name.name()){
			case "parse":
				statement += store.getIndent()+store.getVar(code.target())+" = "
						+ "parseInteger(" + store.getVar(code.operand(0))+");";
				break;
			default:
				throw new RuntimeException("Un-implemented code:"+code);
			}			
		}else{
			Type return_type = code.type().ret();
			//Translate the return value of invoked function.
			//If no return value, no needs for translation.
			if(code.target()>=0){
				String ret = store.getVar(code.target());
				// Assign both of lists to have the same array size, e.g.
				// '_12_size=_xs_size;'
				// Check if the return is also an array.
				if (return_type instanceof Type.Array) {
					for (int index = 0; index < code.operands().length; index++) {
						Type type = code.type().params().get(index);
						if (type instanceof Type.Array) {
							statement += store.getIndent() + (ret + "_size") + "=" + store.getVar(code.operand(index)) + "_size;\n";
						}
					}
				}
				// Call the function and assign the return value to lhs register.
				statement += store.getIndent() + ret + "=" + code.name.name() + "(";
			}else{
				// call the function/method
				statement += store.getIndent() + code.name.name() + "(";
			}
			
			// Translate the input parameters of called function, e.g.
			// '_12=reverse(_xs , _xs_size);'		
			boolean isFirst = true;
			for (int index = 0; index < code.operands().length; index++) {
				if (!isFirst) {
					statement += " ,";
				}
				int reg = code.operand(index);
				String param = store.getVar(reg);
				Type paramType = store.getVarType(reg);
				// Add the '*_size' parameter
				if (paramType instanceof Type.Array) {
					if (!isCopyEliminated(reg, code, function)) {
						statement += "clone(" + param + ", " + param + "_size), " + param + "_size";
					} else {
						// Do not need any copy
						statement += param + ", " + param + "_size";
					}
				} else if((paramType instanceof Type.Reference
						&& ((Type.Reference)paramType).element() instanceof Type.Array)){
					statement += param + ", " + param + "_size"; 
				} else {
					statement += param;
				}
				isFirst = false;
			}
			// Pass the array size into the function to mutate the array size.
			/*if(return_type instanceof Type.Array){
				statement += ", &"+ store.getVar(code.target())+"_size";
			}*/
			
			statement += ");";
		}		

		// add the statement
		store.addStatement(code, statement);
	}

	/**
	 * Translated the Whiley comparator into C comparison operators, e.g. EQ :=
	 * '=='. If the negated option is provided, then the comparator is first
	 * negated and then converted into C code.
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
		CodeStore store = this.getCodeStore(function);
		String statement = store.getIndent();
		String left = store.getVar(code.leftOperand);
		String right = store.getVar(code.rightOperand);		

		// Added a special case to compare two arrays.
		if (code.type instanceof Type.Array) {
			/**
			 * 
			 * For example, the byte-code:
			 * <code> ifeq %1, %38 goto blklab2 : [int]</code> can be translated
			 * into C code: if(isArrayEqual(_xs,_xs_size,_38,_38_size)==1){goto
			 * blklab2;}
			 * 
			 * Note that isArrayEqual function checks if both of arrays are
			 * the same (1: true, 0:false).
			 * 
			 */
			if (code.op.equals(Comparator.EQ)) {
				// get the type of left/right
				Type left_type = store.getVarType(code.leftOperand);
				Type right_type = store.getVarType(code.rightOperand);				
				//Check the left type is an array of integers.				
				if(this.isIntType(left_type)){
					statement += "if(isArrayEqual(" + left + ", " + left + "_size";
				}else{
					//If not, use type casting.
					statement += "if(isArrayEqual((" +translate(right_type)+")"+ left + ", " + left + "_size";
				}

				//Check the right type is an array
				if(this.isIntType(right_type)){
					statement += "," + right + ", " + right + "_size)==1";
				}else{
					//Cast the right to an array.
					statement += ", (" +translate(left_type)+")"+ right + ", " + right + "_size)==1";
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
	 * Translates the <code>Codes.AssertOrAssume</code> byte-code. This function
	 * iterates over the list of byte-code in each assertion or assumption and
	 * translated each byte-code. The translated C code is surrounded by two
	 * brackets ('{' and '}') with an indentation.
	 * 
	 * @param code
	 */
	protected void translate(Codes.AssertOrAssume code, FunctionOrMethod function) {
		CodeStore store = this.getCodeStore(function);
		// Add the starting clause for the assertion
		store.addStatement(code, store.getIndent() + "{");
		// Increase the indent
		store.increaseIndent();
		iterateCodes(code.bytecodes(), function);
		store.decreaseIndent();
		store.addStatement(code, store.getIndent() + "}");

	}

	protected void translate(Codes.Goto code, FunctionOrMethod function) {
		CodeStore store = this.getCodeStore(function);
		String stat = store.getIndent() + "goto " + code.target + ";";
		store.addStatement(code, stat);
	}

	/**
	 * Translated the <code>Codes.Label</code> byte-code into C code. For
	 * example,
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
		CodeStore store = this.getCodeStore(function);
		store.addStatement(code, code.label + ":;");
	}

	/**
	 * Prints out the message and Generates the stderr, followed by exit
	 * 
	 * @param code
	 */
	protected void translate(Codes.Fail code, FunctionOrMethod function) {
		CodeStore store = this.getCodeStore(function);
		String indent = store.getIndent();
		String stat = indent + "fprintf(stderr,\"" + code + "\");\n";
		stat += indent + "exit(-1);";//Exit value (-1) means the failure of assertions. 
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
	 * <ul><li>
	 * Referenced array: the update of reference is different, for example,
	 * <code>update (*%0)[%6] = %51 : &[int] -> &[int]</code>
	 * can transform this to:
	 * <code>(*_0)[_6] = _51;</code>
	 * 
	 * 
	 * @param code
	 */
	protected void translate(Codes.Update code, FunctionOrMethod function) {
		CodeStore store = this.getCodeStore(function);
		String indent = store.getIndent();
		String stat = "";
		// For List type only
		if (code.type() instanceof Type.Array) {
			stat += indent + store.getVar(code.target()) + "[" + store.getVar(code.operand(0)) + "] = "
					+ store.getVar(code.result()) + ";";
		} else if (code.type() instanceof Type.Record) {
			stat += indent + store.getVar(code.target()) + "." + code.fields.get(0);
			// check if there are two or more operands. If so, then add the
			// index operand.
			if (code.operands().length > 1) {
				stat += "[" + store.getVar(code.operand(0)) + "]";
			}
			stat += " = " + store.getVar(code.result()) + ";";
		} else if (code.type() instanceof Type.Reference && ((Type.Reference)code.type()).element() instanceof Type.Array){
			stat += indent + "(*"+store.getVar(code.target())+")[" + store.getVar(code.operand(0)) + "]" 
		            +" = " + store.getVar(code.result()) + ";"; 
		} else {
			throw new RuntimeException("Not implemented"+code);
		}

		store.addStatement(code, stat);
	}

	protected void translate(Codes.Nop code, FunctionOrMethod function) {
		// Do nothing
		CodeStore store = this.getCodeStore(function);
		store.addStatement(code, store.getIndent() + ";");
	}

	/**
	 * Translates the <code>Codes.Return</code> byte-code into C code. For
	 * example,
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
		CodeStore store = this.getCodeStore(function);
		String statement = store.getIndent();
		if (code.operand >= 0) {
			// Translate the Return code.
			statement += "return " + store.getVar(code.operand) + ";";
		} else {
			// Negative register means this function/method does not have return value.
			// So we do need to generate the code.
			/*if(function.name().equals("main")){
				// If the method is "main", then
				//add a simple exit code with value of 0.
				statement += "exit(0);";
			}else{
				//Return without exit value.
				statement += "return ;";
			}*/
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
		CodeStore store = this.getCodeStore(function);
		String stat = store.getIndent() + store.getVar(code.target()) + "=" + store.getVar(code.operand(0)) + "["
				+ store.getVar(code.operand(1)) + "];";
		store.addStatement(code, stat);
	}

	/**
	 * Translates the <code>Codes.NewList</code> byte-code. For example,
	 * 
	 * <pre>
	 * <code>
	 * newlist %6 = () : [void]
	 * </code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>
	 * _6_size = 0;
	 * _6 = malloc(0);
	 * </code>
	 * </pre>
	 * 
	 * where '_6_size' is the array size of '_6' array. If the newlist byte-code
	 * initializes the array with inputs, then the array is allocated
	 * dynamically on the memory space and the translation is as below:
	 * 
	 * <pre>
	 * <code>
	 * newlist %12 = (%11) : [int]
	 * </code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>
	 * _12_size=0;
	 * _12 = malloc(_12_size*sizeof(int));
	 * </code>
	 * </pre>
	 * 
	 * Note that if the new list is an empty list, then its element type is a
	 * 'void', which is not supposed to store any value. For example,
	 * 
	 * <pre>
	 * <code>
	 * newlist %5 = () : [void]
	 * </code>
	 * </pre>
	 * 
	 * In this case, the void type is converted into integer type by default
	 * because there is no type mapping to the 'void' type in C. And there is no
	 * translation either.
	 * 
	 * @param code
	 */
	protected void translate(Codes.NewList code, FunctionOrMethod function) {
		CodeStore store = this.getCodeStore(function);
		String target = store.getVar(code.target());
		// Add the 'target_size' variable to indicate the length of the list
		String target_size = target + "_size";
		// Add the declaration of target_size variable.
		// addDeclaration(Type.Int.T_INT, target_size);
		// Assign the array size with the number of operands.
		String indent = store.getIndent();
		String stat = indent + target_size + " = " + code.operands().length + ";\n";
		// Check if the size of input operand > 0.
		if (code.operands().length > 0) {
			// Allocate the target with array size.
			stat += indent + target + " = (" + translate(code.type().element()) + "*)malloc(" + target_size + "*sizeof("
					+ translate(code.type().element()) + "));\n";
			// Initialize the array.
			int index = 0;
			for (int operand : code.operands()) {
				stat += indent + target + "[" + index + "] = " + store.getVar(operand) + ";";
				index++;
			}
			store.addStatement(code, stat);
		} else {
			// Translates the empty list, e.g. 'newlist %3 = () : [void]' can be
			// converted into '_3 = malloc(0);'.
			stat += indent + target + " = malloc(" + target_size + ");";
			store.addStatement(code, stat);
		}

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
	 * <li>Note that at this stage, the field load code that loads
	 * <code>System.out.println</code> is not translated into any C code.</li>
	 * <li> The field code, that loads <code>fieldload %6 = %0 args</code>
	 * is translated into <code>_6 = convertArgsToIntArray(argc, args, _6_size);</code>
	 * @param code
	 * @throws Exception
	 */
	protected void translate(Codes.FieldLoad code, FunctionOrMethod function) {
		String field = code.field;
		CodeStore store = this.getCodeStore(function);		
		String statement = store.getIndent();

		if (field.equals("out") || field.equals("println")) {
			statement = null;
		}else if (field.equals("args")){
			//Convert the arguments into an array of integer array (long long**).
			//
			statement += store.getVar(code.target()) + " = convertArgsToIntArray(argc, args, "
					+ store.getVar(code.target())+"_size);";
		} else {
			// Get the target
			statement += store.getVar(code.target()) + " = " + store.getVar(code.operand(0))
			+ "." + code.field + ";";		
		}
		store.addStatement(code, statement);		
	}

	/**
	 * TODO: Not implemented.
	 * 
	 * @param code
	 */
	protected void translate(Codes.Convert code, FunctionOrMethod function) {
		// Converts Constant to Any type
		// if (code.result instanceof Type.Any) {
		// sym_ctrl.putAttribute(prefix+code.operand(0), "type",
		// code.type());
		// Do nothing.
		// }
		CodeStore store = this.getCodeStore(function);
		store.addStatement(code, null);
	}

	/**
	 * Based on the variable type, print out the variable by using different
	 * indirect invoked 'printf' functions.
	 * 
	 * @param type
	 * @param var
	 * @param function
	 * @return the translated statement.
	 * 
	 *         TODO Print out a pointer without array size. Is it possible?
	 * 
	 */
	private String translateIndirectInvokePrintf(Type type, String var, FunctionOrMethod function) {
		CodeStore store = this.getCodeStore(function);
		String indent = store.getIndent();
		String statement = "";
		if (type instanceof Type.Nominal) {
			Type.Nominal nominal = (Type.Nominal) type;
			wyil.lang.WyilFile.Type user_type = getUserDefinedType(nominal.name().name());
			statement += translateIndirectInvokePrintf(user_type.type(), var, function);
		} else if (type instanceof Type.Array) {
			// Print out a pointer without specifying array size.
			statement += indent + "indirect_printf_array_withoutlength(" + var + ");\n";
		} else if (type instanceof Type.Int) {
			statement += indent + "indirect_printf(" + var + ");\n";
		} else if (type instanceof Type.Record) {
			// Generalize the indirect_invoke_printf function to print out a
			// record.
			Type.Record record = (Type.Record) type;
			for (Entry<String, Type> field : record.fields().entrySet()) {
				// Print out the field name
				statement += indent + "indrect_printf_string(\"" + field.getKey() + "\t\");\n";
				// Based on the field Type, print out the field value using
				// the different 'printf' functions.
				statement += translateIndirectInvokePrintf(field.getValue(), var + "." + field.getKey(), function);
			}
		}
		return statement;

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
	 * If the input type is an instance of user defined type, then get the type
	 * declaration first and convert it into the corresponding type.
	 * 
	 * @param code
	 *            Codes.IndirectInvoke byte-code
	 * 
	 */
	protected void translate(Codes.IndirectInvoke code, FunctionOrMethod function) {
		String statement = "";
		CodeStore store = this.getCodeStore(function);
		if (code.type() instanceof Type.FunctionOrMethod) {
			String var = store.getVar(code.parameter(0));
			// Get input type
			// Type type = code.type().params().get(0);
			// Type type = getVarDeclaration(var);
			Type type = store.getVarType(code.parameter(0));
			// Check if the type is a user-defined type.
			if (type instanceof Type.Array) {
				// Added the additional 'array_size' variable to indicate the
				// length of an array.
				// Due to strictly forbidding the overlapping in C, the function
				// is named differently.
				statement += store.getIndent() + "indirect_printf_array(" + var + ", " + var + "_size);\n";
			} else {
				statement += translateIndirectInvokePrintf(type, var, function);
			}
		}
		store.addStatement(code, statement);
	}

	protected void translate(UnaryOperator code, FunctionOrMethod function) {
		CodeStore store = this.getCodeStore(function);
		String target = prefix + code.target();
		// vars.put(target, CodeGeneratorHelper.translate(code.type()));
		// store.addDeclaration(code.type(), target);
		String stat = store.getIndent() + target + "= -" + prefix + code.operand(0) + ";";
		store.addStatement(code, stat);
	}

	/**
	 * Translate the loop condition and loop variant. For example,
	 * 
	 * <pre>
	 * <code>
	 * ifge %1, %0 goto blklab1 : int
	 * </code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code> while(_i<_limit){
	 * 
	 * @param loop_cond
	 */
	private void translateLoopCondition(Codes.If loop_cond, FunctionOrMethod function) {
		CodeStore store = this.getCodeStore(function);
		String statement = store.getIndent();
		String left = store.getVar(loop_cond.leftOperand);
		String right = store.getVar(loop_cond.rightOperand);
		statement += "while(" + left;
		// The negated operator
		statement += translate(loop_cond.op, true);
		statement += right;
		statement += "){";
		store.addStatement(loop_cond, statement);		
	}

	/**
	 * Translates the <code>Codes.ForAll</code> byte-code. For example,
	 * 
	 * <pre>
	 * <code>
	 * range %8 = %6, %7 : [int]
	 * forall %2 in %8 (%1, %9, %10) : [int]
	 * </code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>
	 * for(_2 = _6; _2 < _7; _2++ ){
	 * ...
	 * }
	 * </code>
	 * </pre>
	 * 
	 * where '_2' is the loop variable and '_6' and '_7' are lower and upper
	 * bound respectively.
	 * 
	 * The range byte-code is stored with a global variable temporarily so that
	 * the translation of 'forall' byte-code can retrieve the bound information.
	 * 
	 * @param code
	 */
	/*
	 * private void translate(Codes.ForAll code) { String loop_var =
	 * getVarName(code.indexOperand); String lower_bound =
	 * getVarName(range.operand(0)); String upper_bound =
	 * getVarName(range.operand(1)); // Construct the loop header. String
	 * statement = indent + "for(" + loop_var + "=" + lower_bound + "; " +
	 * loop_var + "<" + upper_bound + "; " + loop_var + "++){";
	 * addStatement(code, statement); // Increase the indentation
	 * this.increaseIndent(); // Get the code block inside the forall loop.
	 * List<Code> code_blk = code.bytecodes(); // Translate each byte-code and
	 * output each generated code. this.iterateOverCodeBlock(code_blk);
	 * this.decreaseIndent(); statement = indent + "}"; addStatement(null,
	 * statement);// Ending bracket of the forall loop. // Nullify the range.
	 * this.range = null; }
	 */

	/**
	 * Iterate over the list of loop byte-code and translate each code into C
	 * code. To separate the bytecode inside a loop from the main byte-code, the
	 * loop flag is enabled and the indentation is increased.
	 * 
	 * @param code
	 */
	protected void translate(Loop code, FunctionOrMethod function) {
		CodeStore store = this.getCodeStore(function);
		// Get loop_header
		List<Code> loop_header = new ArrayList<Code>();
		Codes.Invariant loop_invariant = null;
		Codes.If loop_condition = null;
		int index = 0;
		// Split the loop header and loop body
		for (index = 0; index < code.bytecodes().size(); index++) {
			Code loop_code = code.bytecodes().get(index);
			if (loop_code instanceof Codes.If) {
				// Assign the loop condition
				loop_condition = (Codes.If) loop_code;
				// Increment the index
				index++;
				break;
			} else if (loop_code instanceof Codes.Invariant) {
				loop_invariant = (Codes.Invariant) loop_code;
			} else {
				// Add the code to loop header
				loop_header.add(loop_code);
			}
		}

		List<Code> loop_body = new ArrayList<Code>();
		// Reorder the sequence of loop code and put the loop invariant next to
		// loop condition.
		for (; index < code.bytecodes().size(); index++) {
			// Get the loop invariant
			loop_body.add(code.bytecodes().get(index));
		}

		// Translate the loop header
		this.iterateCodes(loop_header, function);

		// Translate the loop condition
		if (loop_condition != null) {
			translateLoopCondition(loop_condition, function);
		}

		// Translate the loop invariant
		if (loop_invariant != null) {
			translate(loop_invariant, function);
		}

		// Increase the indent for loop body.
		store.increaseIndent();
		// Translate the loop body
		if (loop_body != null) {
			iterateCodes(loop_body, function);
		}
		// Decrease the indentation after loop body.
		store.decreaseIndent();
		// Add the ending bracket.
		store.addStatement(null, store.getIndent() + "}");
	}

	/**
	 * Deprecated due to v0.3.36
	 * 
	 * Translates the append byte-code. For example,
	 * 
	 * <pre>
	 * <code>append %13 = %2, %12 : [int]</code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>_13_size = _2_size+_12_size;//new array size.
	 * _13=append(_2, &_2_size, _12, &_12_size, &_13_size);//call the 'append' function and pass the size argument by reference for the update.
	 * free(_12);
	 * </code>
	 * </pre>
	 * 
	 * @param code
	 */
	/*protected void translate(ListOperator code, FunctionOrMethod function) {
		CodeStore store = this.getCodeStore(function);
		String target = store.getVar(code.target());

		// _13_size = _2_size+_12_size;//new array size
		String stat = store.getIndent() + target + "_size = ";
		boolean isFirst = true;
		for (int operand : code.operands()) {
			String op = store.getVar(operand);
			if (!isFirst) {
				// Add '+' operator before the 'size' variable.
				stat += "+";
			}
			stat += op + "_size";
			isFirst = false;
		}
		stat += ";\n";
		// Calls the append function. For example,
		// _13=append(_2, _2_size, _12, _12_size);
		stat += store.getIndent() + target + "=append(";
		isFirst = true;
		for (int operand : code.operands()) {
			String op = store.getVar(operand);
			if (!isFirst) {
				// Add ',' to separate the arguments.
				stat += ", ";
			}
			stat += op + ", " + op + "_size";
			isFirst = false;
		}
		// Add the ending clause.
		stat += ");\n";

		// Free the op_2, because op_2 has been appended to the op_1. stat +=
		// store.getIndent() + "free(" + store.getVar(code.operand(1)) + ");";
		//
		// Put it to the statement list.
		store.addStatement(code, stat);
	}
*/
	/**
	 * Translate the WyIL type into the type in C.
	 * 
	 * @param type
	 *            the WyIL type
	 * @return the result string. Return null if the type can not be translated,
	 *         e.g. the function call of print, printf...
	 *
	 *         TODO Generalize the user-defined types, such as 'Board'.
	 * 
	 */
	protected String translate(Type type) {
		// The existential type, e.g. function EmptyBoard() -> (Board r)
		// The return type of 'EmptyBoard' function is 'Board'.
		if (type instanceof Type.Nominal) {
			Type.Nominal nomial = (Type.Nominal) type;
			return nomial.name().name();
		}

		if (type instanceof Type.Int || type instanceof Type.Bool) {
			return "long long";
		}

		if (type instanceof Type.Array) {
			Type.Array listType = (Type.Array) type;
			return translate(listType.element()) + "*";
		}

		if (type instanceof Type.Void) {
			return "void";
		}

		if (type instanceof Type.Record) {
			Type.Record record = (Type.Record) type;
			HashMap<String, Type> fields = record.fields();
			// Check if the var is the function call of print,...
			if (fields.containsKey("print") || fields.containsKey("println") || fields.containsKey("print_s")
					|| fields.containsKey("println_s")) {
				// No needs to do the translation.
				return null;
			}

			// Check
			if (fields.containsKey("args")) {
				return "int argc, char** args";
			}

			// Check if the type is an instance of user defined type.
			wyil.lang.WyilFile.Type userDefinedType = getUserDefinedType((Type.Record) type);
			if (userDefinedType != null) {
				return userDefinedType.name();
			}
		}


		if(type instanceof Type.Union){
			Type.Union union = (Type.Union)type;
			//Check if type is an union type of integer. 
			//If so, return the integer type. 
			if(union.bounds().contains(Type.T_INT)){
				return "long long";
			}else{
				throw new RuntimeException("Un-implemented Type"+union);
			}
		}

		// Translate reference type in Whiley to pointer type in C. 
		if(type instanceof Type.Reference){
			Type.Reference ref = (Type.Reference)type;
			// Types are passed as a pointer type
			return translate(ref.element())+"*";
		}
		
		return null;
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
	 * </code>
	 * </pre>
	 * 
	 * @TODO Fix the sequence of fields in a record type as the order of fields
	 *       is in the reversed direction of operands.
	 * 
	 * @param code
	 */
	protected void translate(NewRecord code, FunctionOrMethod function) {
		CodeStore store = this.getCodeStore(function);
		NewRecord newrecord = (NewRecord) code;
		String statement = "";
		// Begin with the last item
		int index = newrecord.type().fields().size();
		// Iterate the record's fields.
		for (Map.Entry<String, Type> field : newrecord.type().fields().entrySet()) {
			// Decrement the index
			index--;
			// Assess the structure member, such as 'move', and assign the
			// operand to
			statement += store.getIndent() + store.getVar(newrecord.target()) + "." + field.getKey() + " = "
					+ store.getVar(newrecord.operand(index)) + ";\n";
		}
		store.addStatement(code, statement);
	}

	/**
	 * Write out the generated C code, which starts with variable declarations,
	 * followed by a list of statements and a list of free statements at the
	 * end.
	 * 
	 * @param writer
	 */
	protected void writeCodeToFile(FunctionOrMethod function) {
		// Get the code store
		CodeStore store = this.getCodeStore(function);
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
	 * Deprecated due to v0.3.36
	 * 
	 * Translate the sublist byte-code into C code, e.g.
	 * <code> sublist %16 = %0, %15, %1 : [int]</code> can be translated into C
	 * code: <code> 
	 * _16 = sublist(clone(_0, _0_size), _15, _1);
	 * _16_size = _1 - _15;
	 * </code>
	 * 
	 * @param code
	 * @param function
	 */
	@Deprecated
	/*@Override
	protected void translate(SubList code, FunctionOrMethod function) {
		CodeStore store = this.getCodeStore(function);
		int[] ops = code.operands();
		// Generate the C code.
		String statement = "";

		// Generate the size of sublist
		statement += store.getIndent() + store.getVar(code.target()) + "_size = " + store.getVar(ops[2]) + " - "
				+ store.getVar(ops[1]) + ";\n";

		// Generate the function call of 'sublist'
		// LHS
		statement += store.getIndent() + store.getVar(code.target());
		// RHS
		//Check if the array copy is needed
		//if(isNecessaryCopy(ops[0], code, function)){
		//	statement += " = sublist(clone(" + store.getVar(ops[0]) + ", " + store.getVar(ops[0]) + "_size), "
		//			+ store.getVar(ops[1]) + ", " + store.getVar(ops[2]) + ");";
		//}else{
			statement += " = sublist(" + store.getVar(ops[0]) + ", " + store.getVar(ops[1]) 
			+ ", " + store.getVar(ops[2]) + ");";
		//}
		store.addStatement(code, statement);
	}*/
	/**
	 * Translate ifis Wyil code into C code. This code checks that the register is the given value.
	 * 
	 * For example, the ifis Wyil code
	 * <code>ifis %1, null goto blklab6 : null|int</code>
	 * can be translated int C code
	 * <code>if(_1 == NULL) {goto blklab6;}
	 * 
	 */
	@Override
	protected void translate(IfIs code, FunctionOrMethod function) {
		CodeStore store = this.getCodeStore(function);
		String statement = "";
		//The ifis code checks if the register is NULL or not.
		if(code.rightOperand instanceof Type.Null){
			statement += store.getIndent() + "if("+store.getVar(code.operand)+" == NULL) { goto "+code.target+";}";
		}else{
			throw new RuntimeException("Not implemented!"+code);
		}		
		store.addStatement(code, statement);
	}
	/**
	 * Translate deference Wyil code into C code. Deference in C is to
	 * use '*' operator to get the value of lhs operand and assign it
	 * to rhs operand.     
	 * 
	 * For example, 
	 * <code>
	 * deref %16 = %0 : &[int]
	 * </code>
	 * can translate this into
	 * <code>
	 * _16 = *(_0);
	 * </code>
	 * 
	 * 
	 * @param code Dereference Wyil code
	 * @param function function
	 */
	@Override
	protected void translate(Dereference code, FunctionOrMethod function) {
		CodeStore store = this.getCodeStore(function);
		String statement = store.getIndent() +store.getVar(code.target())+" = *("+ store.getVar(code.operand(0))+");";
		//Check if the value in the rhs register is an array.
		if(code.type().element() instanceof Type.Array){
			//Assign the array size to lhs register
			statement += "\n" + store.getIndent() + store.getVar(code.target())+"_size = " 
					+ store.getVar(code.operand(0))+"_size;";
		}
		store.addStatement(code, statement);
	}
	
	/**
	 * Translate newobject Wyil code into C code. The newObject code creates a
	 * new object from the value of 'rhs' and assign the address of new object
	 * to 'lhs'.
	 * 
	 * For example, 
	 * <code>
	 * newobject %4 = %3 : &[void]
	 * </code>
	 * can translate this into
	 * <code>
	 * long long* _3_value = clone(_3, _3_size);
	 * _4 =(void**)&(_3_value);
	 * _4_size = _3_size;
	 * </code>
	 * 
	 * 
	 */
	@Override
	protected void translate(NewObject code, FunctionOrMethod function) {
		CodeStore store = this.getCodeStore(function);
		String statement = "";
		//Check that the given value is an array.
		if(code.type().element() instanceof Type.Array){
			String rhs = store.getVar(code.operand(0));
			Type rhs_type = store.getVarType(code.operand(0));
			//Get the value of rhs operand
			//long long* _3_value = clone(_3, _3_size);
			statement += store.getIndent() + translate(rhs_type)+ " " + rhs + "_value"
					+" = clone(" + rhs+", "+rhs+"_size);\n";
			// Get the address of rhs and assign it to lhs with type casting.
			String lhs = store.getVar(code.target());
			Type lhs_type = store.getVarType(code.target());
			//_4 =(void**)&(_3_value);
			statement += store.getIndent() + lhs +" = ("+ translate(lhs_type)+")"
			+"&("+rhs+"_value);\n";
			//Propagate array size from rhs to lhs
			statement += store.getIndent() + lhs +"_size = "+rhs+"_size;";	
		}else{
			throw new RuntimeException("Not implemented! "+code);
		}
		store.addStatement(code, statement);
	}

	/***
	 * Translate 'ListGenerator' wyil code into C code. For example, 
	 * 
	 * <code>
	 * listgen %69 = [66; 68] : int[]
	 * </code>
	 * can translate this into
	 * <code>
	 * _69 = genArray(_66, _68);
	 * _69_size = _68;
	 * </code>
	 * The array is initialized with '_66' and allocated with '_68' size.
	 */
	@Override
	protected void translate(ListGenerator code, FunctionOrMethod function) {
		CodeStore store = this.getCodeStore(function);
		// Call genArray function to generate the array
		String statement = store.getIndent() + store.getVar(code.target())+" = genArray(" + store.getVar(code.operand(0)) 
								+ ", " + store.getVar(code.operand(1))+");\n" ;
		// Assign array size.
		statement += store.getIndent() + store.getVar(code.target()) + "_size = " + store.getVar(code.operand(1)) + ";";
		store.addStatement(code, statement);
	}
}
