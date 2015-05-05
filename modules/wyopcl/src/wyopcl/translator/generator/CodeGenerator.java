package wyopcl.translator.generator;

import static wycc.lang.SyntaxError.internalFailure;

import java.io.PrintWriter;
import java.util.ArrayList;
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

	/**
	 * Constructor
	 * 
	 * @param config
	 * @param functionOrMethod
	 */
	public CodeGenerator(Configuration config, FunctionOrMethod functionOrMethod) {
		this.config = config;
		this.functionOrMethod = functionOrMethod;
		this.var_declarations = this.functionOrMethod.attribute(VariableDeclarations.class);
		this.vars = new LinkedHashMap<String, Type>();
		this.statements = new ArrayList<String>();
	}

	/**
	 * Add the statements about iterations.
	 */
	/*
	 * private void addStartingIteration(String func_name, Code code){ // Adds
	 * the timer to measure the starting time at the main method
	 * if(func_name.equals("main")&& code instanceof Codes.Invoke){ //Get the
	 * invoke code Codes.Invoke invoked = (Codes.Invoke)code;
	 * if(invoked.name.name().equals("reverse")){ //Add the number of iteration
	 * vars.put("iteration", Type.Int.T_INT); //Add variable declaration
	 * vars.put("start", "clock_t"); vars.put("end", "clock_t");
	 * vars.put("diff", "double"); //Add a file pointer vars.put("*fp", "FILE");
	 * statements.add(indent + "diff=0;"); //Initial the return value
	 * statements.add(indent +prefix+invoked.target()+"=NULL;"); //Use the
	 * for-loop to repeatedly execute the function. statements.add(indent +
	 * "for(iteration=0;iteration<10;iteration++){"); increaseIndent(); //Add
	 * the starting timer statements.add(indent + "start = clock();"); //check
	 * if the return reg is null. If so, nullify it. statements.add(indent
	 * +"if("+prefix+invoked.target()+
	 * "!= NULL){ free("+prefix+invoked.target()+");}"); } } }
	 */
	/**
	 * Adds a block of code to free any variable whose type is a list as the
	 * array in C is allocated by malloc.
	 */
	private void free_varaibles() {
		// Iterate the variables and adds statements to free the list variables.
		for (Map.Entry<String, Type> var : vars.entrySet()) {
			// Get variable name
			String var_name = var.getKey();
			Type type = var.getValue();
			// Check if the type is an array (pointer of pointer).
			if (type != null && type instanceof Type.List) {
				// Free the variable.
				statements.add(indent + "free(" + var_name + ");");
			}
		}
	}

	/*
	*//**
	 * Adds the ending timer and calculate the execution time
	 * 
	 * @param func_name
	 */
	/*
	 * private void addEndingIteration(String func_name, Code code){ //Adds the
	 * ending time and calculate and print out the execution time
	 * if(func_name.equals("main") && code instanceof Codes.Invoke){
	 * Codes.Invoke invoked = (Codes.Invoke)code;
	 * if(invoked.name.name().equals("reverse")){ //Add the ending timer
	 * statements.add(indent + "end = clock();"); //Print out . //Create a file
	 * statements.add(indent + "fp= fopen(\"result.txt\", \"a\");"); //Write out
	 * the execution time of each iteration to the txt file. //This is
	 * hard-coded statements.add(indent + "fprintf(fp, \"Array size:%lld\\t" +
	 * "Execution time of reverse function(seconds):%.10lf\\n\"" +
	 * ", _4, ((double)(end - start))/CLOCKS_PER_SEC);"); //Close the txt file
	 * statements.add(indent+"fclose(fp);"); statements.add(indent +
	 * "diff += end - start;"); decreaseIndent(); //The end of iteration
	 * while-loop. statements.add(indent + "}"); statements.add(indent +
	 * "printf(\"Execution time:%.10lf seconds\", diff/(CLOCKS_PER_SEC*iteration));"
	 * ); } } }
	 */

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
	 * Check if the register is an input parameter of the function.
	 * 
	 * @param reg
	 * @return
	 */
	private boolean isInputParameter(int reg) {
		// Check if the register number is less than the input parameter sizes.
		// If so, then the register is an input.
		if (reg < this.functionOrMethod.type().params().size()) {
			return true;
		}
		return false;
	}

	/**
	 * Get the variable name of the given register
	 * 
	 * @param reg
	 *            the register
	 * @return the variable name (starting with "_x")
	 */
	private String getVarName(int reg) {
		Declaration declaration = var_declarations.get(reg);
		if (declaration != null) {
			String name = declaration.name();
			if (name != null && !name.isEmpty()) {
				return prefix + name;
			}
		}
		return prefix + reg;
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
	 * Given a variable name, check if it is the size variable of input parameter. For example,
	 * <pre><code>
	 * long long* reverse(long long* _ls, long long _ls_size)
	 * </code></pre>
	 * The '_ls_size' variable is the size variable of input parameter 'ls'. 
	 * 
	 * @param var_name
	 * @return true if the variable is the size variable of input parameter. 
	 * 
	 */
	private Boolean isInputParameterSize(String var_name){
		// Check if the variable is the size variable of the input
		// parameter.
		if (var_name.contains("_size")){
			//Get the array variable. 
			String array_var = var_name.split("_size")[0];
			//Check if the array variable is an number. 
			//If so, the variable is an intermediate variable. Otherwise, it could be an input parameter.
			if(!(array_var.matches("^_[0-9]+$"))){
				//check if the array var matches with the variable at index of 0, which is the input paramter.
				if(array_var.equals("_"+this.var_declarations.get(0).name())){
					return true;
				}
			}
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
		int reg = 0;
		for (Entry<String, Type> var : vars.entrySet()) {
			// If the register is not an input.
			if (!isInputParameter(reg)) {
				String var_name = var.getKey();
				// Check if the variable is the size variable of the input
				// parameter.
				if (!isInputParameterSize(var_name)) {
					//Type declaration and initial value assignment.
					Type var_type = var.getValue();
					// Assign the initial values for local variables.
					String init = "";
					if (var_type instanceof Type.List) {
						init = "NULL";
					} else if (var_type instanceof Type.Int) {
						init = "0";
					}
					// Write out the variable declaration.
					writer.println("\t" + translate(var_type) + " " + var_name + " = " + init + ";");
				}
			}
			// increment the register.
			reg++;
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
	 * assign %5 = %6  : int
	 * </code>
	 * </pre>
	 * 
	 * can be translated into:
	 * <p>
	 * <code>
	 * _5 = _6;
	 * </code></pre> When we need to assign the input parameter(_0) to the new
	 * register, we need to clone the input and return the result pointer. For
	 * example,
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
		// Check if the assigned type is an array. If so, we use different way
		// to copy the array.
		if (code.type() instanceof Type.List) {
			String target_size = target + "_size";
			// long long _11_size;
			addDeclaration(Type.Int.T_INT, target_size);
			// Check if the op is the input parameters or not.
			if (isInputParameter(code.operand(0))) {
				// If so, then the operand is cloned and
				// _4 = clone(_0, _0_size);
				statement = indent + target + " = clone(" + op + ", " + op + "_size);\n";
			} else {
				// _1 = _10;
				statement = indent + target + " = " + op + ";\n";
			}
			// _1_size = _10_size;
			statement += indent + target_size + " = " + op + "_size;";
		} else if (code.type() instanceof Type.Int) {
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
		/*
		 * //Check if the label is equal to assert_label
		 * if(assert_labels.contains(code.label)){ //pop up the label from the
		 * stack. assert_labels.pop(); decreaseIndent(); //Ending clause.
		 * addStatement(null, indent+"}"); }
		 */
		addStatement(code, code.label + ":");
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
			stat += prefix + code.target() + "[" + prefix + code.operand(0) + "] = " + prefix + code.result() + ";";
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
	 * _6_size=0;
	 * _6 = NULL;
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

		Type elem_type = code.type().element();
		// Check if the element type is a void, which cannot hold any value.
		if (elem_type instanceof Type.Void) {
			// Change the element type to an integer type.
			elem_type = Type.Int.T_INT;
			// Construct a list type of integer element type.
			wyil.lang.Type list_type = Type.List(Type.Int.T_INT, false);
			// Update the type of target variable.
			addDeclaration(list_type, target);
		}

		// Add the 'target_size' variable to indicate the length of the list
		String target_size = target + "_size";
		// Add the declaration of target_size variable.
		addDeclaration(Type.Int.T_INT, target_size);

		// Check if the size of input operand is 0.
		if (code.operands().length != 0) {
			// Assign the array size with the number of operands.
			String stat = indent + target_size + "=" + code.operands().length + ";\n";
			// Allocate the target with array size.
			stat += indent + target + "=(" + translate(elem_type) + "*)malloc(" + target_size + "*sizeof(" + translate(elem_type) + "));\n";
			// Initialize the array.
			int index = 0;
			for (int operand : code.operands()) {
				stat += indent + target + "[" + index + "]=" + getVarName(operand) + ";";
				index++;
			}
			addStatement(code, stat);
		} else {
			addStatement(code, null);
		}

	}

	/**
	 * Translates FieldLoad byte-code into C code. At this stage, the field load
	 * code that loads <code>System.out.println</code> is not translated into
	 * any C code.
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
			throw new Exception("Not implemented!");
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
	 * @param code
	 *            Codes.IndirectInvoke byte-code
	 * 
	 */
	private void translate(Codes.IndirectInvoke code) {
		String statement = "";
		if (code.type() instanceof Type.FunctionOrMethod) {
			String var = getVarName(code.parameter(0));
			// Get input type
			Type type = getVarDeclaration(var);
			if (type instanceof Type.List) {
				// Added the additional 'array_size' variable to indicate the
				// length of an array.
				// Due to strictly forbidding the overlapping in C, the function
				// is named differently.
				statement += indent + "indirect_printf_array(" + var + ", " + var + "_size);\n";
			} else if (type instanceof Type.Int) {
				statement += indent + "indirect_printf(" + var + ");\n";
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
	 * @return the result string
	 */
	private String translate(Type type) {
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
			return record.toString();
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
				internalFailure("Not implemented!", code.toString(), null);
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

}
