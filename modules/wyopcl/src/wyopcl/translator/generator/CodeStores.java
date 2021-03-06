package wyopcl.translator.generator;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.Map.Entry;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import wyc.lang.Stmt.VariableDeclaration;
import wyil.attributes.VariableDeclarations;
import wyil.attributes.VariableDeclarations.Declaration;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Codes.FieldLoad;
import wyil.lang.Type;
import wyil.lang.Type.Nominal;
import wyil.lang.Type.Record;
import wyil.lang.Type.Record.State;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.Configuration;

/**
 * Stores the generated code and provides common functionality for code generator.
 * 
 * @author Min-Hsien Weng
 *
 */
public class CodeStores {
	private String prefix = "_";
	private boolean isVerbose;
	private List<FunctionOrMethod> functions;
	private List<wyil.lang.WyilFile.Type> userTypes;// Store all the user-defined types at source level, e.g. Board.
	protected HashMap<FunctionOrMethod, CodeStore> stores; // Store generated code for each function
	// Store the function names, e.g. _Cash_
	private HashMap<FunctionOrMethod, String> functionNames;
	// Store aliased variable (register number) of command line arguments
	private List<String> aliasedCmdArguments; 
	
	public CodeStores(boolean isVerbose, WyilFile module){
		this.isVerbose = isVerbose;
		this.userTypes = (List<wyil.lang.WyilFile.Type>) module.types();
		this.functions = new ArrayList<FunctionOrMethod>(module.functionOrMethods());
		this.stores = new HashMap<FunctionOrMethod, CodeStore>();
		this.functionNames = new HashMap<FunctionOrMethod, String>();
		this.aliasedCmdArguments = new ArrayList<String>();
		initFunctionNames(module);
	}
	/**
	 * Return temporary parameter name to store extra copies
	 * For example, 'func(a, b)'
	 * The temporary variable at index 1 is 'tmp_b'.
	 * If 'tmp_b' is used, then 'tmp_b_0', 'tmp_b_1', etc
	 * 
	 * @param param
	 * @param index
	 * @param code
	 * @param func
	 * @return
	 */
	public String getTmpParamName(String param, int index, Codes.Invoke code, FunctionOrMethod func){
		// Get code store of 'function'
		CodeStore store = stores.get(func);
		// Extract called function from 
		FunctionOrMethod calledFunc = getFunction(code.name.name(), code.type(0));
		// Get parameter name at index of calledFunc
		String fparam = getVar(index, calledFunc);
		// Get the name of temporary parameter at 'func' 
		return store.getTmpParamName(fparam, index, code);
	}
	
	
	
	/**
	 * Alias register and command line argument
	 * @param register
	 */
	public void aliasCmdArgument(String var_name){
		aliasedCmdArguments.add(var_name);
	}
	
	/**
	 * Check if register is an aliased to command line arguments
	 * @param register
	 * @return
	 */
	public boolean isAliasedCmdArg(String var_name){
		return aliasedCmdArguments.contains(var_name);
	}
	
	/**
	 * Add the transformed function byte-code to the function name map.
	 * 
	 * @param function
	 * @param transformedFunction
	 */
	public void addTransformFunctionName(FunctionOrMethod function, FunctionOrMethod transformedFunction){
		// Get the name of original function 
		String name = getFunctionName(function);
		// The name of transformed function is the same as the original one
		this.functionNames.put(transformedFunction, name);
	}
	
	
	/**
	 * Adds an unique number to the suffix of a function name
	 * 
	 * @param func_name
	 * @return
	 */
	private String getUniqueFunctionName(String func_name){
		String name;
		// Rename the function name by adding a number
		int i=1;
		do{
			// Recursively create a new function name, e.g. _Cash_1_
			name = prefix+func_name+prefix+i+prefix;
			i++;
		}while(functionNames.containsValue(name)); // If the name is duplicated
		
		return name;
	}
	
