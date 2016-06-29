package wyopcl.translator.generator;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import wyil.attributes.VariableDeclarations;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.ArrayGenerator;
import wyil.lang.Codes.Comparator;
import wyil.lang.Codes.Debug;
import wyil.lang.Codes.Dereference;
import wyil.lang.Codes.IfIs;
import wyil.lang.Codes.Lambda;
import wyil.lang.Codes.Loop;
import wyil.lang.Codes.NewObject;
import wyil.lang.Codes.NewRecord;
import wyil.lang.Codes.UnaryOperator;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.copy.CopyEliminationAnalyzer;
import wyopcl.translator.deallocate.DeallocationAnalyzer;

/**
 * Takes a list of functional byte-code and converts it into C code.
 * 
 * @author Min-Hsien Weng
 *
 */
public class CodeGenerator extends AbstractCodeGenerator {
	private Optional<CopyEliminationAnalyzer> copyAnalyzer = Optional.empty();
	private Optional<DeallocationAnalyzer> deallocatedAnalyzer = Optional.empty();

	/**
	 * Constructor
	 * 
	 * @param config
	 * @param functionOrMethod
	 */
	public CodeGenerator(Configuration config) {
		super(config);
	}

	public CodeGenerator(Configuration config, Optional<CopyEliminationAnalyzer> copyAnalyzer,
			Optional<DeallocationAnalyzer> deallcAnalyzer) {
		this(config);
		this.copyAnalyzer = copyAnalyzer;
		this.deallocatedAnalyzer = deallcAnalyzer;
	}

	/**
	 * Takes the byte-code and produces the code.
	 * 
	 * @param module
	 */
	public void apply(WyilFile module) {
		// Get and Set up user-defined types
		this.stores = new CodeStores(config.isVerbose(), module);

		this.writeIncludes();
		// Defines constants
		this.writeConstants(module.constants());

		// Write out user-defined types.
		this.writeUserTypes((List<wyil.lang.WyilFile.Type>) module.types());

		// Translate each function
		for (FunctionOrMethod function : module.functionOrMethods()) {
			for (Code code : function.body().bytecodes()) {
				// Iterate and translate each code into the target language.
				this.iterateCode(code, function);
			}
			// Write the code
			this.writeFunction(function);
		}
	}

	/**
	 * Given a function, defines and initialize local variables
	 */
	protected List<String> declareVariables(FunctionOrMethod function) {
		// Get variable declaration
		VariableDeclarations vars = function.attribute(VariableDeclarations.class);
		// The string declaration.
		List<String> declarations = new ArrayList<String>();
		// Skip the parameter registers and iterate over the remaining registers
		int inputs = function.type().params().size();
		String indent = "\t";
		for (int reg = inputs; reg < vars.size(); reg++) {
			Type type = stores.getRawType(reg, function);
			// Get the variable name.
			String var = stores.getVar(reg, function);
			if (type instanceof Type.FunctionOrMethod) {
				// Skip translation
			} else {
				if (type instanceof Type.Null) {
					declarations.add(indent + "void* " + var + ";");
				} else if (type instanceof Type.Int) {
					String translateType = CodeGeneratorHelper.translateType(type, stores);
					declarations.add(indent + translateType + " " + var + " = 0;");
				} else if (type instanceof Type.Array) {
					// Check elm type is an integer
					Type elm_type = stores.getArrayElementType((Type.Array) type);
					if (stores.isIntType(elm_type)) {
						int dimension = stores.getArrayDimension(type);
						// Declare array variable
						declarations.add(indent + "_DECL_" + dimension + "DARRAY(" + var + ");");
					} else {
						String translateType = CodeGeneratorHelper.translateType(elm_type, stores);
						declarations.add(indent + translateType + "* " + var + ";");
						declarations.add(indent + "long long " + var + "_size = 0;");
					}
				} else if (type instanceof Type.Reference && ((Type.Reference) type).element() instanceof Type.Array) {
					// Declare array variable
					int dimension = stores.getArrayDimension(type);
					declarations.add(indent + "_DECL_" + dimension + "DARRAY(" + var + ");");
				} else if (type instanceof Type.Record || type instanceof Type.Nominal || type instanceof Type.Union
						|| type instanceof Type.Bool) {
					String translateType = CodeGeneratorHelper.translateType(type, stores);
					declarations.add(indent + translateType + " " + var + ";");
				} else {
					throw new RuntimeException("Not implemented");
				}
			}
			int register = reg;
			// Declare deallocation flag
			this.deallocatedAnalyzer.ifPresent(a -> {
				String o = a.declareDeallocFlag(indent, register, function, stores);
				if (o != null) {
					declarations.add(o);
				}
			});

		}

		return declarations;
	}

	/**
	 * Declare the lambda function singature.
	 * 
	 * @param lhs
	 * @param lambda
	 * @return
	 */
	private String declareLambda(String lhs, Type.Function type) {
		String statement = "";
		String ret_type = CodeGeneratorHelper.translateType(type.returns().get(0), stores);
		statement += ret_type + " (*" + lhs + ")(";
		boolean isFirst = true;
		// Get parameter list
		for (Type parameter_type : type.params()) {
			if (!isFirst) {
				statement += ",";
			} else {
				isFirst = false;
			}
			statement += CodeGeneratorHelper.translateType(parameter_type, stores);
		}
		statement += ")";
		return statement;
	}

