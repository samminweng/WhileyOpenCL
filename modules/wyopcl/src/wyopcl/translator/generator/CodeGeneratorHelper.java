package wyopcl.translator.generator;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import wyil.attributes.VariableDeclarations;
import wyil.lang.Attribute;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.Type.Record.State;
import wyil.lang.Type.Union;
import wyil.lang.WyilFile.Constant;
import wyil.lang.WyilFile.FunctionOrMethod;
import wyopcl.translator.copy.CopyEliminationAnalyzer;
import wyopcl.translator.deallocate.DeallocationAnalyzer;
import wyopcl.translator.generator.CodeStores.CodeStore;

/**
 * Lists the code generation methods
 * 
 * @author Min-Hsien Weng
 *
 */
public final class CodeGeneratorHelper {
	private CodeGeneratorHelper() {

	}
	
	/**
	 * Check if the type is instance of Integer by inferring the type from
	 * <code>wyil.Lang.Type</code> objects, including the effective collection
	 * types.
	 * 
	 * @param type
	 * @return true if the type is or contains an integer type.
	 */
	protected static boolean isIntType(Type type) {
		if (type instanceof Type.Int) {
			return true;
		}

		if (type instanceof Type.Array) {
			return isIntType(((Type.Array) type).element());
		}

		if (type instanceof Type.Tuple) {
			// Check the type of value field.
			Type element = ((Type.Tuple) type).element(1);
			return isIntType(element);
		}

		
		if(type instanceof Type.Union){
			// Check if the union type contains INT type.
			if(((Type.Union)type).bounds().contains(Type.Int.T_INT)){
				return true;
			}
		}
		
		return false;
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
	protected static String[] getMemebers(Type.Record record){
		//System.out.println(record.keys());
		State fields = (State) record.automaton.states[0].data;
		String[] members = fields.toArray(new String[fields.size()]);
		return members;
	}
	
	/***
	 * 
	 * Given a user-defined structure, generate 'printf_*' function to print out its value. For example,	 * 
	 * <pre>
	 * <code>
	 * void printf_Board(Board s){
	 *		printf("{");
	 *		printf("pieces");
	 *		printf_array(s.pieces, s.pieces_size);
	 *		printf("move");
	 *		printf("%d,", s.move);
	 *		printf("}");
	 * }
	 * </code>
	 * 
	 * @param type_name
	 * @param fields
	 * @return
	 */
	private static List<String> generateStructPrintf(String type_name, Type type){
		List<String> statement = new ArrayList<String>();
		Type.Record record = null;
		if((record = getRecordType(type))!= null ){
			HashMap<String, Type> fields = record.fields();
			String input = "_"+type_name.toLowerCase().replace("*", "");
			String f_name = type_name.replace("*", "");
			statement.add("void printf_" + f_name + "(" + type_name + " "+input+"){");
			// Add open bracket
			statement.add("\tprintf(\"{\");"); 
			// Get all field names
			String[] names = fields.keySet().toArray(new String[fields.size()]);
			// Print out each field.
			for (int i = 0; i < names.length; i++) {
				String member = names[i];
				String input_member;
				if(type instanceof Type.Union){
					input_member = input + "->" +member;
				}else{
					input_member = input + "." +member;
				}
				// Add field name
				statement.add("\tprintf(\" " + member + ":\");");
				Type member_type = fields.get(member);
				if (member_type instanceof Type.Nominal || member_type instanceof Type.Int) {
					// Add field values.
					statement.add("\tprintf(\"%d\", " + input_member + ");");
				} else if (member_type instanceof Type.Array) {
					String s = "\tprintf"+getArrayDimension(member_type)+"DArray(" + input_member;				
					s += ", " + generateArraySizeVars(input_member, member_type);
					s += ");";
					statement.add(s);
				} else {
					throw new RuntimeException("Not implemented!");
				}
			}
			// Add ending "}"
			statement.add("\tprintf(\"}\");");
			statement.add("}");
		}
		
		return statement;
	}
	
	/**
	 * Generates the code to create a structure pointer.
	 * 
	 * For a structure (record type), return a structure
	 * Board create_Board(){
	 * 		Board _board;
	 * 		return _board;
	 * }
	 * 
	 * For a union of NULL and structure, return a structure address.
	 * Board* create_Board(){
	 * 		Board _board;
	 * 		return &_board;
	 * }
	 * 
	 * @param type_name
	 * @param type
	 * @param stores
	 * @return
	 */
	private static List<String> generateStructCreate(String type_name, Type type){
		List<String> statement = new ArrayList<String>();
		String input = "_"+type_name.toLowerCase().replace("*", ""); // such as '_board'
		String f_name = type_name.replace("*", "");
		statement.add(type_name+" create_"+f_name+ "(){");
		statement.add("\t"+type_name+" "+input+";");// Create a board, e.g. ' 
		statement.add("\treturn "+input+";");
		statement.add("}");
		return statement;
		
	}
	
	
	
	/**
	 * Given a structure, generate 'copy_*' function to make a copy of the structure, e.g. 
	 * <pre><code>
	 * Board copy_Board(Board b){
	 *	Board new_b;
	 *	new_b.pieces = copy(b.pieces, b.pieces_size);
	 *	new_b.pieces_size = b.pieces_size;
	 * 	new_b.move = b.move;
	 *	return new_b; 
	 * } 
	 * </code></pre>
	 * For union type of NULL and record, the copy function is 
	 * <pre><code>
	 * Board* copy_Board(Board* _board){
	 * 	Board* new_board;
	 * 	new_board.pieces_size = _board->pieces_size;  new_board.pieces = copy(_board->pieces, _board->pieces_size);
	 *	new_board.move = _board->move;
	 *	return &new_board;
	 * }
	 * </code></pre>
	 * @param type_name
	 * @param fields
	 * @return
	 */
	private static List<String> generateStructCopy(String type_name, Type type){
		List<String> statement = new ArrayList<String>();
		Type.Record record = null;
		if((record = getRecordType(type)) != null){
			HashMap<String, Type> fields = record.fields();			
			String input = "_"+type_name.toLowerCase().replace("*", "");
			String new_copy = "new_"+type_name.toLowerCase().replace("*", "");
			String f_name = type_name.replace("*", "");
			statement.add(type_name+" copy_"+f_name+ "(" + type_name + " "+input+"){");;
			// Declare local copy.
			statement.add("\t" + type_name + " "+new_copy+";");
			//String[] members = fields.keySet().toArray(new String[fields.size()]);
			List<String> members = fields.keySet().stream().collect(Collectors.toList());
			
			for (String member: members) {		
				String rhs = accessMember(input, member, type);
				String lhs = accessMember(new_copy, member, type);
				Type fieldtype = fields.get(member);
				if (fieldtype instanceof Type.Nominal || fieldtype instanceof Type.Int) {
					statement.add("\t" + lhs + " = " + rhs+";"); 
				} else if (fieldtype instanceof Type.Array) {
					statement.add("\t" + generateArraySizeAssign(fieldtype, lhs, rhs) + " " + lhs + " = " + generateCopyCode((Type.Array)fieldtype, rhs)+";");
				} else {
					throw new RuntimeException("Not implemented!");
				}
			}
			// Add return statement
			statement.add("\treturn "+new_copy+";");
			statement.add("}");
		}
		
		return statement;
	}
	
	/**
	 * Generate the code of accessing a member of a structure. 
	 *  
	 *  
	 * @param var
	 * @param member
	 * @param type
	 * @return
	 */
	protected static String accessMember(String var, String member, Type type){
		if(type instanceof Type.Record){
			return var +"."+member;
		}else if(type instanceof Type.Union){
			return var +"->"+member;
		}
		throw new RuntimeException("Not implemented");
	}
	
	
	
	/**
	 * 
	 * @param type_name
	 * @param fields
	 * @return
	 */
	private static List<String> generateStructFree(String type_name, Type type){
		List<String> statement = new ArrayList<String>();
		
		Type.Record record = null;
		if((record = getRecordType(type)) != null){
			HashMap<String, Type> fields = record.fields();
			
			String input = "_"+type_name.replace("*", "");
			String f_name = type_name.replace("*", "");
			statement.add("void free_"+f_name+"("+type_name+ " "+input+"){");
			String[] names = fields.keySet().toArray(new String[fields.size()]);
			for (int i = 0; i < names.length; i++) {
				String member = names[i];
				Type member_type = fields.get(member);
				String input_member = accessMember(input, member, type);
				if(member_type instanceof Type.Array){
					if(getArrayDimension(member_type)== 2){
						// Release 2D array by using built-in 'free2DArray' function
						statement.add("\tfree2DArray("+input_member+", "+input_member+"_size);");
					}else{
						statement.add("\tfree("+input_member+");");
					}
				}
			}
			statement.add("}");// Add ending bracket.
		}
		
		
		return statement;
	}
	/**
	 * get the array dimension.
	 * 
	 * @param type
	 * @return
	 */
	private static int getArrayDimension(Type type){
		int dimension = 0;
		// Compute array dimension.
		while(type != null && type instanceof Type.Array){
			type = ((Type.Array)type).element();
			dimension++;
		}
		
		return dimension;
	}
	
	/**
	 * Return a list of size variables w.r.t. array dimension.
	 * @param var array variable
	 * @param type array type
	 * @return
	 */
	protected static List<String> getArraySizeVars(String var, Type type){
		List<String> size_vars = new ArrayList<String>();
		int dimension = getArrayDimension(type);
		
		String size_var = var;
		for(int d=dimension;d>0;d--){
			size_var += "_size";
			size_vars.add(size_var);
		}
		
		return size_vars;
		
	}
	
	
	/**
	 * Check if the type of given register is an array or record (excluding 'print' fields)
	 * 
	 * @param register
	 * @param function
	 * @return
	 */
	protected static boolean isCompoundType(Type type, CodeStores stores){
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
			// Get nominal type
			Type.Nominal nominal = (Type.Nominal)type;
			if(!nominal.name().toString().contains("Console") &&
				// Check if the nominal type is aliased Integer type
				!(stores.getNominalType(nominal) instanceof Type.Int)){
				return true;
			}
		}else if(type instanceof Type.Union){
			if(getRecordType((Type.Union)type)!=null){
				return true;
			}
		}
		
		return false;
	}
	/**
	 * Return ownership flag for a given variable
	 * @param var
	 * @return
	 */
	private static String getOwnership(String var){
		return var+"_has_ownership";
	}
	
	
	/**
	 * Generate the declaration of ownership variable, e.g.
	 * 
	 * <pre><code>
	 * bool a_has_ownership = true;
	 * </code></pre>
	 * @param var
	 * @return
	 */
	protected static String assignOwnership(Type type, String var, CodeStores stores, DeallocationAnalyzer analyzer){
		if(analyzer != null && isCompoundType(type, stores)){
			return getOwnership(var)+" = true;";
		}
		return "";
	}
	
