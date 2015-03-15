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
				"#include <time.h>\n"+
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
	public static void generateToString(PrintWriter writer, boolean isBoolType){
		//Hard-coded the function temporarily.
		String indent = "\t";
		String stats = "";		
		stats +="char* toString(long long arr[], long long size, char *str){\n" + 
				"	long long i;\n" + 
				"	i=0;\n" + 
				"	strcpy(str, \"[\");\n" + 
				"	for(i=0;i<size;i++){		\n";
		if(isBoolType){
			stats +="		if(arr[i]==true){\n" + 
				    "			strcat(str, \"true\");\n" + 
					"		}else{\n" + 
					"			strcat(str, \"false\");\n" + 
					"		}\n";
		}else{
			stats +="		char c[1024];\n" + 
					"		sprintf(c, \"%d\", arr[i]);\n" + 
					"		strcat(str, c);\n";	
		}
				 
	    stats +="		if(i<size-1){\n" + 
				"			strcat(str, \", \");\n" + 
				"		}\n" + 
				"	}\n" + 
				"	strcat(str, \"]\");\n" + 
				"	//free arr[]"+
				"	free(arr);"+
				"	return str;\n" + 
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
		stats +="long long* clone(long long *arr, long long size){\n" + 
				"	long long *ptr;\n" + 
				"	long long i;\n" + 
				"	//Clone all the values from board array due to immutable Whiley value\n" + 
				"	ptr = (long long*)malloc(size*sizeof(long long));\n" + 
				"	//Copy data from 'board' array to 'nboard' array\n" + 
				"	for(i=0;i<size;i++){\n" + 
				"		ptr[i]=arr[i];\n" + 
				"	}\n" + 
				"	return ptr;\n" + 
				"}";				
	
		writer.println(stats);
		System.out.println(stats);
	}
	
	/**
	 * Generates the C code for append byte-code.
	 * @param writer
	 */
	public static void generateAppend(PrintWriter writer){
		String indent = "\t";
		String stats = "";		
		stats +="void append(long long* op_1, long long op_1_size, long long* op_2, long long op_2_size, long long* res){\n" + 
				"	long long i;\n" + 
				"	long long res_i;\n" + 
				"	res_i=0;\n" + 
				"	for(i=0;i<op_1_size;i++){\n" + 
				"		res[res_i]=op_1[i];\n" + 
				"		res_i++;\n" + 
				"	}\n" + 
				"	for(i=0;i<op_2_size;i++){\n" + 
				"		res[res_i]=op_2[i];\n" + 
				"		res_i++;\n" + 
				"	}\n" +
				"	//free the op_1\n" + 
				"	free(op_1);"+
				"	//free the op_2\n" + 
				"	free(op_2);"+
				"}\n" + 
				"";				
	
		writer.println(stats);
		System.out.println(stats);
	}
	
	/**
	 * Translate the WyIL type into the type in C.
	 * @param type the WyIL type
	 * @return the result string
	 */
	public static String translate(Type type){
		if(type instanceof Type.Int || type instanceof Type.Bool){
			return "long long";
		}

		if(type instanceof Type.List){
			Type.List listType = (Type.List)type;
			return translate(listType.element())+"*";
		}		

		if(type instanceof Type.Void){
			return "void";
		}

		if(type instanceof Type.Record){			
			Type.Record record = (Type.Record)type;
			HashMap<String, Type> fields = record.fields();
			if(fields.containsKey("args")){
				return "int argc, char** argv";
			}
			return record.toString();
		}
		
		if(type instanceof Type.Strung){
			return "char*";
		}
		
		return null;
	}
	

}
