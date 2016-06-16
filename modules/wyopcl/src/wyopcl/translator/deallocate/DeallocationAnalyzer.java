package wyopcl.translator.deallocate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.Analyzer;
import wyopcl.translator.ReadWriteAnalyzer;
import wyopcl.translator.ReturnAnalyzer;
import wyopcl.translator.copy.CopyEliminationAnalyzer;
import wyopcl.translator.copy.LiveVariablesAnalysis;
import wyopcl.translator.generator.CodeGeneratorHelper;
import wyopcl.translator.generator.CodeStores;

/**
 * Deallocation Analyzer computes ownerships for a variety of code type, and produce the code of adding, removing or
 * transferring ownership so that it is added to the generated C code.
 * 
 * 
 * @author Min-Hsien Weng
 *
 */
public class DeallocationAnalyzer extends Analyzer {

	public DeallocationAnalyzer(Configuration config) {
		super(config);
	}

	/**
	 * Declare ownership flags
	 * 
	 * @param indent
	 * @param register
	 * @param function
	 * @param stores
	 * @return
	 */
	public String declareOwnershipFlag(String indent, int register, FunctionOrMethod function, CodeStores stores) {
		Type type = stores.getRawType(register, function);
		String var = stores.getVar(register, function);
		// Declare ownership
		if (stores.isCompoundType(type) || type instanceof Type.Union) {
			// Declare the extra 'has_ownership' boolean variables
			return indent + "_DECL_OWNERSHIP(" + var + ");";
		}
		return null;
	}

	/**
	 * Get a list of ownership variables and generate the code to free all of them Note that the deallocation of
	 * function input parameters are skipped by default. Thus, the deallocation releases all the local variables,
	 * excluding input parameters.
	 *
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 *
	 */
	public List<String> freeAllMemory(Codes.Return code, FunctionOrMethod function, CodeStores stores) {
		List<String> statements = new ArrayList<String>();

		// Get all registers
		List<Integer> registers = stores.getAllVars(function);

		// Skip the return values
		int ret = -1;
		if (code.operands().length > 0) {
			ret = code.operand(0);
		}

		String indent = stores.getIndent(function);
		// Skip the deallocation of function parameters.
		for (int r : registers) {
			// Skip the deallocation for return value.
			if (r != ret) {
				Type var_type = stores.getRawType(r, function);
				if (var_type != null && !(var_type instanceof Type.Null)) {
					String var = stores.getVar(r, function);
					statements.add(indent + addDeallocatedCode(var, var_type, stores));
				}
			}
		}

		return statements;

	}