	/**
	 * Go through each function/method and add its function name to the map. 
	 * 
	 * @param module
	 */
	private void initFunctionNames(WyilFile module){
		// Go through all functions or methods
		for(FunctionOrMethod function: module.functionOrMethods()){
			// Skip main function
			if(function.name().equals("main")){
				// Add 'main' without any change
				functionNames.put(function, "main");
				continue;
			}
			
			// Add a function name e.g. _Cash_
			String name = prefix+function.name()+prefix;
			// Check if the function name exists.
			if(functionNames.containsValue(name)){
				name = getUniqueFunctionName(function.name());
			}
			// Put the name to map
			functionNames.put(function, name);
		}
	}
	
	
	/**
	 * Get the function byte using name and type
	 * 
	 * @param name
	 * @param type
	 * @return
	 */
	protected FunctionOrMethod getFunction(String name, Type.FunctionOrMethod type){
		// Get the function byte with function name and type
		for(FunctionOrMethod func: functions){
			if(func.name().equals(name)
					&&func.type().equals(type)){
				// Put the function name to the map
				return func;
			}
		}
		return null;
	}
	
	/**
	 * Given a function byte code, add or retrieves the name of the function, e.g. _Cash_
	 * 
	 * @param func
	 * @return
	 */
	public String getFunctionName(FunctionOrMethod function){
		// Return the function name
		return functionNames.get(function);
	}
	
	/**
	 * Given a invoke byte code, gets the name of called function 
	 * 
	 * @param func_type
	 * @return
	 */
	public String getFunctionName(Codes.Invoke code){
		// Get the function byte
		FunctionOrMethod func = getFunction(code.name.name(), code.type(0));
		// Get function name
		return functionNames.get(func);
	}
	
	/**
	 * Get the code store of the given function.
	 * 
	 * @param function
	 * @return
	 */
	private CodeStore getCodeStore(FunctionOrMethod function) {
		// Lazy initailization.
		if (!stores.containsKey(function)) {
			// Put the code store into the stores
			stores.put(function, new CodeStore(function));
		}
		return stores.get(function);
	}
	
	/**
	 * Get all variables (registers) used in a function.
	 * 
	 * 
	 * @param function function
	 * @return a list of variables.
	 */
	public List<Integer> getAllVars(FunctionOrMethod function){
		List<Integer> vars = new ArrayList<Integer>();
		VariableDeclarations declarations = function.attribute(VariableDeclarations.class);
		for(int register=0;register<declarations.size();register++){
			vars.add(register);
		}
		return vars;
	}
	
	/**
	 * Adds the generated statements (e.g. C code) for given wyil code
	 * @param code
	 * @param statement
	 * @param function
	 */
	protected void addAllStatements(Code code, List<String> statement, FunctionOrMethod function) {
		CodeStore store = getCodeStore(function);
		store.addAllStatements(code, statement);
	}
	/**
	 * Adds the generated C code for a given wyil code.
	 * @param code
	 * @param statement
	 * @param function
	 */
	protected void addStatement(Code code, String statement, FunctionOrMethod function){
		CodeStore store = getCodeStore(function);
		store.addStatement(code, statement);
	}
	
	/**
	 * Get the current indentation used in the given function.
	 * @param function
	 * @return
	 */
	public String getIndent(FunctionOrMethod function) {
		CodeStore store = getCodeStore(function);
		return store.indent;
	}
	