	/**
	 * Declare ownership variable
	 * @param type
	 * @param var
	 * @param analyzer
	 * @return
	 */
	protected static String declareOwnership(Type type, String var, CodeStores stores, DeallocationAnalyzer analyzer){
		if(analyzer != null && isCompoundType(type, stores)){
			return "bool "+var + "_has_ownership";
		}
		return "";
	}
	/**
	 * Declare
	 * @param type
	 * @param var
	 * @param analyzer
	 * @param ownership
	 * @return
	 */
	protected static String declareOwnership(Type type, String var, CodeStores stores, DeallocationAnalyzer analyzer, boolean ownership){
		String s = declareOwnership(type, var, stores, analyzer);
		if(s.equals("")){
			return "";
		}
		// Initialize ownership with value
		return s + " = " +ownership + ";"; 
	}
	/**
	 * Return ownership to a function. If deallocation is enabled, then pass the ownership to a function. 
	 * The ownership value is based on copy analysis results.  
	 * 
	 * 
	 * @param deallocAnalyzer
	 * @param copyAnalyzer
	 * @return 
	 */
	protected static String passOwnershipToFunction(Type type, CodeStores stores, DeallocationAnalyzer deallocatedAnalyzer, CopyEliminationAnalyzer copyAnalyzer){
		if(deallocatedAnalyzer == null || !isCompoundType(type, stores)){
			return "";
		}
		
		if(copyAnalyzer != null){
			// For copy-reduced implementation, the calling function does not own the array. 
			return "false";
		}else{
			// For naive implementation, the copy is always made and thus calling function owns the array
			return "true";
		}
	}
	