	/**
	 * Compute ownerships for a function call
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> computeOwnership(Codes.Invoke code, FunctionOrMethod function, CodeStores stores) {
		String indent = stores.getIndent(function);
		List<String> statements = new ArrayList<String>();

		if (code.name.module().toString().contains("whiley/lang")) {
			int lhs = code.target(0);
			switch (code.name.name()) {
			case "parse":
				int rhs = code.operand(0);
				// Add ownership to lhs.
				statements.add(indent + addOwnership(lhs, function, stores));
				// Remove rhs ownership
				statements.add(indent + removeOwnership(rhs, function, stores));
				break;
			case "slice":
				// Add ownership to lhs.
				statements.add(indent + addOwnership(lhs, function, stores));
				break;
			default:
				// no change to statement
				break;
			}
		} else {
			// Add ownership to lhs variable
			if (code.targets().length > 0) {
				statements.add(indent + addOwnership(code.target(0), function, stores));
			}
		}
		return statements;

	}

	/**
	 * Compute ownership of array generator
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> computeOwnership(Codes.ArrayGenerator code, FunctionOrMethod function, CodeStores stores) {
		String indent = stores.getIndent(function);
		List<String> statements = new ArrayList<String>();

		// Assign ownership to lhs variable.
		statements.add(indent + addOwnership(code.target(0), function, stores));

		return statements;

	}

	/**
	 * Compute ownership of Const byte-code
	 * 
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> computeOwnership(Codes.Const code, FunctionOrMethod function, CodeStores stores) {
		String indent = stores.getIndent(function);
		List<String> statements = new ArrayList<String>();

		int lhs = code.target(0);
		if (code.constant.type() instanceof Type.Null) {
			// Constant is a NULL and remove ownership
			statements.add(indent + removeOwnership(lhs, function, stores));
		} else if (code.constant.type() instanceof Type.Array) {
			// Check if constant is an array and add ownership
			statements.add(indent + addOwnership(lhs, function, stores));
		} else {
			// Do nothing
		}

		return statements;
	}

	/**
	 * Computes ownership for new array byte-code
	 * 
	 * 
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> computeOwnership(Codes.NewArray code, FunctionOrMethod function, CodeStores stores) {
		String indent = stores.getIndent(function);
		List<String> statements = new ArrayList<String>();
		int lhs = code.target(0);
		if (code.operands().length > 0) {
			// Create an non-empty array, and add lhs variable to ownership set.
			statements.add(indent + addOwnership(lhs, function, stores));
		}

		return statements;
	}

	/**
	 * Compute ownerships for new record code
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> computeOwnership(Codes.NewRecord code, FunctionOrMethod function, CodeStores stores,
			HashMap<Integer, Boolean> argumentCopyEliminated) {
		String indent = stores.getIndent(function);
		List<String> statements = new ArrayList<String>();
		// Iterate each member
		argumentCopyEliminated.entrySet().forEach(entry -> {
			int register = entry.getKey();
			boolean isCopyEliminated = entry.getValue();
			// Remove the ownerships for those member whose copies are not needed.
			if (isCopyEliminated) {
				statements.add(indent + removeOwnership(register, function, stores));
			}
		});

		// Assign ownership to lhs variable
		statements.add(indent + addOwnership(code.target(0), function, stores));

		return statements;
	}

	/**
	 * Compute ownership flags for assignment
	 * 
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> computeOwnership(boolean isCopyEliminated, Codes.Assign code, FunctionOrMethod function,
			CodeStores stores) {
		String indent = stores.getIndent(function);
		List<String> statements = new ArrayList<String>();
		Codes.Assign assign = (Codes.Assign) code;
		int lhs = assign.target(0);
		Type lhs_type = stores.getRawType(lhs, function);
		int rhs = assign.operand(0);
		Type rhs_type = stores.getRawType(rhs, function);

		// Special case for NULL type ( a = NULL;)
		if (assign.type(0) instanceof Type.Null) {
			// Remove lhs ownership
			statements.add(indent + removeOwnership(lhs, function, stores));
		} else if (lhs_type instanceof Type.Int && rhs_type instanceof Type.Union) {
			// Special case for converting an integer pointer to an integer
			// No changes to ownership
		} else {
			if (isCopyEliminated) {
				// Transfer rhs ownership to lhs
				statements.add(indent + transferOwnership(lhs, rhs, function, stores));
				// Remove rhs ownership
				statements.add(indent + removeOwnership(rhs, function, stores));
			} else {
				// Add rhs to ownership set
				statements.add(indent + addOwnership(lhs, function, stores));
			}
		}

		return statements;
	}

	/**
	 * Compute ownerships of Update byte-code
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> computeOwnership(Codes.Update code, FunctionOrMethod function, CodeStores stores) {
		String indent = stores.getIndent(function);
		List<String> statements = new ArrayList<String>();
		
		// The rhs register is the last operand
		int rhs = code.operand(code.operands().length - 1);
		// Remove rhs ownership as the copy is not made at 'update' byte-code
		statements.add(indent + removeOwnership(rhs, function, stores));
		return statements;
	}
	
	/**
	 * Given a code, compute the ownerships and return the generated C code.
	 * 
	 * Note the lhs variable in an assignment is not always added with ownership.
	 * 
	 * If the lhs variable points to an array element, then its ownership is transferred out. Because the array variable
	 * owns the ownership, other variables that point to the array lost the ownership. For example,
	 * 
	 * <pre>
	 * <code> a = b[i]; // Access the array element a_has_ownership = false; 
	 * 		  a_has_ownership = false;//Remove lhs ownership
	 * </code>
	 * </pre>
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> computeOwnership(boolean isCopyEliminated, Code code, FunctionOrMethod function,
			CodeStores stores) {
		String indent = stores.getIndent(function);
		List<String> statements = new ArrayList<String>();
		if (code instanceof Codes.IndexOf) {
			Codes.IndexOf indexof = (Codes.IndexOf) code;
			int lhs = indexof.target(0);
			// Transfer lhs ownership due to non-transferable array ownership
			statements.add(indent + removeOwnership(lhs, function, stores));
		} else if (code instanceof Codes.FieldLoad) {
			Codes.FieldLoad fieldload = (Codes.FieldLoad) code;
			int lhs = fieldload.target(0);
			if (fieldload.field.equals("args")) {
				// Add ownership to lhs register
				statements.add(indent + addOwnership(lhs, function, stores));
			} else {
				// int rhs = fieldload.operand(0);
				if (isCopyEliminated) {
					// That means 'fieldload' access one member
					// rhs ownership could be changed. But remove lhs ownership
					statements.add(indent + removeOwnership(lhs, function, stores));
				} else {
					// Assign ownership to lhs variable.
					statements.add(indent + addOwnership(lhs, function, stores));
				}
			}
		} else {
			throw new RuntimeException("Not implemented");
		}

		return statements;

	}

	/**
	 * Compute the ownership for each parameter of a function call,
	 * 
	 * If the parameter ownership is transferred to the calling function, then its ownership is removed. For example,
	 * 
	 * <pre>
	 * <code>
	 * 		a = f(b); // Pass b parameter without copy call function f 
	 * 		b_has_ownership = false;
	 * </code>
	 * </pre>
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @param copyAnalyzer
	 * @return
	 */
	public List<String> computeOwnership(Codes.Invoke code, FunctionOrMethod function, CodeStores stores,
			Optional<CopyEliminationAnalyzer> copyAnalyzer) {
		List<String> statements = new ArrayList<String>();

		String indent = stores.getIndent(function);
		// Add or transfer out the parameters that do not have the copy
		for (int register : code.operands()) {
			Optional<HashMap<String, Boolean>> ownership = computeOwnership(register, code, function, stores,
					copyAnalyzer);
			ownership.ifPresent(o -> {
				// Get caller ownership
				boolean caller_own = o.get("caller");
				if (!caller_own) {
					// The ownership is transferred from caller to calling
					// function
					statements.add(indent + removeOwnership(register, function, stores));
				}
			});
		}

		return statements;
	}

