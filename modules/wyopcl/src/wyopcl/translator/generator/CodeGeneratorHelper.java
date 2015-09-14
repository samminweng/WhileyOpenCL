package wyopcl.translator.generator;

import java.io.PrintWriter;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import wyil.lang.Attribute;
import wyil.lang.Type;
import wyil.lang.WyilFile;
import wyil.lang.WyilFile.Constant;

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
	 * Extract the type from the constant and translates the type into the C
	 * type.
	 * 
	 * @param constant
	 * @return
	 */
	private static String translate(wyil.lang.Constant constant) {
		if (constant instanceof wyil.lang.Constant.Integer) {
			return "long long";
		}
		return "null";
	}

	/**
	 * Declares all the constants defined in WyIL modules, e.g. the Whiley code
	 * 
	 * <pre>
	 * <code>
	 * constant BLANK is 0
	 * </code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>
	 * const long long BLANK = 0;
	 * </code>
	 * </pre>
	 * 
	 */
	public static void generateConstant(PrintWriter writer, Collection<Constant> constants) {
		String statements = "";
		// Include the standard 'Util' header file.
		statements += "#include \"Util.h\"\n";
		for (Constant constant : constants) {
			//Add the comment of original code 
			statements += "//"+constant.constant()+"\n";
			statements += "const " + translate(constant.constant()) + " " + constant.name() + "=" + constant.constant() + ";\n";
		}
		writer.println(statements);
	}
	
	/**
	 * Translates the Whiley type into C type, e.g. 
	 * <pre><code>
	 * 
	 *  
	 * @param type
	 * @return
	 */
	private static String translate(Type type){
		
		if(type instanceof Type.Nominal){
			return ((Type.Nominal) type).name().name();
		}		
		
		//Hard-coded translation due to the lack of variable declaration of 'nat' and 'Square'.
		if(type instanceof Type.Int){
			//Add 'long long;'
			return "long long";
		}
		
		if(type instanceof Type.Array){
			return translate(((Type.Array)type).element())+ "*";
		}
		
		
		if(type instanceof Type.Record){
			Type.Record record = (Type.Record)type;
			String statement = "";
			for(Map.Entry<String, Type> field:record.fields().entrySet()){
				statement += translate(field.getValue()) + " " + field.getKey()+";\n"; 
			}
			return statement;
		}
		
		return "null";
		
	}
	
	
	
	

	/**
	 * Declares all the user defined types in WyIL module, e.g.
	 * 
	 * <pre>
	 * <code>
	 * type Square is (int x) where x == BLANK || x == CIRCLE || x == CROSS
	 * </code>
	 * </pre>
	 * 
	 * can be translated into:
	 * 
	 * <pre>
	 * <code>
	 * 
	 * </code>
	 * </pre>
	 * 
	 * @param writer
	 * @param module 
	 * @param collection
	 */
	public static void generateUserDefinedType(PrintWriter writer, Collection<wyil.lang.WyilFile.Type> types) {
		String statements = "";
		for (wyil.lang.WyilFile.Type type: types) {
			//Add the original type
			statements += "//"+type.name()+"\n";
			if(type.type() instanceof Type.Int){
				//Use the 'typedef' keyword in C to give the type a new name
				statements += "typedef long long "+ type.name()+";\n";
			}else if(type.type() instanceof Type.Record){
				statements += "typedef struct " + type.name() + "{\n";
				// Get the 'struct' keyword in C to convert the type into the structure in C. 
				statements += translate(type.type());
				statements += "} "+type.name()+";\n";
			}
		}
		writer.println(statements);
	}

	/**
	 * Writes out the 'include' and 'define' code. TODO : generalize the code
	 * generation.
	 * 
	 * @param writer
	 */
	public static void generateHeader(PrintWriter writer, List<String> list_func, boolean isVerbose) {
		// Include files
		String stats = "";
		// Declare the function signatures of the function which are defined in
		// the Whiley program.
		for (String func : list_func) {
			stats += func + ";\n";
		}
		writer.println(stats);
		if (isVerbose) {
			System.out.println(stats);
		}
	}

	/**
	 * Write out the 'include' part
	 * 
	 * @param writer
	 */
	public static void generateIncludes(PrintWriter writer, String filename) {
		writer.println("#include \"" + filename + ".h\"");
		System.out.println("#include \"" + filename + ".h\"");
	}

	/**
	 * Write out the 'free_doublePtr' method to free the memory spaces allocated
	 * for the pointer of pointer.
	 * 
	 * @param writer
	 */
	public static void generateFree_doublePtr(PrintWriter writer) {

		String stats = "/**Frees the memory space allocated for the pointer of pointer.*/\n"
				+ "void free_doublePtr(char** res, long long res_size){\n" + "	long long i;\n" + "	for(i=0;i<res_size;i++){\n" + "		free(res[i]);\n"
				+ "	}\n" + "	free(res);\n" + "}";
		writer.println(stats);
		System.out.println(stats);
	}

}
