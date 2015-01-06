package wyopcl.translator.generator;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Lists the common methods for code generation. 
 * @author Min-Hsien Weng
 *
 */
public final class Utility {
	private Utility(){

	}
	/**
	 * Writes out the 'include' and 'define' code.
	 * TODO : generalize the code generation.
	 * @param writer
	 */
	public static void generateHeader(PrintWriter writer, List<String> list_func, boolean isVerbose){
		//Include files
		String stats = "";
		stats +="#include <stdio.h>\n" + 
				"#include <stdlib.h>\n" + 
				"#include <string.h>\n" + 
				"#include <errno.h>\n" + 
				"#define false 0\n" + 
				"#define true 1\n";
		//Native function declaration
		stats +="long long* clone(long long *arr, long long size);\n"+
				"char* toString(long long arr[], long long size, char *str);\n";
		
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
	 * Generate the native C 'toString' function to convert the content of an array to a string.
	 * TODO : generalize the code generation.
	 * @param writer
	 */
	public static void generateToString(PrintWriter writer){
		//Hard-coded the function temporarily.
		String indent = "\t";
		String stats = "";		
		stats +="char* toString(long long arr[], long long size, char *str){\n" + 
				indent+"long long i;\n" +
				indent+"i=0;\n" + 
				indent+"strcpy(str, \"[\");\n" + 
				indent+"for(i=0;i<size;i++){\n" + 
				indent+indent+"if(arr[i]==true){\n" + 
				indent+indent+indent+"strcat(str, \"true\");\n" + 
				indent+indent+"}else{\n" + 
				indent+indent+indent+"strcat(str, \"false\");\n" + 
				indent+indent+"}\n" + 
				indent+indent+"if(i<size-1){\n" + 
				indent+indent+indent+"strcat(str, \", \");\n" + 
				indent+indent+"}\n" + 
				indent+"}\n" + 
				indent+"strcat(str, \"]\");\n" + 
				indent+"return str;\n" + 
				"}";
		writer.println(stats);
		System.out.println(stats);
	}

	/**
	 * Generates the native C 'Clone' function to clone an array.
	 * TODO : generalization.
	 * @param writer
	 */
	public static void generateClone(PrintWriter writer){
		String indent = "\t";
		String stats = "";		
		stats +="long long* clone(long long *arr, long long size){\n" + 
				indent+"long long *ptr;\n" + 
				indent+"long long i;\n" + 
				indent+"//Clone all the values from board array due to immutable Whiley value\n" + 
				indent+"ptr = (long long*)malloc(size*sizeof(long long));\n" + 
				indent+"//Copy data from 'board' array to 'nboard' array\n" + 
				indent+"for(i=0;i<size;i++){\n" + 
				indent+indent+"ptr[i]=arr[i];\n" + 
				indent+"}\n" +				
				indent+"return ptr;\n" + 
				"}";				
	
		writer.println(stats);
		System.out.println(stats);
	}

}
