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
import wyopcl.translator.LiveVariablesAnalysis;
import wyopcl.translator.ReadWriteAnalyzer;
import wyopcl.translator.ReturnAnalyzer;
import wyopcl.translator.copy.CopyEliminationAnalyzer;
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

	// Read-write, return and live variable analyzers
	private ReadWriteAnalyzer readwriteAnalyzer;
	private ReturnAnalyzer returnAnalyzer;
	private LiveVariablesAnalysis liveAnalyzer;

	public DeallocationAnalyzer(Configuration config, ReadWriteAnalyzer readwriteAnalyzer,
			ReturnAnalyzer returnAnalyzer, LiveVariablesAnalysis liveAnalyzer) {
		super(config);
		this.readwriteAnalyzer = readwriteAnalyzer;
		this.returnAnalyzer = returnAnalyzer;
		this.liveAnalyzer = liveAnalyzer;
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
	 * Get a list of pre-deallocation code to free all the local variables, excluding return variables.
	 *
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 *
	 */
	public List<String> preDealloc(Codes.Return code, FunctionOrMethod function, CodeStores stores) {
		List<String> statements = new ArrayList<String>();

		// Get all registers
		List<Integer> registers = stores.getAllVars(function);

		// Get the return variable
		int ret = -1;
		if (code.operands().length > 0) {
			ret = code.operand(0);
		}

		String indent = stores.getIndent(function);
		// Iterate all local variables
		for (int r : registers) {
			// Skip the deallocation of return variable.
			if (r != ret) {
				Type var_type = stores.getRawType(r, function);

				if (var_type != null) {
					if (var_type instanceof Type.Null) {
						continue;// Jump to next iteration
					}
					String var_name = stores.getVar(r, function);
					// Check if var is aliased with command line argument
					if(function.name().toString().equals("main") && stores.isAliasedCmdArg(var_name)){
						// Use '_FREE_ARGS' to free it
						statements.add(indent + "_FREE_ARGS("+var_name+");");
						continue;
					}					
					
					// Check if var is Console
					if (var_type instanceof Type.Nominal) {
						Type.Nominal nominal = ((Type.Nominal) var_type);
						if (nominal.toString().equals("whiley/lang/ASCII:string")) {
							// Release the string (an integer array)
							statements.add(indent + preDealloc(var_name, var_type, stores));
							continue;
						} else if (nominal.name().name().equals("Console")) {
							// Skip deallocation as they are allocated by system
							continue;
						} else {
							// Close the file pointer
							statements
									.add(indent + "if(" + var_name + " != NULL){fclose(" + var_name + "); " + var_name + " = NULL;}");
							continue;
						}
					}
					// Check if type is a record
					if (var_type instanceof Type.Record) {
						Type.Record record = (Type.Record) var_type;
						if (record.fields().containsKey("readAll") || record.fields().containsKey("write")) {
							// Skip the de-allocation
							continue;
						}
					}

					// Apply deallocation marco on other cases.
					statements.add(indent + preDealloc(var_name, var_type, stores));
				}
			}
		}

		return statements;

	}

	/**
	 * 
	 * @param register
	 * @param function
	 * @param stores
	 * @return
	 */
	private String new1DArrayDealloc(int register, int valueReg, int sizeReg, FunctionOrMethod function, CodeStores stores) {
		Type type = stores.getRawType(register, function);
		if (stores.isCompoundType(type) || type instanceof Type.Union) {
			String var = stores.getVar(register, function);
			String value = stores.getVar(valueReg, function);
			String size = stores.getVar(sizeReg, function);
			return "_NEW1DARRAY_DEALLOC(" + var + ", "+ value +", "+size+");";
		}
		return "";
	}
	
	
	/**
	 * Compute deallocation flag of array generator
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	private List<String> computeDealloc(Codes.ArrayGenerator code, FunctionOrMethod function, CodeStores stores) {
		String indent = stores.getIndent(function);
		List<String> statements = new ArrayList<String>();
		
		//statements.add(indent + addDealloc(code.target(0), function, stores));
		// Apply '_NEW1DARRAY_DEALLOC' macro 
		statements.add(indent + new1DArrayDealloc(code.target(0), code.operand(0), code.operand(1), function, stores));

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
	private List<String> computeDealloc(Codes.Const code, FunctionOrMethod function, CodeStores stores) {
		String indent = stores.getIndent(function);
		List<String> statements = new ArrayList<String>();

		if (code.constant.type() instanceof Type.Null) {
			// Constant is a NULL and remove deallocation flag
			statements.add(indent +this.removeDealloc(code.target(0), function, stores) );
		} else if (code.constant.type() instanceof Type.Array) {
			// Check if constant is an array and add deallocation flag
			statements.add(indent + this.assignDealloc(code.target(0), function, stores));
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
	private List<String> computeDealloc(Codes.NewArray code, FunctionOrMethod function, CodeStores stores) {
		String indent = stores.getIndent(function);
		List<String> statements = new ArrayList<String>();
		//String lhs = stores.getVar(code.target(0), function);
		if (code.operands().length > 0) {
			// Create an non-empty array, and add lhs variable to deallocation flag set.
			statements.add(indent + this.assignDealloc(code.target(0), function, stores));
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
	public List<String> postDealloc(Codes.NewRecord code, FunctionOrMethod function, CodeStores stores,
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
		//String lhs = stores.getVar(code.target(0), function);
		// Assign deallocation flag to lhs variable
		statements.add(indent + this.assignDealloc(code.target(0), function, stores));

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
	private List<String> computeDealloc(boolean isCopyEliminated, Codes.Assign code, FunctionOrMethod function,
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
				statements.add(indent + addDealloc(lhs, rhs, function, stores));
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
	private List<String> computeDealloc(Codes.Update code, FunctionOrMethod function, CodeStores stores) {
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
	private List<String> computeDealloc(Codes.IndexOf code, FunctionOrMethod function, CodeStores stores) {
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
	private List<String> computeDealloc(boolean isCopyEliminated, Codes.FieldLoad code, FunctionOrMethod function,
			CodeStores stores) {
		String indent = stores.getIndent(function);
		List<String> statements = new ArrayList<String>();
		
		if (code.field.equals("args")) {
			// Add deallocation flag to lhs register
			statements.add(indent + this.assignDealloc(code.target(0), function, stores));
		} else {
			if (isCopyEliminated) {
				// That means 'fieldload' access one member
				// rhs deallocation flag could be changed. But remove lhs deallocation flag
				statements.add(indent + this.removeDealloc(code.target(0), function, stores));
			} else {
				// Assign deallocation flag to lhs variable.
				statements.add(indent + this.assignDealloc(code.target(0), function, stores));
			}
		}

		return statements;

	}

	/**
	 * Add the post code to compute the deallocation flag of each function parameter,
	 * 
	 * For example,
	 * 
	 * <pre>
	 * <code>
	 * 		a = f(b, b_dealloc); // 'f' function frees 'b' array
	 * 		a_dealloc = b_dealloc; // transfer b's flag to a's flag 
	 * </code>
	 * </pre>
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @param copyAnalyzer
	 * @return
	 */
	public List<String> postDealloc(Codes.Invoke code, FunctionOrMethod function, CodeStores stores,
			Optional<CopyEliminationAnalyzer> copyAnalyzer) {
		List<String> statements = new ArrayList<String>();

		String indent = stores.getIndent(function);

		if (code.name.module().toString().contains("whiley/lang")) {
			
			switch (code.name.name()) {
			case "parse":
				//int rhs = code.operand(0);
				// Add deallocation flag to lhs.
				statements.add(indent + this.assignDealloc(code.target(0), function, stores));
				// Remove rhs deallocation flag
				statements.add(indent + this.removeDealloc(code.operand(0), function, stores));
				break;
			case "slice":
				// Add deallocation flag to lhs.
				statements.add(indent + this.assignDealloc(code.target(0), function, stores));
				break;
			case "fromBytes":
				// Assign flag to lhs
				statements.add(indent + this.assignDealloc(code.target(0), function, stores));
				break;
			case "append":
				statements.add(indent + this.assignDealloc(code.target(0), function, stores));
				break;
			case "toString":
				statements.add(indent + this.assignDealloc(code.target(0), function, stores));
				break;
			default:
				// no change to statement
				break;
			}
		} else {
			// Get return variable and type
			// Get function return variable
			String ret = "";
			Type ret_type = null;
			if (code.targets().length > 0) {
				ret = stores.getVar(code.target(0), function);
				// Get the return type
				ret_type = stores.getRawType(code.target(0), function);
			}
			
			
			// Apply the macros for each parameter
			int index = 0;
			for (int register : code.operands()) {
				String macro = computeDealloc(register, code, function, stores, copyAnalyzer);
				if(macro.equals("")){
					index++;
					// We do not need post code
					continue;
				}
				// Split the macro into an array of two string
				String[] parts = macro.split("\t");
				// Get macro name
				String macro_name = parts[0];
				// Get check results (mutable, return and live checks on parameter)
				String checks = parts[1];
				// Get function name
				String func_name = code.name.name();
				// Get parameter name
				String parameter = stores.getVar(register, function);
				// Get parameter type
				Type parameter_type = stores.getRawType(register, function);
				statements.add(indent + macro_name +"(" + parameter + ", \"" + checks + "\" , \"" + func_name + "\");");
				if (ret_type != null && stores.isCompoundType(ret_type)) {
					// Write the checks results as a parameter to macro
					// statements.add(indent+"//"+parameter+":"+checks);
					switch(macro_name){
					case "_CALLER_DEALLOC":
						// Get tmp param name
						String tmp_name = stores.getTmpParamName(parameter, index, code, function);
						if (parameter_type instanceof Type.Array) {
							Type elm_type = stores.getArrayElementType((Type.Array) parameter_type);
							if (elm_type instanceof Type.Byte || stores.isIntType(elm_type)) {
								// Applied caller macro and used standard 'free' function to release extra copy
								statements.add(indent + "_CALLER_DEALLOC_POST(" + ret + ", " + tmp_name + ");");
							} else {
								throw new RuntimeException("Not Implemented");
								// // An array of structures
								// // Translate the type
								// String type_name = CodeGeneratorHelper.translateType(parameter_type, stores)
								// .replace("*", "");
								// // Applied caller_struct macro and used structure free function to release extra copy
								// statements.add(indent + "_CALLER_DEALLOC_STRUCT_POST(" + ret + ", " + tmp_name + ",
								// \""
								// + checks + "\" , \"" + func_name + "\", " + type_name + ");");
							}
						} else {
							// Structure type
							String type_name = CodeGeneratorHelper.translateType(parameter_type, stores).replace("*",
									"");
							// Applied caller_struct macro and used structure free function to release extra copy
							statements.add(indent + "_CALLER_DEALLOC_STRUCT_POST(" + ret + ", " + tmp_name + "\", " + type_name + ");");
						}
						break;
					case "_RESET_DEALLOC":
						// Added the macros
						statements.add(indent + "_RESET_DEALLOC_POST(" + ret +", " + parameter + ");");			
						break;
					case "_RETAIN_DEALLOC":	
						// Added the macros
						statements.add(indent + "_RETAIN_DEALLOC_POST(" + ret +", "+ parameter + ");");
						break;
					case "_CALLEE_DEALLOC":	
						// Added the macros
						statements.add(indent + "_CALLEE_DEALLOC_POST("+ ret +", " + parameter + ");");
						break;						
					case "_SUBSTRUCTURE_DEALLOC":
						statements.add(indent + "_SUBSTRUCTURE_DEALLOC(" + parameter +");");
						statements.add(indent + this.assignDealloc(code.target(0), function, stores));
						break;
					default:
						throw new RuntimeException("Not implemented");
					}
				}else if(macro_name.equals("_CALLER_DEALLOC")){
					// Get tmp param name
					String tmp_name =stores.getTmpParamName(parameter, index, code, function);
					statements.add(indent + "free("+tmp_name+");");
				}
				index++;
			}
		}
		
		if(statements.size()==0){
			// For a = init(b, c) where a is int[], b is int and c is int
			// Add deallocation flag to lhs variable by default.
			if (code.targets().length > 0) {
				// Add the deallocation flag of lhs variable
				statements.add(indent + assignDealloc(code.target(0), function, stores));
			}
			
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
	 * @param lhs lhs register
	 * @param rhs rhs register
	 * @return
	 */
	private String addDealloc(int lhs, int rhs, FunctionOrMethod function, CodeStores stores) {
		Type type = stores.getRawType(lhs, function);
		String lhs_var = stores.getVar(lhs, function);
		String rhs_var = stores.getVar(rhs, function);
		if (type instanceof Type.Array) {
			// Get dimension 
			int dimension = stores.getArrayDimension(type);
			if(dimension == 1) {
				// Get element type, e.g. integer or byte
				Type elm_type = ((Type.Array)type).element();			
				if(stores.isIntType(elm_type)) {
					return "_ADD_DEALLOC(" + lhs_var + ", " + rhs_var + ", int64_t);";	
				}else if (elm_type instanceof Type.Byte) {
					return "_ADD_DEALLOC(" + lhs_var + ", " + rhs_var + ", BYTE);";
				}
			}
			return "_ADD_DEALLOC_POST(" + lhs_var + ", " + rhs_var + ");";			
		}else if (stores.isCompoundType(type) || type instanceof Type.Union) {
			return "_ADD_DEALLOC_POST(" + lhs_var + ", " + rhs_var + ");";
		}
		return "";
	}
	/**
	 * Generate 'a_dealloc:=true'
	 * 
	 * 
	 * @param register
	 * @param function
	 * @param stores
	 * @return
	 */
	private String assignDealloc(int register, FunctionOrMethod function, CodeStores stores) {
		Type type = stores.getRawType(register, function);
		if (stores.isCompoundType(type) || type instanceof Type.Union) {
			String var = stores.getVar(register, function);
			return var + "_dealloc = true;";
		}
		return "";
	}
	

	/**
	 * Set de-allocation flag of given register to be 'false'
	 * 
	 * @param reg
	 * @param function
	 */
	private String removeDealloc(int register, FunctionOrMethod function, CodeStores stores) {
		Type type = stores.getRawType(register, function);
		if (stores.isCompoundType(type) || type instanceof Type.Union) {
			String var = stores.getVar(register, function);
			return var + "_dealloc = false;";
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
	private String transferDealloc(int lhs, int rhs, FunctionOrMethod function, CodeStores stores) {
		Type type = stores.getRawType(lhs, function);
		if (type instanceof Type.Array) {
			String lhs_var = stores.getVar(lhs, function);
			String rhs_var = stores.getVar(rhs, function);
			int dimension = stores.getArrayDimension(type);
			Type elm_type = stores.getArrayElementType((Type.Array)type);
			if (dimension == 1 &&(stores.isIntType(elm_type) || elm_type instanceof Type.Byte)) {
				// For integer typed array, apply single transfer dealloc macro  
				return "_TRANSFER_DEALLOC(" + lhs_var + ", " + rhs_var +");";
			}else {
				// Otherwise, apply transfer structure macro
				return "_TRANSFER_DEALLOC_POST(" + lhs_var + ", " + rhs_var+");";
			}
			
		}else if (stores.isCompoundType(type) || type instanceof Type.Union) {
			String lhs_var = stores.getVar(lhs, function);
			String rhs_var = stores.getVar(rhs, function);
			return "_TRANSFER_DEALLOC_POST(" + lhs_var + ", " + rhs_var+");";
		}
		return "";
	}

	/**
	 * Return parameter deallocation flag of the caller.
	 * 
	 * If deallocation analyzer is enabled, then deallocation flags of caller and callee are based on the following
	 * rules, e.g. a function call 'a = f(b, b_own_f)', Rules are as below:
	 * 
	 * De-allocation rules for copy-made test case
	 * 
	 * <pre>
	 *  
	 * f mutates b?	   |F			     |F			       |T			      |T
	 * f returns b?	   |F			     |T			       |T			      |F
	 * -----------------------------------------------------------------------------
	 * b is alive?	F  |Copy	         |Copy	           |Copy		      |Copy
	 * 				   |'callee_dealloc' |'caller_dealloc' |'caller_dealloc'  |'callee_dealloc'
	 * -----------------------------------------------------------------------------
	 * 				T  |Copy	         |Copy	           |Copy	          |Copy
	 * 				   |'callee_dealloc' |'caller_dealloc' |'caller_dealloc'  |'callee_dealloc'
	 * 
	 * </pre>
	 * 
	 * De-allocation rules for copy-reduced test cases
	 * 
	 * <pre>
	 * f mutates b?		|F					|F			       |T			    |T
	 * f returns b?		|F					|T			       |T			    |F
	 * ------------------------------------------------------------------------------------------
	 * b is alive?  F	|No Copy			|No Copy	       |No Copy	        |No Copy
	 * 					|'retain_dealloc'   |'reset_dealloc'   |'reset_dealloc' |'retain_dealloc'
	 * ------------------------------------------------------------------------------------------
	 * 				T	|No Copy			|Copy      	       |Copy		    |Copy
	 * 					|'retain_dealloc'	|'caller_dealloc'  |'caller_dealloc'|'callee_dealloc'
	 * 
	 * 
	 * </pre>
	 * 
	 * 
	 * @param register
	 *            function argument
	 * @param code
	 *            function call byte-code
	 * @param function
	 *            caller function
	 * @param stores
	 *            code stores
	 * @param copyAnalyzer
	 * @return a string that contains macro name "\t" A "-" B "-"C, e.g. where A is the mutable check B is the return
	 *         check C is the Live variable check
	 * 
	 *         De-allocation macros include:
	 *         <ul>
	 *         <li>'substructure_dealloc': retains the flag of original parameter and passes 'false' flag to callee.
	 *         This macro is applied to sub-structure only <code>     
	 * 		  		a = f(b, false)
	 *        		a_dealloc = true
	 * 	    	</code>
	 *         <li>'retain_dealloc': retains the flag of original parameter and passes 'false' flag to callee. This
	 *         macro is applied to sub-structure or immutable parameter <code>     
	 * 		  		a = f(b, false)
	 *        		a_dealloc = true
	 * 	    	</code>
	 *         <li>'reset_dealloc': resets the flag of original parameter and passes 'false' flag to callee. <code>     
	 * 		  		a = f(b, false)
	 * 				b_dealloc = false
	 *        		a_dealloc = true
	 * 	    	</code>
	 *         <li>'callee_dealloc': passes the copied parameter to callee along with 'true' flag. This macro allows
	 *         'callee' to free the passing parameter. <code>     
	 * 		  		a = f(copy(b), true)
	 *        		a_dealloc = true
	 * 	    	</code>
	 *         <li>'caller_dealloc': passes the copied parameter to callee along with 'false' flag. This macro stops
	 *         caller freeing the passing parameter. <code>     
	 * 		  		a = f(copy(b), false)
	 *        		a_dealloc = true
	 * 	    	</code>
	 *         </ul>
	 * 
	 */
	public String computeDealloc(int register, Codes.Invoke code, FunctionOrMethod function, CodeStores stores,
			Optional<CopyEliminationAnalyzer> copyAnalyzer) {
		Type type = stores.getRawType(register, function);
		if (!stores.isCompoundType(type)) {
			return "";
		}

		FunctionOrMethod callingfunction = this.getCalledFunction(code);
		int arguement = mapFunctionArgumentToCalleeRegister(register, code);
		boolean isMutated = readwriteAnalyzer.isMutated(arguement, callingfunction);
		boolean isReturned = returnAnalyzer.isReturned(arguement, callingfunction);
		// Analyze the deallocation flags using live variable, read-write and return analysis
		boolean isLive = liveAnalyzer.isLive(register, code, function);

		String checks = isMutated + "-" + isReturned + "-" + isLive;
		// Analyze the copy
		if (copyAnalyzer.isPresent()) {
			// Check if the register is a substructure
			boolean isSubStructure = stores.isSubstructure(register, function);
			if (isSubStructure) {
				// The substructure is passed to function call with 'false' flag
				return "_SUBSTRUCTURE_DEALLOC" + "\t" + checks;
			}
			
			if (!isMutated) {
				// NOT mutated
				if (!isReturned) {
					// NOT mutated nor return
					if (!isLive) {
						return "_RETAIN_DEALLOC" + "\t" + checks;
					} else {
						return "_RETAIN_DEALLOC" + "\t" + checks;
					}
				} else {
					// NOT mutated but returned
					if (!isLive) {
						// If 'b' is NOT alive at caller site
						return "_RESET_DEALLOC" + "\t" + checks;
					} else {
						// If 'b' is alive at caller site, then we use caller macro
						return "_CALLER_DEALLOC" + "\t" + checks;
						//return "_RESET_DEALLOC" + "\t" + checks;
					}
				}
			} else {
				// Mutated
				if (isReturned) {
					// Mutated and returned
					if (!isLive) {
						// 'b' is NOT alive
						return "_RESET_DEALLOC" + "\t" + checks;
					} else {
						// 'b' is alive
						return "_CALLER_DEALLOC" + "\t" + checks;
					}
				} else {
					// Mutated and NOT returned
					if (!isLive) {
						return "_RETAIN_DEALLOC" + "\t" + checks;
					} else {
						// 'b' is alive
						return "_CALLEE_DEALLOC" + "\t" + checks;
					}
				}
			}
		} else {
			// Naive code that the copy is always needed.
			if (!isMutated) {
				if (isReturned) {
					// The de-allocation is Not done at callee.
					return "_CALLER_DEALLOC" + "\t" + checks;
				}
			} else {
				if (isReturned) {
					return "_CALLER_DEALLOC" + "\t" + checks;
				}
			}
			// For other cases, the de-allocation is done at callee.
			return "_CALLEE_DEALLOC" + "\t" + checks;
		}
	}

	/**
	 * Adds the pre-deallocation code to release the lhs variable of update byte-code. For example,
	 * 
	 * <pre>
	 * <code>
	 * // Free target lhs variable.
	 * free(a[n]);
	 * a[n] = NULL;
	 * a[n] = b; 
	 * // Update a[i] with b 
	 * </code>
	 * </pre>
	 * 
	 * The update of substructure does not require to check the top-level de-allocation flag, but directly free the
	 * substructure. This is because substructure does not have the de-allocation.
	 * 
	 *
	 * @param lhs
	 * @param code
	 *            update byte-code
	 * @param function
	 *            function
	 * @param stores
	 * @return
	 */
	public String preDealloc(String lhs, Codes.Update code, FunctionOrMethod function, CodeStores stores) {
		Type lhs_type = stores.getRawType(code.target(0), function);
		// Get struct variable, e.g. a[i]
		String struct_var = stores.getVar(code.target(0), function);
		Type rhs_type = stores.getRawType(code.operand(code.operands().length - 1), function);
		if (lhs_type instanceof Type.Array || lhs_type instanceof Type.Record) {
			if (rhs_type instanceof Type.Record) {
				// LHS and RHS are both structures
				String struct = CodeGeneratorHelper.translateType(rhs_type, stores).replace("*", "");
				// Use '_DEALLOC_MEMBER_STRUCT_UPDATECODE' macro to forcedly release the lhs
				return "_DEALLOC_MEMBER_STRUCT_UPDATECODE(" + struct_var + ", " + lhs + ", " + struct + ");";
			}
		}

		// No needs to de-allocate lhs variable.
		return "";

	}

	/**
	 * Generate the pre-deallocation code to release the lhs variable e.g.
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
	public String preDealloc(String var, Type type, CodeStores stores) {
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

			// For integer array, byte array or NULL array
			if (stores.isIntType(elem_type) || elem_type instanceof Type.Void || elem_type instanceof Type.Byte) {
				if (dimension == 2) {
					return "_DEALLOC_2DARRAY(" + var + ");";
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
		} else if (stores.isIntArrayOrAliasedType(type)) {
			// Release an aliased array type, e.g. a string
			return "_DEALLOC(" + var + ");";
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

	/**
	 * Generate Post-deallocation code.
	 * 
	 * @param isCopyEliminated
	 * @param register
	 * @param statement
	 * @param code
	 * @param function
	 */
	public void postDealloc(boolean isCopyEliminated, int register, List<String> statement, Code code,
			FunctionOrMethod function, CodeStores stores) {

		// Compute deallocation flag of lhs register
		if (code instanceof Codes.Assign) {
			statement.addAll(computeDealloc(isCopyEliminated, (Codes.Assign) code, function, stores));
		} else if (code instanceof Codes.Update) {
			statement.addAll(computeDealloc((Codes.Update) code, function, stores));
		} else if (code instanceof Codes.FieldLoad) {
			statement.addAll(computeDealloc(isCopyEliminated, (Codes.FieldLoad) code, function, stores));
		}
	}

	/**
	 * Generate the post-deallocation code.
	 * 
	 * 
	 * @param statement
	 * @param code
	 * @param function
	 * @param storese
	 */
	public void postDealloc(List<String> statement, Code code, FunctionOrMethod function, CodeStores stores) {
		if (code instanceof Codes.ArrayGenerator) {
			statement.addAll(computeDealloc((Codes.ArrayGenerator) code, function, stores));
		} else if (code instanceof Codes.Const) {
			statement.addAll(computeDealloc((Codes.Const) code, function, stores));
		} else if (code instanceof Codes.NewArray) {
			statement.addAll(computeDealloc((Codes.NewArray) code, function, stores));
		} else if (code instanceof Codes.IndexOf) {
			statement.addAll(computeDealloc((Codes.IndexOf) code, function, stores));
		} else {
			throw new RuntimeException("Not implemented");
		}

	}

	@Override
	public void apply(WyilFile module, Optional<HashMap<FunctionOrMethod, FunctionOrMethod>> transformFuncMap) {
		super.apply(module, transformFuncMap);
	}

	@Override
	protected void visit(DefaultMutableTreeNode node) {
		// TODO Auto-generated method stub

	}

}