	/**
	 * Load a target register to a specific field to code store
	 * @param target
	 * @param field
	 */
	protected void loadField(int register, String field, FunctionOrMethod function) {
		CodeStore store = getCodeStore(function);
		store.loadField(register, field);
	}
	
	
	/**
	 * 
	 * Add 'register' to the substructure set 
	 * 
	 * @param lhs
	 * @param rhs
	 * @param function
	 */
	protected void addSubStructure(int register, FunctionOrMethod function){
		CodeStore store = getCodeStore(function);
		// Check if rhs is a substructure
		store.addSubStructure(register);
	}
	
	
	/**
	 * Check if rhs is a substructure. If so, then lhs is also a substructure.
	 * 
	 * @param lhs
	 * @param rhs
	 * @param function
	 */
	protected void addSubStructure(int lhs, int rhs, FunctionOrMethod function){
		CodeStore store = getCodeStore(function);
		// Check if rhs is a substructure
		if(store.isSubstructure(rhs)){
			// If so, the lhs register is also a substructure
			store.addSubStructure(lhs);
		}
	}
	
	
	
	
	/**
	 * Check if a register is a substructure (field).
	 * 
	 * @param register
	 * @param function
	 * @return true if the register is a substructure.
	 */
	public boolean isSubstructure(int register, FunctionOrMethod function){
		CodeStore store = getCodeStore(function);
		// Check if the register is a field
		return store.isSubstructure(register);
	}
	
	/**
	 * Get the lambda expression to the register
	 * @param register
	 * @param lambda
	 */
	protected FunctionOrMethod getLambda(String name){
		for (FunctionOrMethod funcOrMethod: functions){
			if(funcOrMethod.name().equals(name)){
				return funcOrMethod;
			}
		}
		return null;
	}
	
	
	/**
	 * Get the raw type of a given register, defined in 'f' function
	 * @param register
	 * @param function
	 * @return
	 */
	public Type getRawType(int register, FunctionOrMethod function){
		CodeStore store = getCodeStore(function);
		return store.getRawType(register);
	}
	/**
	 * Get the variable name of a given register defined in 'f' function
	 * @param register
	 * @param function
	 * @return
	 */
	public String getVar(int register, FunctionOrMethod function){
		
		CodeStore store = getCodeStore(function);
		return store.getVar(register);
	}
	
	/**
	 * Get the fields from a record type. 
	 * 
	 * Although record type provides 'keys()' function to get the fields set,
	 * the fields are returned by a Hashset, and their orders are not preserved and inconsistent with operands. 
	 * 
	 * That makes trouble when generating newrecord bytecode. For example, the 'newrecord' code for creating a matrix
	 * <pre>
	 * <code> 
	 * newrecord %3 = (%2, %1, %0) : {int[][] data,int height,int width}
	 * </code>
	 * </pre>
	 * The 'data' fields is mapped to %0, 'height' to %1 and 'width' to %2.
	 * But the return key set  
	 * <code>
	 * [data, width, height]
	 * </code> has a different orders.
	 * @param record
	 * @return
	 */
	public List<String> getMemebers(Type.Record record){
		//System.out.println(record.keys());
		State fields = (State) record.automaton.states[0].data;
		List<String> members = fields.stream().collect(Collectors.toList());
		return members;
	}
	
	
	/**
	 * Given an array type, compute its array dimension.
	 * 
	 * @param type
	 * @return the array dimension. Return 0 if the input is not an array type.
	 */
	public int getArrayDimension(Type type){
		int dimension = 0;
		
		if(type instanceof Type.Array){
			// Compute array dimension.
			while(type != null && type instanceof Type.Array){
				type = ((Type.Array)type).element();
				dimension++;
			}
		}else if(isIntArrayOrAliasedType(type)){
			// Check if the type is aliased to integer array type 
			dimension = 1;
		}
		

		return dimension;
	}
	
	
	/**
	 * Check if the type is instance of Integer by inferring the type from
	 * <code>wyil.Lang.Type</code> objects, including the effective collection
	 * types.
	 * 
	 * @param type
	 * @return true if the type is or contains an integer type.
	 */
	public boolean isIntType(Type type) {
		if (type instanceof Type.Int) {
			return true;
		}
		if(type instanceof Type.Union){
			// Check if the union type contains INT type.
			if(((Type.Union)type).bounds().contains(Type.Int.T_INT)){
				return true;
			}
		}
		// Check if the raw nominal type is 'Int' type.
		if(type instanceof Type.Nominal){
			Optional<wyil.lang.WyilFile.Type> nominal = Optional.ofNullable(getUserDefinedType(type));
			if(nominal.isPresent() && nominal.get().type() instanceof Type.Int){
				return true;
			}
		}
		
		return false;
	}
	
