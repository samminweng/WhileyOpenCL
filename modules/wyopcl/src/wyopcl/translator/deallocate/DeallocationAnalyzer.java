package wyopcl.translator.deallocate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import wybs.lang.Builder;
import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Constant;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;
import wyopcl.translator.Analyzer;
import wyopcl.translator.copy.CopyEliminationAnalyzer;
import wyopcl.translator.generator.CodeGeneratorHelper;
import wyopcl.translator.generator.CodeStores;


/**
 * 
 * @author Min-Hsien Weng
 *
 */
public class DeallocationAnalyzer extends Analyzer {
	private HashMap<FunctionOrMethod, OwnershipVariables> ownerships;
	public DeallocationAnalyzer(Configuration config){
		super(config);
		this.ownerships = new HashMap<FunctionOrMethod, OwnershipVariables>();
	}
	
	public String declareOwnershipVar(String indent, int register, FunctionOrMethod function, CodeStores stores ){
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
	 * Get a list of ownership variables and generate the code to free all of them
	 * Note that the deallocation of function input parameters are skipped by default.
	 * Thus, the deallocation releases all the local variables, excluding input parameters. 
	 *
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 *
	 */
	public List<String> freeAllMemory(Codes.Return code, FunctionOrMethod function, CodeStores stores){
		List<String> statements = new ArrayList<String>();
		
		// Get all registers
		List<Integer> registers = stores.getAllVars(function);
			
		// Skip the return values
		int ret = -1;
		if(code.operands().length >0){
			ret = code.operand(0);
		}
		
		String indent = stores.getIndent(function);
		// Skip the deallocation of function parameters.
		for(int r : registers){
			// Skip the deallocation for return value.
			if(r != ret){
				Type var_type = stores.getRawType(r, function);
				if(var_type != null && !(var_type instanceof Type.Null)){
					String var = stores.getVar(r, function);
					statements.add(indent + addDeallocatedCode(var, var_type, stores));
				}
			}
		}

		return statements;
		
	}
	
	
	/**
	 * Given a code, compute the ownerships and return the generated C code. 
	 * 
	 * Note the lhs variable in an assignment is not always added with ownership.
	 * 
	 * If the lhs variable points to an array element, then its ownership is transferred out. 
	 * Because the array variable owns the ownership, other variables that point to the array 
	 * lost the ownership. For example, 
	 * <pre><code>
	 * 		a = b[i]; // Access the array element 
	 * 		a_has_ownership = false; // Transfer lhs ownership 
	 * 
	 * 		c = a;
	 * 		a_has_ownership = false;
	 * 		c_has_ownership = false; // Transfer lhs ownership
	 * 
	 * @param code
	 * @param function
	 * @param stores
	 * @return
	 */
	public List<String> computeOwnership(String indent, boolean isCopyEliminated, Code code, FunctionOrMethod function, CodeStores stores){
		List<String> statements = new ArrayList<String>();
		if(code instanceof Codes.Assign){			
			Codes.Assign assign = (Codes.Assign)code;
			int lhs = assign.target(0);
			int rhs = assign.operand(0);
			
			// Special case for NULL type ( a = NULL;)
			if(assign.type(0) instanceof Type.Null){
				// Remove lhs ownership
				statements.add(indent + removeOwnership(lhs, function, stores));
			}else{
				if(isCopyEliminated){
					// Transfer rhs ownership to lhs 
					statements.add(indent + transferOwnership(lhs, rhs, function, stores));
					// Remove rhs ownership
					statements.add(indent + removeOwnership(rhs, function, stores));
				}else{
					// Add rhs to ownership set
					statements.add(indent + addOwnership(lhs, function, stores));
				}
			}
		}else if (code instanceof Codes.IndexOf){
			Codes.IndexOf indexof = (Codes.IndexOf)code;
			int lhs = indexof.target(0);
			// Add lhs register to array variable
			stores.addArrayVar(lhs, function);
			// Transfer lhs ownership due to non-transferable array ownership 
			statements.add(indent + removeOwnership(lhs, function, stores));
			
		}else if (code instanceof Codes.Update){
			Codes.Update update = (Codes.Update)code;
			// The rhs register is always the last operand (a[i] = b)
			int rhs = update.operand(update.operands().length - 1);
			
			if(isCopyEliminated){
				// Remove the rhs ownership
				statements.add(indent + removeOwnership(rhs, function, stores));
			}
		}else if(code instanceof Codes.Invoke){
			Codes.Invoke invoke = (Codes.Invoke)code;
			if(invoke.name.name().equals("parse")){
				int lhs = invoke.target(0);
				int rhs = invoke.operand(0);
				//Add ownership to lhs.
				statements.add(indent + addOwnership(lhs, function, stores));
				// Remove rhs ownership
				statements.add(indent + removeOwnership(rhs, function, stores));
				
			}else{
				throw new RuntimeException("Not implement");
			}
			
		}else if(code instanceof Codes.FieldLoad){
			Codes.FieldLoad fieldload = (Codes.FieldLoad)code;
			int lhs = fieldload.target(0);
			int rhs = fieldload.operand(0);
			
			if(isCopyEliminated){
				statements.add(indent + transferOwnership(lhs, rhs, function, stores));
				statements.add(indent + removeOwnership(rhs, function, stores));
			}else{
				// Assign ownership to lhs variable if the rhs variable is copied.
				statements.add(indent + addOwnership(lhs, function, stores));
			}			
		}else if(code instanceof Codes.NewRecord){
			Codes.NewRecord nr = (Codes.NewRecord)code;
			int lhs = nr.target(0);
			int rhs = nr.operand(0);
			if(isCopyEliminated){
				statements.add(indent + transferOwnership(lhs, rhs, function, stores));
				statements.add(indent + removeOwnership(rhs, function, stores));
			}else{
				// Assign ownership to lhs variable if the rhs variable is copied.
				statements.add(indent + addOwnership(lhs, function, stores));
			}
		}else{
			throw new RuntimeException("Not implemented");
		}
		
		return statements;
	}
	
	
	/**
	 * Adds the register to ownership and generate the code
	 * 
	 * <pre><code>
	 * bool a_has_ownership = true;
	 * </code></pre>
	 * @param var
	 * @return
	 */
	public String addOwnership(int register, FunctionOrMethod function, CodeStores stores){
		Type type = stores.getRawType(register, function);
		if(stores.isCompoundType(type) || type instanceof Type.Union){
			String var = stores.getVar(register, function);
			this.ownerships.get(function).addOwnership(register);
			return "_ADD_OWNERSHIP("+var+");";
		}
		return "";
	}

	/**
	 * Takes out 'register' from 'ownership' set
	 * @param reg
	 * @param function
	 */
	public String removeOwnership(int register, FunctionOrMethod function, CodeStores stores){
		Type type = stores.getRawType(register, function);
		if(stores.isCompoundType(type)|| type instanceof Type.Union){
			String var = stores.getVar(register, function);
			this.ownerships.get(function).removeOwnership(register);
			return "_REMOVE_OWNERSHIP("+var+");";
		}
		return "";
	}

	
	/**
	 * Transfer rhs's ownership to lhs's ownership for an assignment
	 * a = b;
	 * a_has_ownership = b_has_ownership
	 * 
	 * @param lhs register
	 * @param rhs register
	 * @param function
	 */
	public String transferOwnership(int lhs, int rhs, FunctionOrMethod function, CodeStores stores){
		Type type = stores.getRawType(lhs, function);
		if(stores.isCompoundType(type)|| type instanceof Type.Union){
			String lhs_var = stores.getVar(lhs, function);
			String rhs_var = stores.getVar(rhs, function);
			//this.ownerships.get(function).removeOwnership(register);
			return "_TRANSFER_OWNERSHIP("+lhs_var+", "+rhs_var+");";
		}
		return "";
	}
	
	/**
	 * Return parameter ownership in the caller. If deallocation is enabled, then pass the ownership to a function. 
	 * The ownership value are based on based on the following rules, e.g. a function call 'a = f(b, b_own_f)', 
	 * 
	 * <table>
	 * <thead>
	 * <tr><th colspan="2"> f mutates b?</th><th>F</th><th>F</th><th>T</th><th>T</th></tr>
	 * <tr><th colspan="2"> f returns b?</th><th>F</th><th>T</th><th>T</th><th>F</th></tr>
	 * </thead>
	 * <tbody>
	 * <tr><td rowspan="3"> b is live?</td><td rowspan="3">T</td><td>No copy </td><td>No copy </td><td>Copy</td><td>Copy</td></tr>
	 * <tr><td>b_own=T</td><td>b_own=F</td><td>b_own=T</td><td>b_own=T</td><td></td></tr>
	 * <tr><td>b_own_f=F</td><td>b_own_f=T</td><td>b_own_f=T</td><td>b_own_f=T</td><td></td></tr>
	 * <tr><td rowspan="3"> b is live?</td><td rowspan="3">F</td><td>No copy </td><td>No copy </td><td>No copy</td><td>No copy</td></tr>
	 * <tr><td>b_own=T</td><td>b_own=F</td><td>b_own=F</td><td>b_own=F</td><td></td></tr>
	 * <tr><td>b_own_f=F</td><td>b_own_f=T</td><td>b_own_f=T</td><td>b_own_f=T</td><td></td></tr>
	 * </tbody>
	 * </table>
	 * @param type
	 * @param copyAnalyzer
	 * @return a hashmap that contains caller's ownership and callee's ownership for a parameter. 
	 */
	public Optional<HashMap<String, Boolean>> computeCallParameterOwnership(int register, Codes.Invoke code, FunctionOrMethod function, CodeStores stores, Optional<CopyEliminationAnalyzer> copyAnalyzer){
		Type type = stores.getRawType(register, function);
		if(!stores.isCompoundType(type)){
			return Optional.empty();
		}
		
		boolean isLive = true;
		if(copyAnalyzer.isPresent()){
			isLive = copyAnalyzer.get().isLive(register, code, function);
		}
		
		String var = this.mapToFunctionParameters(register, code);
		FunctionOrMethod f = this.getFunction(code.name.name(), code.type(0));
		boolean isMutated = this.isMutated(var, f);
		boolean isReturned = this.isReturned(var, f);
		
		Optional<HashMap<String, Boolean>> ownership = Optional.of(new HashMap<String, Boolean>());
		if(!isMutated){
			if(!isReturned){
				// Caller ownership
				ownership.get().put("caller", true);
				ownership.get().put("callee", false);
			}else{
				ownership.get().put("caller", false);
				ownership.get().put("callee", true);
			}
		}else{
			if(isReturned){
				// 'b' is alive
				if(isLive){
					ownership.get().put("caller", true);
					ownership.get().put("callee", true);
				}else{
					ownership.get().put("caller", false);
					ownership.get().put("callee", true);
				}
			}else{
				if(isLive){
					ownership.get().put("caller", true);
					ownership.get().put("callee", true);
				}else{
					ownership.get().put("caller", false);
					ownership.get().put("callee", true);
				}
			}
		}
		
		return ownership;
	}

	
	/**
	 * Generate the code to release the memory for a given variable, e.g. 
	 * <pre><code>
	 * if(a_has_ownership){free_Board(a); a_has_ownership = false;}
	 * </code></pre>
	 * where 'a' is a board and 'a_has_ownership' flag indicates whether 'a' owns an object.
	 * 
	 * @param var
	 * @param type
	 * @param stores
	 * @return
	 */
	public String addDeallocatedCode(String var, Type type, CodeStores stores){
		if(!stores.isCompoundType(type)&& !(type instanceof Type.Union)){
			return "";
		}
		
		// Get function name
		String name = "";
		// Check if var_type is a structure
		if(type instanceof Type.Array){
			Type.Array arr_type = (Type.Array)type;
			Type elem_type = stores.getArrayElementType(arr_type);
			int dimension = stores.getArrayDimension(arr_type);
			 
			// For integer array or NULL array
			if(stores.isIntType(elem_type)|| elem_type instanceof Type.Void){
				if(dimension== 2){
					return "_FREE2DArray("+var+");";
				}else{
					// Use _FREE macro to release the array variable.
					return "_FREE("+var+");";
				}
			}else{
				name = CodeGeneratorHelper.translateType(elem_type, stores).replace("*", "");
				if(dimension==1){
					// Use '_FREE_1DARRAY_STRUCT' to release an array of structure
					return "_FREE_1DARRAY_STRUCT("+var+", "+name+");";
				}else{
					throw new RuntimeException("Not implemented");
				}
				
			}
			
		}else if(type instanceof Type.Record){
			name =  CodeGeneratorHelper.translateType(type, stores).replace("*", "");
			return "_FREE_STRUCT("+var+", "+name+");";
		}else if(type instanceof Type.Union){
			if(stores.isIntType(type)){
				return "_FREE("+var+");";
			}else{
				name =  CodeGeneratorHelper.translateType(type, stores).replace("*", "");
				return "_FREE_STRUCT("+var+", "+name+");";
			}
		}else{
			throw new RuntimeException("Not implemented");
		}
	}
	
	
	
	@Override
	public void apply(WyilFile module) {
		super.apply(module);
		
		for(FunctionOrMethod function: module.functionOrMethods()){
			if(!this.ownerships.containsKey(function)){
				this.ownerships.put(function, new OwnershipVariables());
			}
		}
		
	}
	
}
