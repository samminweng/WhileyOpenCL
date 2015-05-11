package wyopcl.translator.generator;

import java.io.PrintWriter;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import wyil.lang.Type;
import wyil.lang.WyilFile.Constant;

/**
 * Lists the code generation methods 
 * @author Min-Hsien Weng
 *
 */
public final class CodeGeneratorHelper {
	private CodeGeneratorHelper(){

	}

	/**
	 * Extract the type from the constant and translates the type into the C type.
	 * @param constant
	 * @return
	 */
	private static String translateConstantType(wyil.lang.Constant constant){
		if(constant instanceof wyil.lang.Constant.Integer){
			return "long long";
		}
		return "null";
	}
	
	/**
	 * Declares all the constants defined in WyIL modules, e.g.
	 * <pre><code>
	 * const in 
	 * </code></pre>
	 * 
	 */
	public static void generateConstant(PrintWriter writer, Collection<Constant> collection){
		String statements = "";
		for(Constant constant: collection){
			statements += "const " + translateConstantType(constant.constant())+ " "+ constant.name()+ "=" + constant.constant() + ";\n";
		}		
		writer.println(statements);
	}
	
	
	
	/**
	 * Writes out the 'include' and 'define' code.
	 * TODO : generalize the code generation.
	 * @param writer
	 */
	public static void generateHeader(PrintWriter writer, List<String> list_func, boolean isVerbose){
		//Include files
		String stats = "";
		//Include the user-defined standard 'Util' header file.  
		stats += "#include \"Util.h\"\n";
		//Declare the function signatures of the function which are defined in the Whiley program.
		for(String func : list_func){
			stats += func + ";\n";
		}
		writer.println(stats);
		if(isVerbose){
			System.out.println(stats);
		}		
	}

	/**
	 * Write out the 'include' part
	 * @param writer
	 */
	public static void generateIncludes(PrintWriter writer, String filename){		
		writer.println("#include \""+filename+".h\"");
		System.out.println("#include \""+filename+".h\"");
	}

	
	

	


	
	/**
	 * Write out the 'free_doublePtr' method to free the memory spaces allocated for the pointer of pointer.
	 * @param writer
	 */
	public static void generateFree_doublePtr(PrintWriter writer){
		
		String stats = "/**Frees the memory space allocated for the pointer of pointer.*/\n" + 
				"void free_doublePtr(char** res, long long res_size){\n" + 
				"	long long i;\n" + 
				"	for(i=0;i<res_size;i++){\n" + 
				"		free(res[i]);\n" + 
				"	}\n" + 
				"	free(res);\n" + 
				"}";
		writer.println(stats);
		System.out.println(stats);
	}

	


}
