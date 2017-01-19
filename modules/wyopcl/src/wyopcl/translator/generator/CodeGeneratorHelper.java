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

	/***
	 * 
	 * Given a user-defined structure, generate 'printf_*' function to print out its value. For example, *
	 * 
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
	 * @param type
	 * @param fields
	 * @return
	 */
	private static List<String> generateStructPrintf(Type type, CodeStores stores) {
		List<String> statement = new ArrayList<String>();
		Type.Record record = stores.getRecordType(type);
		String type_name = translateType(type, stores);
		String parameter = type_name.toLowerCase().replace("*", "");

		statement.add("void printf_" + type_name.replace("*", "") + "(" + type_name + " " + parameter + "){");
		// Add open bracket
		statement.add("\tprintf(\"{\");");

		// Print out each member
		record.fields().forEach((member, member_type) -> {
			String input_member = parameter + "->" + member;
			// Print the member name
			statement.add("\tprintf(\" " + member + ":\");");
			// Print the member value
			if(member_type instanceof Type.Byte){
				// Print Byte (unsigned char)
				statement.add("\tprintf(\"%c\", " + input_member + ");");
			}else if (member_type instanceof Type.Int || stores.isIntType(member_type)) {
				// Print integer value.
				statement.add("\tprintf(\"%\"PRId64, " + input_member + ");");
			} else if (member_type instanceof Type.Array) {
				// Check the element type
				Type elm_type = stores.getArrayElementType((Type.Array) member_type);
				int dimension = stores.getArrayDimension(member_type);
				if(elm_type instanceof Type.Byte){
					// Print an array of BYTE
					statement.add("\t_PRINT_" + dimension + "DARRAY_BYTE(" + input_member + ");");
					
				}else if (stores.isIntType(elm_type)) {
					// Print an array of integers
					statement.add("\t_PRINT_" + dimension + "DARRAY_int64_t(" + input_member + ");");
				} else {
					String struct = translateType(elm_type, stores).replace("*", "");
					// Print an array of structure pointers using macro
					statement.add("\t_PRINT_1DARRAY_STRUCT(" + struct + "," + input_member + ");");
				}
			} else if (member_type instanceof Type.Nominal) {
				Type.Nominal nominal = (Type.Nominal) member_type;
				// Print out nominal type using predefined print function
				statement.add("\tprintf_" + nominal.name().name() + "(" + input_member + ");");
			} else {
				throw new RuntimeException("Not implemented!");
			}
		});

		// Add ending "}"
		statement.add("\tprintf(\"}\");");
		statement.add("}");

		return statement;
	}

	/**
	 * Generate the assignment code of an variable by using update or copy.
	 * 
	 * @param type
	 * @param indent
	 * @param lhs
	 * @param rhs
	 * @param isCopyEliminated
	 * @return
	 */
	protected static List<String> generateAssignmentCode(Type type, String indent, String lhs, String rhs,
			boolean isCopyEliminated, CodeStores stores) {
		List<String> statement = new ArrayList<String>();
		if (type instanceof Type.Array) {
			Type elm_type = stores.getArrayElementType((Type.Array) type);
			// Get array dimension
			int dimension = stores.getArrayDimension(type);
			// Generate the assignment for BYTE array
			if(elm_type instanceof Type.Byte){
				// Check if the lhs copy is needed or not
				if (isCopyEliminated) {
					statement.add(indent + "_UPDATE_" + dimension + "DARRAY(" + lhs + ", " + rhs + ");");
				} else {
					statement.add(indent + "_COPY_" + dimension + "DARRAY_BYTE(" + lhs + ", " + rhs + ");");
				}
			}else if (stores.isIntType(elm_type)) {				
				// Check if the lhs copy is needed or not
				if (isCopyEliminated) {
					statement.add(indent + "_UPDATE_" + dimension + "DARRAY(" + lhs + ", " + rhs + ");");
				} else {
					statement.add(indent + "_COPY_" + dimension + "DARRAY_int64_t(" + lhs + ", " + rhs + ");");
				}
			} else {
				// An array of structure pointers
				if (isCopyEliminated) {
					// Have an in-place update
					statement.add(indent + "_UPDATE_1DARRAY(" + lhs + ", " + rhs + ");");
				} else {
					// Copy the array and assign it to lhs
					String struct = translateType(elm_type, stores).replace("*", "");
					statement.add(indent + "_COPY_1DARRAY_STRUCT(" + lhs + ", " + rhs + ", " + struct + ");");
				}
			}
		} else {
			if (isCopyEliminated || !stores.isCompoundType(type)) {
				statement.add(indent + lhs + " = " + rhs + ";");
			} else {
				String elm_type = translateType(type, stores).replace("*", "");
				statement.add(indent + "_COPY_STRUCT(" + lhs +", "+ rhs+ ", "+ elm_type+");");
			}
		}

		return statement;
	}

	/**
	 * Given a structure, generate 'copy_*' function to make a copy of the structure, e.g.
	 * 
	 * <pre>
	 * <code>
	 * Board copy_Board(Board b){
	 *	Board new_b;
	 *	new_b.pieces = copy(b.pieces, b.pieces_size);
	 *	new_b.pieces_size = b.pieces_size;
	 * 	new_b.move = b.move;
	 *	return new_b; 
	 * } 
	 * </code>
	 * </pre>
	 * 
	 * For union type of NULL and record, the copy function is
	 * 
	 * <pre>
	 * <code>
	 * Board* copy_Board(Board* _board){
	 * 	Board* new_board = create_Board();
	 * 	new_board.pieces_size = _board->pieces_size;  new_board.pieces = copy(_board->pieces, _board->pieces_size);
	 *	new_board.move = _board->move;
	 *	return &new_board;
	 * }
	 * </code>
	 * </pre>
	 * 
	 * @param type_name
	 * @param fields
	 * @return
	 */
	private static List<String> generateStructCopy(Type type, CodeStores stores) {
		List<String> statement = new ArrayList<String>();
		// Get the raw record type
		Type.Record record = stores.getRecordType(type);
		String type_name = translateType(type, stores);
		String struct_name = type_name.replace("*", "");
		String parameter = "_" + struct_name;
		String new_copy = "new_" + struct_name;
		// Define the signature of 'copy_struct' function
		statement.add(type_name + " " + ("copy_" + struct_name) + "(" + type_name + " " + parameter + "){");
		
		// Create a structure pointer
		statement.add("\t" + type_name + " " + new_copy + " = malloc(sizeof(" + struct_name + "));");
		
		// Allocate the input in heap  memory, which require manual de-allocation.
		
		// Generate the code for each member.
		record.fields().forEach((member, member_type) -> {
			String lhs = new_copy + "->" + member;
			String rhs = parameter + "->" + member;
			statement.addAll(generateAssignmentCode(member_type, "\t", lhs, rhs, false, stores));
		});

		// Add return statement
		statement.add("\treturn " + new_copy + ";");
		statement.add("}");

		return statement;
	}

	/**
	 * Given an array of structures and array size, make a copy of an array of structures.
	 * 
	 * <pre>
	 * <code> POS** copy_array_POS(POS** _POS, size_t _POS_size){ POS** new_array_POS =
	 * malloc(_POS_size*sizeof(POS*)); for(int i=0;i< _POS_size;i++){ new_array_POS[i]= copy_POS(_POS[i]); }
	 *
	 * return new_array_POS; }
	 * 
	 * @param type
	 * @param stores
	 * @return
	 */
	private static List<String> generateStructArrayCopy(Type type, CodeStores stores) {
		List<String> statement = new ArrayList<String>();
		String struct = translateType(type, stores).replace("*", "");
		String parameter = "_" + struct;
		String size = parameter + "_size";
		String new_copy = "new_" + struct;
		// Define the function signature, e.g. 'POS** copy_array_POS(POS** _POS, size_t _POS_size){
		statement.add(struct + "** " + "copy_array_" + struct + "(" + struct + "** " + parameter + ", size_t " + size
				+ "){");

		// Create an array of structure pointers, e.g. 'POS** new_array_POS = malloc(_POS_size*sizeof(POS*));'
		statement.add("\t" + struct + "** " + new_copy + " = malloc(" + size + "*sizeof(" + struct + "*));");
		
		// Allocate the input in heap memory, which require manual de-allocation.

		// Generate the for loop to create each structure pointer, e.g. 'for(int i=0;i< _POS_size;i++){
		statement.add("\tfor(int i=0;i<" + size + ";i++){");

		// Copy each structure pointer, e.g. 'new_array_POS[i]= copy_POS(_POS[i]);
		statement.add("\t\t" + new_copy + "[i] = copy_" + struct + "(" + parameter + "[i]);");

		statement.add("\t}");

		// Add return statement
		statement.add("\treturn " + new_copy + ";");
		statement.add("}");

		return statement;
	}

	/**
	 * Get the operator of accessing a structure member w.r.t. input type.
	 * 
	 * 
	 * @param var
	 * @param member
	 * @param type
	 * @return
	 */
	protected static String accessMember(Type type) {
		if (type instanceof Type.Record) {
			return ".";
		} else if (type instanceof Type.Union) {
			return "->";
		}
		throw new RuntimeException("Not implemented");
	}

	/**
	 * Release a board structure if(_board!=NULL){ free(_board->pieces); }
	 * 
	 * @param type_name
	 * @param fields
	 * @return
	 */
	private static List<String> generateStructFree(Type type, CodeStores stores) {
		List<String> statement = new ArrayList<String>();
		Type.Record record = stores.getRecordType(type);

		String type_name = translateType(record, stores);
		String parameter = type_name.toLowerCase().replace("*", "");
		statement.add("void free_" + type_name.replace("*", "") + "(" + type_name + " " + parameter + "){");

		// Get all array-typed members and free their memory spaces
		record.fields().forEach((member, member_type) -> {
			if (!stores.isIntType(member_type)) {
				String input_member = parameter + "->" + member;
				// No needs to free integer
				if (member_type instanceof Type.Array) {
					// Check element type
					Type elm_type = stores.getArrayElementType((Type.Array) member_type);
					if (stores.isIntType(elm_type) || elm_type instanceof Type.Byte) {
						// An array of integers
						if (stores.getArrayDimension(member_type) == 2) {
							// Free an array of integer arrays by using '_DEALLOC_2DArray' macro
							statement.add("\tfree2DArray_int64_t(" + input_member + ", " + input_member + "_size);");
						} else {
							statement.add("\tfree(" + input_member + ");");
						}
						// Nullify the member
						statement.add("\t" + input_member + " = NULL;");
					} else {
						// Free n array of structure pointers
						String struct = translateType(elm_type, stores).replace("*", "");
						statement.add("\t_FREE_1DARRAY_STRUCT(" + input_member + ", " + struct + ");");
					}
				} else if (member_type instanceof Type.Nominal) {
					Type.Nominal nominal = (Type.Nominal)member_type;
					// Call predefined free function to free this member
					statement.add("\tfree_" +nominal.name().name()+ "("+input_member + ");");
					// Nullify the member
					statement.add("\t" + input_member + " = NULL;");
				}
			}

		});

		statement.add("\tfree(" + parameter + ");");
		statement.add("}");// Add ending bracket.

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
	public static String translateType(Type type, CodeStores stores) {
		if (type instanceof Type.Nominal) {
			String nominal_name = ((Type.Nominal) type).name().name();
			
			// Check is type is a System.Console.
			if (nominal_name.equals("Console") || nominal_name.equals("Reader")
					|| nominal_name.equals("Writer")) {
				// Use FILE type.
				return "FILE*";
			}

			// string type
			if(nominal_name.equals("string")){
				// Use an array of integers (BYTE*)
				return "int64_t*";
			}
			
			// The existential type, e.g. 'Board' is an nominal type in TicTacToe test case.
			WyilFile.Type nominal = Optional.of(stores.getUserDefinedType(type)).get();
			return translateType(nominal.type(), stores);
		}

		if (type instanceof Type.Int) {
			// Return 64-bit integers
			return "int64_t";
		}

		if (type instanceof Type.Array) {
			return translateType(((Type.Array) type).element(), stores) + "*";
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
				return "void*";
			}

			// The input 'type' is input arguments of main method.
			if (fields.containsKey("args")) {
				return "int argc, char** args";
			}
			
			// Check if the fields is FILE input/output methods
			if(fields.containsKey("readAll")|| fields.containsKey("write") || fields.containsKey("close")){
				return "void*";
			}
			
			// Get the user-defined type
			return Optional.ofNullable(stores.getUserDefinedType(type)).get().name() + "*";

		}

		if (type instanceof Type.Union) {
			Type.Union u = (Type.Union) type;
			// Check if type is 'union' type of INT and NULL
			if (stores.isIntArrayOrAliasedType(u) 
					|| (u.bounds().contains(Type.Int.T_INT) && u.bounds().contains(Type.Null.T_NULL))) {
				// Return an array of 64-bit integers
				return "int64_t*";
			}
			
			return Optional.ofNullable(stores.getUserDefinedType(type)).get().name() + "*";
		}

		// Translate reference type in Whiley to pointer type in C.
		if (type instanceof Type.Reference) {
			Type.Reference ref = (Type.Reference) type;
			// Types are passed as a pointer type
			return translateType(ref.element(), stores) + "*";
		}

		if (type instanceof Type.Method) {
			return "void*";
		}

		if (type instanceof Type.Null) {
			return "void*";
		}

		if (type instanceof Type.Function) {
			// Function pointers, e.g. int64_t (*)(int64_t)
			Type.Function func_type = (Type.Function) type;
			// Return type (single return value)
			String str = translateType(func_type.returns().get(0), stores);
			// Function pointer
			str += "(*)(";
			// Parameter types
			boolean isFirst = true;
			for (Type param : func_type.params()) {
				if (!isFirst) {
					str += ", ";
				} else {
					isFirst = false;
				}
				str += translateType(param, stores);
			}
			str += ")";
			return str;
		}

		if (type instanceof Type.Bool) {
			return "bool";
		}
		// byte type
		if (type instanceof Type.Byte){
			return "BYTE";
		}
				
		throw new RuntimeException("Not Implemented!");
	}

	/**
	 * Generate 'Copy', 'Free' and 'Print' functions for a given structure.
	 * 
	 * @param name
	 * @param type
	 * @param stores
	 * @return
	 */
	protected static List<String> generateStructFunction(Type type, CodeStores stores) {
		List<String> statements = new ArrayList<String>();
		statements.addAll(generateStructCopy(type, stores));
		statements.addAll(generateStructArrayCopy(type, stores));
		statements.addAll(generateStructFree(type, stores));
		statements.addAll(generateStructPrintf(type, stores));

		return statements;
	}

	/**
	 * Write the user-defined structure to *.h file, e.g.
	 * 
	 * <pre>
	 * <code>
	 * typedef struct{
	 *		Square* pieces;
	 *		int64_t pieces_size;
	 * 		nat move;
	 * } Board;<br>
	 * </code>
	 * </pre>
	 * 
	 * @param userType
	 */
	protected static List<String> generateStructDef(Type type, CodeStores stores) {
		List<String> statements = new ArrayList<String>();

		// Extract record type from an union/record type
		String type_name = translateType(type, stores);

		// Define a structure
		String struct_name = type_name.replaceAll("\\*", "");
		statements.add("typedef struct{");

		// Generate structure members for a given members
		Type.Record record = stores.getRecordType(type);
		// Gather all members
		record.fields().forEach((member, member_type) -> {
			if (member_type instanceof Type.Array) {
				// Get array 
				int dimension = stores.getArrayDimension(member_type);
				Type elm_type = stores.getArrayElementType((Type.Array) member_type);
				if(elm_type instanceof Type.Byte){
					statements.add("\t_DECL_" + dimension + "DARRAY_MEMBER_BYTE(" + member + ");");
				}else if (stores.isIntType(elm_type)) {
					// Declare an array of integers					
					statements.add("\t_DECL_" + dimension + "DARRAY_MEMBER(" + member + ");");
				} else {
					String struct = translateType(elm_type, stores).replace("*", "");
					// Declare an array of structure pointers, e.g. POS**
					statements.add("\t" + struct + "** " + member + ";");
					// Declare the array size variable
					statements.add("\tsize_t " + member + "_size;");
				}

			} else {
				statements.add("\t" + translateType(member_type, stores) + " " + member + ";");
			}
		});

		statements.add("} " + struct_name + ";");
		String input = "_" + type_name.toLowerCase().replace("*", ""); // Input parameter
		// Add built-in function declarations, 'create' and 'printf', 'copy' and 'free'
		statements.add("void printf_" + struct_name + "(" + type_name + " " + input + ");");
		statements.add(type_name + " copy_" + struct_name + "(" + type_name + " " + input + ");");
		statements.add("void free_" + struct_name + "(" + type_name + " " + input + ");");

		return statements;
	}

}
