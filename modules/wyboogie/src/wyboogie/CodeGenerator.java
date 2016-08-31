package wyboogie;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import wyil.attributes.VariableDeclarations;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.ArrayGenerator;
import wyil.lang.Codes.AssertOrAssume;
import wyil.lang.Codes.Assign;
import wyil.lang.Codes.BinaryOperator;
import wyil.lang.Codes.Comparator;
import wyil.lang.Codes.Const;
import wyil.lang.Codes.Convert;
import wyil.lang.Codes.Debug;
import wyil.lang.Codes.Dereference;
import wyil.lang.Codes.Fail;
import wyil.lang.Codes.FieldLoad;
import wyil.lang.Codes.Goto;
import wyil.lang.Codes.If;
import wyil.lang.Codes.IfIs;
import wyil.lang.Codes.IndexOf;
import wyil.lang.Codes.IndirectInvoke;
import wyil.lang.Codes.Invoke;
import wyil.lang.Codes.Label;
import wyil.lang.Codes.Lambda;
import wyil.lang.Codes.LengthOf;
import wyil.lang.Codes.Loop;
import wyil.lang.Codes.NewArray;
import wyil.lang.Codes.NewObject;
import wyil.lang.Codes.NewRecord;
import wyil.lang.Codes.Nop;
import wyil.lang.Codes.Return;
import wyil.lang.Codes.UnaryOperator;
import wyil.lang.Codes.Update;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.translator.generator.CodeGeneratorHelper;

/**
 * Takes a list of functional byte-code and converts it into C code.
 *
 * @author Min-Hsien Weng
 * @author Mark Utting
 *
 */
public class CodeGenerator extends AbstractCodeGenerator {

	/**
	 * Constructor
	 */
	public CodeGenerator() {
	}

	@Override
	protected void apply(WyilFile module) {
		// Get and Set up user-defined types

		// Write out Defines constants
		//this.writeConstants(module.constants());

		// Write out user-defined types.
		//this.writeUserTypes((List<wyil.lang.WyilFile.Type>) module.types());

		// Translate each function
		for (FunctionOrMethod function : module.functionOrMethods()) {
			System.out.println("function " + function.name());
			for (Code code : function.body().bytecodes()) {
				// Iterate and translate each code into the target language.
				this.iterateCode(code, function);
			}
			// Write the code
			this.writeFunction(function);
		}
	}