	/**
	 * Given a function, translates it into function declaration including function name and input parameters, e.g.
	 * 
	 * <pre>
	 * <code>
	 * long long* reverse(long long* ls, long long ls_size)
	 * </code>
	 * </pre>
	 * 
	 * where 'reverse' is function name and its input declaration
	 * 
	 * @param function
	 * @return the function declaration.
	 */
	protected String declareFunction(FunctionOrMethod function) {
		// Function declaration.
		String declaration = "";
		// Get the name
		if (function.name().equals("main")) {
			declaration = "int main(int argc, char** args)";
		} else {
			// Translate function declaration in C
			if (function.type().returns().size() > 0) {
				// Translate return type
				declaration += CodeGeneratorHelper.translateType(function.type().returns().get(0), stores);
			} else {
				// no return values
				declaration += "void";
			}
			// Function names
			declaration += " " + function.name() + "(";

			List<Type> params = function.type().params();
			// Generate input parameters separated by comma
			List<String> parameters = new ArrayList<String>();
			for (int op = 0; op < params.size(); op++) {
				Type parameter_type = params.get(op);
				String var = stores.getVar(op, function);
				if (parameter_type instanceof Type.Array) {
					Type elm_type = stores.getArrayElementType((Type.Array) parameter_type);
					if (stores.isIntType(elm_type)) {
						// Add extra 'size' variable for array variable
						int dimension = stores.getArrayDimension(parameter_type);
						parameters.add("_DECL_" + dimension + "DARRAY_PARAM(" + var + ")");
					} else {
						// E.g. POS* var, long long var_size
						String elem_type = CodeGeneratorHelper.translateType(parameter_type, stores);
						parameters.add(elem_type + " " + var + ", long long " + var + "_size");
					}

				} else {
					if (parameter_type instanceof Type.Function) {
						// Add lambda function pointer
						parameters.add(declareLambda(var, (Type.Function) parameter_type));
					} else {
						parameters.add(CodeGeneratorHelper.translateType(parameter_type, stores) + " " + var);
					}
				}
				// Add deallocation flag ('_dealloc') to input parameter
				this.deallocatedAnalyzer.ifPresent(a -> {
					if (stores.isCompoundType(parameter_type)) {
						parameters.add("_DECL_DEALLOC_PARAM(" + var + ")");
					}
				});
			}

			declaration += parameters.stream().map(i -> i.toString()).collect(Collectors.joining(", "));

			declaration += ")";
		}

		if (config.isVerbose()) {
			System.out.println(declaration);
		}
		return declaration;
	}

	/**
	 * Generates the C code for Codes.Const byte-code. For example,
	 * 
	 * <pre>
	 * <code>const %33 = [80,97,115,115,32,115,119,97,112,32,116,101,115,116,32,99,97,115,101] : int[]</code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>_33_size = 19;
	 * _33=(long long*)malloc(19*sizeof(long long));
	 * _33[0] = 80; _33[1] = 97; _33[2] = 115; _33[3] = 115; _33[4] = 32; _33[5] = 115; _33[6] = 119; _33[7] = 97; _33[8] = 112; _33[9] = 32; _33[10] = 116; _33[11] = 101; _33[12] = 115; _33[13] = 116; _33[14] = 32; _33[15] = 99; _33[16] = 97; _33[17] = 115; _33[18] = 101; </code>
	 * </pre>
	 * 
	 * @param code
	 * @see Codes.Const
	 */
	protected void translate(Codes.Const code, FunctionOrMethod function) {
		List<String> statement = new ArrayList<String>();
		String lhs = preProcessor(statement, code, function);
		
		String indent = stores.getIndent(function);
		if (code.constant.type() instanceof Type.Null) {
			statement.add(indent + lhs + " = NULL;");
		} else {
			if (code.constant.type() instanceof Type.Array) {
				// Cast the constant to an array
				Constant.Array list = (Constant.Array) code.constant;
				statement.add(indent + "_NEW_1DARRAY(" + lhs + ", " + list.values.size() + ", 0);");
				if (!list.values.isEmpty()) {
					// Assign values to each element
					String s = indent;
					for (int i = 0; i < list.values.size(); i++) {
						s += lhs + "[" + i + "] = " + list.values.get(i) + "; ";
					}
					statement.add(s);
				}
			} else {
				// Add a statement
				statement.add(indent + lhs + " = " + code.constant + ";");
			}
		}

		// Compute the deallocation flag
		postProcessor(false, code.target(0), statement, code, function);

		stores.addAllStatements(code, statement, function);
	}

	/**
	 * Generate assignment code, based on lhs type
	 * 
	 * @param code
	 * @param isCopyEliminated
	 * @param function
	 * @param stores
	 * @return
	 */
	private String generateAssignmentCode(Codes.Assign code, boolean isCopyEliminated, FunctionOrMethod function,
			CodeStores stores) {
		String indent = stores.getIndent(function);
		Type lhs_type = stores.getRawType(code.target(0), function);
		String lhs = stores.getVar(code.target(0), function);
		String rhs = stores.getVar(code.operand(0), function);

		// Special cases for NULL type
		if (code.type(0) instanceof Type.Null) {
			return indent + lhs + " = NULL;";
		}

		if (!stores.isCompoundType(lhs_type)) {
			Type rhs_type = stores.getRawType(code.operand(0), function);
			if (lhs_type instanceof Type.Int && rhs_type instanceof Type.Union) {
				// Cast an integer pointer to integer, e.g. 'size = *i'
				return indent + lhs + " = *" + rhs + ";";
			}
			// Update lhs with rhs
			return indent + lhs + " = " + rhs + ";";
		} else {
			if (lhs_type instanceof Type.Array) {
				int dimension = stores.getArrayDimension(lhs_type);
				// Get element type
				Type elm_type = stores.getArrayElementType((Type.Array) lhs_type);

				if (stores.isIntType(elm_type)) {
					// Check if the lhs copy is needed or not
					if (isCopyEliminated) {
						return indent + "_UPDATE_" + dimension + "DARRAY(" + lhs + ", " + rhs + ");";
					} else {
						return indent + "_COPY_" + dimension + "DARRAY(" + lhs + ", " + rhs + ");";
					}
				} else {
					String struct = CodeGeneratorHelper.translateType(elm_type, stores).replace("*", "");
					// Create an array of stucture pointers
					//return indent + lhs + " = malloc(" + rhs + "_size*sizeof(" + struct + "*));\n" +
							// Copy an array of structures
							return indent + "_COPY_1DARRAY_STRUCT(" + lhs + ", " + rhs + ", " + struct + ");";

				}

			} else {
				if (isCopyEliminated) {
					return indent + lhs + " = " + rhs + ";";
				} else {
					return indent + lhs + " = copy_"
							+ CodeGeneratorHelper.translateType(lhs_type, stores).replace("*", "") + "(" + rhs + ");";
				}
			}

		}
	}