	/**
	 * Returns the record types for an union/record type.
	 * @param type
	 * @return
	 */
	protected Type.Record getRecordType(Type type){

		if(type instanceof Type.Record){
			return (Type.Record)type;
		}else if(type instanceof Type.Union){
			Type.Union union = (Type.Union)type;
			Iterator<Type> iterator = union.bounds().iterator();
			while(iterator.hasNext()){
				Type t = iterator.next();
				if(t instanceof Type.Record){
					return (Type.Record)t;
				}else if(t instanceof Type.Nominal){
					wyil.lang.WyilFile.Type nominal = getUserDefinedType((Type.Nominal)t);
					if(nominal!=null){
						return (Type.Record)nominal.type();
					}
				}
			}
			return null;
			//throw new RuntimeException("Can not find the record type");
		}else{
			throw new RuntimeException("Not implemented");
		}
	}
	
	/**
	 * Extract the basic element type of an array type (recursively).
	 * @param type
	 * @return
	 */
	public Type getArrayElementType(Type type){
		if(type instanceof Type.Array){
			Type elmType = ((Type.Array)type).element();
			if(elmType instanceof Type.Array){
				return getArrayElementType((Type.Array)elmType);
			}	
			return elmType;
		}
		if(isIntArrayOrAliasedType(type)){
			return Type.T_INT; // The element type of aliased integer array is integer type
		}
		
		// For other cases, return null.
		return null;
	}
	
	
	/**
	 * Check if the union type is an union of int[]|null
	 * 
	 * 
	 * 
	 * @param union
	 * @return true
	 */
	public boolean isIntArrayOrAliasedType(Type type){
		if(type instanceof Type.Array){
			return true;
		}
		
		// Union type
		if(type instanceof Type.Union){
			Type.Union union = (Type.Union)type;
			Iterator<Type> iterator = union.bounds().iterator();
			while(iterator.hasNext()){
				Type t = iterator.next();
				if(t instanceof Type.Null){
					continue;
				}else if(t instanceof Type.Nominal){
					wyil.lang.WyilFile.Type nominal = getUserDefinedType((Type.Nominal)t);
					if(nominal!=null){
						// Check if the union type is an array type.
						if(nominal.type() instanceof Type.Array){
							return true;//  
						}
					}
				}else if(t instanceof Type.Array){
					Type element = ((Type.Array)t).element();
					if(isIntType(element)){
						return true;
					}
				}
			}
		}else if (type instanceof Type.Nominal){
			// Special case for ASCII::String
			Type.Nominal nominal = (Type.Nominal)type;
			if(nominal.name().toString().equals("whiley/lang/ASCII:string")){
				return true;// String is a byte array.
			}
			
			// Get the user type
			wyil.lang.WyilFile.Type userType = getUserDefinedType((Type.Nominal)type);
			if(userType!=null){
				// Check if the union type is an array type.
				if(userType.type() instanceof Type.Array){
					return true;//  
				}
			}
			
		}
		
		
		return false;
	}
	
	
	