	/**
	 * Adds the register to ownership and generate the code
	 * 
	 * <pre>
	 * <code>
	 * bool a_has_ownership = true;
	 * </code>
	 * </pre>
	 * 
	 * @param var
	 * @return
	 */
	protected String addOwnership(int register, FunctionOrMethod function, CodeStores stores) {
		Type type = stores.getRawType(register, function);
		if (stores.isCompoundType(type) || type instanceof Type.Union) {
			String var = stores.getVar(register, function);
			return "_ADD_OWNERSHIP(" + var + ");";
		}
		return "";
	}

	/**
	 * Takes out 'register' from 'ownership' set
	 * 
	 * @param reg
	 * @param function
	 */
	protected String removeOwnership(int register, FunctionOrMethod function, CodeStores stores) {
		Type type = stores.getRawType(register, function);
		if (stores.isCompoundType(type) || type instanceof Type.Union) {
			String var = stores.getVar(register, function);
			return "_REMOVE_OWNERSHIP(" + var + ");";
		}
		return "";
	}

	/**
	 * Transfer rhs's ownership to lhs's ownership for an assignment a = b; a_has_ownership = b_has_ownership
	 * 
	 * @param lhs
	 *            register
	 * @param rhs
	 *            register
	 * @param function
	 */
	protected String transferOwnership(int lhs, int rhs, FunctionOrMethod function, CodeStores stores) {
		Type type = stores.getRawType(lhs, function);
		if (stores.isCompoundType(type) || type instanceof Type.Union) {
			String lhs_var = stores.getVar(lhs, function);
			String rhs_var = stores.getVar(rhs, function);
			return "_TRANSFER_OWNERSHIP(" + lhs_var + ", " + rhs_var + ");";
		}
		return "";
	}

	/**
	 * Return parameter ownership in the caller. If deallocation is enabled, then pass the ownership to a function. The
	 * ownership value are based on based on the following rules, e.g. a function call 'a = f(b, b_own_f)',
	 * 
	 * 
	 * Rules are as below:
	 * 
	 * <pre>
	 * f mutates b?		|F			|F			|T			|T
	 * f returns b?		|F			|T			|T			|F
	 * --------------------------------------------------------------------
	 * b is alive?	T	|No Copy	|No Copy	|Copy		|Copy
	 * 					|caller = T	|caller = F |caller = T	|caller = T
	 * 					|callee = F |callee = T |callee = T	|calee  = T
	 * --------------------------------------------------------------------
	 * 				F	|No Copy	|No Copy	|No Copy	|No Copy
	 * 					|caller = T |caller = F	|caller = F |caller = F
	 * 					|callee = F |callee = T	|callee = T	|callee = T
	 * </pre>
	 * 
	 * where 'caller' is the ownership flag of caller site 'callee' is the ownership flag of callee site
	 * 
	 * @param type
	 * @param copyAnalyzer
	 * @return a hashmap that contains caller's ownership and callee's ownership for a parameter.
	 */
	public Optional<HashMap<String, Boolean>> computeOwnership(int register, Codes.Invoke code,
			FunctionOrMethod function, CodeStores stores, Optional<CopyEliminationAnalyzer> copyAnalyzer) {
		Type type = stores.getRawType(register, function);
		if (!stores.isCompoundType(type)) {
			return Optional.empty();
		}

		boolean isLive = true;
		Optional<HashMap<String, Boolean>> ownership = Optional.of(new HashMap<String, Boolean>());
		if (copyAnalyzer.isPresent()) {
			// Analyze the ownerships using live variable, read-write and return analysis
			isLive = copyAnalyzer.get().liveAnalyzer.isLive(register, code, function);

			FunctionOrMethod f = this.getFunction(code.name.name());
			int arguement = mapFunctionArgument(register, code);
			boolean isMutated = copyAnalyzer.get().readwriteAnalyzer.isMutated(arguement, f);
			boolean isReturned = copyAnalyzer.get().returnAnalyzer.isReturned(arguement, f);

			if (!isMutated) {
				if (!isReturned) {
					// Caller ownership
					ownership.get().put("caller", true);
					ownership.get().put("callee", false);
				} else {
					ownership.get().put("caller", false);
					ownership.get().put("callee", true);
				}
			} else {
				if (isReturned) {
					// 'b' is alive
					if (isLive) {
						ownership.get().put("caller", true);
						ownership.get().put("callee", true);
					} else {
						ownership.get().put("caller", false);
						ownership.get().put("callee", true);
					}
				} else {
					if (isLive) {
						ownership.get().put("caller", true);
						ownership.get().put("callee", true);
					} else {
						ownership.get().put("caller", false);
						ownership.get().put("callee", true);
					}
				}
			}
		} else {
			// The copy is needed, so that caller and Callee both have the ownerships
			ownership.get().put("caller", true);
			ownership.get().put("callee", true);
		}

		return ownership;
	}