	@Override
	protected void translate(Update code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);

	}

	@Override
	protected void translate(UnaryOperator code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);
	}

	@Override
	protected void translate(Nop code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);
	}

	@Override
	protected void translate(Return code, FunctionOrMethod function) {
		List<String> statements = new ArrayList<String>();
		String indent = stores.getIndent(function);

		if (function.isFunction()) {
			// Generate a statement that returns a value to a calling function
			if (code.operands().length > 0) {
				statements.add(indent + "return " + stores.getVar(code.operand(0), function) + ";");
			}
			// Skip the translation of return statement for a function
		} else if (code.operands().length == 0) {
				statements.add(indent + "return;");
		} else {
				throw new RuntimeException("Not implemented for return statement in a method");
		}
		stores.addAllStatements(code, statements, function);
	}

	@Override
	protected void translate(NewRecord code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);
	}

	@Override
	protected void translate(LengthOf code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);
	}

	@Override
	protected void translate(Label code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);

	}

	@Override
	protected void translate(Loop code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);
	}

	@Override
	protected void translate(IndirectInvoke code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);
	}

	@Override
	protected void translate(Invoke code, FunctionOrMethod function) {
		List<String> statement = new ArrayList<String>();
		String indent = stores.getIndent(function);

		// Translate built-in Whiley functions using macros.
		if (code.name.module().toString().contains("whiley/lang")) {
			String lhs = stores.getVar(code.target(0), function);
			String rhs = stores.getVar(code.operand(0), function);
			switch (code.name.name()) {
			// Parse a string into an integer.
			case "parse":
				statement.add(indent + "_STR_TO_INT(" + lhs + ", " + rhs + ");");
				break;
			// Slice an array into a new sub-array at given starting and ending index.
			case "slice":
				extractLHSVar(statement, code, function);
				// Call the 'slice' function.
				String array = stores.getVar(code.operand(0), function);
				String start = stores.getVar(code.operand(1), function);
				String end = stores.getVar(code.operand(2), function);
				statement.add("_SLICE_ARRAY(" + lhs + ", " + array + ", " + start + ", " + end + ");");
				break;
			case "toString":
				statement.add(indent + lhs + " = " + rhs + ";");
				break;
			case "abs":
				// Use 'llabs' function to return the absolute value of 'rhs'
				// because the rhs is a long long integer.
				statement.add(indent + lhs + " = llabs(" + rhs + ");");
				break;
			case "min":
				String rhs1 = stores.getVar(code.operand(1), function);
				statement.add(indent + lhs + " = min(" + rhs + ", " + rhs1 + ");");
				break;
			case "max":
				rhs1 = stores.getVar(code.operand(1), function);
				statement.add(indent + lhs + " = max(" + rhs + ", " + rhs1 + ");");
				break;
			default:
				throw new RuntimeException("Un-implemented code:" + code);
			}
		} else {
			statement.add(translateFunctionCall(code, function));
		}
		stores.addAllStatements(code, statement, function);
	}

	/**
	 * Translate the rhs of a function call
	 *
	 * @param code
	 * @param f
	 * @return
	 */
	private String translateFunctionCall(Codes.Invoke code, FunctionOrMethod function) {

		String lhs_statement = "";
		// Translate the lhs side of a function call.
		// If no return value, no needs for translation.
		if (code.targets().length > 0) {
			String indent = stores.getIndent(function);
			String lhs = stores.getVar(code.target(0), function);
			// Call the function and assign the return value to lhs register.
			lhs_statement = indent + lhs + " := ";
		}

		// Translate the parameters of a function call
		String params = "";
		String sep = "";
		for (int operand : code.operands()) {
			params += sep;
			sep = ", ";
			String name = stores.getVar(operand, function);
			params += name;
		}
		return lhs_statement + code.name.name() + "(" + params + ");";
	}

	@Override
	protected void translate(IndexOf code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);
	}

	@Override
	protected void translate(If code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);
	}

	@Override
	protected void translate(Goto code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);
	}

	@Override
	protected void translate(FieldLoad code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);
	}

	@Override
	protected void translate(Fail code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);
	}

	@Override
	protected void translate(Const code, FunctionOrMethod function) {
		List<String> statement = new ArrayList<String>();
		String lhs = extractLHSVar(statement, code, function);

		String indent = stores.getIndent(function);
		if (code.constant.type() instanceof Type.Null) {
			statement.add(indent + lhs + " : WVal;");
		} else {
			if (code.constant.type() instanceof Type.Array) {
				// Cast the constant to an array
				Constant.Array list = (Constant.Array) code.constant;
				statement.add(indent + lhs + " : WVal;");
				statement.add(indent + "assume isArray(" + lhs + ");");
				statement.add(indent + "assume arraylen(" + lhs + ") = " + list.values.size() + ";");
				if (!list.values.isEmpty()) {
					// Assign values to each element
					for (int i = 0; i < list.values.size(); i++) {
						statement.add(indent + "assume toArray(" + lhs + ")[" + i + "] = " + list.values.get(i) + "; ");
					}
				}
			} else {
				statement.add(indent + lhs + " := " + code.constant + ";");
			}
		}
		stores.addAllStatements(code, statement, function);
	}

	@Override
	protected void translate(Convert code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);
	}

	@Override
	protected void translate(BinaryOperator code, FunctionOrMethod function) {
		String lhs = stores.getVar(code.target(0), function);
		String rhs0 = stores.getVar(code.operand(0), function);
		// Append 'integer' member for union type
		String rhs1 = stores.getVar(code.operand(1), function);

		String stat = stores.getIndent(function);
		stat += lhs + " := fromInt(toInt(" + rhs0 + ")";
		switch (code.kind) {
		case ADD:
			stat += " + ";
			break;
		case SUB:
			stat += " - ";
			break;
		case MUL:
			stat += " * ";
			break;
		case DIV:
			stat += " / ";
			break;
		case REM:
			stat += " % ";
			break;
		default:
			stat += "TODO BinaryOperator " + code.kind;
		}
		stat += "toInt(" + rhs1 + "));";
		stores.addStatement(code, stat, function);	}

	@Override
	protected void translate(Assign code, FunctionOrMethod function) {
		List<String> statement = new ArrayList<String>();
		String lhs = extractLHSVar(statement, code, function);
		// Get the actual type for lhs variable.
		String indent = stores.getIndent(function);
		Type lhs_type = stores.getRawType(code.target(0), function);
		String rhs = stores.getVar(code.operand(0), function);
		if (lhs_type instanceof Type.Function) {
			statement.add("LAMBDA NOT IMPL YET");
			// TODO: statement.add(indent + declareLambda(lhs, (Type.Function) lhs_type) + ";");
			// Point lhs to lambda function.
			statement.add(indent + lhs + " = " + rhs + ";");
		} else {
			statement.add(generateAssignmentCode(code, function, stores));
		}

		// Add the statement to the list of statements.
		stores.addAllStatements(code, statement, function);
	}

	@Override
	protected void translate(AssertOrAssume code, FunctionOrMethod function) {
		// Add the starting clause for the assertion
		String ass = code.getClass().getName().toLowerCase().contains("assert") ? "assert" : "assume";
		stores.addStatement(code, stores.getIndent(function) + ass + " (", function);
		// Increase the indent
		stores.increaseIndent(function);
		for (Code assert_code : code.bytecodes()) {
			// Skip return statements inside assert or assume
			if (!(assert_code instanceof Codes.Return)) {
				this.iterateCode(assert_code, function);
			}
		}
		stores.addStatement(code, stores.getIndent(function) + ")", function);
		stores.decreaseIndent(function);
	}

	@Override
	protected void translate(Debug code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);

	}

	@Override
	protected void translate(Lambda code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);

	}

	@Override
	protected void translate(NewArray code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);

	}

	@Override
	protected void translate(ArrayGenerator code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);

	}

	@Override
	protected void translate(NewObject code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);

	}

	@Override
	protected void translate(Dereference code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);

	}

	@Override
	protected void translate(IfIs code, FunctionOrMethod function) {
		// TODO Auto-generated method stub
		stores.addStatement(code, "TODO " + code.getClass().getName(), function);

	}

	@Override
	protected String declareFunction(FunctionOrMethod function) {
		// Function declaration.
		StringBuilder decl = new StringBuilder();
		decl.append(function.name());
		decl.append("(");

		// Generate input parameters separated by comma
		List<Type> params = function.type().params();
		String sep = "";
		for (int op = 0; op < params.size(); op++) {
			decl.append(sep);
			sep = ", ";
			Type parameter_type = params.get(op);
			String var = stores.getVar(op, function);
			decl.append(var + ":WVal where " + typePredicate(var, parameter_type, stores));
		}

		// Translate function return type
		if (function.type().returns().size() > 0) {
			// Translate return type
			// TODO: get name of result variable(s)? _5, _6, ...
			String var = "result";
			decl.append(": " + ":WVal where " + typePredicate(var, function.type().returns().get(0), stores));
		} else {
			// no return values
		}
		decl.append(")");
		// TODO: translate function pre and post
		return decl.toString();
	}

	/**
	 * Translate the WyIL type into the type in Boogie.
	 *
	 * @param type the WyIL type
	 * @return the result string, or null if type can not be translated.
	 *    e.g. the function call of print, printf...
	 *
	 * TODO: update this to use WVal for all types, plus isXXX preds?
	 */
	public String typePredicate(String var, Type type, CodeStores stores) {
		if (type instanceof Type.Nominal) {
			// Check is type is a System.Console.
			if (((Type.Nominal) type).name().name().equals("Console")) {
				return "isConsole(" + var + ")";
			}
			// The existential type, e.g. 'Board' is a nominal type in TicTacToe test case.
			WyilFile.Type nominal = Optional.of(stores.getUserDefinedType(type)).get();
			// TODO: check how we should translate nominal types?
			return typePredicate(var, nominal.type(), stores);
		}

		if (type instanceof Type.Int || type instanceof Type.Bool) {
			return "isInt(" + var + ")";
		}

		if (type instanceof Type.Array) {
			return "isArray(" + var + ")";
			// TODO: add constraints on the element type
			//translateType(var, ((Type.Array) type).element(), stores);
		}

//		if (type instanceof Type.Void) {
//			// this should not happen?
//			return "TODO Type.Void";
//		}

		if (type instanceof Type.Record) {
			HashMap<String, Type> fields = ((Type.Record) type).fields();
			if (((Type.Record) type).isOpen()) {
				return "isObject(" + var + ")";
			} else {
				return "isRecord(" + var + ")";
			}

//			// Check if the field is the function call of print,...
//			if (fields.containsKey("print") || fields.containsKey("println") || fields.containsKey("print_s")
//					|| fields.containsKey("println_s")) {
//				// No need to do the translation.
//				return "void*";
//			}
//
//			// The input 'type' is input arguments of main method.
//			if (fields.containsKey("args")) {
//				return "int argc, char** args";
//			}
//			// Get the user-defined type
//			return Optional.ofNullable(stores.getUserDefinedType(type)).get().name() + "*";
		}

		if (type instanceof Type.Union) {
			Type.Union u = (Type.Union) type;
			// TODO: generate the disjunction of all the bounds??
			// u.bounds()
			// return Optional.ofNullable(stores.getUserDefinedType(type)).get().name() + "*";
		}

		if (type instanceof Type.Reference) {
			// Type.Reference ref = (Type.Reference) type;
			// translateType(?, ref.element(), stores);
			return "isRef(" + var + ")";
		}

		if (type instanceof Type.Function) {
			return "isFunc(" + var + ")";
		}

		if (type instanceof Type.Method) {
			return "isMethod(" + var + ")";
		}

		if (type instanceof Type.Null) {
			return "isNull(" + var + ")";
		}

		if (type instanceof Type.Bool) {
			return "isBool(" + var + ")";
		}
		throw new RuntimeException("Not Implemented!");
	}

	/**
	 * Finds the variable that is being assigned to.
	 *
	 * @param statement
	 * @param code
	 * @param function
	 * @return LHS variable
	 */
	private String extractLHSVar(List<String> statement, Code code, FunctionOrMethod function) {

		String indent = stores.getIndent(function);
		if (code instanceof Codes.Update) {
			// Update bytecode 'update %0.queens[%1] = %32'
			Codes.Update update = (Codes.Update) code;
			// Get array variable, e.g. a[i]
			String lhs = stores.getVar(update.target(0), function);
			// Get lhs type
			Type struct_type = stores.getRawType(update.target(0), function);
			if (struct_type instanceof Type.Array) {
				// Iterates operands to increase the depths.
				for (int i = 0; i < update.operands().length - 1; i++) {
					lhs += "[" + stores.getVar(update.operand(i), function) + "]";
				}
			} else if (struct_type instanceof Type.Record || struct_type instanceof Type.Union) {
				String member = update.fields.get(0);
				lhs += "->" + member;
				// check if there are two or more operands. If so, then add 'index' operand.
				if (update.operands().length > 1) {
					lhs += "[" + stores.getVar(update.operand(0), function) + "]";
				}
			} else {
				throw new RuntimeException("Not implemented" + code);
			}
			return lhs;

		} else {
			String lhs;
			Type type = null;
			if (code instanceof Codes.ArrayGenerator) {
				lhs = stores.getVar(((Codes.ArrayGenerator) code).target(0), function);
				type = ((Codes.ArrayGenerator) code).type(0);
			} else if (code instanceof Codes.Assign) {
				lhs = stores.getVar(((Codes.Assign) code).target(0), function);
				type = stores.getRawType(((Codes.Assign) code).target(0), function);
			} else if (code instanceof Codes.Const) {
				lhs = stores.getVar(((Codes.Const) code).target(0), function);
				type = stores.getRawType(((Codes.Const) code).target(0), function);
			} else if (code instanceof Codes.FieldLoad) {
				lhs = stores.getVar(((Codes.FieldLoad) code).target(0), function);
				type = stores.getRawType(((Codes.FieldLoad) code).target(0), function);
			} else if (code instanceof Codes.Invoke) {
				Codes.Invoke invoke = (Codes.Invoke) code;
				// Check if function call returns the values.
				if (invoke.targets().length > 0) {
					lhs = stores.getVar(invoke.target(0), function);
					type = stores.getRawType(invoke.target(0), function);
					if (type instanceof Type.Array) {
						// Adds the code to propagate size variable
						for (int operand : invoke.operands()) {
							Type op_type = stores.getRawType(operand, function);
							if (op_type instanceof Type.Array) {
								String param = stores.getVar(operand, function);
								// Propagate the size of return array from input array.
								statement.add(indent + "_UPDATE_" + stores.getArrayDimension(op_type) + "DARRAY_SIZE("
										+ lhs + ", " + param + ");");
							}
						}
					}
				} else {
					lhs = null;
				}
			} else if (code instanceof Codes.NewArray) {
				lhs = stores.getVar(((Codes.NewArray) code).target(0), function);
				type = stores.getRawType(((Codes.NewArray) code).target(0), function);
			} else if (code instanceof Codes.NewRecord) {
				lhs = stores.getVar(((Codes.NewRecord) code).target(0), function);
				type = stores.getRawType(((Codes.NewRecord) code).target(0), function);
			} else {
				lhs = null;
				throw new RuntimeException("Not implemented");
			}
			return lhs;
		}
	}

	/**
	 * Generate assignment code, based on lhs type
	 * TODO: update this for Boogie
	 *
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	private String generateAssignmentCode(Codes.Assign code, FunctionOrMethod function,
			CodeStores stores) {
		String indent = stores.getIndent(function);
		Type lhs_type = stores.getRawType(code.target(0), function);
		String lhs = stores.getVar(code.target(0), function);
		String rhs = stores.getVar(code.operand(0), function);

		// Special cases for NULL type
		if (code.type(0) instanceof Type.Null) {
			return indent + lhs + " := null;";
		}
		return indent + lhs + " := " + rhs + ";";
	}

	@Override
	protected List<String> declareVariables(FunctionOrMethod function) {
		// Get variable declaration
		VariableDeclarations vars = function.attribute(VariableDeclarations.class);
		// The string declaration.
		List<String> declarations = new ArrayList<String>();
		// Skip the parameter registers and iterate over the remaining registers
		int inputs = function.type().params().size();
		String indent = "\t";
		for (int reg = inputs; reg < vars.size(); reg++) {
			// TODO: is it useful to add the type constraints?
			// Type type = stores.getRawType(reg, function);
			String var = stores.getVar(reg, function);
			declarations.add(indent + var + ":WVal");
		}
		return declarations;
	}
}