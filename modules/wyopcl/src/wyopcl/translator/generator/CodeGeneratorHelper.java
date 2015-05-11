package wyopcl.translator.generator;

import java.io.PrintWriter;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import wyil.lang.Attribute;
import wyil.lang.Type;
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
	private static String translateConstantType(wyil.lang.Constant constant) {
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
		for (Constant constant : constants) {
			statements += "const " + translateConstantType(constant.constant()) + " " + constant.name() + "=" + constant.constant() + ";\n";
		}
		writer.println(statements);
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
	 * @param types
	 */
	public static void generateUserDefinedType(PrintWriter writer, List<Type.Record> types) {
		String statements = "";
		for (Type.Record type : types) {

			// Get the type name
			statements += "struct " + type + "{\n";
			// Iterate the attributes, e.g. 'x'
			//for (Attribute att : type.attributes()) {

			//}
			statements += "}\n";

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
		// Include the user-defined standard 'Util' header file.
		stats += "#include \"Util.h\"\n";
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