	/**
	 * Generate the code to release the memory for a given variable.
	 * @param indent
	 * @param var
	 * @param type
	 * @param stores
	 * @return
	 */
	protected static String addDeallocatedCode(String var, Type type, CodeStores stores, DeallocationAnalyzer analyzer){
		if(analyzer == null || !isCompoundType(type, stores)){
			return "";
		}
		String s = "if(";
		s += getOwnership(var)+"){free";
		int dimension = 0;
		// Check if var_type is a structure
		if(type instanceof Type.Array){
			dimension = getArrayDimension(type);
			if(dimension== 2){
				s+=dimension+"DArray";
			}
		}else if(type instanceof Type.Record){
			s+= "_"+translateType(type, stores);
		}else if(type instanceof Type.Nominal){		
			s+= "_"+translateType(type, stores);
		}else if(type instanceof Type.Union){		
			s+= "_"+translateType(type, stores);			
		}else{
			throw new RuntimeException("Not implemented");
		}
		s+="("+var;
		if(dimension==2){
			// Pass size variable of 2D array to release the memory
			s += ", "+var+"_size";
		}
		s+= "); "+getOwnership(var)+" = false;";
		s+="}";
		
		return s;
	}
	
	
	/**
	 * Returns a list of free statements to release array memory spaces.
	 * @param vars
	 * @return
	 */
	protected static List<String> generateDeallocatedCode(DeallocationAnalyzer analyzer, FunctionOrMethod function, CodeStores stores){
		CodeStore store = stores.getCodeStore(function);
		String indent = store.getIndent();
		List<String> statements = new ArrayList<String>();
		if(analyzer != null){
			List<Integer> registers = analyzer.getOwnerships(function);
			// Generate the code to release memory spaces of ownership variables.
			for(int register : registers){
				// Get variable type
				Type var_type = store.getVarType(register);
				String var = store.getVar(register);
				statements.add(indent + addDeallocatedCode(var, var_type, stores, analyzer));
			}
		}
		
		return statements;
	}
	
	
	/***
	 * Given a type, generates size variables according to array dimension, e.g.
	 * 'data' is a 2D array and its size variables are
	 * 
	 * <pre>
	 * <code>
	 * 	_data_size, _data_size_size
	 * </code>
	 * </pre>
	 * where each variable is separated by comma (,).
	 * 
	 * @see https://docs.oracle.com/javase/8/docs/api/java/util/StringJoiner.html
	 * @param var array variable
	 * @param type type
	 * @return a string of array sizes variables in C. If type is not an array, return empty
	 */
	protected static String generateArraySizeVars(String var, Type type){
		if(type instanceof Type.Array){
			return getArraySizeVars(var, type).stream()
			.map(i -> i.toString())
			.collect(Collectors.joining(", "));
		}
		
		return "";
	}
	
	
	