	/**
	 * Generates the code for <code>Codes.Assign</code> code. For example,
	 * 
	 * <pre>
	 * <code>
	 * assign %4 = %5  : {int move,int[] pieces}
	 * </code>
	 * </pre>
	 * 
	 * can be translated into:
	 * <p>
	 * <code>
	 * _4 = copy_Board(_5);
	 * </code>
	 * </pre>
	 * 
	 * Note that we need to copy input parameter(_5) to ensure value-semantics in Whiley, but the copy can eliminated by
	 * our copy analyzer. For example,
	 * <p>
	 * <code> _4 = _5;//Remove the copy.</code>
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
		List<String> statement = new ArrayList<String>();
		String lhs = preProcessor(statement, code, function);
		// Get the actual type for lhs variable.
		String indent = stores.getIndent(function);
		Type lhs_type = stores.getRawType(code.target(0), function);
		String rhs = stores.getVar(code.operand(0), function);
		if (lhs_type instanceof Type.Function) {
			statement.add(indent + declareLambda(lhs, (Type.Function) lhs_type) + ";");
			// Point lhs to lambda function.
			statement.add(indent + lhs + " = " + rhs + ";");
		} else {
			boolean isCopyEliminated = isCopyEliminated(code.operand(0), code, function);
			statement.add(generateAssignmentCode(code, isCopyEliminated, function, stores));
			postProcessor(isCopyEliminated, code.operand(0), statement, code, function);
		}

		// Add the statement to the list of statements.
		stores.addAllStatements(code, statement, function);
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
		stores.addStatement(code, stores.getIndent(function) + stores.getVar(code.target(0), function) + " = "
				+ stores.getVar(code.operand(0), function) + "_size;", function);
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
		String lhs = stores.getVar(code.target(0), function);
		String rhs0 = stores.getVar(code.operand(0), function);
		// Append 'integer' member for union type
		String rhs1 = stores.getVar(code.operand(1), function);

		String stat = stores.getIndent(function);
		stat += lhs + "=" + rhs0;
		switch (code.kind) {
		case ADD:
			stat += "+" + rhs1 + ";";
			break;
		case SUB:
			stat += "-" + rhs1 + ";";
			break;
		case MUL:
			stat += "*" + rhs1 + ";";
			break;
		case DIV:
			stat += "/" + rhs1 + ";";
			break;
		case REM:
			stat += "%" + rhs1 + ";";
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
		stores.addStatement(code, stat, function);
	}

	/**
	 * Checks if the copy of given register is needed or not, based on liveness information.
	 * 
	 * @param register
	 * @param code
	 * @param function
	 * @return
	 */
	private boolean isCopyEliminated(int register, Code code, FunctionOrMethod function) {
		if (this.copyAnalyzer.isPresent()) {
			return this.copyAnalyzer.get().isCopyEliminated(register, code, function);
		}

		return false;
	}



	/**
	 * Translate the rhs of a function call
	 * 
	 * @param code
	 * @param f
	 * @return
	 */
	private String translateFunctionCall(HashMap<Integer, Boolean> argumentCopyEliminated, Codes.Invoke code,
			FunctionOrMethod function) {
		
		String lhs_statement = "";
		// Translate the lhs side of a function call.
		// If no return value, no needs for translation.
		if (code.targets().length > 0) {
			String indent = stores.getIndent(function);
			String lhs = stores.getVar(code.target(0), function);
			// Call the function and assign the return value to lhs register.
			lhs_statement = indent + lhs + " = ";
		}
		
		// Translate the rhs side of a function call
		List<String> statement = new ArrayList<String>();
		for (int operand : code.operands()) {
			String parameter = stores.getVar(operand, function);
			Type parameter_type = stores.getRawType(operand, function);
			
			// Check if the copy of function argument is needed or not
			// And then generate the corresponding code
			if (parameter_type instanceof Type.Nominal
					&& ((Type.Nominal) parameter_type).name().name().equals("Console")) {
				statement.add("stdout");
			} else if (stores.isIntType(parameter_type)) {
				statement.add(parameter);
			} else if (parameter_type instanceof Type.Array) {
				boolean isCopyEliminated = isCopyEliminated(operand, code, function);
				Type elm = stores.getArrayElementType((Type.Array) parameter_type);
				int dimension = stores.getArrayDimension(parameter_type);
				if (isCopyEliminated) {
					statement.add("_" + dimension + "DARRAY_PARAM(" + parameter + ")");
				} else {
					if (stores.isIntType(elm)) {
						statement.add("_COPY_" + dimension + "DARRAY_PARAM(" + parameter + ")");
					} else {
						String elm_type = CodeGeneratorHelper.translateType(elm, stores).replace("*", "");
						// Copy the rhs and rhs size
						statement.add("copy_array_" + elm_type + "(" + parameter + ", " + parameter + "_size), "
								+ parameter + "_size");
					}
				}
			} else if (parameter_type instanceof Type.Record || parameter_type instanceof Type.Nominal
					|| parameter_type instanceof Type.Union) {
				boolean isCopyEliminated = isCopyEliminated(operand, code, function);
				String type_name = CodeGeneratorHelper.translateType(parameter_type, stores).replace("*", "");
				if (isCopyEliminated) {
					statement.add("_STRUCT_PARAM(" + parameter + ")");
				} else {
					statement.add("_COPY_STRUCT_PARAM(" + parameter + ", " + type_name + ")");
				}
			} else {
				throw new RuntimeException("Not Implemented");
			}
			
			// Append deallocation flag to the function call
			this.deallocatedAnalyzer.ifPresent(a -> {
				Optional<String> dealloc = 
						a.computeDealloc(operand, code, function, stores, copyAnalyzer);
				dealloc.ifPresent(callee_dealloc ->{
					switch(callee_dealloc){
						case "add_callee":
							// Assign 'true' to callee's flag
							statement.add("true");
						break;
						case "rm_callee":
							statement.add("false");
						break;
						case "transfer_callee":
							statement.add(parameter+"_dealloc");
						break;
					}
				});
			});
		}

		String rhs_statement = statement.stream().filter(s -> !s.equals("")).map(s -> s.toString()).collect(Collectors.joining(", "));
		
		// Combine lhs and rhs to the statement
		return lhs_statement + code.name.name()+ "(" + rhs_statement + ");";
		
	
	}