	/**
	 * Check if the type of given register is an array or record (excluding 'print' fields)
	 * 
	 * @param register
	 * @param function
	 * @return
	 */
	public boolean isCompoundType(Type type){
		// Check if type aliased to INT type.
		if(type instanceof Type.Array){
			return true;
		}
		if(type instanceof Type.Null){
			return false;
		}

		// Byte type is not a compound type
		if(type instanceof Type.Byte){
			return false;
		}

		if(isIntType(type) || type instanceof Type.FunctionOrMethod ||
				type instanceof Type.Bool){
			return false;			
		}

		if(type instanceof Type.Record){
			Type.Record record = (Type.Record)type;
			// Check if the variable contains 'printf' field. 
			long nonePrintFields = record.fields().keySet().stream()
					.filter(f -> !f.contains("print") && !f.contains("println") && !f.contains("print_s") && !f.contains("println_s") )
					.count();

			// If NOT a printf field, then add ownership.
			if(nonePrintFields>0){
				return true;
			}else{
				return false;
			}
		}

		if(type instanceof Type.Nominal){				
			// Special case
			Type.Nominal nominal = (Type.Nominal)type;
			if(nominal.name().toString().equals("whiley/lang/ASCII:string")){
				return true; // A string is an integer array
			}

			// Get nominal type
			Optional<wyil.lang.WyilFile.Type> user_type = Optional.ofNullable(getUserDefinedType(type));
			if(user_type.isPresent()){
				return isCompoundType(user_type.get().type());
			}else{
				return false;
			}
		}

		if(type instanceof Type.Union){
			// Check if the union type is an integer array
			if(isIntArrayOrAliasedType(type)){
				return true; // Not a compound type
			}

			// The record may be null or non-null
			Optional<Record> record = Optional.ofNullable(getRecordType((Type.Union)type));
			if(record.isPresent()){
				return isCompoundType(record.get());
			}else{
				return true;
			}
		}
		throw new RuntimeException("Not Implemented");
		
	}
	
	/**
	 * Get the existential nominal type, which has been defined in the program.
	 * @param nominal
	 * @return
	 */
	private WyilFile.Type getUserDefinedType(Type.Nominal nominal){
		for (wyil.lang.WyilFile.Type user_type : this.userTypes) {
			if(user_type.name().equals(nominal.name().name())){
				return user_type;
			}
		}
		return null;
	}
	
	/**
	 * Check if two record types are matched.
	 * @param r1
	 * @param r2
	 * @return
	 */
	private static boolean isTypeMatched(Type.Record r1, Type.Record r2){
		if(r1 == null || r2 == null){
			return false;
		}
		
		// check if record and type have the same fields.
		boolean isMatched = true;
		for (Entry<String, Type> field : r2.fields().entrySet()) {
			Type recordFieldType = r1.field(field.getKey());
			if (recordFieldType != null) {
				isMatched &= true;
			} else {
				isMatched &= false;
			}
		}
		
		return isMatched;
	}
	
	
	/**
	 * Get the user defined type by checking if the user type has the same fields as the given record type.
	 * 
	 * @param type
	 *            the record type.
	 * @return the user type. Return null if no type is matched.
	 */
	protected WyilFile.Type getUserDefinedType(Type type){
		if(type instanceof Type.Record){
			return getUserDefinedType((Type.Record)type);
		}else if (type instanceof Type.Union){
			return getUserDefinedType((Type.Union)type);
		}else if(type instanceof Type.Nominal){
			return getUserDefinedType((Type.Nominal)type);
		}else{
			throw new RuntimeException("Not implemented");
		}
	}
	
	
	private WyilFile.Type getUserDefinedType(Type.Record type) {
		for (wyil.lang.WyilFile.Type user_type : this.userTypes) {
			if(user_type.type() instanceof Type.Union){
				Type.Union union = (Type.Union)user_type.type();
				for(Type t: union.bounds()){
					if(t instanceof Type.Record && isTypeMatched(type, (Type.Record)t)){
						return user_type;
					}
				}
			}else if (user_type.type() instanceof Type.Record) {
				Type.Record record = (Type.Record) user_type.type();
				// check if 'type' and 'record' types are matched.
				if (isTypeMatched(type, record)) {
					return user_type;
				}
			}
		}
		return null;
	}
	
