package wyopcl.translator.generator;

import static wycc.lang.SyntaxError.internalFailure;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import wycc.lang.SyntaxError;
import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.If;
import wyil.lang.Codes.Invariant;
import wyil.lang.Codes.ListOperator;
import wyil.lang.Codes.Loop;
import wyil.lang.Codes.NewRecord;
import wyil.lang.Codes.UnaryOperator;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.translator.Configuration;

/**
 * Takes a list of functional byte-code and converts it into C code.
 * 
 * @author Min-Hsien Weng
 *
 */
public class CodeGenerator {
	private final Configuration config;
	private final String prefix = "_";
	private final FunctionOrMethod functionOrMethod;
	private final VariableDeclarations var_declarations;
	private String indent = "\t";
	private String func_declaration;// function declaration.
	private LinkedHashMap<String, Type> vars;// stores the variable declaration
												// and preserve the insertion
												// orders of variables.
	private List<String> statements;// store the list of translated C code.
	private Codes.BinaryOperator range;// indicate the range that forall loop
										// iterates over.

	private List<String> input_params;// Store all the names of input
										// parameters.
	private Collection<wyil.lang.WyilFile.Type> userTypes;// Store all the
															// user-defined
															// types, e.g.
															// Board.

	/**
	 * Constructor
	 * 
	 * @param config
	 * @param functionOrMethod
	 */
	public CodeGenerator(Configuration config, FunctionOrMethod functionOrMethod, Collection<wyil.lang.WyilFile.Type> userTypes) {
		this.config = config;
		this.functionOrMethod = functionOrMethod;
		this.var_declarations = this.functionOrMethod.attribute(VariableDeclarations.class);
		this.vars = new LinkedHashMap<String, Type>();
		this.statements = new ArrayList<String>();
		this.input_params = new ArrayList<String>();
		this.userTypes = userTypes;
	}

	/**
	 * Iterates over the list of byte-code to generate the corresponding C code.
	 * 
	 * @param code_blk
	 * @param func_name
	 */
	public void iterateOverCodeBlock(List<Code> code_blk) {

		int line = 0;
		for (Code code : code_blk) {
			// Get the Block.Entry
			if (config.isVerbose()) {
				line = printWyILCode(code, line);
			}
			dispatch(code);
		}
	}

	/**
	 * Prints out each bytecode with the line number and the correct
	 * indentation.
	 * 
	 * @param name
	 * @param line
	 */
	private int printWyILCode(Code code, int line) {
		// Print out the bytecode using the format (e.g. 'main.9 [const %12 =
		// 2345 : int]')
		if (code instanceof Codes.Label) {
			System.out.println(this.functionOrMethod.name() + "." + line + " [" + code + "]");
		} else {
			System.out.println(this.functionOrMethod.name() + "." + line + " [\t" + code + "]");
		}
		return ++line;
	}

	/**
	 * Adds the type declaration for a variable. But serveral types are not
	 * added to the table. For example,
	 * 
	 * <pre>
	 * <code>
	 * method(any) -> void
	 * </code>
	 * </pre>
	 * 
	 * @param type
	 *            the Whiley type
	 * @param var
	 *            the name of variable
	 */
	private void addDeclaration(Type type, String var) {
		// Check if the type is a record and its field contains "println" .
		if (type instanceof Type.Record) {
			Type.Record record = (Type.Record) type;
			// Add the record type to the list
			// if(!this.record_types.contains(record)){
			// this.record_types.add(record);
			// }

			// If so, then the record loads the "println" from the
			// sys.out.console.
			// At this stage, we dont use this record.
			if (record.field("println") != null) {
				return;
			}
		}

		if (type instanceof Type.Method) {
			return;
		}

		if (type instanceof Type.List) {
			vars.put(var, type);
			// add the additional parameter 'reg_size' to indicate the array
			// size.
			vars.put(var + "_size", Type.Int.T_INT);
		} else {
			vars.put(var, type);
		}
	}

	/**
	 * Get the variable declaration of the given operand.
	 * 
	 * @param var
	 * @return Type declaration. Otherwise, return null;
	 */
	private Type getVarDeclaration(String var) {
		if (vars.containsKey(var)) {
			return vars.get(var);
		}
		return null;
	}

