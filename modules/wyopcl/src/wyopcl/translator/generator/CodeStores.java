package wyopcl.translator.generator;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
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
	private List<wyil.lang.WyilFile.Type> userTypes;// Store all the user-defined types at source level, e.g. Board.
	protected HashMap<FunctionOrMethod, CodeStore> stores; // Store generated code for each function
	
	public CodeStores(boolean isVerbose, List<wyil.lang.WyilFile.Type> userTypes){
		this.isVerbose = isVerbose;		
		this.stores = new HashMap<FunctionOrMethod, CodeStore>();
		this.userTypes = userTypes;
	}
	
	/**
	 * Get the code store of the given function.
	 * 
	 * @param function
	 * @return
	 */
	protected CodeStore getCodeStore(FunctionOrMethod function) {
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
	public void addAllStatements(Code code, List<String> statement, FunctionOrMethod function) {
		CodeStore store = getCodeStore(function);
		store.addAllStatements(code, statement);
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
	 * Load fields to code store
	 * @param target
	 * @param field
	 */
	protected void loadField(int register, String field, FunctionOrMethod function) {
		CodeStore store = getCodeStore(function);
		store.loadField(register, field);
	}
	
	/**
	 * Get the raw type of a given register, defined in 'f' function
	 * @param register
	 * @param function
	 * @return
	 */
	public Type getRawType(int register, FunctionOrMethod function){
		CodeStore store = getCodeStore(function);
		if(store.getRawType(register) == null){
			return null;
		}else{
			return store.getRawType(register);
		}
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
	protected int getArrayDimension(Type type){
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
	protected boolean isIntType(Type type) {
		if (type instanceof Type.Int) {
			return true;
		}

		if (type instanceof Type.Array) {
			return isIntType(((Type.Array) type).element());
		}

		if(type instanceof Type.Union){
			// Check if the union type contains INT type.
			if(((Type.Union)type).bounds().contains(Type.Int.T_INT)){
				return true;
			}
		}
		// Check if the raw nominal type is 'Int' type.
		if(type instanceof Type.Nominal){
			Type nominal = Optional.of(getUserDefinedType(type)).get().type();
			if(nominal != null && nominal instanceof Type.Int){
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
			List<Type> records = ((Type.Union)type).bounds().stream()
					.filter(t -> t instanceof Type.Record)
					.collect(Collectors.toList());

			if(records.isEmpty()){
				throw new RuntimeException("Not implemented");
			}else{
				return (Type.Record)records.get(0);
			}
		}else{
			throw new RuntimeException("Not implemented");
		}
	}
	
	
	/**
	 * Check if the type of given register is an array or record (excluding 'print' fields)
	 * 
	 * @param register
	 * @param function
	 * @return
	 */
	public boolean isCompoundType(Type type){
		if(type instanceof Type.Int || type instanceof Type.FunctionOrMethod){
			return false;
		}
		
		if(type instanceof Type.Array){
			return true;
		}else if(type instanceof Type.Record){
			Type.Record record = (Type.Record)type;
			// Check if the variable contains 'printf' field. 
			long nonePrintFields = record.fields().keySet().stream()
					.filter(f -> !f.contains("print") && !f.contains("println") && !f.contains("print_s") && !f.contains("println_s") )
					.count();

			// If NOT a printf field, then add ownership.
			if(nonePrintFields>0){
				return true;
			}
		}else if(type instanceof Type.Nominal){
			if(!((Type.Nominal)type).name().toString().contains("Console")){
				// Get nominal type
				WyilFile.Type nominal = Optional.of(getUserDefinedType(type)).get();
				if(nominal!= null  &&
						// Check if the nominal type is aliased Integer type
						!isIntType(type)){
					return true;
				}
			}
		}else if(type instanceof Type.Union){
			// Check if the union type does not contain INT type
			if(!isIntType(type) && getRecordType((Type.Union)type)!=null){
				return true;
			}
		}else if(type instanceof Type.Null){
			return false;
		}else{
			throw new RuntimeException("Not Implemented");
		}

		return false;
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
		for (wyil.lang.WyilFile.Type user_type : this.userTypes) {
			if(user_type.type() instanceof Type.Union){
				// Check if 'bounds' types are the same.  
				Type.Record r1 = (Record) ((Type.Union)user_type.type()).bounds().stream()
				.filter(t -> t instanceof Type.Record)
				.collect(Collectors.toList()).get(0);
				
				Type.Record r2 = (Record)((Type.Union)type).bounds().stream()
								 .filter(t-> t instanceof Type.Record)
								 .collect(Collectors.toList()).get(0);
				
				if(isTypeMatched(r1, r2)){
					return user_type;
				}
				
			}
		}
		return null;
	}
	
	
	protected class CodeStore{
		private String indent;
		
		private FunctionOrMethod function;
		private List<String> statements;// Store the list of translated C code.
		private HashMap<Integer, String> fields;// Stores the fields of register, e.g. 'println', 'print_s', 'println_s'
		
		
		public CodeStore(FunctionOrMethod function) {
			this.indent = "\t";
			this.function = function;
			this.statements = new ArrayList<String>();
			this.fields = new HashMap<Integer, String>();
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
			if(type instanceof Type.Nominal){
					WyilFile.Type user_type = getUserDefinedType((Type.Nominal)type);
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


	


	


	
}