	/**
	 * Generates assignment C code to specify the size variables of multi-dimensional array, e.g. 
	 * 
	 * <pre><code>
	 * _7_size = _12_size;
	 * _7_size_size = _12_size_size; 
	 * </code></pre>
	 * where '_7' and '_12' are two 2D arrays and variables with '_size' postfix are size variables. 
	 * @param type
	 * @param indent
	 * @param lhs
	 * @param rhs
	 * @return
	 */
	protected static String generateArraySizeAssign(Type type, String lhs, String rhs){
		String statement = "";
		if(type instanceof Type.Array){
			List<String> lhs_sizes = getArraySizeVars(lhs, type);
			List<String> rhs_sizes = getArraySizeVars(rhs, type);
	
			for(int i=0;i<lhs_sizes.size();i++){
				statement += lhs_sizes.get(i) +" = "+ rhs_sizes.get(i) +"; "; 
			}
			
		}
		
		return statement;
	}
	
	
	/**
	 * Generate lhs code for copying array-typed variable, e.g.
	 * <pre><code>
	 *  copy(a, a_size);
	 * </code></pre>
	 * 
	 * @param type
	 * @param var
	 * @return
	 */
	private static String generateCopyCode(Type.Array type, String var){
		String statement = "";
		// Add 'copy' function call w.r.t. Array dimension
		int dimension = getArrayDimension(type);
		statement += "copy";
		if(dimension>1){
			statement += dimension+"DArray";
		}
		statement += "("+var+", ";
		// Generate size variables according to dimensions.
		statement += generateArraySizeVars(var, type) + ")";
		return statement;			
	}
	
