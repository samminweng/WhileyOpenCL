package wyopcl.translator.generator;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
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
import wyil.lang.Modifier;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.bound.BoundAnalyzer;
import wyopcl.translator.bound.Domain;
import wyopcl.translator.copy.CopyEliminationAnalyzer;
import wyopcl.translator.deallocate.DeallocationAnalyzer;

/**
 * Takes a list of functional byte-code and converts it into C code.
 * 
 * @author Min-Hsien Weng
 *
 */
public class CodeGenerator extends AbstractCodeGenerator {
	// Optional copy and deallocation analyzers
	private Optional<CopyEliminationAnalyzer> copyAnalyzer = Optional.empty();
	private Optional<DeallocationAnalyzer> deallocatedAnalyzer = Optional.empty();
	// Optional bound analyzer
	private Optional<BoundAnalyzer> boundAnalyzer = Optional.empty();
	// Optional transformed function
	private Optional<HashMap<FunctionOrMethod, FunctionOrMethod>> transformFuncMap = Optional.empty();

	/**
	 * Constructor
	 * 
	 * @param config
	 * @param functionOrMethod
	 */
	public CodeGenerator(Configuration config) {
		super(config);
	}

	/**
	 * @deprecated
	 * @param config
	 * @param copyAnalyzer
	 * @param deallcAnalyzer
	 * @param boundAnalyzer
	 * @param transformFuncMap
	 */
	public CodeGenerator(Configuration config, Optional<CopyEliminationAnalyzer> copyAnalyzer,
			Optional<DeallocationAnalyzer> deallcAnalyzer, Optional<BoundAnalyzer> boundAnalyzer,
			Optional<HashMap<FunctionOrMethod, FunctionOrMethod>> transformFuncMap) {
		this(config);
		throw new RuntimeException("Not used anymore");
	}

	public CodeGenerator(Configuration config, Optional<CopyEliminationAnalyzer> copyAnalyzer,
			Optional<DeallocationAnalyzer> deallcAnalyzer, Optional<BoundAnalyzer> boundAnalyzer) {
		this(config);
		this.copyAnalyzer = copyAnalyzer;
		this.deallocatedAnalyzer = deallcAnalyzer;
		this.boundAnalyzer = boundAnalyzer;
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

		Collection<FunctionOrMethod> functions = module.functionOrMethods();

		// Check if any analyser exist. If so, we use the calling graph to produce the code accordingly.
		if (this.copyAnalyzer.isPresent()) {
			functions = this.copyAnalyzer.get().getFunctionsInPostOrderOfCallingGraph();
		} else if (this.deallocatedAnalyzer.isPresent()) {
			functions = this.deallocatedAnalyzer.get().getFunctionsInPostOrderOfCallingGraph();
		} else {
			functions = module.functionOrMethods();
		}

		// Translate each function in the order of WyIL code
		for (FunctionOrMethod function : functions) {
			// Use the copy analyzer to analyze the function
			if (this.copyAnalyzer.isPresent()) {
				this.copyAnalyzer.get().analyzeFunction(function);
			}
			// Use the deallocation analyzer to analyze the function
			if (this.deallocatedAnalyzer.isPresent()) {
				this.deallocatedAnalyzer.get().analyzeFunction(function);
			}

			// Generate the function block
			for (Code code : function.body().bytecodes()) {
				// Iterate and translate each code into the target language.
				this.iterateCode(code, function);
			}
			// Write the code
			this.writeFunction(function);
			// }
		}

	}

