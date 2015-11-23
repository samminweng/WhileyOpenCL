package wyopcl.translator.generator;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Optional;

import wyil.lang.Attribute;
import wyil.lang.Code;
import wyil.lang.Codes;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.Type.Record.State;
import wyil.lang.WyilFile.Constant;
import wyil.lang.WyilFile.FunctionOrMethod;
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
	public static boolean isIntType(Type type) {
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
	public static String[] getMemebers(Type.Record record){
		//System.out.println(record.keys());
		State fields = (State) record.automaton.states[0].data;
		String[] members = fields.toArray(new String[fields.size()]);
		return members;
	}
	
	/**
	 * Given an Array Type, compute the array dimension.
	 * @param arrayType
	 * @return
	 */
	public static int computeArrayDimension(wyil.lang.Type type){
		int d = 0;
		// If element is an array, then increment the dimension.
		while(type != null && type instanceof Type.Array){
			type = ((Type.Array)type).element();
			d++;
		}
		return d;
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
	public static List<String> generatePrintfFunction(WyilFile.Type type, CodeStores stores){
		
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
				int d = computeArrayDimension(member_type);
				String s = indent + "printf"+d+"DArray(" + input_member;
				String size_var = input_member;
				while(d>0){
					size_var += "_size"; 
					s += ", " + size_var;
					d--;
				}
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
	 * Given a structure, generate 'clone_*' function to make and return a copy of this structure, e.g. 
	 * 
	 * Board clone_Board(Board b){
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
	public static List<String> generateCopyFunction(WyilFile.Type type, CodeStores stores){
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
			String input_member = input + "." + member;
			String copy_member = copy + "." + member;
			Type fieldtype = fields.get(member);
			if (fieldtype instanceof Type.Nominal || fieldtype instanceof Type.Int) {
				statement.add(indent + copy_member + " = " + input_member+";"); 
			} else if (fieldtype instanceof Type.Array) {
				throw new RuntimeException("Not implemented!");
				//statement.add(generateArrayCopy(fieldtype, indent, copy_member, input_member, false));
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
	public static List<String> generateFreeFunction(WyilFile.Type type, CodeStores stores){
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
	
	/***
	 * Generates the lists of size variables w.r.t the array dimension, e.g.
	 * 'data' is a 2D array and its size variables are
	 * 
	 * <pre>
	 * <code>
	 * 	_data_size, _data_size_size
	 * </code>
	 * </pre>
	 * @param array_name
	 * @param dimension
	 * @return
	 */
	public static String generateArraySizeVars(String array_name, Type type){
		String size_var = array_name;
		String size_vars = "";
		int dimension = computeArrayDimension(type);
		boolean isFirst = true;
		for(int d=dimension;d>0;d--){
			size_var += "_size";
			if(isFirst){
				isFirst = false;
			}else{
				size_vars += ", ";
			}
			size_vars += size_var;
		}
		return size_vars;
	}
	
	/**
	 * Generates assigment C code to specify the size variables of multi-dimensional array, e.g. 
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
	public static String generateSizeAssign(Type type, String indent, String lhs, String rhs){
		int dimension = computeArrayDimension(type);
		String statement = "";
		String post_fix = "";
		for(int d=dimension;d>0;d--){
			post_fix += "_size";
			statement += indent+ lhs +post_fix +" = "+ rhs +post_fix +";\n"; 
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
	public static String generateArrayCopy(Type type, String var, boolean isCopyEliminated){
		if(isCopyEliminated){
			return var;
		}
		
		String statement = "";
		int dimension = CodeGeneratorHelper.computeArrayDimension(type);
		statement += "copy";
		if(dimension>1){
			statement += dimension+"DArray";
		}
		statement += "("+var+", ";
		// Generate size variables according to dimensions.
		statement += CodeGeneratorHelper.generateArraySizeVars(var, type) + ")";
		
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
	 *         TODO Generalize the user-defined types, such as 'Board'.
	 * 
	 */
	public static String translateType(Type type, CodeStores stores) {	
		if (type instanceof Type.Nominal) {
			// The existential type, e.g. function EmptyBoard() -> (Board r)
			// The return type of 'EmptyBoard' function is 'Board'.
			Type.Nominal nomial = (Type.Nominal) type;
			// Check is type is a System.Console. 
			if(nomial.name().name().equals("Console")){
				// Use FILE type.
				return "FILE*";
			}
			return nomial.name().name();
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
				return stores.getUserDefinedType((Type.Record) type).name();
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
	public static List<String> generateStruct(WyilFile.Type type, CodeStores stores) {
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
				int d = CodeGeneratorHelper.computeArrayDimension(memeber_type);
				String size_var = member;
				// Add 'size' variables w.r.t. array dimension.
				while(d>0){
					size_var += "_size";
					struct.add("\t" + "long long " + size_var + ";");
					d--;
				}
				
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