	/**
	 * Return the actual user-defined type 
	 * @param type
	 * @return
	 */
	private WyilFile.Type getUserDefinedType(Type.Union type) {
		// Get the record types from union type  
		Type.Record original_record = getRecordType((Type.Union)type);
		if(original_record!= null){
			for (wyil.lang.WyilFile.Type user_type : this.userTypes) {
				Type.Record record = null;
				if(user_type.type() instanceof Type.Union){
					record = getRecordType(user_type.type());
				}else if(user_type.type() instanceof Type.Record){
					record = (Type.Record)user_type.type();
				}
				if(isTypeMatched(record, original_record)){
					return user_type;
				}
			}
		}
		return null;
	}
	
	/**
	 * Store the generated code for a target function.
	 * 
	 * It also contains a list of registers that are sub-structures 
	 * 
	 * 
	 * @author Min-Hsien Weng
	 *
	 */
	protected class CodeStore{
		private String indent;
		
		private FunctionOrMethod function;// Target function
		private List<String> statements;// List of translated C code.
		private HashMap<Integer, String> fields;// Store fields that registers are loaded with
		private HashSet<Integer> substructures; // Store the registers that point to a structure 
		// Store tmp variables of copied parameters, used to check duplicated names
		private HashMap<Codes.Invoke, HashMap<String, String>> param_names;
		
		
		public CodeStore(FunctionOrMethod function) {
			this.indent = "\t";
			this.function = function;
			this.statements = new ArrayList<String>();
			this.fields = new HashMap<Integer, String>();
			this.substructures = new HashSet<Integer>();
			this.param_names = new HashMap<Codes.Invoke, HashMap<String, String>>();
		}		
		
		/**
		 * Returns the name of temporary parameter 'param'. 
		 * By default, the name is 'tmp_fparam'. 
		 * If the name is used, create another name with extra subfix '_' + num
		 * e.g. 'tmp_fparam_0'
		 * 
		 * The key of map is fparam+_+index, and the value is the corresponding parameter name
		 * 
		 * 
		 * @param fparam formal parameter at called function
		 * @param index the index at parameter list
		 * @param code
		 * @return
		 */
		protected String getTmpParamName(String fparam, int index, Codes.Invoke code){
			if(!param_names.containsKey(code)){
				// Create a new set
				param_names.put(code, new HashMap<String, String>());
			}
			HashMap<String, String> names = param_names.get(code);
			String key = fparam + "_" +index;
			// If 'name' is stored in map, return it.
			if(names.containsKey(key)){
				return names.get(key);
			}
			
			String name = "tmp_" + fparam;
			int suffix = 0;
			
			// Check if name is used in 'func' function
			VariableDeclarations vars = function.attribute(VariableDeclarations.class);
			for(int reg =0; reg< vars.size();reg++) {
				String var_name = prefix + reg;
				// Check if the name is defined in variable declaration
				Declaration declaration = vars.get(reg);
				if (declaration != null && declaration.name() != null && !declaration.name().isEmpty()) {
					var_name = declaration.name();
				}
				// Check if 'name' is used in 'func' function
				if(var_name.equals(name)) {
					name = "tmp_" + fparam + "_"+ suffix;
					suffix++;
				}
			}
		
			// Put 'name' to 'param_names'
			names.put(key, name);
			
			return name;
		}
		
		
		
		
		
		
		
		/**
		 * Load the field to the given register.
		 * @param reg
		 * @param field
		 */
		protected void loadField(int reg, String field){
			this.fields.put(reg, field);
		}
		/**
		 * Get the field of the given register.
		 * @param reg
		 * @return
		 */
		protected String getField(int reg){
			return this.fields.get(reg);
		}
		
		/**
		 * Add the 'r' register to the sub-structure set.
		 * 
		 * @param reg
		 */
		private void addSubStructure(int r){
			this.substructures.add(r);
		}
		
