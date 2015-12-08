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
	 * @param struct
	 * @param fields
	 * @return
	 */
	protected static List<String> generateStructPrintf(WyilFile.Type type, CodeStores stores){
		
		String struct = type.name();
		HashMap<String, Type> fields = ((Type.Record)type.type()).fields();
		
		
		String input = "_"+struct.toLowerCase();
		String indent = "\t";
		List<String> statement = new ArrayList<String>();
		
		statement.add("void printf_" + struct + "(" + struct + " "+input+"){");
		// Add open bracket
		statement.add(indent + "printf(\"{\");"); 
		// Get all field names
		String[] names = fields.keySet().toArray(new String[fields.size()]);
		// Print out each field.
		for (int i = 0; i < names.length; i++) {
			String member = names[i];
			String input_member = input + "." +member;
			// Add field name
			statement.add(indent + "printf(\" " + member + ":\");");
			Type member_type = fields.get(member);
			if (member_type instanceof Type.Nominal || member_type instanceof Type.Int) {
				// Add field values.
				statement.add(indent + "printf(\"%d\", " + input_member + ");");
			} else if (member_type instanceof Type.Array) {
				List<String> size_vars = getArraySizeVars(input_member, member_type);
				String s = indent + "printf"+size_vars.size()+"DArray(" + input_member;				
				s += ", " + generateArraySizeVars(input_member, member_type);
				s += ");";
				statement.add(s);
			} else {
				throw new RuntimeException("Not implemented!");
			}
		}
		// Add ending "}"
		statement.add(indent + "printf(\"}\");");
		statement.add("}");

		return statement;
	}
	/**
	 * Given a structure, generate 'copy_*' function to make a copy of the structure, e.g. 
	 * 
	 * Board copy_Board(Board b){
	 *		Board new_b;
	 *		new_b.pieces = copy(b.pieces, b.pieces_size);
	 *		new_b.pieces_size = b.pieces_size;
	 * 		new_b.move = b.move;
	 *		return new_b; 
	 * } 
	 * @param struct
	 * @param fields
	 * @return
	 */
	protected static List<String> generateStructCopy(WyilFile.Type type, CodeStores stores){
		String struct = type.name();
		HashMap<String, Type> fields = ((Type.Record)type.type()).fields();
		
		String input = "_"+struct.toLowerCase();
		String copy = "new_"+struct.toLowerCase();
		List<String> statement = new ArrayList<String>();
		
		statement.add(struct+" copy_"+struct+ "(" + struct + " "+input+"){");;
		// Declare local copy.
		String indent = "\t";
		statement.add(indent + struct + " "+copy+";");
		String[] names = fields.keySet().toArray(new String[fields.size()]);
		for (int i = 0; i < names.length; i++) {
			String member = names[i];			
			String rhs = input + "." + member;
			String lhs = copy + "." + member;
			Type fieldtype = fields.get(member);
			if (fieldtype instanceof Type.Nominal || fieldtype instanceof Type.Int) {
				statement.add(indent + lhs + " = " + rhs+";"); 
			} else if (fieldtype instanceof Type.Array) {
				statement.add(indent + generateArraySizeAssign(fieldtype, lhs, rhs) + " " + lhs + " = " + generateCopyUpdateCode(fieldtype, stores, rhs, false)+";");
			} else {
				throw new RuntimeException("Not implemented!");
			}
		}
		// Add return statement
		statement.add(indent + "return "+copy+";");
		statement.add("}");
		return statement;
	}
	/**
	 * 
	 * @param struct
	 * @param fields
	 * @return
	 */
	protected static List<String> generateStructFree(WyilFile.Type type, CodeStores stores){
		String struct = type.name();
		HashMap<String, Type> fields = ((Type.Record)type.type()).fields();
		
		String input = "_"+struct;
		String indent = "\t";
		List<String> statement = new ArrayList<String>();
		statement.add("void free_"+struct+"("+struct+ " "+input+"){");
		String[] names = fields.keySet().toArray(new String[fields.size()]);
		for (int i = 0; i < names.length; i++) {
			String member = names[i];
			Type member_type = fields.get(member);
			String input_member = input +"."+member;
			if(member_type instanceof Type.Array){
				statement.add(indent+ "free("+input_member+");");
			}
		}
		statement.add("}");// Add ending bracket.
		return statement;
	}
	/**
	 * Return a list of size variables w.r.t. array dimension.
	 * @param var array variable
	 * @param type array type
	 * @return
	 */
	protected static List<String> getArraySizeVars(String var, Type type){
		List<String> size_vars = new ArrayList<String>();
		int dimension = 0;
		// Compute array dimension.
		while(type != null && type instanceof Type.Array){
			type = ((Type.Array)type).element();
			dimension++;
		}
		
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
				stores.getNominalType(nominal).type() instanceof Type.Int){
				return false;
			}
			
		}
		
		return false;
	}
	/**
	 * Return ownership flag for a given variable
	 * @param var
	 * @return
	 */
	protected static String getOwnership(String var){
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
	protected static String passOwnershipToFunction(DeallocationAnalyzer deallocatedAnalyzer, CopyEliminationAnalyzer copyAnalyzer){
		if(deallocatedAnalyzer == null){
			return "";
		}
		
		if(copyAnalyzer != null){
			// For copy-reduced implementation, the calling function does not own the array. 
			return ", false";
		}else{
			// For naive implementation, the copy is always made and thus calling function owns the array
			return ", true";
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
		// Check if var_type is a structure
		if(type instanceof Type.Record){
			s+= "_"+translateType(type, stores);
		}else if(type instanceof Type.Nominal){
			WyilFile.Type nominal = stores.getNominalType((Type.Nominal) type);
			if(nominal != null && nominal.type() instanceof Type.Record){
				s+= "_"+translateType(type, stores); 
			}
		}
		s+="("+var+"); "+getOwnership(var)+" = false;";
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
		List<String> size_vars = getArraySizeVars(var, type);
		
		return size_vars.stream()
		.map(i -> i.toString())
		.collect(Collectors.joining(", "));
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
		
		String statement = "";
		String type_name = translateType(type, stores);
		
		if(type instanceof Type.Array){
			// Add 'copy' function call w.r.t. Array dimension
			List<String> size_vars = getArraySizeVars(var, type);
			statement += "copy";
			if(size_vars.size()>1){
				statement += size_vars.size()+"DArray";
			}
			statement += "("+var+", ";
			// Generate size variables according to dimensions.
			statement += generateArraySizeVars(var, type) + ")";	
		}else if (type instanceof Type.Record){
			statement += "copy_"+type_name+"(" + var + ")";
		}else if (type instanceof Type.Nominal){
			WyilFile.Type nominal = stores.getNominalType(((Type.Nominal)type));
			// Skip copy for int typed nominal
			if(nominal.type() instanceof Type.Int){
				statement += ""+var;
			}else{
				statement += "copy_"+type_name+"(" + var + ")";
			}
		}else if(type instanceof Type.Int){
			statement += ""+var;
		} else{
			throw new RuntimeException("Not implemented");
		}
		
		
		return statement;
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
			WyilFile.Type nominal = stores.getNominalType((Type.Nominal) type);
			if(nominal == null){
				// Check is type is a System.Console. 
				if(((Type.Nominal) type).name().name().equals("Console")){
					// Use FILE type.
					return "FILE*";
				}
				throw new RuntimeException("Not Implemented");
			}
			return nominal.name();
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
			// Check if type is an union type of integer.
			// If so, return the integer type.
			if (union.bounds().contains(Type.T_INT)) {
				return "long long";
			} else {
				throw new RuntimeException("Un-implemented Type" + union);
			}
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
		
		
		throw new RuntimeException("Not Implemented!");
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
	protected static List<String> generateStruct(WyilFile.Type type, CodeStores stores) {
		List<String> struct = new ArrayList<String>();
		String typeName = type.name();
		HashMap<String, Type> fields = ((Type.Record)type.type()).fields();
		// Get all field names
		String[] names = fields.keySet().toArray(new String[fields.size()]);
		// Define a structure
		struct.add("typedef struct{");
		for (int i = 0; i < names.length; i++) {
			String member = names[i];
			Type memeber_type = fields.get(member);
			struct.add("\t" + translateType(memeber_type, stores) + " " + member + ";");
			if (memeber_type instanceof Type.Array) {
				List<String> size_vars = getArraySizeVars(member, memeber_type);
				size_vars.stream()
				.forEach(size_var -> struct.add("\t" + "long long " + size_var + ";"));
			}
		}
		struct.add( "} " + typeName + ";");
		// Add built-in function signatures, e.g. 'void printf_Board(Board s);'
		struct.add("void printf_" + typeName + "(" + typeName + " _"+typeName.toLowerCase()+");");
		struct.add(typeName + " copy_"+typeName+ "("+typeName + " _"+typeName.toLowerCase()+");");
		struct.add("void free_"+ typeName+"("+typeName+" _"+typeName.toLowerCase()+");"); 	
		return struct;
	}
	
}
