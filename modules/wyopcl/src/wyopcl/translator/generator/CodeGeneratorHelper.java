package wyopcl.translator.generator;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import wyil.lang.Type;

/**
 * Lists the code generation methods 
 * @author Min-Hsien Weng
 *
 */
public final class CodeGeneratorHelper {
	private CodeGeneratorHelper(){

	}

	/**
	 * 
	 */
	public static void generateUtil(){
		
		
		
		
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
	 * Write out the indirect_invoked method to print out each long long integer in a list.
	 * @param writer
	 */
	public static void generateIndirectInvoked(PrintWriter writer){		
		String stats = "/*Print out each string in a list of string.*/\n" + 
				"void indirect_printf(long long* res, long long _res_size){\n" + 
				"	long long i;\n" + 
				"	printf(\"\\n[\");\n" + 
				"	for(i=0;i<_res_size;i++){\n" + 
				"		printf(\"%lld,\",res[i]);\n" + 
				"	}\n" + 
				"	printf(\"]\\n\");\n" + 
				"}";
		writer.println(stats);
		System.out.println(stats);

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