	/**
	 * Added de-allocation code to release the memory of lhs register
	 * @param statement
	 * @param code
	 * @param function
	 * @return lhs variable
	 */
	private String preProcessor(List<String> statement, Code code, FunctionOrMethod function) {
		String indent = stores.getIndent(function);
		String var;
		Type type;
		if (code instanceof Codes.ArrayGenerator) {
			var = stores.getVar(((Codes.ArrayGenerator) code).target(0), function);
			type = ((Codes.ArrayGenerator) code).type(0);
		} else if (code instanceof Codes.Assign) {
			var = stores.getVar(((Codes.Assign) code).target(0), function);
			type = stores.getRawType(((Codes.Assign) code).target(0), function);
		} else if (code instanceof Codes.Const){
			var = stores.getVar(((Codes.Const)code).target(0), function);
			type = stores.getRawType(((Codes.Const)code).target(0), function);
		} else if (code instanceof Codes.FieldLoad){
			var = stores.getVar(((Codes.FieldLoad)code).target(0), function);
			type = stores.getRawType(((Codes.FieldLoad)code).target(0), function); 
		} else if (code instanceof Codes.Invoke){
			Codes.Invoke invoke = (Codes.Invoke)code;
			// Check if function call returns the values.
			if(invoke.targets().length>0){
				var = stores.getVar(invoke.target(0), function);
				type = stores.getRawType(invoke.target(0), function);
				if (type instanceof Type.Array) {
					// Adds the code to propagate size variable 
					for (int operand : invoke.operands()) {
						Type op_type = stores.getRawType(operand, function);
						if (op_type instanceof Type.Array) {
							String param = stores.getVar(operand, function);
							// Propagate the size of return array from input array.
							statement.add(indent + "_UPDATE_" + stores.getArrayDimension(op_type) 
							+ "DARRAY_SIZE(" + var + ", " + param + ");");
						}
					}
				}
			}else{
				var = null;
				type = null;
			}
		} else if (code instanceof Codes.NewArray){
			var= stores.getVar(((Codes.NewArray)code).target(0), function);
			type = stores.getRawType(((Codes.NewArray)code).target(0), function); 
		} else if (code instanceof Codes.NewRecord){
			var = stores.getVar(((Codes.NewRecord)code).target(0), function);
			type = stores.getRawType(((Codes.NewRecord)code).target(0), function); 
		} else if (code instanceof Codes.Update){
			// Update bytecode 'update %0.queens[%1] = %32'
			Codes.Update update = (Codes.Update)code;
			Type lhs_type = stores.getRawType(update.target(0), function);
			// Get array variable, e.g. a[i]
			var = stores.getVar(update.target(0), function);
			String lhs_var;
			// Get rhs register (the last operand)
			int rhs_register = update.operand(update.operands().length -1);
			Type rhs_type = stores.getRawType(rhs_register, function);
			if (lhs_type instanceof Type.Array) {
				lhs_var = var;
				// Iterates operands to increase the depths.
				for (int i = 0; i < update.operands().length - 1; i++) {
					lhs_var += "[" + stores.getVar(update.operand(i), function) + "]";
				}
			} else if (lhs_type instanceof Type.Record || lhs_type instanceof Type.Union) {
				lhs_var = var;
				String member = update.fields.get(0);
				lhs_var += "->" + member;
				// check if there are two or more operands. If so, then add 'index' operand.
				if (update.operands().length > 1) {
					lhs_var += "[" + stores.getVar(update.operand(0), function) + "]";
				}
			} else {
				throw new RuntimeException("Not implemented" + code);
			}
			
			final String lhs = lhs_var;
			// Deallocate lhs register
			this.deallocatedAnalyzer.ifPresent(a -> {
				statement.add(indent+ a.addDeallocCode(var, lhs, lhs_type, rhs_type, stores));
			});

			return lhs;
			
		} else {
			var = null;
			type = null;
			throw new RuntimeException("Not implemented");
		}
		
		
		final String lhs = var;
		final Type lhs_type = type;
		// Deallocate lhs register
		this.deallocatedAnalyzer.ifPresent(a -> {
			statement.add(indent + a.addDeallocCode(lhs, lhs_type, stores));
		});

		return lhs;
	}

	/**
	 * Update the set with register and generate deallocation code.
	 * @param isCopyEliminated
	 * @param register
	 * @param statement
	 * @param code
	 * @param function
	 */
	private void postProcessor(boolean isCopyEliminated, int register, List<String> statement, Code code,
			FunctionOrMethod function) {
		// Update the set with register
		this.copyAnalyzer.ifPresent(a -> a.updateSet(isCopyEliminated, register, code, function));
		
		// Compute deallocation flag of lhs register
		this.deallocatedAnalyzer.ifPresent(a -> {
			if (code instanceof Codes.Assign) {
				statement.addAll(a.computeDealloc(isCopyEliminated, (Codes.Assign) code, function, stores));
			} else if (code instanceof Codes.NewArray) {
				statement.addAll(a.computeDealloc((Codes.NewArray) code, function, stores));
			} else if (code instanceof Codes.Const) {
				statement.addAll(a.computeDealloc((Codes.Const) code, function, stores));
			} else if (code instanceof Codes.ArrayGenerator) {
				statement.addAll(a.computeDealloc((Codes.ArrayGenerator) code, function, stores));
			} else if (code instanceof Codes.Update) {
				statement.addAll(a.computeDealloc((Codes.Update) code, function, stores));
			} else if (code instanceof Codes.IndexOf){
				statement.addAll(a.computeDealloc((Codes.IndexOf) code, function, stores));
			} else if(code instanceof Codes.FieldLoad) {
				statement.addAll(a.computeDealloc(isCopyEliminated, (Codes.FieldLoad)code, function, stores));
			}
		});
	}

