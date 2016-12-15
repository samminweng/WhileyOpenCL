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
	
	public CodeStores(boolean isVerbose, WyilFile module){
		this.isVerbose = isVerbose;
		this.userTypes = (List<wyil.lang.WyilFile.Type>) module.types();
		this.functions = new ArrayList<FunctionOrMethod>(module.functionOrMethods());
		this.stores = new HashMap<FunctionOrMethod, CodeStore>();
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
	 * 
	 * @param function
	 * @return
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
		// Compute array dimension.
		while(type != null && type instanceof Type.Array){
			type = ((Type.Array)type).element();
			dimension++;
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
	public Type getArrayElementType(Type.Array type){
		Type elmType = type.element();
		if(elmType instanceof Type.Array){
			return getArrayElementType((Type.Array)elmType);
		}
		
		return elmType;
	}
	
	
	/**
	 * Check if the union type is an union of int[]|null
	 * 
	 * 
	 * 
	 * @param union
	 * @return true
	 */
	public boolean isUnionOfArrayIntType(Type type){
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
			wyil.lang.WyilFile.Type nominal = getUserDefinedType((Type.Nominal)type);
			if(nominal!=null){
				// Check if the union type is an array type.
				if(nominal.type() instanceof Type.Array){
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
		}else{
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
				// Get nominal type
				Optional<wyil.lang.WyilFile.Type> nominal = Optional.ofNullable(getUserDefinedType(type));
				if(nominal.isPresent()){
					return isCompoundType(nominal.get().type());
				}else{
					return false;
				}
			}
			
			if(type instanceof Type.Union){
				// Check if the union type is an integer array
				if(isUnionOfArrayIntType((Type.Union)type)){
					return false; // Not a compound type
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
		
		public CodeStore(FunctionOrMethod function) {
			this.indent = "\t";
			this.function = function;
			this.statements = new ArrayList<String>();
			this.fields = new HashMap<Integer, String>();
			this.substructures = new HashSet<Integer>();
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
				if (isVerbose) {
					System.out.println(statement);
				}
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
				if (isVerbose) {
					System.out.println(statement);
				}
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