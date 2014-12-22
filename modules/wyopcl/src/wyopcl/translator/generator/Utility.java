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
	public static void generateHeader(PrintWriter writer){
		//Include files
		String stats = "#include <stdio.h>\n"+
					   "#include <stdlib.h>\n"+
					   "#include <string.h>\n"+
					   "#include <errno.h>\n";
		//Boolean type
		stats += "#define false 0\n"+
				  "#define true 1";
		writer.println(stats);
		System.out.println(stats);
		
	}
	
	/**
	 * Write out the native 'toString' function in C.
	 * TODO : generalize the code generation.
	 * @param writer
	 */
	public static void generateToString(PrintWriter writer){
		//Hard-coded the function temporarily.
		String stats = "char* toString(int arr[], int size, char *str){\r\n" + 				
				"	int i;\r\n" +				
				"	int len;\r\n" + 				
				"	i=0;\r\n" +
				"	strcpy(str, \"[\");\r\n" + 
				"	for(i=0;i<size;i++){\r\n" + 				
				"		if(arr[i]==true){\r\n" + 				
				"			strcat(str, \"true\");\r\n" +				
				"		}else{\r\n" + 				
				"			strcat(str, \"false\");\r\n" + 				
				"		}\r\n" + 				
				"		if(i<size-1){\r\n" + 				
				"			strcat(str, \", \");\r\n" + 				
				"		}\r\n" + 				
				"	}\r\n" + 				
				"	strcat(str, \"]\");\r\n" + 				
				"	//Add the ending \r\n" + 				
				"	len = strlen(str);\r\n" + 				
				"	str[len+1]='\\0';\r\n" + 				
				"	return str;\r\n" + 				
				"}";
		writer.println(stats);
		System.out.println(stats);
	}
	
	/**
	 * Generates the native clone function in C.
	 * @param writer
	 */
	public static void generateClone(PrintWriter writer){
		String stats ="int* clone(int *arr, int size){\r\n" + 				
				"	int *ptr;\r\n" + 				
				"	int i;\r\n" + 				
				"	//Clone all the values from board array due to immutable Whiley value\r\n" +				
				"	ptr = (int*)malloc(size*sizeof(int));\r\n" + 				
				"	//Copy data from 'board' array to 'nboard' array\r\n" + 				
				"	for(i=0;i<size;i++){\r\n" + 				
				"		ptr[i]=arr[i];\r\n" + 				
				"	}\r\n" + 				
				"	return ptr;\r\n" + 				
				"}";
		writer.println(stats);
		System.out.println(stats);
	}
	

}
