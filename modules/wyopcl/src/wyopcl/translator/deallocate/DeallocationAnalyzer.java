package wyopcl.translator.deallocate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import javax.swing.tree.DefaultMutableTreeNode;

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
 * Deallocation Analyzer computes deallocation flags for a variety of code type, and produce the code of
 * 
 * adding, removing or transferring deallocation flag so that it is added to the generated C code.
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
	 * Declare deallocation flags
	 * 
	 * @param indent
	 * @param register
	 * @param function
	 * @param stores
	 * @return
	 */
	public String declareDeallocFlag(String indent, int register, FunctionOrMethod function, CodeStores stores) {
		Type type = stores.getRawType(register, function);
		String var = stores.getVar(register, function);
		// Declare deallocation flag
		if (stores.isCompoundType(type) || type instanceof Type.Union) {
			// Declare the extra '_dealloc' boolean variables
			return indent + "_DECL_DEALLOC(" + var + ");";
		}
		return null;
	}

	/**
	 * Get a list of deallocation flag and generate the code to free all of them Note that the deallocation of function
	 * input parameters are skipped by default. Thus, the deallocation releases all the local variables, excluding input
	 * parameters.
	 *
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 *
	 */
	public List<String> addAllDeallocCode(Codes.Return code, FunctionOrMethod function, CodeStores stores) {
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
					statements.add(indent + addDeallocCode(var, var_type, stores));
				}
			}
		}

		return statements;

	}

	/**
	 * Compute deallocation flags for a function call
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> computeDealloc(Codes.Invoke code, FunctionOrMethod function, CodeStores stores) {
		String indent = stores.getIndent(function);
		List<String> statements = new ArrayList<String>();

		if (code.name.module().toString().contains("whiley/lang")) {
			int lhs = code.target(0);
			switch (code.name.name()) {
			case "parse":
				int rhs = code.operand(0);
				// Add deallocation flag to lhs.
				statements.add(indent + addDealloc(lhs, function, stores));
				// Remove rhs deallocation flag
				statements.add(indent + removeDealloc(rhs, function, stores));
				break;
			case "slice":
				// Add deallocation flag to lhs.
				statements.add(indent + addDealloc(lhs, function, stores));
				break;
			default:
				// no change to statement
				break;
			}
		} else {
			// Add deallocation flag to lhs variable
			if (code.targets().length > 0) {
				statements.add(indent + addDealloc(code.target(0), function, stores));
			}
		}
		return statements;

	}

	/**
	 * Compute deallocation flag of array generator
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> computeDealloc(Codes.ArrayGenerator code, FunctionOrMethod function, CodeStores stores) {
		String indent = stores.getIndent(function);
		List<String> statements = new ArrayList<String>();

		// Assign deallocation flag to lhs variable.
		statements.add(indent + addDealloc(code.target(0), function, stores));

		return statements;

	}

	/**
	 * Compute deallocation flag of Const byte-code
	 * 
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> computeDealloc(Codes.Const code, FunctionOrMethod function, CodeStores stores) {
		String indent = stores.getIndent(function);
		List<String> statements = new ArrayList<String>();

		int lhs = code.target(0);
		if (code.constant.type() instanceof Type.Null) {
			// Constant is a NULL and remove deallocation flag
			statements.add(indent + removeDealloc(lhs, function, stores));
		} else if (code.constant.type() instanceof Type.Array) {
			// Check if constant is an array and add deallocation flag
			statements.add(indent + addDealloc(lhs, function, stores));
		} else {
			// Do nothing
		}

		return statements;
	}

	/**
	 * Computes deallocation flag for new array byte-code
	 * 
	 * 
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> computeDealloc(Codes.NewArray code, FunctionOrMethod function, CodeStores stores) {
		String indent = stores.getIndent(function);
		List<String> statements = new ArrayList<String>();
		int lhs = code.target(0);
		if (code.operands().length > 0) {
			// Create an non-empty array, and add lhs variable to deallocation flag set.
			statements.add(indent + addDealloc(lhs, function, stores));
		}

		return statements;
	}

	/**
	 * Compute deallocation flags for new record code
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> computeDealloc(Codes.NewRecord code, FunctionOrMethod function, CodeStores stores,
			HashMap<Integer, Boolean> argumentCopyEliminated) {
		String indent = stores.getIndent(function);
		List<String> statements = new ArrayList<String>();
		// Iterate each member
		argumentCopyEliminated.entrySet().forEach(entry -> {
			int register = entry.getKey();
			boolean isCopyEliminated = entry.getValue();
			// Remove the deallocation flags for those member whose copies are not needed.
			if (isCopyEliminated) {
				statements.add(indent + removeDealloc(register, function, stores));
			}
		});

		// Assign deallocation flag to lhs variable
		statements.add(indent + addDealloc(code.target(0), function, stores));

		return statements;
	}

	/**
	 * Compute deallocation flag for assignment
	 * 
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> computeDealloc(boolean isCopyEliminated, Codes.Assign code, FunctionOrMethod function,
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
			// Remove lhs deallocation flag
			statements.add(indent + removeDealloc(lhs, function, stores));
		} else if (lhs_type instanceof Type.Int && rhs_type instanceof Type.Union) {
			// Special case for converting an integer pointer to an integer
			// No changes to deallocation flag
		} else {
			if (isCopyEliminated) {
				// Transfer rhs deallocation flag to lhs
				statements.add(indent + transferDealloc(lhs, rhs, function, stores));
			} else {
				// Add deallocation flag to lhs register
				statements.add(indent + addDealloc(lhs, function, stores));
			}
		}

		return statements;
	}

	/**
	 * Compute deallocation flags of Update byte-code
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> computeDealloc(Codes.Update code, FunctionOrMethod function, CodeStores stores) {
		String indent = stores.getIndent(function);
		List<String> statements = new ArrayList<String>();

		// The rhs register is the last operand
		int rhs = code.operand(code.operands().length - 1);
		// Remove rhs deallocation flag as the copy is not made at 'update' byte-code
		statements.add(indent + removeDealloc(rhs, function, stores));
		return statements;
	}

	/**
	 * Compute deallocation flags of IndexOf code
	 * 
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> computeDealloc(Codes.IndexOf code, FunctionOrMethod function, CodeStores stores) {
		String indent = stores.getIndent(function);
		List<String> statements = new ArrayList<String>();

		int lhs = code.target(0);
		// Transfer lhs deallocation flag due to non-transferable array deallocation flag
		statements.add(indent + removeDealloc(lhs, function, stores));
		return statements;
	}

	/**
	 * Compute the deallocation flags of FieldLoad byte-code
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> computeDealloc(boolean isCopyEliminated, Codes.FieldLoad code, FunctionOrMethod function,
			CodeStores stores) {
		String indent = stores.getIndent(function);
		List<String> statements = new ArrayList<String>();
		int lhs = code.target(0);
		if (code.field.equals("args")) {
			// Add deallocation flag to lhs register
			statements.add(indent + addDealloc(lhs, function, stores));
		} else {
			if (isCopyEliminated) {
				// That means 'fieldload' access one member
				// rhs deallocation flag could be changed. But remove lhs deallocation flag
				statements.add(indent + removeDealloc(lhs, function, stores));
			} else {
				// Assign deallocation flag to lhs variable.
				statements.add(indent + addDealloc(lhs, function, stores));
			}
		}

		return statements;

	}

	/**
	 * Compute the deallocation flag for each argument of a function call,
	 * 
	 * If the deallocation flag is assigned to the calling function and no copy is made, then callee frees the argument.
	 * 
	 * For example,
	 * 
	 * <pre>
	 * <code>
	 * 		a = f(b, b_dealloc); // 'f' function frees 'b' array
	 * 		b_dealloc = false; // reset b 'de-alloc' flag to be 'false' 
	 * </code>
	 * </pre>
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @param copyAnalyzer
	 * @return
	 */
	public List<String> computeDealloc(Codes.Invoke code, FunctionOrMethod function, CodeStores stores,
			Optional<CopyEliminationAnalyzer> copyAnalyzer) {
		List<String> statements = new ArrayList<String>();

		String indent = stores.getIndent(function);
		// Add or transfer out the parameters that do not have the copy
		for (int register : code.operands()) {
			Optional<String> dealloc = computeDealloc(register, code, function, stores, copyAnalyzer);
			dealloc.ifPresent(callee_dealloc -> {
				// Check callee's deallocation flag
				if (copyAnalyzer.isPresent()) {
					// Check if the callee de-allocates the argument
					if (callee_dealloc.equals("transfer_callee")) {
						// If so, then deallocation flag is transferred from caller site to callee
						// And remove the caller's flag
						statements.add(indent + removeDealloc(register, function, stores));
					}
				}
				;
			});
		}

		return statements;
	}

	/**
	 * Adds deallocation flag to register and generate the code
	 * 
	 * <pre>
	 * <code>
	 * bool a_dealloc = true;
	 * </code>
	 * </pre>
	 * 
	 * @param var
	 * @return
	 */
	protected String addDealloc(int register, FunctionOrMethod function, CodeStores stores) {
		Type type = stores.getRawType(register, function);
		if (stores.isCompoundType(type) || type instanceof Type.Union) {
			String var = stores.getVar(register, function);
			return "_ADD_DEALLOC(" + var + ");";
		}
		return "";
	}

	/**
	 * Set de-allocation flag of given register to be 'false'
	 * 
	 * @param reg
	 * @param function
	 */
	protected String removeDealloc(int register, FunctionOrMethod function, CodeStores stores) {
		Type type = stores.getRawType(register, function);
		if (stores.isCompoundType(type) || type instanceof Type.Union) {
			String var = stores.getVar(register, function);
			return "_REMOVE_DEALLOC(" + var + ");";
		}
		return "";
	}

	/**
	 * Transfer rhs's deallocation flag to lhs's
	 * 
	 * For example,
	 * 
	 * <pre>
	 * <code>
	 * a = b;
	 * a_dealloc = b_dealloc;
	 * </code>
	 * </pre>
	 * 
	 * @param lhs
	 *            register
	 * @param rhs
	 *            register
	 * @param function
	 */
	protected String transferDealloc(int lhs, int rhs, FunctionOrMethod function, CodeStores stores) {
		Type type = stores.getRawType(lhs, function);
		if (stores.isCompoundType(type) || type instanceof Type.Union) {
			String lhs_var = stores.getVar(lhs, function);
			String rhs_var = stores.getVar(rhs, function);
			return "_TRANSFER_DEALLOC(" + lhs_var + ", " + rhs_var + ");";
		}
		return "";
	}

	/**
	 * Return parameter deallocation flag of the caller.
	 * 
	 * If deallocation analyzer is enabled, then deallocation flags of caller and callee are based on the following
	 * rules, e.g. a function call 'a = f(b, b_own_f)', Rules are as below:
	 * 
	 * <pre>
	 * f mutates b?		|F			|F			      |T			    |T
	 * f returns b?		|F			|T			      |T			    |F
	 * -----------------------------------------------------------------------------
	 * b is alive?	T	|No Copy	|No Copy	      |Copy		        |Copy
	 * 					|'rm_callee'|'rm_callee'      |'add_callee'	    |'add_callee'
	 * --------------------------------------------------------------------
	 * 				F	|No Copy	|No Copy	      |No Copy	        |No Copy
	 * 					|'rm_callee'|'transfer_callee'|'transfer_callee'|'transfer_callee'
	 * </pre>
	 * 
	 * where 'caller' is the deallocation flag of caller site 'callee' is the deallocation flag of callee site
	 * 
	 * @param register function argument
	 * @param code function call byte-code
	 * @param function caller function
	 * @param stores code stores
	 * @param copyAnalyzer
	 * @return three outcomes: 'rm_callee', 'add_callee' and 'transfer_callee'
	 * 
	 *  'rm_callee': set callee flag to be 'false'
	 *  'add_callee': set callee flag to be 'true'
	 *  'transfer_callee': transfers caller's flag to callee, and after the function call, set caller flag to be 'false'
	 * 
	 */
	public Optional<String> computeDealloc(int register, Codes.Invoke code, FunctionOrMethod function,
			CodeStores stores, Optional<CopyEliminationAnalyzer> copyAnalyzer) {
		Type type = stores.getRawType(register, function);
		if (!stores.isCompoundType(type)) {
			return Optional.empty();
		}

		if (copyAnalyzer.isPresent()) {
			// Analyze the deallocation flags using live variable, read-write and return analysis
			boolean isLive = copyAnalyzer.get().liveAnalyzer.isLive(register, code, function);

			FunctionOrMethod f = this.getFunction(code.name.name());
			int arguement = mapFunctionArgument(register, code);
			boolean isMutated = copyAnalyzer.get().readwriteAnalyzer.isMutated(arguement, f);
			boolean isReturned = copyAnalyzer.get().returnAnalyzer.isReturned(arguement, f);

			if (!isMutated) {
				if (!isReturned) {
					// NOT mutated nor return
					return Optional.of("rm_callee");
					//dealloc.get().put("caller", true);
					//dealloc.get().put("callee", false);
				} else {
					// NOT mutated but returned
					if (isLive) {
						// If 'b' is alive at caller site
						return Optional.of("rm_callee");
						//dealloc.get().put("caller", true);
						//dealloc.get().put("callee", false);
					} else {
						// If 'b' is NOT alive at caller site
						return Optional.of("transfer_callee");
						//dealloc.get().put("caller", false);
						//dealloc.get().put("callee", true);
					}
				}
			} else {
				if (isReturned) {
					// Mutated and returned
					if (isLive) {
						// 'b' is alive
						return Optional.of("add_callee");
						//dealloc.get().put("caller", true);
						//dealloc.get().put("callee", true);
					} else {
						// 'b' is NOT alive
						return Optional.of("transfer_callee");
						//dealloc.get().put("caller", false);
						//dealloc.get().put("callee", true);
					}
				} else {
					// Mutated and NOT returned
					if (isLive) {
						// 'b' is alive
						return Optional.of("add_callee");
						//dealloc.get().put("caller", true);
						//dealloc.get().put("callee", true);
					} else {
						return Optional.of("transfer_callee");
						//dealloc.get().put("caller", false);
						//dealloc.get().put("callee", true);
					}
				}
			}
		} else {
			// The copy is needed, so that caller and callee both have the deallocation flags
			return Optional.of("add_callee");
			//dealloc.get().put("caller", true);
			//dealloc.get().put("callee", true);
		}

		//return dealloc;
	}

	/**
	 * Adds the deallocation code for update byte-code. For example,
	 * 
	 * <pre>
	 * <code>
	 * if(a_dealloc){ // Free a[i]
	 * 		free(a[n]);
	 * 		a[n] = NULL;
	 * }
	 * a[n] = b; // Update a[i] with b where b is a structure pointer 
	 * </code>
	 * </pre>
	 * 
	 * @param dealloc_var
	 * @param lhs
	 * @param lhs_type
	 * @param stores
	 * @return
	 */
	public String addDeallocCode(String dealloc_var, String lhs, Type lhs_type, CodeStores stores) {
		if (lhs_type instanceof Type.Array) {
			// Get element type of array type
			Type elm_type = stores.getArrayElementType((Type.Array) lhs_type);
			if (stores.isCompoundType(elm_type)) {
				// Free the lhs structure pointer
				String struct = CodeGeneratorHelper.translateType(elm_type, stores).replace("*", "");
				return "_DEALLOC_MEMBER_1DARRAY_STRUCT(" + dealloc_var + ", " + lhs + ", " + struct + ");";	
			}
		}

		return "";

	}

	/**
	 * Generate the code to release the memory for a given variable, e.g.
	 * 
	 * <pre>
	 * <code>
	 * if(a_dealloc){free_Board(a); a_dealloc = false;}
	 * </code>
	 * </pre>
	 * 
	 * where 'a' is a board and 'a_dealloc' flag indicates whether 'a' owns an object.
	 * 
	 * @param var
	 * @param type
	 * @param stores
	 * @return
	 */
	public String addDeallocCode(String var, Type type, CodeStores stores) {
		// NULL check
		if (var == null || type == null || !stores.isCompoundType(type) && !(type instanceof Type.Union)) {
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
					return "_DEALLOC_2DArray(" + var + ");";
				} else {
					// Release the previously allocated variable, e.g. an array of integers
					return "_DEALLOC(" + var + ");";
				}
			} else {
				name = CodeGeneratorHelper.translateType(elem_type, stores).replace("*", "");
				if (dimension == 1) {
					// Release an array of structure pointer
					return "_DEALLOC_1DARRAY_STRUCT(" + var + ", " + name + ");";
				} else {
					throw new RuntimeException("Not implemented");
				}

			}

		} else if (type instanceof Type.Record) {
			name = CodeGeneratorHelper.translateType(type, stores).replace("*", "");
			return "_DEALLOC_STRUCT(" + var + ", " + name + ");";
		} else if (type instanceof Type.Union) {
			if (stores.isIntType(type)) {
				return "_DEALLOC(" + var + ");";
			} else {
				name = CodeGeneratorHelper.translateType(type, stores).replace("*", "");
				return "_DEALLOC_STRUCT(" + var + ", " + name + ");";
			}
		} else {
			throw new RuntimeException("Not implemented");
		}
	}

	@Override
	public void apply(WyilFile module) {
		super.apply(module);
	}

	@Override
	protected void visit(DefaultMutableTreeNode node) {
		// TODO Auto-generated method stub

	}

}