	/**
	 * Update read-write and return sets and generate deallocation flag for lhs register.
	 * 
	 * @param isCopyEliminated
	 * @param argumentCopyEliminated
	 * @param statement
	 * @param code
	 * @param function
	 */
	private void postProcessor(HashMap<Integer, Boolean> argumentCopyEliminated, List<String> statement, Code code,
			FunctionOrMethod function) {

		// Iterate copy elimination set and update read-write/return set
		if (this.copyAnalyzer.isPresent()) {
			argumentCopyEliminated.entrySet().forEach(entry -> {
				boolean isCopyEliminated = entry.getValue();
				int register = entry.getKey();
				this.copyAnalyzer.get().updateSet(isCopyEliminated, register, code, function);
			});
		}

		// Compute deallocation flag of lhs register
		this.deallocatedAnalyzer.ifPresent(a -> {
			if (code instanceof Codes.NewRecord) {
				statement.addAll(a.computeDealloc((Codes.NewRecord) code, function, stores, argumentCopyEliminated));
			} else if (code instanceof Codes.Invoke) {
				statement.addAll(a.computeDealloc((Codes.Invoke) code, function, stores));
			}
		});

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
	 * Before invoking the function, copy the array ('xs') first and then pass the cloned array to the function. So that
	 * the original array will not be overwritten and its value is safely preserved.
	 * 
	 * Special cases:
	 * <ul>
	 * <li>Parse Integer<br>
	 * <code>invoke %5 = (%8) whiley/lang/Int:parse : function(whiley/lang/ASCII:string) -> null|int</code> <br>
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
		List<String> statement = new ArrayList<String>();
		String indent = stores.getIndent(function);
		HashMap<Integer, Boolean> argumentCopyEliminated = new HashMap<Integer, Boolean>();
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
				preProcessor(statement, code, function);
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
			// De-allocate lhs register
			preProcessor(statement, code, function);
		
			// call the function/method, e.g. '_12=reverse(_xs , _xs_size);'
			statement.add(translateFunctionCall(argumentCopyEliminated, code, function));
			
			// If the copy is not made and the parameter is transferred to callee, 
			// then remove deallocation flags of the parameters.
			this.deallocatedAnalyzer.ifPresent(a -> {
				statement.addAll(a.computeDealloc(code, function, stores, copyAnalyzer));
			});
		}
		
		postProcessor(argumentCopyEliminated, statement, code, function);
		
		// add the statement
		stores.addAllStatements(code, statement, function);
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
	 * Generates the code for <code>Codes.If</code> code. For example, For example, the byte-code:
	 * <code> ifeq %1, %38 goto blklab2 : [int]</code> can be translated into C code:
	 * <code>_IFEQ_ARRAY(_1, _38, blklab2);</code>
	 * 
	 * Note that _IFEQ_ARRAY macro checks if both of arrays are the same (1: true, 0:false).
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
		String indent = stores.getIndent(function);
		String lhs = stores.getVar(code.operand(0), function);
		String rhs = stores.getVar(code.operand(1), function);

		List<String> statement = new ArrayList<String>();
		// Added a special case to compare two arrays.
		if (code.type(0) instanceof Type.Array) {
			if (code.op.equals(Comparator.EQ)) {
				// Use the '_IFEQ_ARRAY' macro to compare two arrays
				statement.add(indent + "_IFEQ_ARRAY(" + lhs + ", " + rhs + ", " + code.target + ");");
			}
		} else {
			statement.add(indent + "if(" + lhs
					// The condition
					+ translate(code.op, false) + rhs
					// The goto statement
					+ "){" + "goto " + code.target + ";" + "}");
		}