	/**
	 * Adds the deallocation code
	 * 
	 * @param lhs
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public String addDeallocatedCode(String lhs, Codes.Update code, FunctionOrMethod function, CodeStores stores) {
		String indent = stores.getIndent(function);
		Type lhs_type = stores.getRawType(code.target(0), function);

		if (lhs_type instanceof Type.Array) {
			String array_variable = stores.getVar(code.target(0), function);
			// Get array element type
			Type elm_type = stores.getArrayElementType((Type.Array) lhs_type);
			if (stores.isCompoundType(elm_type)) {
				// Free the lhs variable
				String name = CodeGeneratorHelper.translateType(elm_type, stores).replace("*", "");
				return indent + "_FREE_1DARRAY_ELEMENT_STRUCT(" + array_variable + ", " + lhs + ", " + name + ");";
			}
		}

		return "";

	}

	/**
	 * Generate the code to release the memory for a given variable, e.g.
	 * 
	 * <pre>
	 * <code>
	 * if(a_has_ownership){free_Board(a); a_has_ownership = false;}
	 * </code>
	 * </pre>
	 * 
	 * where 'a' is a board and 'a_has_ownership' flag indicates whether 'a' owns an object.
	 * 
	 * @param var
	 * @param type
	 * @param stores
	 * @return
	 */
	public String addDeallocatedCode(String var, Type type, CodeStores stores) {
		// NULL check
		if(var == null || type == null || !stores.isCompoundType(type) && !(type instanceof Type.Union)){
			return "";
		}

		// Get function name
		String name = "";
		// Check if var_type is a structure
		if (type instanceof Type.Array) {
			Type.Array arr_type = (Type.Array) type;
			Type elem_type = stores.getArrayElementType(arr_type);
			int dimension = stores.getArrayDimension(arr_type);

			// For integer array or NULL array
			if (stores.isIntType(elem_type) || elem_type instanceof Type.Void) {
				if (dimension == 2) {
					return "_FREE2DArray(" + var + ");";
				} else {
					// Use _FREE macro to release the array variable.
					return "_FREE(" + var + ");";
				}
			} else {
				name = CodeGeneratorHelper.translateType(elem_type, stores).replace("*", "");
				if (dimension == 1) {
					// Use '_FREE_1DARRAY_STRUCT' to release an array of
					// structure
					return "_FREE_1DARRAY_STRUCT(" + var + ", " + name + ");";
				} else {
					throw new RuntimeException("Not implemented");
				}

			}

		} else if (type instanceof Type.Record) {
			name = CodeGeneratorHelper.translateType(type, stores).replace("*", "");
			return "_FREE_STRUCT(" + var + ", " + name + ");";
		} else if (type instanceof Type.Union) {
			if (stores.isIntType(type)) {
				return "_FREE(" + var + ");";
			} else {
				name = CodeGeneratorHelper.translateType(type, stores).replace("*", "");
				return "_FREE_STRUCT(" + var + ", " + name + ");";
			}
		} else {
			throw new RuntimeException("Not implemented");
		}
	}

	@Override
	public void apply(WyilFile module) {
		super.apply(module);
	}

}