	/**
	 * Get the variable name of the given register
	 * 
	 * @param reg
	 *            the register
	 * @return the variable name (starting with "_")
	 */
	private String getVarName(int reg) {
		// Check if the register has been kept in the functional variable
		// declarations.
		if (reg < var_declarations.size()) {
			Declaration declaration = var_declarations.get(reg);
			if (declaration != null) {
				String name = declaration.name();
				if (name != null && !name.isEmpty()) {
					return prefix + name;
				}
			}
		}
		return prefix + reg;
	}

	/**
	 * Get the type of a variable.
	 * 
	 * @param reg
	 * @return
	 */
	private Type getVarType(int reg) {
		return vars.get(getVarName(reg));
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
	 * Adds the statement to the list and print out the statement if the verbose
	 * option is on.
	 * 
	 * @param code
	 *            the WyIL code
	 * @param stat
	 *            the C code
	 */
	private void addStatement(Code code, String stat) {
		// Add the WyIL code as a comment
		if (code != null) {
			if (code instanceof Codes.Label) {
				// No indentation for label bytecode
				statements.add("//" + code.toString());
			} else {
				statements.add(indent + "//" + code.toString());
			}

		}
		// Add the translated statement.
		if (stat != null) {
			if (config.isVerbose()) {
				System.out.println(stat);
			}
			statements.add(stat);
		}
	}

	/**
	 * Translates the function or method declaration (e.g.
	 * <code>int* play(int* _0, int _0_size){</code>)
	 * 
	 * @param functionOrMethod
	 *            the code block of a function
	 * @return func_declartion the function signature.
	 */
	public String declareFunction() {
		// Get the name
		String name = functionOrMethod.name();
		if (name.equals("main")) {
			func_declaration = "int main(int argc, char** argv)";
		} else {
			func_declaration = "";
			// Get the type info
			wyil.lang.Type.FunctionOrMethod type = functionOrMethod.type();
			// Get the return type
			func_declaration += translate(type.ret()) + " ";
			func_declaration += name + "(";
			boolean isfirst = true;
			int register = 0;
			for (Type param : type.params()) {
				if (isfirst) {
					func_declaration += translate(param);
				} else {
					func_declaration += ", " + translate(param);
				}
				String var = getVarName(register);
				// Add the variable names
				func_declaration += " " + var;
				// If the variable is an array, then add the extra 'size'
				// variable.
				if (param instanceof Type.List) {
					String var_size = var + "_size";
					func_declaration += ", long long " + var_size;
				}
				isfirst = false;
				register++;
			}
			func_declaration += ")";
		}

		if (config.isVerbose()) {
			System.out.println(func_declaration);
		}
		return func_declaration;
	}

	/**
	 * Local variables are defined and initialized with values at the top of the
	 * code block.
	 */
	public void declareVariables() {

		// Get the input parameters.
		for (int reg = 0; reg < functionOrMethod.type().params().size(); reg++) {
			this.input_params.add(prefix + this.var_declarations.get(reg).name());
		}

		// Iterate over the list of registers.
		for (int reg = 0; reg < var_declarations.size(); reg++) {
			Declaration declaration = var_declarations.get(reg);
			// Get the variable name.
			String name = getVarName(reg);
			addDeclaration(declaration.type(), name);
		}
	}

	/**
	 * Increase the indentation.
	 */
	private void increaseIndent() {
		this.indent += "\t";
	}

	/**
	 * Decrease the indentation.
	 */
	private void decreaseIndent() {
		this.indent = this.indent.replaceFirst("\t", "");
	}

	/**
	 * Given a variable name, check if it is the size variable of input
	 * parameter. For example,
	 * 
	 * <pre>
	 * <code>
	 * long long* reverse(long long* _ls, long long _ls_size)
	 * </code>
	 * </pre>
	 * 
	 * The '_ls_size' variable is the size variable of input parameter 'ls'.
	 * 
	 * @param var_name
	 * @return true if the variable is the size variable of input parameter.
	 * 
	 */
	private Boolean isInputParameter(String var_name) {
		// Check if the variable is the size variable of the input
		// parameter.
		String variable_name = var_name;
		if (variable_name.contains("_size")) {
			// Get the array variable.
			String[] split = variable_name.split("_size");
			// Check if the split variable name has at least two items.
			if (split.length >= 1) {
				variable_name = split[0];
			}
		}
		// Check if the variable_name is an number.
		// If so, the variable is an intermediate variable. Otherwise, it could
		// be an input parameter.
		if (!variable_name.isEmpty() && !(variable_name.matches("^_[0-9]+$"))) {
			// Check if the input parameter contains the variable name.
			return this.input_params.contains(variable_name);
		}

		return false;
	}

	/**
	 * Write out the generated C code, which starts with variable declarations,
	 * followed by a list of statements and a list of free statements at the
	 * end.
	 * 
	 * @param writer
	 */
	public void writeCodeToFile(PrintWriter writer) {
		// function declaration
		writer.println(func_declaration + "{");
		// Variable declaration with initial values.
		for (Entry<String, Type> var : vars.entrySet()) {
			// If the register is not an input.
			String var_name = var.getKey();
			// Check if the variable is the size variable of the input
			// parameter.
			if (!isInputParameter(var_name)) {
				// Type declaration and initial value assignment.
				Type var_type = var.getValue();
				// Assign the initial values for local variables.
				String init = indent + translate(var_type) + " " + var_name;
				if (var_type instanceof Type.List) {
					init += " = NULL";
				} else if (var_type instanceof Type.Int) {
					init += " = 0";
				}
				init += ";";
				// Write out the variable declaration.
				writer.println(init);
			}

		}
		// Statments
		for (String stat : statements) {
			writer.println(stat.toString());
		}
		// Ending clause
		writer.println("}");
		// clear vars
		vars.clear();
		// Clear statements
		statements.clear();
		// Reset the indent
		indent = "\t";
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
	private void translate(Codes.Const code) {
		String stat = null;
		String target = getVarName(code.target());
		if (code.assignedType() instanceof Type.List) {
			Constant.List list = (Constant.List) code.constant;
			// Initialize an array
			if (list.values.isEmpty()) {
				stat = indent + target + "=(long long*)malloc(1*sizeof(long long));\n";
				stat += indent + "if(" + target + " == NULL) {fprintf(stderr,\"fail to malloc\"); exit(0);}\n";
				stat += indent + target + "_size = 0;";
			}
		} else {
			// Add a statement
			stat = indent + target + " = " + code.constant + ";";
		}

		addStatement(code, stat);
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
	 * </code></pre> Note that the operand needs the type casting.
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
	 * @param code
	 */
	private void translate(Codes.Assign code) {
		String target = getVarName(code.target());
		String op = getVarName(code.operand(0));
		String statement = "";

		if (code.type() instanceof Type.List) {
			// Check if the assigned type is an array. If so, use different way
			// to copy the array.
			String target_size = target + "_size";
			// long long _11_size;
			addDeclaration(Type.Int.T_INT, target_size);
			// Check if the op is the input parameters or not.
			if (isInputParameter(op)) {
				// If so, then the operand is cloned and
				// _4 = clone(_0, _0_size);
				statement = indent + target + " = clone(" + op + ", " + op + "_size);\n";
			} else {
				// _2 = (long long*)_3;
				statement = indent + target + " = (" + translate(getVarType(code.target())) + ")" + op + ";\n";
			}
			// _1_size = _10_size;
			statement += indent + target_size + " = " + op + "_size;";
		} else {
			statement = indent + target + " = " + op + ";";
		}
		// Add the statement to the list of statements.
		addStatement(code, statement);
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
	private void translate(Codes.LengthOf code) {
		String stat = indent + getVarName(code.target()) + " = " + getVarName(code.operand(0)) + "_size;";
		addStatement(code, stat);
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
	private void translate(Codes.BinaryOperator code) {
		Type type = code.type();
		String target = getVarName(code.target());
		String left = getVarName(code.operand(0));
		String right = getVarName(code.operand(1));
		// vars.put(target, CodeGeneratorHelper.translate(type));
		addDeclaration(type, target);
		String stat = indent;
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
		case RANGE:
			// Assign the range with input code for the translation of 'forall'
			// byte-code.
			this.range = code;
			stat = null;
			break;
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
		addStatement(code, stat);
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
	 * _12=reverse(_xs , _xs_size);
	 * </code>
	 * </pre>
	 * 
	 * TODO The size of the returned list requires the symbolic analysis.
	 * 
	 * @param code
	 */
	private void translate(Codes.Invoke code) {
		String stat = "";
		String ret = getVarName(code.target());
		Type return_type = code.type().ret();
		// Assign both of lists to have the same array size, e.g.
		// '_12_size=_xs_size;'
		// Check if the return is also an array.
		if (return_type instanceof Type.List) {
			for (int index = 0; index < code.operands().length; index++) {
				Type type = code.type().params().get(index);
				if (type instanceof Type.List) {
					stat += indent + (ret + "_size") + "=" + getVarName(code.operand(index)) + "_size;\n";
				}
			}
		}
		//
		stat += indent + ret + "=" + code.name.name() + "(";
		// Translate the input parameters of called function, e.g.
		// '_12=reverse(_xs , _xs_size);'
		boolean isFirst = true;
		for (int index = 0; index < code.operands().length; index++) {
			String param = getVarName(code.operand(index));
			if (!isFirst) {
				stat += " ,";
			}
			stat += param;
			// Add the '*_size' parameter
			Type paramType = (Type) code.type().params().get(index);
			if (paramType instanceof Type.List) {
				stat += " , " + param + "_size";
			}
			isFirst = false;
		}
		stat += ");";
		// add the statement
		addStatement(code, stat);
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
	private void translate(Codes.If code) {
		String statement = indent;
		String left = getVarName(code.leftOperand);
		String right = getVarName(code.rightOperand);

		statement += "if(" + left;
		// The condition
		statement += translate(code.op, false);
		statement += right;
		statement += "){";
		statement += "goto " + code.target + ";";
		statement += "}";

		addStatement(code, statement);
	}

	/**
	 * Translates the <code>Codes.AssertOrAssume</code> byte-code. This function
	 * iterates over the list of byte-code in each assertion or assumption and
	 * translated each byte-code. The translated C code is surrounded by two
	 * brackets ('{' and '}') with an indentation.
	 * 
	 * @param code
	 */
	private void translate(Codes.AssertOrAssume code) {
		// Add the starting clause for the assertion
		addStatement(code, indent + "{");
		// Increase the indent
		this.increaseIndent();
		iterateOverCodeBlock(code.bytecodes());
		this.decreaseIndent();
		addStatement(code, indent + "}");

	}

	private void translate(Codes.Goto code) {
		String stat = indent;
		stat += "goto " + code.target + ";";
		addStatement(code, stat);
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
	private void translate(Codes.Label code) {
		addStatement(code, code.label + ":;");
	}

	/**
	 * Prints out the message and Generates the stderr, followed by exit
	 * 
	 * @param code
	 */
	private void translate(Codes.Fail code) {
		String stat = indent + "fprintf(stderr,\"" + code + "\");\n";
		stat += indent + "exit(0);";
		addStatement(code, stat);
	}

	private void translate(Codes.Update code) {
		String stat = indent;
		// For List type only
		if (code.type() instanceof Type.List) {
			stat += getVarName(code.target()) + "[" + getVarName(code.operand(0)) + "] = " + getVarName(code.result()) + ";";
			addStatement(code, stat);
		}
	}

	private void translate(Codes.Nop code) {
		// Do nothing
		String stat = indent + ";";
		addStatement(code, stat);
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
	private void translate(Codes.Return code) {
		String statement = indent;
		if (code.operand != -1) {
			// Translate the Return code.
			statement += "return " + getVarName(code.operand) + ";";
		} else {
			// If operand == -1, then add a simple empty code.
			statement += ";";
		}
		addStatement(code, statement);
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
	private void translate(Codes.IndexOf code) {
		// EffectiveIndexible type = code.type();
		String stat = indent + getVarName(code.target()) + "=" + getVarName(code.operand(0)) + "[" + getVarName(code.operand(1)) + "];";
		addStatement(code, stat);
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
	private void translate(Codes.NewList code) {
		String target = getVarName(code.target());
		// Add the 'target_size' variable to indicate the length of the list
		String target_size = target + "_size";
		// Add the declaration of target_size variable.
		addDeclaration(Type.Int.T_INT, target_size);
		// Assign the array size with the number of operands.
		String stat = indent + target_size + " = " + code.operands().length + ";\n";
		// Check if the size of input operand > 0.
		if (code.operands().length > 0) {
			// Allocate the target with array size.
			stat += indent + target + " = (" + translate(code.type().element()) + "*)malloc(" + target_size + "*sizeof("
					+ translate(code.type().element()) + "));\n";
			// Initialize the array.
			int index = 0;
			for (int operand : code.operands()) {
				stat += indent + target + "[" + index + "] = " + getVarName(operand) + ";";
				index++;
			}
			addStatement(code, stat);
		} else {
			// Translates the empty list, e.g. 'newlist %3 = () : [void]' can be
			// converted into '_3 = malloc(0);'.
			stat += indent + target + " = malloc(" + target_size + ");";
			addStatement(code, stat);
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
	 * 
	 * Note that at this stage, the field load code that loads
	 * <code>System.out.println</code> is not translated into any C code.
	 * 
	 * @param code
	 * @throws Exception
	 */
	private void translate(Codes.FieldLoad code) throws Exception {
		/*
		 * Type param = params.get(code.operand(0)); if(param != null){ if(param
		 * instanceof Type.Record){ Type.Record record = (Type.Record) param;
		 * Type fieldType = record.field(code.field); } }
		 */
		String field = code.field;
		if (field.equals("out") || field.equals("println")) {
			addStatement(code, null);
		} else {
			// Get the target
			String statement = indent + getVarName(code.target()) + " = " + getVarName(code.operand(0)) + "." + code.field + ";";
			addStatement(code, statement);
		}
	}

	/**
	 * TODO: Not implemented.
	 * 
	 * @param code
	 */
	private void translate(Codes.Convert code) {
		// Converts Constant to Any type
		if (code.result instanceof Type.Any) {
			// sym_ctrl.putAttribute(prefix+code.operand(0), "type",
			// code.type());
			// Do nothing.
		}
		addStatement(code, null);
	}

	/**
	 * Based on the variable type, print out the variable by using different
	 * indirect invoked 'printf' functions.
	 * 
	 * @param type
	 * @param var
	 * @return the translated statement.
	 */
	private String translateIndirectInvokePrintf(Type type, String var) {
		String statement = "";
		if (type instanceof Type.List) {
			//Print out a pointer without specifying array size.
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
				statement += translateIndirectInvokePrintf(field.getValue(), var + "." + field.getKey());
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
	private void translate(Codes.IndirectInvoke code) {
		String statement = "";
		if (code.type() instanceof Type.FunctionOrMethod) {
			String var = getVarName(code.parameter(0));
			// Get input type
			// Type type = code.type().params().get(0);
			Type type = getVarDeclaration(var);
			// Check if the type is a user-defined type.
			if (type instanceof Type.Nominal) {
				Type.Nominal nominal = (Type.Nominal) type;
				wyil.lang.WyilFile.Type user_type = getUserDefinedType(nominal.name().name());
				statement += translateIndirectInvokePrintf(user_type.type(), var);
			} else if (type instanceof Type.List) {
				// Added the additional 'array_size' variable to indicate the
				// length of an array.
				// Due to strictly forbidding the overlapping in C, the function
				// is named differently.
				statement += indent + "indirect_printf_array(" + var + ", "+ var +"_size);\n";
			} else {
				statement += translateIndirectInvokePrintf(type, var);
			}
		}
		addStatement(code, statement);
	}

	private void translate(UnaryOperator code) {
		String target = prefix + code.target();
		// vars.put(target, CodeGeneratorHelper.translate(code.type()));
		addDeclaration(code.type(), target);
		String stat = indent + target + "= -" + prefix + code.operand(0) + ";";
		addStatement(code, stat);
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
	 * <pre><code>
	 * while(_i<_limit){
	 * 	
	 * @param loop_cond
	 */
	private void translateLoopHeader(Codes.If loop_cond) {
		String statement = indent;
		String left = getVarName(loop_cond.leftOperand);
		String right = getVarName(loop_cond.rightOperand);
		statement += "while(" + left;
		// The negated operator
		statement += translate(loop_cond.op, true);
		statement += right;
		statement += "){\n";
		// Increase the indent
		increaseIndent();
		addStatement(loop_cond, statement);
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
	private void translate(Codes.ForAll code) {
		String loop_var = getVarName(code.indexOperand);
		String lower_bound = getVarName(range.operand(0));
		String upper_bound = getVarName(range.operand(1));
		// Construct the loop header.
		String statement = indent + "for(" + loop_var + "=" + lower_bound + "; " + loop_var + "<" + upper_bound + "; " + loop_var + "++){";
		addStatement(code, statement);
		// Increase the indentation
		this.increaseIndent();
		// Get the code block inside the forall loop.
		List<Code> code_blk = code.bytecodes();
		// Translate each byte-code and output each generated code.
		this.iterateOverCodeBlock(code_blk);
		this.decreaseIndent();
		statement = indent + "}";
		addStatement(null, statement);// Ending bracket of the forall loop.
		// Nullify the range.
		this.range = null;

	}

	/**
	 * Iterate over the list of loop byte-code and translate each code into C
	 * code. To separate the bytecode inside a loop from the main byte-code, the
	 * loop flag is enabled and the indentation is increased.
	 * 
	 * @param code
	 */
	private void translate(Loop code) {
		// Increase the indentation.
		this.increaseIndent();
		List<Code> loop_body = new ArrayList<Code>();
		Codes.Invariant loop_invariant = null;
		Codes.If loop_condition = null;
		// Reorder the sequence of loop code and put the loop invariant next to
		// loop condition.
		for (Code loop_code : code.bytecodes()) {
			// Get the loop invariant
			if (loop_code instanceof Invariant) {
				loop_invariant = (Invariant) loop_code;
			} else {
				if (loop_code instanceof Codes.If && loop_condition == null) {
					loop_condition = (If) loop_code;
				} else {
					loop_body.add(loop_code);
				}
			}
		}
		translateLoopHeader(loop_condition);
		translate(loop_invariant);
		iterateOverCodeBlock(loop_body);
		// Decrease the indentation.
		this.decreaseIndent();
		// Add the ending bracket.
		addStatement(null, indent + "}");
	}

	/**
	 * private void translate(StringOperator code) { String stat = ""; String
	 * target = prefix+code.target(); //vars.put(target+"[1024]", "char");
	 * addDeclaration(code.type(), target);
	 * 
	 * String left = prefix+code.operand(0); String right =
	 * prefix+code.operand(1);
	 * 
	 * //Check the operator switch (code.kind){ case APPEND: stat += indent +
	 * "strcpy("+target+", "+left+");\n"; stat += indent +
	 * "strcat("+target+", "+right+"_str);"; break; case LEFT_APPEND:
	 * 
	 * break; case RIGHT_APPEND:
	 * 
	 * default: break; } addStatement(code, stat); }
	 **/

	/**
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
	private void translate(ListOperator code) {
		String target = getVarName(code.target());
		// long long _10_size;
		addDeclaration(Type.Int.T_INT, target + "_size");

		// _13_size = _2_size+_12_size;//new array size
		String stat = indent + target + "_size = ";
		boolean isFirst = true;
		for (int operand : code.operands()) {
			String op = getVarName(operand);
			if (!isFirst) {
				// Add '+' operator before the 'size' variable.
				stat += "+";
			}
			stat += op + "_size";
			isFirst = false;
		}
		stat += ";\n";
		// Calls the append function. For example, _13=append(_2, &_2_size, _12,
		// &_12_size, &_13_size);
		stat += indent + target + "=append(";
		isFirst = true;
		for (int operand : code.operands()) {
			String op = getVarName(operand);
			if (!isFirst) {
				// Add ',' to separate the arguments.
				stat += ", ";
			}
			stat += op + ", &" + op + "_size";
			isFirst = false;
		}
		// Put the target's array size at the end of the input parameters.
		stat += ", &" + target + "_size";
		stat += ");\n";

		// Free the op_2, because op_2 has been appended to the op_1.
		stat += indent + "free(" + getVarName(code.operand(1)) + ");";

		// Put it to the statement list.
		addStatement(code, stat);
	}

	/**
	 * Translate the WyIL type into the type in C.
	 * 
	 * @param type
	 *            the WyIL type
	 * @return the result string TODO Generalize the user-defined types, such as
	 *         'Board'.
	 * 
	 */
	private String translate(Type type) {
		// The existential type, e.g. function EmptyBoard() -> (Board r)
		// The return type of 'EmptyBoard' function is 'Board'.
		if (type instanceof Type.Nominal) {
			Type.Nominal nomial = (Type.Nominal) type;
			return nomial.name().name();
		}

		if (type instanceof Type.Int || type instanceof Type.Bool) {
			return "long long";
		}

		if (type instanceof Type.List) {
			Type.List listType = (Type.List) type;
			return translate(listType.element()) + "*";
		}

		if (type instanceof Type.Void) {
			return "void";
		}

		if (type instanceof Type.Record) {
			Type.Record record = (Type.Record) type;
			HashMap<String, Type> fields = record.fields();
			if (fields.containsKey("args")) {
				return "int argc, char** argv";
			}
			// Check if the type is an instance of user defined type.
			wyil.lang.WyilFile.Type userDefinedType = getUserDefinedType((Type.Record) type);
			if (userDefinedType != null) {
				return userDefinedType.name();
			}
		}

		return null;
	}

	/**
	 * Checks the type of the wyil code and dispatches the code to the analyzer
	 * for being executed by the <code>analyze(code)</code>
	 * 
	 * @param entry
	 */
	private void dispatch(Code code) {
		try {
			// enable the assertion
			if (code instanceof Codes.AssertOrAssume) {
				translate((Codes.AssertOrAssume) code);
			} else if (code instanceof Codes.Assign) {
				translate((Codes.Assign) code);
			} else if (code instanceof Codes.BinaryOperator) {
				translate((Codes.BinaryOperator) code);
			} else if (code instanceof Codes.Convert) {
				translate((Codes.Convert) code);
			} else if (code instanceof Codes.Const) {
				translate((Codes.Const) code);
			} else if (code instanceof Codes.Debug) {
				internalFailure("Not implemented!", code.toString(), null);
			} else if (code instanceof Codes.Dereference) {
				internalFailure("Not implemented!", code.toString(), null);
			} else if (code instanceof Codes.Fail) {
				translate((Codes.Fail) code);
			} else if (code instanceof Codes.FieldLoad) {
				translate((Codes.FieldLoad) code);
			} else if (code instanceof Codes.ForAll) {
				translate((Codes.ForAll) code);
			} else if (code instanceof Codes.Goto) {
				translate((Codes.Goto) code);
			} else if (code instanceof Codes.If) {
				translate((Codes.If) code);
			} else if (code instanceof Codes.IfIs) {
				internalFailure("Not implemented!", code.toString(), null);
			} else if (code instanceof Codes.IndexOf) {
				translate((Codes.IndexOf) code);
			} else if (code instanceof Codes.IndirectInvoke) {
				translate((Codes.IndirectInvoke) code);
			} else if (code instanceof Codes.Invoke) {
				translate((Codes.Invoke) code);
			} else if (code instanceof Codes.Invert) {
				internalFailure("Not implemented!", code.toString(), null);
			} else if (code instanceof Codes.ListOperator) {
				translate((Codes.ListOperator) code);
			} else if (code instanceof Codes.Loop) {
				translate((Codes.Loop) code);
			} else if (code instanceof Codes.Label) {
				translate((Codes.Label) code);
			} else if (code instanceof Codes.Lambda) {
				internalFailure("Not implemented!", code.toString(), null);
			} else if (code instanceof Codes.LengthOf) {
				translate((Codes.LengthOf) code);
			} else if (code instanceof Codes.Move) {
				internalFailure("Not implemented!", code.toString(), null);
			} else if (code instanceof Codes.NewMap) {
				internalFailure("Not implemented!", code.toString(), null);
			} else if (code instanceof Codes.NewList) {
				translate((Codes.NewList) code);
			} else if (code instanceof Codes.NewRecord) {
				translate((Codes.NewRecord) code);
			} else if (code instanceof Codes.NewSet) {
				internalFailure("Not implemented!", code.toString(), null);
			} else if (code instanceof Codes.NewTuple) {
				internalFailure("Not implemented!", code.toString(), null);
			} else if (code instanceof Codes.Return) {
				translate((Codes.Return) code);
			} else if (code instanceof Codes.NewObject) {
				internalFailure("Not implemented!", code.toString(), null);
			} else if (code instanceof Codes.Nop) {
				translate((Codes.Nop) code);
			} else if (code instanceof Codes.SetOperator) {
				internalFailure("Not implemented!", code.toString(), null);
			} else if (code instanceof Codes.SubList) {
				internalFailure("Not implemented!", code.toString(), null);
			} else if (code instanceof Codes.Switch) {
				internalFailure("Not implemented!", code.toString(), null);
			} else if (code instanceof Codes.TupleLoad) {
				internalFailure("Not implemented!", code.toString(), null);
			} else if (code instanceof Codes.UnaryOperator) {
				translate((Codes.UnaryOperator) code);
			} else if (code instanceof Codes.Update) {
				translate((Codes.Update) code);
			} else {
				internalFailure("unknown wyil code encountered (" + code + ")", "", null);
			}

		} catch (SyntaxError ex) {
			throw ex;
		} catch (Exception ex) {
			internalFailure(ex.getMessage(), "", null, ex);
		}

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
	private void translate(NewRecord code) {
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
			statement += indent + getVarName(newrecord.target()) + "." + field.getKey() + " = " + getVarName(newrecord.operand(index)) + ";\n";
		}
		addStatement(code, statement);
	}

}