	/**
	 * Generates the array code, including the copy function call and the list of array size variables, e.g.
	 * <code>
	 * assign %2 = %7  : int[][]
	 * </code>
	 * can be translated into
	 * <pre><code>
	 *	 _C_data_size = _7_size;
	 *	_C_data_size_size = _7_size_size;
	 *	_C_data = copy2DArray(_7, _7_size, _7_size_size);
	 * </code></pre>
	 * @param indent
	 * @param lhs
	 * @param rhs
	 * @param dimension
	 * @return
	 */
	protected static String generateCopyUpdateCode(Type type, CodeStores stores, String var, boolean isCopyEliminated){
		if(isCopyEliminated){
			// Do not need to make a copy of 'var' 
			return var;
		}
		
		if (type instanceof Type.Nominal){
			type = stores.getNominalType(((Type.Nominal)type));
		}
		
		String statement = "";
		String type_name = translateType(type, stores);
		
		if(type instanceof Type.Array){
			// Add 'copy' function call w.r.t. Array dimension
			statement += generateCopyCode((Type.Array)type, var);
		}else if (type instanceof Type.Record){
			statement += "copy_"+type_name+"(" + var + ")";
		}else if(type instanceof Type.Int){
			statement += ""+var;
		}else if (type instanceof Type.Union){
			if(getRecordType((Type.Union)type)==null){
				statement += ""+var;
			}else{
				statement += "copy_"+type_name.replace("*", "")+"(" + var + ")";
			}
		} else{
			throw new RuntimeException("Not implemented");
		}
		
		return statement;
	}
	
	
	
