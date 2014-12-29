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
	public static void generateHeader(PrintWriter writer, List<String> list_func){
		//Include files
		String stats = "";
		stats +="#include <stdio.h>\n" + 
				"#include <stdlib.h>\n" + 
				"#include <string.h>\n" + 
				"#include <errno.h>\n" + 
				"#define false 0\n" + 
				"#define true 1\n" + 
				"#define NULL -1\n";
		
		for(String func : list_func){
			stats += func + ";\n";
		}		
		writer.println(stats);
		System.out.println(stats);
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
		String stats = "";		
		stats +="char* toString(int arr[], int size, char *str){\n" + 
				"int i;\n" + 
				"int len;\n" + 
				"i=0;\n" + 
				"strcpy(str, \"[\");\n" + 
				"for(i=0;i<size;i++){\n" + 
				"if(arr[i]==true){\n" + 
				"strcat(str, \"true\");\n" + 
				"}else{\n" + 
				"strcat(str, \"false\");\n" + 
				"}\n" + 
				"if(i<size-1){\n" + 
				"strcat(str, \", \");\n" + 
				"}\n" + 
				"}\n" + 
				"strcat(str, \"]\");\n" + 
				"//Add the ending\n" + 
				"len = strlen(str);\n" + 
				"str[len+1]=NULL;\n" + 
				"return str;\n" + 
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
		String stats = "";		
		stats +="int* clone(int *arr, int size){\n" + 
				"int *ptr;\n" + 
				"int i;\n" + 
				"//Clone all the values from board array due to immutable Whiley value\n" + 
				"ptr = (int*)malloc((size+1)*sizeof(int));\n" + 
				"//Copy data from 'board' array to 'nboard' array\n" + 
				"for(i=0;i<size;i++){\n" + 
				"ptr[i]=arr[i];\n" + 
				"}\n" + 
				"//Ending\n" + 
				"ptr[i]=NULL;\n" + 
				"return ptr;\n" + 
				"}";				
	
		writer.println(stats);
		System.out.println(stats);
	}

	/**
	 * Generates the native C 'getSize' function to get the size of an array.
	 * TODO : generalization.
	 * @param writer
	 */
	public static void generateGetSize(PrintWriter writer){
		String stats = "";
		stats += "int getSize(int *arr){\n" + 
				"int size=0;\n" + 
				"while(arr[size] != NULL){\n" + 
				"size++;\n" + 
				"}\n" + 
				"return size;\n" + 
				"}";
		writer.println(stats);
		System.out.println(stats);
	}


}