		stores.addAllStatements(code, statement, function);
	}

	/**
	 * Translates the <code>Codes.AssertOrAssume</code> byte-code. This function iterates over the list of byte-code in
	 * each assertion or assumption and translated each byte-code. The translated C code is surrounded by two brackets
	 * ('{' and '}') with an indentation.
	 * 
	 * @param code
	 */
	protected void translate(Codes.AssertOrAssume code, FunctionOrMethod function) {
		// Add the starting clause for the assertion
		stores.addStatement(code, stores.getIndent(function) + "{", function);
		// Increase the indent
		stores.increaseIndent(function);
		for (Code assert_code : code.bytecodes()) {
			// Skip the translation of return statement insides assert or assume
			// code
			if (!(assert_code instanceof Codes.Return)) {
				// Iterate and translate each code into the target language.
				this.iterateCode(assert_code, function);
			}
		}
		stores.decreaseIndent(function);
		stores.addStatement(code, stores.getIndent(function) + "}", function);

	}

	protected void translate(Codes.Goto code, FunctionOrMethod function) {
		stores.addStatement(code, stores.getIndent(function) + "goto " + code.target + ";", function);
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
		stores.addStatement(code, code.label + ":;", function);
	}

	/**
	 * Prints out the message and Generates the stderr, followed by exit
	 * 
	 * @param code
	 */
	protected void translate(Codes.Fail code, FunctionOrMethod function) {
		String indent = stores.getIndent(function);
		List<String> statement = new ArrayList<String>();

		statement.add(indent + "fprintf(stderr,\"" + code + "\");");
		statement.add(indent + "exit(-1);");// Exit value (-1) means the failure
		// of assertions.
		stores.addAllStatements(code, statement, function);
	}

	/**
	 * Translates the update byte-code into C code, and removes the deallocation flag of rhs variable (a[i] = b; b_dealloc
	 * = false;) For example,
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
	 * _7_dealloc = false;
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
		String indent = stores.getIndent(function);
		List<String> statement = new ArrayList<String>();	
		String lhs = preProcessor(statement, code, function);
		
		// Generate update statement, e.g. a[i] = b
		statement.add(indent + lhs + " = " + stores.getVar(code.result(), function) + ";");
		boolean isCopyEliminated = isCopyEliminated(code.operand(0), code, function);
		postProcessor(isCopyEliminated, code.operand(0), statement, code, function);

		stores.addAllStatements(code, statement, function);
	}

	protected void translate(Codes.Nop code, FunctionOrMethod function) {
		// Do nothing
		stores.addStatement(code, stores.getIndent(function) + ";", function);
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
		List<String> statements = new ArrayList<String>();
		String indent = stores.getIndent(function);

		// Add return statements
		if (function.isFunction()) {
			// Generate a statement that returns a value to a calling function
			if (code.operands().length > 0) {
				// Add the code to deallocate all variables.
				this.deallocatedAnalyzer.ifPresent(a -> {
					statements.addAll(a.addAllDeallocCode(code, function, stores));
				});
				statements.add(indent + "return " + stores.getVar(code.operand(0), function) + ";");
			}
			// Skip the translation of return statement for a function
		} else {
			// Generate system exit statement
			if (function.name().equals("main")) {
				// Add the code to deallocate all variables.
				this.deallocatedAnalyzer.ifPresent(a -> {
					statements.addAll(a.addAllDeallocCode(code, function, stores));
				});
				// Add 'exit(0);'
				statements.add(indent + "exit(0);");
			} else {
				if (code.operands().length == 0) {
					// Add the code to deallocate all variables.
					this.deallocatedAnalyzer.ifPresent(a -> {
						statements.addAll(a.addAllDeallocCode(code, function, stores));
					});
					statements.add(indent + "return;");
				} else {
					throw new RuntimeException("Not implemented for return statement in a method");
				}
			}
		}

		stores.addAllStatements(code, statements, function);
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
		// Check the type of array element
		List<String> statement = new ArrayList<String>();

		String indent = stores.getIndent(function);
		String lhs = stores.getVar(code.target(0), function);
		String rhs = stores.getVar(code.operand(0), function);
		String index = stores.getVar(code.operand(1), function);

		// Assign rhs to rhs without any copy, e.g. a = b[i];
		statement.add(indent + lhs + "=" + rhs + "[" + index + "];");

		postProcessor(false, code.operand(0), statement, code, function);

		stores.addAllStatements(code, statement, function);
	}

	/**
	 * Translates the <code>Codes.NewList</code> byte-code. For example,
	 * 
	 * <pre>
	 * <code>
	 * newlist %10 = (%1, %2, %3, %4, %5, %6, %7, %8, %9) : int[]
	 * </code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>
	 * _10_size = 9;
	 * _10 = malloc(_10_size*sizeof(long long));
	 * _10[0] = _1; _10[1] = _2; _10[2] = _3; _10[3] = _4; _10[4] = _5; _10[5] = _6; _10[6] = _7; _10[7] = _8; _10[8] = _9;
	 * </code>
	 * </pre>
	 * 
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
	protected void translate(Codes.NewArray code, FunctionOrMethod function) {
		List<String> statement = new ArrayList<String>();
		// Free lhs variable
		preProcessor(statement, code, function);
		String indent = stores.getIndent(function);
		// Get array names
		String lhs = stores.getVar(code.target(0), function);
		int length = code.operands().length;
		if (length > 0) {	
			statement.add(indent + "_NEW_1DARRAY(" + lhs + ", " + length + ", 0);");
			String s = indent;
			// Initialize the array
			for (int i = 0; i < code.operands().length; i++) {
				s += lhs + "[" + i + "] = " + stores.getVar(code.operand(i), function) + "; ";
			}
			statement.add(s);
		}

		postProcessor(false, code.operand(0), statement, code, function);

		stores.addAllStatements(code, statement, function);
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
		List<String> statement = new ArrayList<String>();
		// Skip translation.
		if (field.equals("out") || field.equals("print") || field.equals("println") || field.equals("print_s")
				|| field.equals("println_s")) {
			// Load the field to the target register.
			stores.loadField(code.target(0), field, function);
		} else {
			// Free lhs variable
			//preProcessor(statement, code, function);
			boolean isCopyEliminated;// The copy is NOT needed by default.
			if (field.equals("args")) {
				// Convert the arguments into an array of integer array (long long**).
				statement.add(stores.getIndent(function) + "_CONV_ARGS(" + stores.getVar(code.target(0), function) + ");");
				isCopyEliminated = false;
			} else {
				Type lhs_type = stores.getRawType(code.target(0), function);
				String rhs = stores.getVar(code.operand(0), function) + "->" + code.field;
				isCopyEliminated = isCopyEliminated(code.operand(0), code, function);
				// Generate copy/uncopy assignment code
				statement.addAll(CodeGeneratorHelper.generateAssignmentCode(lhs_type, stores.getIndent(function), stores.getVar(code.target(0), function), rhs,
						isCopyEliminated, stores));
			}
			//postProcessor(isCopyEliminated, code.operand(0), statement, code, function);
		}
		stores.addAllStatements(code, statement, function);
	}

	/**
	 * TODO: Not implemented.
	 * 
	 * @param code
	 */
	protected void translate(Codes.Convert code, FunctionOrMethod function) {
		stores.addStatement(code, null, function);
	}

	/**
	 * Generates the C code for <code>Codes.IndirectInvoke</code>. For example,
	 * 
	 * <pre>
	 * <code>
	 * fieldload %2 = %1 println : {method(any) -> void print,method([int]) -> void print_s,method(any) -> 
	 * void println,method([int]) -> void println_s}
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
		List<String> statement = new ArrayList<String>();
		String indent = stores.getIndent(function);
		if (code.type(0) instanceof Type.Function) {
			// Get the lambda expression
			String lhs = stores.getVar(code.target(0), function);
			String rhs = stores.getVar(code.operand(0), function);
			String parameter = stores.getVar(code.operand(1), function);
			statement.add(indent + lhs + " = " + rhs + "(" + parameter + ");");
		} else if (code.type(0) instanceof Type.Method) {
			// Get the function name, e.g. 'printf'.
			String print_name = stores.getField(code.operand(0), function);
			// Get the input
			String input = stores.getVar(code.operand(1), function);
			Type input_type = stores.getRawType(code.operand(1), function);
			String f_s = "%lld";// Specify the format to 'printf' function, e.g.
			// '%lld'
			switch (print_name) {
			case "print":
				statement.add(indent + "printf(\"" + f_s + "\", " + input + ");");
				break;
			case "print_s":
				int dimension = stores.getArrayDimension(input_type);
				statement.add(indent + "printf_s(_" + dimension + "DARRAY_PARAM(" + input + "));");
				break;
			case "println_s":
				// dimension = stores.getArrayDimension(input_type);
				statement.add(indent + "println_s(" + input + ", " + input + "_size);");
				break;
			case "println":
				// Check input's type to call different println function.
				if (input_type instanceof Type.Int) {
					statement.add(indent + "printf(\"" + f_s + "\\n\", " + input + ");");
				} else if (input_type instanceof Type.Array) {
					statement.add(indent + "_1DARRAY_PRINT(" + input + ");");
				} else if (input_type instanceof Type.Nominal) {
					Type.Nominal nominal = (Type.Nominal) input_type;
					// Print out a user-defined type structure
					statement.add(indent + "printf_" + nominal.name().name() + "(" + input + ");");
				} else if (input_type instanceof Type.Union) {
					statement.add(indent + "printf(\"" + f_s + "\\n\", " + input + ");");
				} else {
					throw new RuntimeException("Not implemented." + code);
				}
				break;
			default:
				throw new RuntimeException("Not implemented." + code);
			}
		} else {
			throw new RuntimeException("Not implemented." + code);
		}
		stores.addAllStatements(code, statement, function);
	}

	protected void translate(UnaryOperator code, FunctionOrMethod function) {
		stores.addStatement(code,
				stores.getIndent(function) + (prefix + code.target(0)) + "= -" + prefix + code.operand(0) + ";",
				function);
	}

	/**
	 * Iterate over the list of loop byte-code and translate each code into C code. To separate the bytecode inside a
	 * loop from the main byte-code, the loop flag is enabled and the indentation is increased.
	 * 
	 * @param code
	 */
	protected void translate(Loop code, FunctionOrMethod function) {
		String indent = stores.getIndent(function);
		String statement = indent + "while(true){";
		stores.addStatement(code, statement, function);

		// Increase the indent for loop body.
		stores.increaseIndent(function);
		// Translate the loop body
		for (Code loop_code : code.bytecodes()) {
			// Iterate and translate each code into the target language.
			this.iterateCode(loop_code, function);
		}

		// Decrease the indentation after loop body.
		stores.decreaseIndent(function);
		// Add the ending bracket.
		stores.addStatement(null, stores.getIndent(function) + "}", function);
	}

	/**
	 * Translates the new record byte-code. For example,
	 * 
	 * <pre>
	 * <code>newrecord a = (b, c) : {int move,[int] pieces}</code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>
	 * a = create_Board();
	 * a.move = b;
	 * a.pieces = c;
	 * a.pieces_size = c_size;
	 * </code>
	 * </pre>
	 * 
	 * @TODO Fix the sequence of fields in a record type as the order of fields is in the reversed direction of
	 *       operands.
	 * 
	 * @param code
	 */
	protected void translate(NewRecord code, FunctionOrMethod function) {
		List<String> statement = new ArrayList<String>();
		// Add deallocation code to lhs structure
		preProcessor(statement, code, function);
		
		String indent = stores.getIndent(function);
		String lhs = stores.getVar(code.target(0), function);
		Type lhs_type = stores.getRawType(code.target(0), function);
		// Assign lhs structure members with rhs member, e.g. 'a.pieces = copy(b, b_size);'
		statement.add(indent + lhs + " = malloc(sizeof("
				+ CodeGeneratorHelper.translateType(lhs_type, stores).replace("*", "") + "));");

		List<String> members = stores.getMemebers(code.type(0));

		HashMap<Integer, Boolean> copyEliminatedMap = new HashMap<Integer, Boolean>();
		int[] operands = code.operands();
		for (int i = 0; i < operands.length; i++) {
			// Get operand
			int register = operands[i];
			String rhs = stores.getVar(register, function);
			String member = members.get(i);
			String lhs_member = lhs + "->" + member;
			Type member_type = stores.getRawType(register, function);
			//Type type = code.type(0).field(member);
			boolean isCopyEliminated = isCopyEliminated(register, code, function);
			copyEliminatedMap.put(register, isCopyEliminated);

			statement.addAll(CodeGeneratorHelper.generateAssignmentCode(member_type, indent, lhs_member, rhs, isCopyEliminated,
					stores));
		}

		postProcessor(copyEliminatedMap, statement, code, function);

		// Get the set of field names and convert it to an array of string.
		stores.addAllStatements(code, statement, function);
	}

	/**
	 * Write out the generated C code, which starts with variable declarations, followed by a list of statements and a
	 * list of free statements at the end.
	 * 
	 * @param writer
	 */
	private void writeFunction(FunctionOrMethod function) {
		// Write out the header file
		// Function header
		List<String> function_header = new ArrayList<String>();
		function_header.add(this.declareFunction(function) + ";");
		String file_name = config.getFilename();
		try {
			// Create a new one or over-write an existing one.
			Files.write(Paths.get(file_name + ".h"), function_header, StandardOpenOption.APPEND);
		} catch (IOException e) {
			throw new RuntimeException("Errors occur in writeIncludes()");
		}

		// Function body
		List<String> function_body = new ArrayList<String>();
		function_body.add(this.declareFunction(function) + "{");
		function_body.addAll(this.declareVariables(function));
		function_body.addAll(stores.getStatements(function));
		function_body.add("}\n");

		try {
			// Create a new one or over-write an existing one.
			Files.write(Paths.get(file_name + ".c"), function_body, StandardOpenOption.APPEND);
		} catch (IOException e) {
			throw new RuntimeException("Errors occur in writeIncludes()");
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
		String statement = "";
		// The ifis code checks if the register is NULL or not.
		if (code.rightOperand instanceof Type.Null) {
			String lhs = stores.getVar(code.operand(0), function);
			String indent = stores.getIndent(function);
			statement = indent + "if(" + lhs + " == NULL) { goto " + code.target + ";}";
		} else {
			throw new RuntimeException("Not implemented!" + code);
		}
		stores.addStatement(code, statement, function);
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
		String indent = stores.getIndent(function);
		List<String> statement = new ArrayList<String>();
		statement.add(indent + stores.getVar(code.target(0), function) + " = *("
				+ stores.getVar(code.operand(0), function) + ");");
		// Check if the value in the rhs register is an array.
		if (code.type(0).element() instanceof Type.Array) {
			// Assign the array size to lhs register
			statement.add(indent + stores.getVar(code.target(0), function) + "_size = "
					+ stores.getVar(code.operand(0), function) + "_size;");
		}
		stores.addAllStatements(code, statement, function);
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
		// Check that the given value is an array.
		throw new RuntimeException("Not implemented! " + code);
	}

	/***
	 * Generates a multi-dimensional array with 'genXDArray' built-in C function in C, e.g.
	 * 
	 * <pre>
	 * <code>
	 * listgen a = [b; c] : int[][]
	 * </code>
	 * </pre>
	 * 
	 * can translate this into
	 * 
	 * <pre>
	 * <code>
	 * a_size = c;
	 *	if(a_dealloc){free2DArray(a, a_size); a_dealloc = false;}
	 * a_size_size = __size;
	 * a = gen2DArray(b, a_size, a_size_size);
	 * a_dealloc = true;
	 * </code>
	 * </pre>
	 * 
	 * Creates a 2D array ( _11*_10_size) with initial '_10' value.
	 */
	@Override
	protected void translate(ArrayGenerator code, FunctionOrMethod function) {
		List<String> statement = new ArrayList<String>();
		String lhs = preProcessor(statement, code, function);

		String indent = stores.getIndent(function);
		Type.Array lhs_type = (Type.Array) stores.getRawType(code.target(0), function);
		String rhs = stores.getVar(code.operand(0), function);
		String size = stores.getVar(code.operand(1), function);
		Type elm_type = stores.getArrayElementType(lhs_type);
		boolean isCopyEliminated;
		if (stores.isIntType(elm_type)) {
			// Generate an array with given size and values.
			statement.add(indent + "_NEW_" + stores.getArrayDimension(lhs_type) + "DARRAY(" + lhs + ", " + size + ", " + rhs + ");");
			isCopyEliminated = true;
		} else {
			// Generate an array of structures
			String struct = CodeGeneratorHelper.translateType(elm_type, stores).replace("*", "");
			statement.add(indent + "_NEW_1DARRAY_STRUCT("+lhs +", "+size+", "+ rhs+ ", "+struct+");");
			isCopyEliminated = false;
		}

		postProcessor(isCopyEliminated, code.operand(0), statement, code, function);

		stores.addAllStatements(code, statement, function);
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
	private void writeUserTypes(List<wyil.lang.WyilFile.Type> userTypes) {
		String filename = this.config.getFilename();
		List<String> structs = new ArrayList<String>();
		List<String> statements = new ArrayList<String>();
		// Iterate each user type and write out code to source and header files.
		for (wyil.lang.WyilFile.Type userType : userTypes) {
			String type_name = userType.name();
			Type type = userType.type();
			// Check if userType is a typedef structure.
			if (type instanceof Type.Int) {
				structs.add("typedef " + CodeGeneratorHelper.translateType(type, stores) + " " + type_name + ";");
			} else if (type instanceof Type.Record) {
				structs.addAll(CodeGeneratorHelper.generateStructDef(type, stores));
				statements.addAll(CodeGeneratorHelper.generateStructFunction(type, stores));
			} else if (type instanceof Type.Union) {
				structs.addAll(CodeGeneratorHelper.generateStructDef(type, stores));
				statements.addAll(CodeGeneratorHelper.generateStructFunction(type, stores));
			} else if (type instanceof Type.Function) {
				// Use 'typedef' to declare the lambda function
				structs.add("typedef " + declareLambda(type_name, (Type.Function) type) + ";");
			} else {
				throw new RuntimeException("Not Implemented!");
			}
		}

		// Write out user-defined structures to *.h
		try {
			Files.write(Paths.get(filename + ".h"), structs, StandardOpenOption.APPEND);
		} catch (IOException e) {
			throw new RuntimeException("Errors occurs in writing " + structs + " to " + filename + ".h");
		}

		// Write out statements to *.c
		try {
			Files.write(Paths.get(filename + ".c"), statements, StandardOpenOption.APPEND);
		} catch (IOException e) {
			throw new RuntimeException("Errors in writing " + statements + " to " + filename + ".c");
		}
	}

	/**
	 * Defines constants, e.g. <code>
	 * #define BLANK 0
	 * </code>
	 * 
	 * 
	 */
	private void writeConstants(Collection<WyilFile.Constant> constants) {
		// Generates declarations
		List<String> declarations = new ArrayList<String>();
		constants.forEach(c -> declarations.add("#define " + c.name() + " " + c.constant()));

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
	private void writeIncludes() {
		String file_name = this.config.getFilename();
		// Writes out #include "Util.h" to test_case.h
		String includes = "#include \"Util.h\"\n";
		try {
			// Create a new one or over-write an existing one.
			Files.write(Paths.get(file_name + ".h"), includes.getBytes(), StandardOpenOption.CREATE,
					StandardOpenOption.TRUNCATE_EXISTING);
		} catch (IOException e) {
			throw new RuntimeException("Errors occur in writeIncludes()");
		}

		// Writes out #include "test_case.h" to test_case.c
		includes = "#include \"" + file_name + ".h\"\n";
		try {
			Files.write(Paths.get(file_name + ".c"), includes.getBytes(), StandardOpenOption.CREATE,
					StandardOpenOption.TRUNCATE_EXISTING);
		} catch (IOException e) {
			throw new RuntimeException("Errors occur in writeIncludes()");
		}
	}

	/**
	 * Translates the lambda expression into anonymous function in C.
	 * <http://stackoverflow.com/questions/10405436/anonymous-functions-using-gcc-statement-expressions> Currently, we
	 * translate the lambda function into GCC anonymous function, e.g.
	 * <code>lambda %3 = (_) lambda:$lambda88 : function(int)->(int)</code> can be translated into:
	 * 
	 * <pre>
	 * <code>
	 *  $lambda88(NULL);
	 *  long long (*twice)(long long);
	 *	twice = $lambda88;
	 * </code>
	 * </pre>
	 * 
	 */
	@Override
	protected void translate(Lambda code, FunctionOrMethod function) {
		List<String> statement = new ArrayList<String>();
		String indent = stores.getIndent(function);
		// Get lhs var
		String lhs = stores.getVar(code.target(0), function);
		String lambda = code.name.name();
		// Initialize the lambda expression.
		String init_lambda = lambda + "(";
		// Add parameters
		boolean isFirst = true;
		for (int operand : code.operands()) {
			if (!isFirst) {
				init_lambda += ", ";
			} else {
				isFirst = false;
			}
			// Get the parameter
			if (operand > 0) {
				init_lambda += stores.getVar(operand, function);
			} else {
				init_lambda += "NULL";
			}
		}

		init_lambda += ");";
		statement.add(indent + init_lambda);
		// Adds the lambda declaration
		statement.add(indent + declareLambda(lhs, (Type.Function) code.type(0)) + ";");
		// Point the lhs to lambda function name
		statement.add(indent + lhs + " = " + code.name.name() + ";");

		stores.addAllStatements(code, statement, function);
	}

	@Override
	protected void translate(Debug code, FunctionOrMethod function) {
		// code.toString()
		throw new RuntimeException("Not Implemented");
		// Print out error message
		// stores.addStatement(code, "prinf(", function);
	}
}