		/**
		 * Check is the 'reg' register points to a substructure
		 * @param reg
		 * @return
		 */
		private boolean isSubstructure(int r){
			return this.substructures.contains(r);
		}

		protected List<String> getStatements() {
			return this.statements;
		}

		/**
		 * Adds the statement to the list and print out the statement if the
		 * verbose option is on.
		 * 
		 * @param code
		 *            the WyIL code
		 * @param statement
		 *            the C code
		 */
		protected void addStatement(Code code, String statement) {
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
			if (statement != null) {
//				if (isVerbose) {
//					System.out.println(statement);
//				}
				statements.add(statement);
			}
		}
		
		/**
		 * Add a list of statements w.r.t. one line of Wyil code
		 * 
		 * @param code
		 * @param statement
		 */
		protected void addAllStatements(Code code, List<String> statement) {
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
			if (statement != null) {
//				if (isVerbose) {
//					System.out.println(statement);
//				}
				// Filter empty s
				statement.stream()
				// Remove 'tab' in a string and check if the string is empty
				.filter(s -> !s.equals("") && !s.replaceAll("\t", "").equals(""))
				.forEach(s -> statements.add(s));
				//statements.addAll(statement);
			}
		}
		

		/**
		 * Increase the indentation.
		 */
		protected void increaseIndent() {
			this.indent += "\t";
		}

		protected String getIndent() {
			return this.indent;
		}

		/**
		 * Decrease the indentation.
		 */
		protected void decreaseIndent() {
			this.indent = this.indent.replaceFirst("\t", "");
		}

		/**
		 * Get the raw type for a variable.
		 * 
		 * @param reg
		 * @return
		 */
		protected Type getRawType(int reg) {
			VariableDeclarations vars = function.attribute(VariableDeclarations.class);
			Declaration declaration = vars.get(reg);
			Type type = declaration.type();
			// Return the 'system console' Nominal type.
			if(type instanceof Type.Nominal){
				Type.Nominal nominal = (Type.Nominal)type;
				// Special case for ASCII.string
				if(nominal.name().name().equals("Console")
					|| nominal.name().name().equals("Reader")
					|| nominal.name().name().equals("Writer")
					|| nominal.name().name().equals("string")
						){
					return nominal;
				}
				
				
				WyilFile.Type user_type = getUserDefinedType((Type.Nominal) type);
				if(user_type != null){
					return user_type.type();
				}else{
					return null;
				}
			}
			return type;
		}

		
		
		
		/**
		 * Get the variable name of the given register
		 * 
		 * @param reg
		 *            the register
		 * @return the variable name (starting with "_")
		 */
		protected String getVar(int reg) {
			VariableDeclarations vars = function.attribute(VariableDeclarations.class);
			String name = prefix + reg;
			// Check if the register has been kept in the declarations.
			Declaration declaration = vars.get(reg);
			if (declaration != null && declaration.name() != null && !declaration.name().isEmpty()) {
				name = declaration.name();
			}
			
			return name;
		}
		
		
		
	}

	/**
	 * Increases the indentation of generated C code for a given function
	 * @param function
	 */
	protected void increaseIndent(FunctionOrMethod function) {
		CodeStore store = getCodeStore(function);
		store.increaseIndent();
	}
	/***
	 * Decreases the indentation of generated C code for a given function.
	 * @param function
	 */
	protected void decreaseIndent(FunctionOrMethod function){
		CodeStore store = getCodeStore(function);
		store.decreaseIndent();
	}

	/**
	 * Get the pre-loaded field of given register.
	 * @param operand
	 * @param function
	 * @return
	 */
	protected String getField(int register, FunctionOrMethod function) {
		CodeStore store = getCodeStore(function);
		return store.getField(register);
	}

	/**
	 * Get the generated C code for the given function
	 * @return
	 */
	protected List<String> getStatements(FunctionOrMethod function) {
		CodeStore store = getCodeStore(function);
		return store.getStatements();
	}
	
}