	/**
	 * Given a function, defines and initialize local variables
	 */
	protected List<String> declareVariables(FunctionOrMethod function) {
		// Get variable declaration
		VariableDeclarations vars = function.attribute(VariableDeclarations.class);
		// The string declaration in C
		List<String> decStatements = new ArrayList<String>();
		// Store all the variable names to avoid duplicated declarations
		List<String> varNames = new ArrayList<String>();
		// Skip the parameter registers and iterate over the remaining registers
		ArrayList<Type> params = function.type().params();
		String indent = "\t";
		// Declare the deallocation for the parameter
		for (int reg = 0; reg < params.size(); reg++) {
			int register = reg;
			// Declare deallocation flag
			this.deallocatedAnalyzer.ifPresent(a -> {
				String o = a.declareDeallocFlag(indent, register, function, stores);
				if (o != null) {
					decStatements.add(o);
				}
			});
		}

		// Declare local variables
		for (int reg = params.size(); reg < vars.size(); reg++) {
			Type type = stores.getRawType(reg, function);
			// Get the variable name.
			String varname = stores.getVar(reg, function);
			// Check if 'var' exists in 'varNames' and the var type is not a function. If any, skip the translation.
			if (varNames.contains(varname) || type instanceof Type.FunctionOrMethod) {
				continue;// Skip the translation.
			}
			// Add the 'varname' to 'varNames' set
			varNames.add(varname);
			if (type == null || type instanceof Type.Null) {
				decStatements.add(indent + "void* " + varname + ";");
			} else if (type instanceof Type.Byte) {
				decStatements.add(indent + "BYTE " + varname + ";");
			} else if (type instanceof Type.Int) {
				String translateType;
				if (boundAnalyzer.isPresent()) {
					translateType = boundAnalyzer.get().suggestIntegerType(reg, function);
				} else {
					// Use the int64_t integer
					translateType = CodeGeneratorHelper.translateType(type, stores);
				}
				String def = indent + translateType + " " + varname + ";";// Initialize an integer variable to 0
				if (boundAnalyzer.isPresent()) {
					def = def + " //" + boundAnalyzer.get().getInferredDomain(reg, function);
				}
				decStatements.add(def);
			} else if (type instanceof Type.Array) {
				// Get the array dimension
				int dimension = stores.getArrayDimension(type);
				// Check elm type is an integer
				Type elm_type = stores.getArrayElementType((Type.Array) type);
				// Add variable declaration
				if (elm_type instanceof Type.Byte) {
					// Declare a BYTE array
					decStatements.add(indent + "_DECL_" + dimension + "DARRAY_BYTE(" + varname + ");");
				} else if (stores.isIntType(elm_type)) {
					// Choose integer type for a single dimensional array
					if (boundAnalyzer.isPresent() && dimension == 1) {
						String translateType = boundAnalyzer.get().suggestIntegerType(reg, function);
						String def = indent + translateType + "* " + varname + " = NULL;";
						// Initialize an integer variable to 0
						if (boundAnalyzer.isPresent()) {
							def = def + " //" + boundAnalyzer.get().getInferredDomain(reg, function);
						}
						decStatements.add(def);
						// Declare array size variable as 'size_t' type
						decStatements.add(indent + "size_t " + varname + "_size = 0;");
					} else {
						// Declare an integer array using int64_t
						decStatements.add(indent + "_DECL_" + dimension + "DARRAY(" + varname + ");");
					}
				} else {
					String translateType = CodeGeneratorHelper.translateType(elm_type, stores);
					decStatements.add(indent + translateType + "* " + varname + ";");
					// Declare array size variable as 'size_t' type
					decStatements.add(indent + "size_t " + varname + "_size = 0;");
				}
			} else if ((type instanceof Type.Reference && ((Type.Reference) type).element() instanceof Type.Array)) {
				// Declare array variable
				int dimension = stores.getArrayDimension(type);
				decStatements.add(indent + "_DECL_" + dimension + "DARRAY(" + varname + ");");
			} else if ((type instanceof Type.Union && stores.isIntArrayOrAliasedType(type))
					|| (type instanceof Type.Nominal && stores.isIntArrayOrAliasedType(type))) {
				// Check if union type is null|int[] or nomial type is aliased to int[]
				decStatements.add(indent + "_DECL_1DARRAY(" + varname + ");");
			} else if (type instanceof Type.Nominal && ((Type.Nominal) type).name().name().equals("string")) {
				// Special case for ASCII.String type
				// Declare an array of bytes
				decStatements.add(indent + "_DECL_1DARRAY_BYTE(" + varname + ");");
			} else if (type instanceof Type.Record || type instanceof Type.Nominal || type instanceof Type.Union
					|| type instanceof Type.Bool) {
				String translateType = CodeGeneratorHelper.translateType(type, stores);
				decStatements.add(indent + translateType + " " + varname + ";");
			} else {
				throw new RuntimeException("Not implemented");
			}

			int register = reg;
			// Declare deallocation flag
			this.deallocatedAnalyzer.ifPresent(a -> {
				String o = a.declareDeallocFlag(indent, register, function, stores);
				if (o != null) {
					decStatements.add(o);
				}
			});

		}
		return decStatements;
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
	 * int64_t* reverse(int64_t* ls, size_t ls_size)
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
		final List<Type> params = function.type().params();
		// Compute the bound if bound analyser is present
		if (boundAnalyzer.isPresent()) {
			int r = 0;
			declaration += "//";
			// Go through all parameters
			for (Type param : params) {
				if (stores.isIntType(param)) {
					Domain d = boundAnalyzer.get().getInferredDomain(r, function);
					// Print out the domains of parameters
					declaration += "\t" + d;
				}
			}
			declaration += "\n";
		}

		// Get the name
		if (function.name().equals("main")) {
			declaration += "int main(int argc, char** args)";
		} else {
			// Translate function declaration in C

			// Translate the return type
			Type ret_type = null;
			{
				if (function.type().returns().size() > 0) {
					ret_type = function.type().returns().get(0);
					// Translate array typed return value
					if (boundAnalyzer.isPresent() && ret_type instanceof Type.Array) {
						// Register of return value is -1
						declaration += boundAnalyzer.get().suggestIntegerType(-1, function) + "*";
					} else {
						// Translate return type
						declaration += CodeGeneratorHelper.translateType(ret_type, stores);
					}
				} else {
					// no return values
					declaration += "void";
				}
				// Function name, e.g. _Cash_
				declaration += " " + stores.getFunctionName(function) + "(";
			}
			// Translate parameter types
			{
				// Translate input parameters, separated by comma
				List<String> parameters = new ArrayList<String>();
				// Parameters are defined in the order as the source Whiley program
				for (int op = 0; op < params.size(); op++) {
					Type parameter_type = params.get(op);
					String var = stores.getVar(op, function);
					if (parameter_type instanceof Type.Array) {
						// Array type

						Type elm_type = stores.getArrayElementType((Type.Array) parameter_type);
						if (stores.isIntType(elm_type)) {
							int dimension = stores.getArrayDimension(parameter_type);
							if (boundAnalyzer.isPresent() && dimension == 1) {
								String translateType = boundAnalyzer.get().suggestIntegerType(op, function);
								// Pass array parameter along with array size
								String def = translateType + "* " + var + ", size_t " + var + "_size";
								parameters.add(def);

							} else {
								// Generate the parameter types using default macro
								parameters.add("_DECL_" + dimension + "DARRAY_PARAM(" + var + ")");
							}
						} else {
							// E.g. POS* var, size_t var_size
							String elem_type = CodeGeneratorHelper.translateType(parameter_type, stores);
							// Declare a 'size_t' size variable
							parameters.add(elem_type + " " + var + ", size_t " + var + "_size");
						}
					} else if (stores.isIntArrayOrAliasedType(parameter_type)) {
						// Pass the parameter along with size variable
						parameters.add("_DECL_1DARRAY_PARAM(" + var + ")");
					} else {
						if (parameter_type instanceof Type.Function) {
							// Add lambda function pointer
							parameters.add(declareLambda(var, (Type.Function) parameter_type));
						} else {
							if (parameter_type instanceof Type.Int && boundAnalyzer.isPresent()) {
								parameters.add(boundAnalyzer.get().suggestIntegerType(op, function) + " " + var);
							} else {
								parameters.add(CodeGeneratorHelper.translateType(parameter_type, stores) + " " + var);
							}

						}
					}
					// Add deallocation flag ('_dealloc') to input parameter
					// this.deallocatedAnalyzer.ifPresent(a -> {
					// if (stores.isCompoundType(parameter_type)) {
					// parameters.add("_DECL_DEALLOC_PARAM(" + var + ")");
					// }
					// });
				}
				// Pass the extra size variable of return array
				if (ret_type != null) {
					if (ret_type instanceof Type.Array) {
						Type.Array arr_type = (Type.Array) ret_type;
						// Get array dimension
						int dimension = stores.getArrayDimension(arr_type);
						// Declare the call-by-reference size variable for output array, e.g. 'size_t* a_size'
						parameters.add("_DECL_" + dimension + "DARRAYSIZE_PARAM_CALLBYREFERENCE");
					} else if (stores.isIntArrayOrAliasedType(ret_type)) {
						// The return type is aliased to array type, e.g. string
						// Pass the size variable as a reference
						parameters.add("_DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE");
					} else {
						// For other types, no extra parameter is required.
					}
				}

				// Separate each parameter with ',' sign
				declaration += parameters.stream().map(i -> i.toString()).collect(Collectors.joining(", "));
			}

			declaration += ")";
		}

		// if (config.isVerbose()) {
		// System.out.println(declaration);
		// }
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
	 * _33=(int64_t*)malloc(19*sizeof(int64_t));
	 * _33[0] = 80; _33[1] = 97; _33[2] = 115; _33[3] = 115; _33[4] = 32; _33[5] = 115; _33[6] = 119; _33[7] = 97; _33[8] = 112; _33[9] = 32; _33[10] = 116; _33[11] = 101; _33[12] = 115; _33[13] = 116; _33[14] = 32; _33[15] = 99; _33[16] = 97; _33[17] = 115; _33[18] = 101; </code>
	 * </pre>
	 * 
	 * For a given 2D array
	 * 
	 * <pre>
	 * _NEW_2DARRAY_int64_t_EMPTY(_21, 8, 3);
	 * {
			int tmp[] = {49, 99};
			memcpy(_21[0], tmp, 2*sizeof(int64_t));
		}....
	 * </pre>
	 * 
	 * @param code
	 * @see Codes.Const
	 */
	protected void translate(Codes.Const code, FunctionOrMethod function) {
		List<String> statement = new ArrayList<String>();
		String lhs = translateLHSVarFunctionCall(statement, code, function);

		String indent = stores.getIndent(function);
		Constant constant = code.constant;
		if (constant.type() instanceof Type.Null) {
			statement.add(indent + lhs + " = NULL;");
		} else {
			if (constant.type() instanceof Type.Byte) {
				// Declare a BYTE constant
				statement.add(indent + lhs + " = 0b" + constant.toString().replaceAll("b", "") + ";");
			} else if (constant.type() instanceof Type.Array) {
				// Cast the constant to an array
				Constant.Array list = (Constant.Array) code.constant;
				// Get element type
				Type elm_type = list.type().element();
				// Special case for BYTE type
				if (elm_type instanceof Type.Byte) {
					// Create an array of bytes
					statement.add(indent + "_NEW_1DARRAY_BYTE(" + lhs + ", " + list.values.size() + ", 0b0);");
					if (!list.values.isEmpty()) {
						// Assign values to each element
						String s = indent;
						for (int i = 0; i < list.values.size(); i++) {
							// Get binary code
							String value = list.values.get(i).toString().replace("b", "");
							// Binary representation in C starts with '0b', e.g. '0b01001100'
							s += lhs + "[" + i + "] = 0b" + value + "; ";
						}
						statement.add(s);
					}
				} else {
					// Get array dimension
					int dimension = stores.getArrayDimension(constant.type());
					if (dimension == 1) {
						if (boundAnalyzer.isPresent()) {
							String translateType = boundAnalyzer.get().suggestIntegerType(code.target(), function);
							// Generate a new array using _NEW_1DARRAY macro using
							statement.add(indent + "_NEW_1DARRAY(" + lhs + ", " + list.values.size() + ", 0" + ", "
									+ translateType + ");");
						} else {
							statement.add(indent + "_NEW_1DARRAY_int64_t(" + lhs + ", " + list.values.size() + ", 0);");
						}

						if (!list.values.isEmpty()) {
							// Assign values to each element
							String s = indent;
							for (int i = 0; i < list.values.size(); i++) {
								s += lhs + "[" + i + "] = " + list.values.get(i) + "; ";
							}
							statement.add(s);
						}
					} else if (dimension == 2) {
						// Create a 2D array
						int _1d_size = list.values.size(); // Get size of 1st dimension
						// the size of 2nd array : go through each sub-array to get maximal subarray size
						int _max_2d_size = 0;
						for (int i = 0; i < list.values.size(); i++) {
							Constant.Array subarray = (Constant.Array) list.values.get(i);
							if (subarray.values.size() > _max_2d_size) {
								_max_2d_size = subarray.values.size();
							}
						}

						// Generate the code
						statement.add(indent + "_NEW_2DARRAY_int64_t_EMPTY(" + lhs + ", " + _1d_size + ", "
								+ _max_2d_size + ");");

						// Assign the value to each sub-array
						// {
						// int64_t tmp[] = {49, 99};
						// memcpy(_21[0], tmp, 2*sizeof(int64_t));
						// }
						String s = "";
						for (int i = 0; i < list.values.size(); i++) {
							ArrayList<Constant> subitem = (((Constant.Array) list.values.get(i))).values;
							// ArrayList<String> subarray = new ArrayList<String>();
							// Generate the code
							s += indent + "{\n" + indent + "\tint64_t tmp[] = {";
							int sub_index = 0;
							boolean isFirst = true;
							// Get the array size and convert the array to a string, e.g. {49, 99};
							while (sub_index < _max_2d_size) {
								if (isFirst == false) {
									s += ", "; // Add the comma (',') to separate each item
								}
								// Get each item. If no item is found, add '\0'
								if (sub_index < subitem.size()) {
									s += subitem.get(sub_index).toString();
								} else {
									// Add '\0' char to subarray so each subarray has the same length
									s += "\'\\0\'";
								}
								sub_index++;
								isFirst = false;
							}
							s += "};\n";

							// Copy the subarray to lhs array, e.g. memcpy(_21[0], tmp, 2*sizeof(int64_t));
							s += indent + "\tmemcpy(" + lhs + "[" + i + "], tmp, " + _max_2d_size
									+ "*sizeof(int64_t));\n";
							s += indent + "}\n";
						}
						statement.add(s);

					}
				}
			} else {
				// Add a statement
				statement.add(indent + lhs + " = " + constant + ";");
			}
		}

		// Compute the deallocation flag
		postDealloc(statement, code, function);

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
			// Special case for the assignment of int[]|null
			if (stores.isIntArrayOrAliasedType(lhs_type)) {
				if (isCopyEliminated) {
					// Have in-place update
					return indent + "_UPDATE_1DARRAY(" + lhs + ", " + rhs + ");";
				} else {
					return indent + "_COPY_1DARRAY_int64_t(" + lhs + ", " + rhs + ");";
				}
			}

			// Special case for the assignment of integer pointers
			if (lhs_type instanceof Type.Union && rhs_type instanceof Type.Union) {

				if (isCopyEliminated) {
					// Update lhs with rhs
					return indent + lhs + " = " + rhs + ";";
				} else {
					// Use '_NEW_INTEGER_POINTER' macro to copy an integer typed structures
					return indent + "_NEW_INTEGER_POINTER(" + lhs + ", " + rhs + ");";
				}
			}

			// Special case of casting an integer pointer to an integer
			if (lhs_type instanceof Type.Int && rhs_type instanceof Type.Union) {
				// Cast an integer pointer to integer, e.g. 'size = *i'
				return indent + lhs + " = *" + rhs + ";";
			}

			// Update lhs with rhs
			return indent + lhs + " = " + rhs + ";";

		}

		if (lhs_type instanceof Type.Array) {
			int dimension = stores.getArrayDimension(lhs_type);
			// Get element type
			Type elm_type = stores.getArrayElementType((Type.Array) lhs_type);

			// Special case of BYTE array
			if (elm_type instanceof Type.Byte) {
				// Check if the lhs copy is needed or not
				if (isCopyEliminated) {
					// Have in-place update
					return indent + "_UPDATE_" + dimension + "DARRAY(" + lhs + ", " + rhs + ");";
				} else {
					// Have a copied assignment
					return indent + "_COPY_" + dimension + "DARRAY_BYTE(" + lhs + ", " + rhs + ");";
				}
			} else if (stores.isIntType(elm_type)) {
				// Check if the lhs copy is needed or not
				if (isCopyEliminated) {
					return indent + "_UPDATE_" + dimension + "DARRAY(" + lhs + ", " + rhs + ");";
				} else {
					if (boundAnalyzer.isPresent() && dimension == 1) {
						String translateType = boundAnalyzer.get().suggestIntegerType(code.target(0), function);
						return indent + "_COPY_1DARRAY(" + lhs + ", " + rhs + ", " + translateType + ");";
					} else {
						return indent + "_COPY_" + dimension + "DARRAY_int64_t(" + lhs + ", " + rhs + ");";
					}
				}
			} else {
				String struct = CodeGeneratorHelper.translateType(elm_type, stores).replace("*", "");
				// An array of structure pointers
				if (isCopyEliminated) {
					// Have an in-place update
					return indent + "_UPDATE_1DARRAY(" + lhs + ", " + rhs + ");";
				} else {
					// Copy an array of structures
					return indent + "_COPY_1DARRAY_STRUCT(" + lhs + ", " + rhs + ", " + struct + ");";
				}
			}
		} else if (stores.isIntArrayOrAliasedType(lhs_type)) {
			// The type is alised to an integer array, e.g. string
			if (isCopyEliminated) {
				return indent + "_UPDATE_1DARRAY(" + lhs + ", " + rhs + ");";
			} else {
				return indent + "_COPY_1DARRAY_int64_t(" + lhs + ", " + rhs + ");";
			}
		} else {
			// Structure type
			if (isCopyEliminated) {
				return indent + lhs + " = " + rhs + ";";
			} else {
				return indent + lhs + " = copy_" + CodeGeneratorHelper.translateType(lhs_type, stores).replace("*", "")
						+ "(" + rhs + ");";
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
		String lhs = stores.getVar(code.target(0), function);
		// Get the actual type for lhs variable.
		String indent = stores.getIndent(function);
		Type lhs_type = stores.getRawType(code.target(0), function);
		String rhs = stores.getVar(code.operand(0), function);
		// The type of file reader is NULL
		if (lhs_type == null || lhs_type instanceof Type.Null) {
			statement.add(indent + lhs + " = " + rhs + ";");
		} else if (lhs_type instanceof Type.Nominal && ((Type.Nominal) lhs_type).name().name().equals("Reader")
				&& ((Type.Nominal) lhs_type).name().name().equals("Writer")) {
			// Special case for File read/write
			// Have in-place update
			statement.add(indent + lhs + " = " + rhs + ";");
		} else if (lhs_type instanceof Type.Function) {
			statement.add(indent + declareLambda(lhs, (Type.Function) lhs_type) + ";");
			// Point lhs to lambda function.
			statement.add(indent + lhs + " = " + rhs + ";");
		} else {
			boolean isCopyEliminated = isCopyEliminated(code.operand(0), 0, code, function);
			// Add copy analysis result as a comment.
			if (this.copyAnalyzer.isPresent()) {
				statement.add(indent + "// isCopyEliminated = " + isCopyEliminated);
			}

			if (this.deallocatedAnalyzer.isPresent() && lhs_type instanceof Type.Array) {
				// Get element type
				Type elm_type = stores.getArrayElementType((Type.Array) lhs_type);
				int dimension = stores.getArrayDimension(lhs_type);
				if (dimension == 1 && (elm_type instanceof Type.Byte || stores.isIntType(elm_type))) {
					// For one dimensional array variable of integer/BYTE type
					// we can use macro directly without any pre-processing.
				} else {
					// For two dimensional array or structures we generate the statements separately.
					// Deallocate lhs register
					this.deallocatedAnalyzer.ifPresent(a -> {
						statement.add(indent + a.preDealloc(lhs, lhs_type, stores));
					});
					// statement.add(indent + "_DEALLOC("+ lhs+ ");");
					statement.add(generateAssignmentCode(code, isCopyEliminated, function, stores));
				}
			} else {
				// Deallocate lhs register
				this.deallocatedAnalyzer.ifPresent(a -> {
					statement.add(indent + a.preDealloc(lhs, lhs_type, stores));
				});
				statement.add(generateAssignmentCode(code, isCopyEliminated, function, stores));
			}

			if (isCopyEliminated && stores.isCompoundType(lhs_type)) {
				// Check if lhs is a substructure.
				stores.addSubStructure(code.target(0), code.operand(0), function);
			}

			// Update the set with rhs variable
			// this.copyAnalyzer.ifPresent(a -> a.updateSet(isCopyEliminated, code.operand(0), code, function));

			// Add the post-deallocation code
			this.deallocatedAnalyzer.ifPresent(
					a -> a.postDealloc(isCopyEliminated, code.operand(0), statement, code, function, stores));
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
	 * When the bound analysis is enabled and any of the operands has infinite bounds, then add overflow checks
	 * Currently, the checks supports only three overflows (add, sub, mul)
	 * 
	 * @param code
	 */
	protected void translate(Codes.BinaryOperator code, FunctionOrMethod function) {
		List<String> statement = new ArrayList<String>();
		String indent = stores.getIndent(function);
		// Get the variable name
		String res = stores.getVar(code.target(0), function);
		String op1 = stores.getVar(code.operand(0), function);
		String op2 = stores.getVar(code.operand(1), function);

		// Add extra overflow check
		if (this.boundAnalyzer.isPresent()) {
			this.boundAnalyzer.ifPresent(analyser -> {
				// Get Domain of left and two right operands
				Domain left = analyser.getInferredDomain(code.target(0), function);
				Domain right1 = analyser.getInferredDomain(code.operand(0), function);
				Domain right2 = analyser.getInferredDomain(code.operand(1), function);
				// If any operand is un-bounded, then add overflow checking
				if (left.isUnbound() || right1.isUnbound() || right2.isUnbound()) {
					switch (code.kind) {
						case ADD :
							statement.add(indent + "_DETECT_INT_ADD_OVERFLOW(" + op1 + "," + op2 + "," + res + ");");
							break;
						case SUB :
							statement.add(indent + "_DETECT_INT_SUB_OVERFLOW(" + op1 + "," + op2 + "," + res + ");");
							break;
						case MUL :
							statement.add(indent + "_DETECT_INT_MUL_OVERFLOW(" + op1 + "," + op2 + "," + res + ");");
							break;
						default :
							// Do nothing
							break;
					}
				} else {
					switch (code.kind) {
						case ADD :
							statement.add(indent + res + " = " + op1 + " + " + op2 + ";");
							break;
						case SUB :
							statement.add(indent + res + " = " + op1 + " - " + op2 + ";");
							break;
						case MUL :
							statement.add(indent + res + " = " + op1 + " * " + op2 + ";");
							break;
						case DIV :
							statement.add(indent + res + " = " + op1 + " / " + op2 + ";");
							break;
						case REM :
							statement.add(indent + res + " = " + op1 + " % " + op2 + ";");
							break;
						default :
							// Do nothing
							break;
					}
				}
			});
		} else {
			// Translate the arithmetic operation
			String stat = indent + res + "=" + op1;
			switch (code.kind) {
				case ADD :
					stat += "+" + op2 + ";";
					break;
				case SUB :
					stat += "-" + op2 + ";";
					break;
				case MUL :
					stat += "*" + op2 + ";";
					break;
				case DIV :
					stat += "/" + op2 + ";";
					break;
				case REM :
					stat += "%" + op2 + ";";
					break;
				case BITWISEOR :
					break;
				case BITWISEXOR :
					break;
				case BITWISEAND :
					break;
				case LEFTSHIFT :
					break;
				case RIGHTSHIFT :
					break;
			}
			statement.add(stat);
		}

		// Add the generated code
		stores.addAllStatements(code, statement, function);
	}

	/**
	 * Checks if the copy of given register is needed or not, based on liveness information.
	 * 
	 * @param register
	 * @param code
	 * @param function
	 * @return
	 */
	private boolean isCopyEliminated(int register, int pos, Code code, FunctionOrMethod function) {
		if (this.copyAnalyzer.isPresent()) {
			return this.copyAnalyzer.get().isCopyEliminated(register, pos, code, function);
		}

		return false;
	}

	/**
	 * Check the copy of each function parameter. If the copy is needed, then generate local temporary variable to
	 * reference the copied parameter. For example, 'a = func(b)' can be translated into c code:
	 * 
	 * <pre>
	 * <code>
	 * {
	 * 		void* b_tmp; // local block variable
	 * 		a = func(b_tmp=copy(b));
	 * }
	 * </code>
	 * </pre>
	 * 
	 * @param code
	 * @param function
	 * @return a HashMap of parameters whose copy can be safely reduced.
	 */
	private LinkedHashMap<Integer, Boolean> translatePreFunctionCall(List<String> statements, Codes.Invoke code,
			FunctionOrMethod function) {
		String indent = stores.getIndent(function);
		// Create a array to store the parameter whose parameter can be reduced.
		LinkedHashMap<Integer, Boolean> copyReducedList = new LinkedHashMap<Integer, Boolean>();
		int index = 0;
		for (int operand : code.operands()) {
			String param = stores.getVar(operand, function);
			Type param_type = stores.getRawType(operand, function);
			// Check if the parameter is an array or structure
			if (stores.isCompoundType(param_type)) {
				// Check if the copy of parameter
				boolean isCopyEliminated = isCopyEliminated(operand, index, code, function);
				// Put the copy analysis results to hashmap
				copyReducedList.put(index, isCopyEliminated);
				// For copied parameter, we generate extra code to make an array copy
				if (!isCopyEliminated) {
					// Generate the temporary block variable to store the copied parameter
					String tmp_name = stores.getTmpParamName(param, index, code, function);
					// Declare the temporary variable
					statements.add(indent + "void* " + tmp_name + ";");
					if (stores.isIntArrayOrAliasedType(param_type)) {
						Type elm = stores.getArrayElementType(param_type);
						int dimension = stores.getArrayDimension(param_type);
						// Make the copy
						if (elm instanceof Type.Byte) {
							if (dimension == 1) {
								// Copy 1D array of 64-bit integers
								statements.add(indent + "_COPY_1DARRAY_PARAM(" + param + ", " + tmp_name + ", BYTE);");
							}
						} else if (stores.isIntType(elm)) {
							if (boundAnalyzer.isPresent() && dimension == 1) {
								String translateType = boundAnalyzer.get().suggestIntegerType(code.target(0), function);
								// Make a copy before the function call
								statements.add(indent + "_COPY_1DARRAY_PARAM(" + param + ", " + tmp_name + ", "
										+ translateType + ");");
							} else {
								if (dimension == 1) {
									// Copy 1D array of 64-bit integers
									statements.add(
											indent + "_COPY_1DARRAY_PARAM(" + param + ", " + tmp_name + ", int64_t);");
								} else if (dimension == 2) {
									// Copy 2D array of 64-bit integers
									statements.add(
											indent + "_COPY_2DARRAY_PARAM_int64_t(" + param + ", " + tmp_name + ");");
								} else {
									throw new RuntimeException("Not implemented");
								}

							}

						} else {
							String elm_type = CodeGeneratorHelper.translateType(elm, stores).replace("*", "");
							// Copy the array of structures and pass it as a function parameter
							statements.add(indent + "_COPY_1DARRAY_PARAM_STRUCT" + "(" + param + ", " + tmp_name + ", "
									+ elm_type + ")");
						}
					} else if (param_type instanceof Type.Record || param_type instanceof Type.Nominal
							|| param_type instanceof Type.Union) {
						// Add copy analysis result as a comment.
						if (this.copyAnalyzer.isPresent()) {
							statements.add(
									indent + "// isCopyEliminated of '" + prefix + operand + "' = " + isCopyEliminated);
						}

						if (!isCopyEliminated) {
							// Temporary variable is used to reference the extra copy of parameter
							String type_name = CodeGeneratorHelper.translateType(param_type, stores).replace("*", "");
							statements.add(indent + tmp_name + " = copy_" + type_name + "(" + param + ");");
						}
					}

				}
			}
			index++;
		}

		// De-allocate lhs register
		translateLHSVarFunctionCall(statements, code, function);

		return copyReducedList;
	}

	/**
	 * Translate the rhs of a function call
	 * 
	 * @param code
	 * @param f
	 * @return
	 */
	private void translateActualFunctionCall(LinkedHashMap<Integer, Boolean> copyEliminatedMap, List<String> statements,
			Codes.Invoke code, FunctionOrMethod function) {
		String indent = stores.getIndent(function);
		String function_return = indent + "";
		// Translate the function return
		if (code.targets().length > 0) {
			String lhs = stores.getVar(code.target(0), function);
			function_return += lhs + " = ";
		}
		// Translate the right hand side of a function call
		// Go through each parameter and generate the function call statement, e.g. func(a, b)
		List<String> parameters = new ArrayList<String>();
		int index = 0;
		for (int operand : code.operands()) {
			// Get parameter name
			String parameter = stores.getVar(operand, function);
			Type parameter_type = stores.getRawType(operand, function);
			if (parameter_type instanceof Type.Nominal
					&& ((Type.Nominal) parameter_type).name().name().equals("Console")) {
				parameters.add("stdout");
			} else if (parameter_type instanceof Type.Byte) {
				parameters.add(parameter);
			} else if (stores.isIntType(parameter_type)) {
				parameters.add(parameter);
			} else if (stores.isIntArrayOrAliasedType(parameter_type)) {
				// Check if the copy of function argument is needed or not And then generate the corresponding code
				Type elm = stores.getArrayElementType(parameter_type);
				int dimension = stores.getArrayDimension(parameter_type);
				// Check if the copy of parameter can be eliminated by copy analysis
				boolean isCopyEliminated = false;
				if (copyEliminatedMap.containsKey(index)) {
					isCopyEliminated = copyEliminatedMap.get(index);
				}
				// Add copy analysis result as a comment.
				if (this.copyAnalyzer.isPresent()) {
					statements.add(indent + "// isCopyEliminated of '" + parameter + " at " + index + "' = "
							+ isCopyEliminated);
				}
				if (isCopyEliminated) {
					parameters.add(parameter + ", " + parameter + "_size");
					// Extra size variable for 2D array
					if (dimension == 2) {
						parameters.add(parameter + "_size_size");
					}
				} else {
					// Get temporary variable
					String copied_param_name = stores.getTmpParamName(parameter, index, code, function);
					// Copy is made
					if (stores.isIntType(elm) || elm instanceof Type.Byte) {
						// Pass the name of temporary parameter to a function call with
						parameters.add(copied_param_name + ", " + parameter + "_size");
						// Extra size variable for 2D array
						if (dimension == 2) {
							parameters.add(parameter + "_size_size");
						}
					} else {
						// Copy an array of structures and Passed copied parameter to called function
						parameters.add(copied_param_name + ", " + parameter + "_size");
					}
				}
			} else if (parameter_type instanceof Type.Record || parameter_type instanceof Type.Nominal
					|| parameter_type instanceof Type.Union) {
				// Check if the copy of parameter can be eliminated by copy analysis
				boolean isCopyEliminated = false;
				if (copyEliminatedMap.containsKey(index)) {
					isCopyEliminated = copyEliminatedMap.get(index);
				}
				// Add copy analysis result as a comment.
				if (this.copyAnalyzer.isPresent()) {
					statements.add(indent + "// isCopyEliminated of '" + parameter + "' at " + index + " = "
							+ isCopyEliminated);
				}
				if (isCopyEliminated) {
					parameters.add(parameter);
				} else {
					// Temporary variable is used to reference the extra copy of parameter
					String copied_param_name = stores.getTmpParamName(parameter, index, code, function);
					// Pass the tmp variable to function call
					parameters.add(copied_param_name);
				}
			} else {
				throw new RuntimeException("Not Implemented");
			}
			index++;
		}

		// Add extra call-by-ref size parameter for output array
		if (code.targets().length > 0) {
			// Get the return type
			Type ret_type = stores.getRawType(code.target(0), function);
			// Check if the return is an array
			if (ret_type instanceof Type.Array || stores.isIntArrayOrAliasedType(ret_type)) {
				// Get array dimension
				int dimension = stores.getArrayDimension(ret_type);
				// Get return variable
				String ret_var = stores.getVar(code.target(0), function);
				// Pass the call-by-ref size variable to the function call
				parameters.add("_" + dimension + "DARRAYSIZE_PARAM_CALLBYREFERENCE(" + ret_var + ")");
			}
		}

		// Separate each parameter with ',' sign
		String rhs = parameters.stream().filter(s -> !s.equals("")).map(s -> s.toString())
				.collect(Collectors.joining(", "));

		// Get the invoked function name
		String func_name = stores.getFunctionName(code);

		// Combine lhs and rhs to the statement
		// statements.add(function_return + code.name.name() + "(" + rhs + ");");
		statements.add(function_return + func_name + "(" + rhs + ");");

	}

	/**
	 * Added de-allocation code to release the memory of lhs register
	 * 
	 * @param statement
	 * @param code
	 * @param function
	 * @return lhs variable
	 */
	private String translateLHSVarFunctionCall(List<String> statement, Code code, FunctionOrMethod function) {

		String indent = stores.getIndent(function);
		if (code instanceof Codes.Update) {
			// Update bytecode 'update %0.queens[%1] = %32'
			Codes.Update update = (Codes.Update) code;
			// Get array variable, e.g. a[i]
			String lhs = stores.getVar(update.target(0), function);
			// Get lhs type
			Type struct_type = stores.getRawType(update.target(0), function);
			if (struct_type instanceof Type.Array || stores.isIntArrayOrAliasedType(struct_type)) {
				// Iterates operands to increase the depths.
				for (int i = 0; i < update.operands().length - 1; i++) {
					lhs += "[" + stores.getVar(update.operand(i), function) + "]";
				}
			} else if (struct_type instanceof Type.Record || struct_type instanceof Type.Union) {
				String member = update.fields.get(0);
				lhs += "->" + member;
				// check if there are two or more operands. If so, then add
				// 'index' operand.
				if (update.operands().length > 1) {
					lhs += "[" + stores.getVar(update.operand(0), function) + "]";
				}
			} else {
				// throw new RuntimeException("Not implemented" + code);
			}

			final String lhs_var = lhs;
			// If the code type is deallocation only, then we generated the preDealloc macro to release the lhs
			// Deallocate lhs register
			this.deallocatedAnalyzer.ifPresent(a -> {
				statement.add(indent + a.preDealloc(lhs_var, update, function, stores));
			});

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
				// Copy and deallocation analysers are both enabled
				if (this.copyAnalyzer.isPresent() && this.deallocatedAnalyzer.isPresent()
						&& type instanceof Type.Array) {
					// Then we can avoid generating PRE_DEALLOC macro
					return lhs;
				}
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
				} else {
					lhs = null;
				}

				// If the code type is a function call, then when the copy and deallocation macros are both enabled,
				// then we do not need to generate the preDealloc macro to release the lhs of the function return
				// if(this.copyAnalyzer.isPresent() && this.deallocatedAnalyzer.isPresent()) {
				// return lhs;
				// }
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

			final Type lhs_type = type;

			// Deallocate lhs register
			this.deallocatedAnalyzer.ifPresent(a -> {
				statement.add(indent + a.preDealloc(lhs, lhs_type, stores));
			});

			return lhs;
		}

	}

	/**
	 * Add post-deallocation code.
	 * 
	 * @param statement
	 * @param code
	 * @param function
	 */
	private void postDealloc(List<String> statement, Code code, FunctionOrMethod function) {

		// Add the post-deallocation code.
		this.deallocatedAnalyzer.ifPresent(a -> {
			a.postDealloc(statement, code, function, stores);
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
		List<String> statements = new ArrayList<String>();
		// Add the starting clause for the function call
		statements.add(stores.getIndent(function) + "{");
		// Increase the indent
		stores.increaseIndent(function);

		String indent = stores.getIndent(function);
		String module = code.name.module().toString();
		// Translate built-in Whiley functions using macros.
		if (module.contains("whiley/lang")) {
			String lhs = stores.getVar(code.target(0), function);
			String rhs = stores.getVar(code.operand(0), function);
			switch (code.name.name()) {
				case "parse" :
					// Parse a string into an integer.
					statements.add(indent + "_STR_TO_INT(" + lhs + ", " + rhs + ");");
					if (this.deallocatedAnalyzer.isPresent()) {
						// remove the flag from rhs variable
						statements.add(indent + rhs + "_dealloc = false;");
					}
					break;
				case "abs" :
					// Use 'llabs' function to return the absolute value of 'rhs'
					// because the rhs is a int64_t integer.
					statements.add(indent + lhs + " = abs(" + rhs + ");");
					break;
				case "min" :
					String rhs1 = stores.getVar(code.operand(1), function);
					statements.add(indent + lhs + " = min(" + rhs + ", " + rhs1 + ");");
					break;
				case "max" :
					rhs1 = stores.getVar(code.operand(1), function);
					statements.add(indent + lhs + " = max(" + rhs + ", " + rhs1 + ");");
					break;
				case "toUnsignedByte" :
					// Convert an integer to byte
					statements.add(indent + lhs + " = (BYTE)" + rhs + ";");
					break;
				case "fromBytes" :
					if (this.deallocatedAnalyzer.isPresent()) {
						// PRE_DEALLOC macro is used to free lhs variable before function call.
						statements.add(indent + "_DEALLOC(" + lhs + ");");
					}
					statements.add(indent + lhs + " = fromBytes(" + rhs + ", " + rhs + "_size);");
					// Propagate the size variable
					statements.add(indent + lhs + "_size = " + rhs + "_size;");
					if (this.deallocatedAnalyzer.isPresent()) {
						// Specify the flag to lhs var
						statements.add(indent + lhs + "_dealloc = true;");
					}
					break;
				case "toUnsignedInt" :
					// Convert a byte to integer
					statements.add(indent + lhs + " = (unsigned int)" + rhs + ";");
					break;
				case "toInt" :
					// Convert a byte to integer
					statements.add(indent + lhs + " = (int)" + rhs + ";");
					break;
				case "toByte" :
					// Convert an integer to a byte
					statements.add(indent + lhs + " = (BYTE)" + rhs + ";");
					break;
				case "toString" :
					if (this.deallocatedAnalyzer.isPresent()) {
						// PRE_DEALLOC macro is used to free lhs variable before function call.
						statements.add(indent + "_DEALLOC(" + lhs + ");");
					}
					// Convert an integer to a string (an integer array of ASCII code)
					// Call WyRT built-in 'InttoString' function
					statements.add(indent + lhs + " = Int_toString(" + rhs + ", _1DARRAYSIZE_PARAM_CALLBYREFERENCE("
							+ lhs + "));");
					if (this.deallocatedAnalyzer.isPresent()) {
						// Specify the flag to lhs var
						statements.add(indent + lhs + "_dealloc = true;");
					}
					break;
				// Slice an array into a new sub-array at given starting and ending index.
				case "slice" :
					// Extract lhs variable and free the variable (if de-allocation analysis enabled)
					lhs = translateLHSVarFunctionCall(statements, code, function);
					// Call the 'slice' function.
					String array = stores.getVar(code.operand(0), function);
					String start = stores.getVar(code.operand(1), function);
					String end = stores.getVar(code.operand(2), function);
					statements.add("_SLICE_ARRAY(" + lhs + ", " + array + ", " + start + ", " + end + ");");
					if (this.deallocatedAnalyzer.isPresent()) {
						// Specify the flag to lhs var
						statements.add(indent + lhs + "_dealloc = true;");
					}
					break;
				case "append" :
					if (this.deallocatedAnalyzer.isPresent()) {
						// PRE_DEALLOC macro is used to free lhs variable before function call.
						statements.add(indent + "_DEALLOC(" + lhs + ");");
					}
					// Append an array to another array, e.g. 'invoke (%13) = (%2, %14) whiley/lang/Array:append'
					String rhs_arr = stores.getVar(code.operand(0), function);
					String rhs1_arr = stores.getVar(code.operand(1), function);
					// Call built-in ArrayAppend function in WyRT.c
					statements.add(indent + lhs + " = Array_Append(" + rhs_arr + ", " + rhs_arr + "_size , " + rhs1_arr
							+ ", " + rhs1_arr + "_size, " + "_1DARRAYSIZE_PARAM_CALLBYREFERENCE(" + lhs + "));");
					if (this.deallocatedAnalyzer.isPresent()) {
						// Specify the flag to lhs var
						statements.add(indent + lhs + "_dealloc = true;");
					}
					break;
				default :
					throw new RuntimeException("Un-implemented code:" + code);
			}

			// this.deallocatedAnalyzer.ifPresent(a -> {
			// statements.addAll(a.postDealloc(code, function, stores, copyAnalyzer));
			// });
		} else if (module.contains("whiley/io")) {
			String lhs = stores.getVar(code.target(0), function);
			String rhs = stores.getVar(code.operand(0), function);
			switch (code.name.name()) {
				case "Reader" :
					// Read a file name (an array of ASCII code) and output an file pointer
					statements.add(indent + lhs + " = Reader(" + rhs + ", " + rhs + "_size);");
					break;
				case "Writer" :
					// Open a file to write the byte array
					statements.add(indent + lhs + " = Writer(" + rhs + ", " + rhs + "_size);");
					break;
				default :
					throw new RuntimeException("Un-implemented code:" + code);
			}
		} else {

			// Check if the copy of parameter is needed, and store all the results to
			// HashMap(key: parameter index, value: isCopyEliminated)
			LinkedHashMap<Integer, Boolean> copyEliminatedMap = translatePreFunctionCall(statements, code, function);

			// call the function/method, e.g. '_12=reverse(_xs , _xs_size);'
			translateActualFunctionCall(copyEliminatedMap, statements, code, function);

			// Generate the post-deallocation code
			this.deallocatedAnalyzer.ifPresent(a -> {
				statements.addAll(a.postDeallocV2(code, function, stores, copyAnalyzer));
			});
		}

		// Decrease the indent
		stores.decreaseIndent(function);

		// Add the ending clause for the function call
		statements.add(stores.getIndent(function) + "}");

		// Reorder the code to make them consistent with our macro design
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < statements.size(); i++) {
			String statement = statements.get(i);
			// Move function call pre macro to the first position
			if (statement.matches(".*(\\_[A-Z]+\\_PRE\\().*")) {
				list.add(1, statement); // Move the PRE macro
			} else if (statement.contains("_DEALLOC(")) {
				// Move PREDEALLOC macro to the first position.
				list.add(1, statement);
			} else {
				list.add(statement);
			}
		}

		// add the statement
		stores.addAllStatements(code, list, function);
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
				case EQ :
					return "!=";
				case NEQ :
					return "==";
				case LT :
					return ">=";
				case LTEQ :
					return ">";
				case GT :
					return "<=";
				case GTEQ :
					return "<";
				default :
					return null;
			}
		} else {
			// The condition
			switch (op) {
				case EQ :
					return "==";
				case NEQ :
					return "!=";
				case LT :
					return "<";
				case LTEQ :
					return "<=";
				case GT :
					return ">";
				case GTEQ :
					return ">=";
				default :
					return null;
			}
		}

	}

	/**
	 * Generates the code for <code>Codes.If</code> code. For example, For example, the byte-code:
	 * <code> ifeq %1, %38 goto blklab2 : [int]</code> can be translated into C code:
	 * <code>_IFEQ_ARRAY_int64_t(_1, _38, blklab2);</code>
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
		if (code.type(0) instanceof Type.Array && code.op.equals(Comparator.EQ)) {
			// Get array element type
			Type elem_type = stores.getArrayElementType((Type.Array) code.type(0));
			// Compare two arrays
			if (elem_type instanceof Type.Byte) {
				// Use the '_IFEQ_ARRAY_int64_t' macro to compare two arrays of integers
				statement.add(indent + "_IFEQ_ARRAY_BYTE(" + lhs + ", " + rhs + ", " + code.target + ");");
			} else if (stores.isIntType(elem_type)) {
				// Use the '_IFEQ_ARRAY_int64_t' macro to compare two arrays of integers
				statement.add(indent + "_IFEQ_ARRAY_int64_t(" + lhs + ", " + rhs + ", " + code.target + ");");
			} else {
				throw new RuntimeException("Not implemented");
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
	 * Translates the update byte-code into C code, and removes the deallocation flag of rhs variable (a[i] = b;
	 * b_dealloc = false;) For example,
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
		String lhs = translateLHSVarFunctionCall(statement, code, function);

		// Generate update statement, e.g. a[i] = b
		boolean isCopyEliminated = isCopyEliminated(code.operand(0), 0, code, function);
		statement.add(indent + lhs + " = " + stores.getVar(code.result(), function) + ";");

		// Update the set with rhs variable
		copyAnalyzer.ifPresent(a -> a.updateSet(isCopyEliminated, code.operand(0), code, function));

		this.deallocatedAnalyzer
				.ifPresent(a -> a.postDealloc(isCopyEliminated, code.operand(0), statement, code, function, stores));

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
			// Generate return statement for a function
			if (code.operands().length > 0) {
				// Add the code to deallocate all variables.
				this.deallocatedAnalyzer.ifPresent(a -> {
					statements.addAll(a.preDealloc(code, function, stores));
				});

				// Get return variable
				String ret_var = stores.getVar(code.operand(0), function);

				// Get the return type
				Type ret_type = stores.getRawType(code.operand(0), function);
				if (stores.isIntArrayOrAliasedType(ret_type)) {
					// Type.Array arr_type = (Type.Array)ret_type;
					// Get the array dimension
					int dimension = stores.getArrayDimension(ret_type);
					// Propagate the size of output array to passing call-by-reference parameter
					statements.add(
							indent + "_UPDATE_" + dimension + "DARRAYSZIE_PARAM_CALLBYREFERENCE(" + ret_var + ");");
				}

				statements.add(indent + "return " + ret_var + ";");
			}
		} else {
			// Generate exit statement for a method
			if (function.name().equals("main")) {
				// Add the code to deallocate all variables.
				this.deallocatedAnalyzer.ifPresent(a -> {
					statements.addAll(a.preDealloc(code, function, stores));
				});
				// Add 'exit(0);'
				statements.add(indent + "exit(0);");
			} else {
				// Check if the return type matches with method declaration
				if (function.type().returns().size() == code.operands().length) {
					// Add the code to deallocate all variables.
					this.deallocatedAnalyzer.ifPresent(a -> {
						statements.addAll(a.preDealloc(code, function, stores));
					});
					if (code.operands().length == 0) {
						statements.add(indent + "return;");
					} else if (code.operands().length == 1) {
						// Get return variable
						String ret_var = stores.getVar(code.operand(0), function);
						// Get the return type
						Type ret_type = stores.getRawType(code.operand(0), function);
						if (stores.isIntArrayOrAliasedType(ret_type)) {
							// Type.Array arr_type = (Type.Array)ret_type;
							// Get the array dimension
							int dimension = stores.getArrayDimension(ret_type);
							// Propagate the size of output array to passing call-by-reference parameter
							statements.add(indent + "_UPDATE_" + dimension + "DARRAYSZIE_PARAM_CALLBYREFERENCE("
									+ ret_var + ");");
						}
						statements.add(indent + "return " + ret_var + ";");
					} else {
						throw new RuntimeException("Not implemented for return statement in a method");
					}
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

		// Check if lhs is a structure. If so, then lhs is a substructure
		Type lhs_type = stores.getRawType(code.target(0), function);
		if (stores.isCompoundType(lhs_type)) {
			// Check if the lhs_type is an array
			if (lhs_type instanceof Type.Array) {
				// Update the array size at left-handed size
				statement.add(indent + lhs + "_size = " + rhs + "_size_size;");
			}

			// Add lhs to substructure set
			stores.addSubStructure(code.target(0), function);
		}

		postDealloc(statement, code, function);

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
	 * _NEW_1DARRAY_int64_t(_10, 9, 0);
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
		translateLHSVarFunctionCall(statement, code, function);
		String indent = stores.getIndent(function);
		// Get array names
		String lhs = stores.getVar(code.target(0), function);
		int length = code.operands().length;
		if (length > 0) {
			// Check the array element type
			Type elm_type = code.type(0).element();
			// Create the array using '_NEW' macro
			if (elm_type instanceof Type.Byte) {
				statement.add(indent + "_NEW_1DARRAY_BYTE(" + lhs + ", " + length + ", 0b0);");
			} else if (elm_type instanceof Type.Int) {
				statement.add(indent + "_NEW_1DARRAY_int64_t(" + lhs + ", " + length + ", 0);");
			} else {
				throw new RuntimeException("Not implemented");
			}

			String s = indent;
			// Initialize the array
			for (int i = 0; i < code.operands().length; i++) {
				s += lhs + "[" + i + "] = " + stores.getVar(code.operand(i), function) + "; ";
			}
			statement.add(s);
		}

		postDealloc(statement, code, function);

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

		if (field.equals("out") || field.equals("print") || field.equals("println") || field.equals("print_s")
				|| field.equals("println_s")) {
			// Load the field to the target register.
			stores.loadField(code.target(0), field, function);
		} else if (field.equals("readAll") || field.equals("write") || field.equals("close")) {
			// Get file pointer
			String fileptr = stores.getVar(code.operand(0), function);
			// Load the field and file pointer to the target register.
			stores.loadField(code.target(0), field + ":" + fileptr, function);
		} else {
			// Free lhs variable
			translateLHSVarFunctionCall(statement, code, function);
			boolean isCopyEliminated;// The copy is NOT needed by default.
			if (field.equals("args")) {
				String var_name = stores.getVar(code.target(0), function);
				stores.aliasCmdArgument(var_name);
				// Convert the arguments into an array of integer array (int64_t**).
				statement.add(stores.getIndent(function) + "_CONV_ARGS(" + var_name + ");");
				isCopyEliminated = false;
			} else {
				Type lhs_type = stores.getRawType(code.target(0), function);
				String rhs = stores.getVar(code.operand(0), function) + "->" + code.field;
				isCopyEliminated = true;
				// isCopyEliminated = isCopyEliminated(code.operand(0), code, function);
				// Generate copy/uncopy assignment code
				statement.addAll(CodeGeneratorHelper.generateAssignmentCode(lhs_type, stores.getIndent(function),
						stores.getVar(code.target(0), function), rhs, isCopyEliminated, stores));
			}

			// Update the set with rhs variable
			this.copyAnalyzer.ifPresent(a -> a.updateSet(isCopyEliminated, code.operand(0), code, function));

			// Add the post-deallocation code
			this.deallocatedAnalyzer.ifPresent(
					a -> a.postDealloc(isCopyEliminated, code.operand(0), statement, code, function, stores));
			// Load the field to the target register.
			stores.loadField(code.target(0), field, function);
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

		// Add the starting clause for the function call
		statement.add(stores.getIndent(function) + "{");
		// Increase the indent
		stores.increaseIndent(function);
		String indent = stores.getIndent(function);
		if (code.type(0) instanceof Type.Function) {
			// Get the lambda expression
			String lhs = stores.getVar(code.target(0), function);
			String rhs = stores.getVar(code.operand(0), function);
			String parameter = stores.getVar(code.operand(1), function);
			statement.add(indent + lhs + " = " + rhs + "(" + parameter + ");");
		} else if (code.type(0) instanceof Type.Method) {
			// Get the function name, e.g. 'printf'.
			String func_name = stores.getField(code.operand(0), function);
			// Get the input
			String input = null;
			Type input_type = null;
			if (func_name.contains("print")) {
				input = stores.getVar(code.operand(1), function);
				input_type = stores.getRawType(code.operand(1), function);
				switch (func_name) {
					case "print" :
						statement.add(indent + "printf(\"" + "%\"PRId64, " + input + ");");
						break;
					case "print_s" :
						if (boundAnalyzer.isPresent()) {
							statement.add(indent + "_PRINT_STR(" + input + ");");
						} else {
							statement.add(indent + "printf_s(" + input + ", " + input + "_size);");
						}
						break;
					case "println_s" :
						if (boundAnalyzer.isPresent()) {
							statement.add(indent + "_PRINTLN_STR(" + input + ");");
						} else {
							statement.add(indent + "println_s(" + input + ", " + input + "_size);");
						}
						break;
					case "println" :
						// Check input's type to call different println function.
						if (input_type instanceof Type.Int) {
							if (boundAnalyzer.isPresent()) {
								// Reference :http://en.cppreference.com/w/c/types/integer
								String translateType = boundAnalyzer.get().suggestIntegerType(code.operand(1),
										function);
								if (translateType.startsWith("u")) {
									// Unsigned integer
									switch (translateType) {
										case "uint16_t" :
											statement.add(
													indent + "printf(\"" + "%\"PRIu16" + "\"\\n\", " + input + ");");
											break;
										case "uint32_t" :
											statement.add(
													indent + "printf(\"" + "%\"PRIu32" + "\"\\n\", " + input + ");");
											break;
										case "uint64_t" :
											statement.add(
													indent + "printf(\"" + "%\"PRIu64" + "\"\\n\", " + input + ");");
											break;
									}
								} else {
									// Signed integer
									switch (translateType) {
										case "int16_t" :
											statement.add(
													indent + "printf(\"" + "%\"PRId16" + "\"\\n\", " + input + ");");
											break;
										case "int32_t" :
											statement.add(
													indent + "printf(\"" + "%\"PRId32" + "\"\\n\", " + input + ");");
											break;
										case "int64_t" :
											statement.add(
													indent + "printf(\"" + "%\"PRId64" + "\"\\n\", " + input + ");");
											break;
									}
								}

							} else {
								statement.add(indent + "printf(\"" + "%\"PRId64" + "\"\\n\", " + input + ");");
							}

						} else if (input_type instanceof Type.Array) {
							Type elm_type = stores.getArrayElementType((Type.Array) input_type);
							// Print out arrays w.r.t. array element type
							if (elm_type instanceof Type.Byte) {
								statement.add(indent + "_PRINT_1DARRAY_BYTE(" + input + ");");
							} else {
								statement.add(indent + "_PRINT_1DARRAY_int64_t(" + input + ");");
							}
						} else if (input_type instanceof Type.Nominal) {
							Type.Nominal nominal = (Type.Nominal) input_type;
							// Print out a user-defined type structure
							statement.add(indent + "printf_" + nominal.name().name() + "(" + input + ");");
						} else if (input_type instanceof Type.Union) {
							statement.add(indent + "printf(\"" + "%\"PRId64" + "\"\\n\", " + input + ");");
						} else if (input_type instanceof Type.Byte) {
							statement.add(indent + "printf(\"" + "%\"PRIu8" + "\"\\n\", " + input + ");");
						} else {
							throw new RuntimeException("Not implemented." + code);
						}
						break;
					default :
						throw new RuntimeException("Not implemented." + code);
				}
			} else if (func_name.matches("readAll:\\w*")) {
				// Get file pointer
				String ptr = func_name.split(":")[1];
				// Get output variable
				String output = stores.getVar(code.target(0), function);
				// Read a file as an array of Bytes
				statement.add(indent + output + " = readAll(" + ptr + ", &" + output + "_size);");
				// Add deallocation flag
				this.deallocatedAnalyzer.ifPresent(a -> {
					statement.add(indent + output + "_dealloc = true;");
				});
			} else if (func_name.matches("write:\\w*")) {
				// Get file pointer
				String ptr = func_name.split(":")[1];
				// Get byte array at index '1'
				String arr = stores.getVar(code.operand(1), function);
				// Read a file as an array of Bytes
				statement.add(indent + "writeAll(" + ptr + ", " + arr + ", " + arr + "_size);");
			} else if (func_name.matches("close:\\w*")) {
				// Close the file pointer
				String ptr = func_name.split(":")[1];
				// Close and nullify the file
				statement.add(indent + "fclose(" + ptr + ");");
				statement.add(indent + "" + ptr + " = NULL;");
			} else {
				throw new RuntimeException("Not implemented." + code);
			}

		} else {
			throw new RuntimeException("Not implemented." + code);
		}

		// Decrease the indent
		stores.decreaseIndent(function);

		// Add the ending clause for the function call
		statement.add(stores.getIndent(function) + "}");
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
		translateLHSVarFunctionCall(statement, code, function);

		String indent = stores.getIndent(function);
		String lhs = stores.getVar(code.target(0), function);
		Type lhs_type = stores.getRawType(code.target(0), function);
		// Assign lhs structure members with rhs member, e.g. 'a.pieces =
		// copy(b, b_size);'
		statement.add(indent + lhs + " = malloc(sizeof("
				+ CodeGeneratorHelper.translateType(lhs_type, stores).replace("*", "") + "));");

		List<String> members = stores.getMemebers(code.type(0));

		HashMap<Integer, Boolean> copyEliminatedMap = new HashMap<Integer, Boolean>();
		int[] operands = code.operands();
		for (int index = 0; index < operands.length; index++) {
			// Get operand
			int register = operands[index];
			String rhs = stores.getVar(register, function);
			String member = members.get(index);
			String lhs_member = lhs + "->" + member;
			Type member_type = stores.getRawType(register, function);
			// Type type = code.type(0).field(member);
			boolean isCopyEliminated = isCopyEliminated(register, index, code, function);
			copyEliminatedMap.put(register, isCopyEliminated);

			statement.addAll(CodeGeneratorHelper.generateAssignmentCode(member_type, indent, lhs_member, rhs,
					isCopyEliminated, stores));
		}

		// Iterate copy elimination set and update read-write/return set
		if (copyAnalyzer.isPresent()) {
			copyEliminatedMap.entrySet().forEach(entry -> {
				boolean isCopyEliminated = entry.getValue();
				int register = entry.getKey();
				copyAnalyzer.get().updateSet(isCopyEliminated, register, code, function);
			});
		}

		this.deallocatedAnalyzer.ifPresent(a -> {
			statement.addAll(a.postDealloc(code, function, stores, copyEliminatedMap));
		});

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
	 * int64_t* _3_value = copy(_3, _3_size);
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
	 * _DEALLOC_2DArray_int64_t(a);	
	 * a = gen2DArray(b, b_size, b_size_size);
	 * a_size = b_size;
	 * a_size_size = __size;
	 * a_dealloc = true;
	 * </code>
	 * </pre>
	 * 
	 * Creates a 2D array ( _11*_10_size) with initial '_10' value.
	 */
	@Override
	protected void translate(ArrayGenerator code, FunctionOrMethod function) {
		List<String> statement = new ArrayList<String>();
		// String lhs = translateLHSVarFunctionCall(statement, code, function);
		String lhs = stores.getVar(code.target(0), function);
		String indent = stores.getIndent(function);
		Type.Array lhs_type = (Type.Array) stores.getRawType(code.target(0), function);
		String rhs = stores.getVar(code.operand(0), function);
		String size = stores.getVar(code.operand(1), function);
		Type elm_type = stores.getArrayElementType(lhs_type);
		// Get array dimension
		int dimension = stores.getArrayDimension(lhs_type);
		if (dimension == 1) {
			if (elm_type instanceof Type.Byte) {
				if (this.deallocatedAnalyzer.isPresent()) {
					// No needs to generate the code because _NEW1DARRAY_DEALLOC contains all the necessary code.
				} else {
					// Generate a BYTE array and assign its value
					statement
							.add(indent + "_NEW_" + dimension + "DARRAY_BYTE(" + lhs + ", " + size + ", " + rhs + ");");
				}
			} else if (stores.isIntType(elm_type)) {
				if (boundAnalyzer.isPresent()) {
					// Deallocate lhs register
					this.deallocatedAnalyzer.ifPresent(a -> {
						statement.add(indent + a.preDealloc(lhs, lhs_type, stores));
					});
					String translateType = boundAnalyzer.get().suggestIntegerType(code.operand(0), function);
					// Generate a new array using _NEW_1DARRAY macro using
					statement.add(indent + "_NEW_" + dimension + "DARRAY(" + lhs + ", " + size + ", " + rhs + ", "
							+ translateType + ");");
				} else {
					if (this.deallocatedAnalyzer.isPresent()) {
						// No needs to generate the code because we will use _NEW1DARRAY_DEALLOC macro
					} else {
						// Generate an array with given size and values.
						statement.add(indent + "_NEW_" + dimension + "DARRAY_int64_t(" + lhs + ", " + size + ", " + rhs
								+ ");");
					}
				}
			} else {
				// Deallocate lhs register
				this.deallocatedAnalyzer.ifPresent(a -> {
					statement.add(indent + a.preDealloc(lhs, lhs_type, stores));
				});
				// Generate an array of structures
				String struct = CodeGeneratorHelper.translateType(elm_type, stores).replace("*", "");
				statement.add(indent + "_NEW_1DARRAY_STRUCT(" + lhs + ", " + size + ", " + rhs + ", " + struct + ");");
			}
		} else {
			throw new RuntimeException("2D array generator is Not implemented!!");
		}

		postDealloc(statement, code, function);

		stores.addAllStatements(code, statement, function);
	}

	/**
	 * Write the user defined data types to *.h file, e.g. <code>
	 * typedef struct{
	 *		Square* pieces;
	 *		size_t pieces_size;
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
			} else if (type instanceof Type.Array) {
				// An array of integers
				Type element = ((Type.Array) type).element();
				if (stores.isIntType(element)) {
					// Define user type as a type of integer array
					structs.add("typedef " + CodeGeneratorHelper.translateType(type, stores) + " " + type_name + ";");
				} else {
					throw new RuntimeException("Not Implemented!");
				}
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
		// Include "Util.h" "WyRT.h" to test_case.h
		String includes = "#include \"Util.h\"\n" + "#include \"WyRT.h\"\n";

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
	 *  int64_t (*twice)(int64_t);
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