	/**
	 * Returns the record types for an union/record type.
	 * @param type
	 * @return
	 */
	protected static Type.Record getRecordType(Type type){
		
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
	 * Translate the WyIL type into the type in C.
	 * 
	 * @param type
	 *            the WyIL type
	 * @return the result string. Return null if the type can not be translated, e.g. the function call of print,
	 *         printf...
	 *
	 *         
	 * 
	 */
	protected static String translateType(Type type, CodeStores stores) {	
		if (type instanceof Type.Nominal) {
			// The existential type, e.g. 'Board' is an nominal type in TicTacToe test case.
			Type nominal = stores.getNominalType((Type.Nominal) type);
			if(nominal == null){
				// Check is type is a System.Console. 
				if(((Type.Nominal) type).name().name().equals("Console")){
					// Use FILE type.
					return "FILE*";
				}
				throw new RuntimeException("Not Implemented");
			}
			return translateType(nominal, stores);
		}

		if (type instanceof Type.Int || type instanceof Type.Bool) {
			return "long long";
		}

		if (type instanceof Type.Array) {
			Type.Array listType = (Type.Array) type;
			return translateType(listType.element(), stores) + "*";
		}

		if (type instanceof Type.Void) {
			return "void";
		}

		if (type instanceof Type.Record) {
			HashMap<String, Type> fields = ((Type.Record) type).fields();
			// Check if the field is the function call of print,...
			if (fields.containsKey("print") || fields.containsKey("println") || fields.containsKey("print_s")
					|| fields.containsKey("println_s")) {
				// No needs to do the translation.
				return "";
			}

			// The input 'type' is input arguments of main method.
			if (fields.containsKey("args")) {
				return "int argc, char** args";
			}

			// Check if the type is an instance of user defined type.
			if(stores != null){
				return stores.getRecordType((Type.Record) type).name();
			}else{
				throw new RuntimeException("Missing CodeStores");
			}
		}

		if (type instanceof Type.Union) {
			Type.Union union = (Type.Union) type;
			// Check if there is any record in 'union' type
			if (isIntType(type)) {
				return "long long";
			}
				
			Type.Record record;
			if((record = getRecordType((Type.Union)type)) != null){
				return translateType(record, stores)+"*";
			}
			
			throw new RuntimeException("Un-implemented Type" + union);
			
		}

		// Translate reference type in Whiley to pointer type in C.
		if (type instanceof Type.Reference) {
			Type.Reference ref = (Type.Reference) type;
			// Types are passed as a pointer type
			return translateType(ref.element(), stores) + "*";
		}

		if(type instanceof Type.Method){
			return "";
		}
		
		if(type instanceof Type.Null){
			return "";
		}
		
		throw new RuntimeException("Not Implemented!");
	}
	
	/**
	 * Generate 'Copy', 'Free' and 'Print' functions for a given structure.
	 * @param name
	 * @param type
	 * @param stores
	 * @return
	 */
	protected static List<String> generateStructFunction(Type type, CodeStores stores){
		List<String> statements = new ArrayList<String>();
		String type_name = translateType(type, stores);
		
		statements.addAll(generateStructCreate(type_name, type));
		statements.addAll(generateStructCopy(type_name, type));
		statements.addAll(generateStructFree(type_name, type));
		statements.addAll(generateStructPrintf(type_name, type));
		
		return statements;
	}
	/**
	 * Generate structure members for a given members  
	 * 
	 * 
	 * @param type
	 * @param stores
	 * @return
	 */
	private static List<String> generateStructMembers(Type type, CodeStores stores){
		Type.Record record = getRecordType(type);
		List<String> members = new ArrayList<String>();
		HashMap<String, Type> fields = record.fields();
		// Get all field names
		String[] names = fields.keySet().toArray(new String[fields.size()]);
		
		for (int i = 0; i < names.length; i++) {
			String member = names[i];
			Type memeber_type = fields.get(member);
			members.add("\t" + translateType(memeber_type, stores) + " " + member + ";");
			if (memeber_type instanceof Type.Array) {
				// Add array size member
				getArraySizeVars(member, memeber_type).stream()
				.forEach(size_var -> members.add("\t" + "long long " + size_var + ";"));
			}
		}
		return members;
	}
	
	
	
	/**
	 * Write the user-defined structure to *.h file, e.g. 
	 * <pre>
	 * <code>
	 * typedef struct{
	 *		Square* pieces;
	 *		long long pieces_size;
	 * 		nat move;
	 * } Board;<br>
	 * </code>
	 * </pre>
	 * @param userType
	 */
	protected static List<String> generateStructDef(Type type, CodeStores stores) {
		List<String> statements = new ArrayList<String>();	
		
		// Extract record type from an union/record type
		String type_name = translateType(type, stores);
		
		// Define a structure
		String struct_name = type_name.replaceAll("\\*", "");
		statements.add("typedef struct{");
		statements.addAll(generateStructMembers(type, stores));
		statements.add( "} " + struct_name + ";");
		String input = "_"+type_name.toLowerCase().replace("*", ""); // Input parameter
		// Add built-in function declarations, 'create' and 'printf', 'copy' and 'free'  
		statements.add(type_name + " create_" + struct_name + "();");
		statements.add("void printf_" + struct_name + "(" + type_name + " "+input+");");
		statements.add(type_name + " copy_"+struct_name+ "("+type_name + " "+input+");");
		statements.add("void free_"+ struct_name+"("+type_name+" "+input+");");
		
			
		return statements;
	}
	
	

	
	
	
}
