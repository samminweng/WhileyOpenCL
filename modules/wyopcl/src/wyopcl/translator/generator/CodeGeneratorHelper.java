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
				"long long* append(long long* op_1, long long op_1_size, long long* op_2, long long op_2_size);\n"+
				"void toString(long long arr[], long long size, char** res);\n" + 
				"void free_doublePtr(char** res, long long res_size);\n"+
				"void indirect_printf(char** res, long long _res_size);\n";
		
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
		stats ="/* Convert an array of long long integer into an array of string.*/\n" + 
				"void toString(long long arr[], long long size, char** res){\n" + 
				"	long long i;\n" + 
				"	char buffer[1024];	\n" + 
				"	if(res == NULL) { fprintf(stderr,\"fail to malloc res in toString(long long arr[], long long size, char** res)\"); exit(0);}\n" + 
				"	i=0;\n" + 
				"	for(i=0;i<size;i++){	\n" + 
				"		//Write the array element (long long) to the buffer and get the length \n" + 
				"		long long length = sprintf(buffer, \"%lld\", arr[i]);\n" + 
				"		//Allocate the memory size for the result array, based on the length.\n" + 
				"		//The string length is the original buffer_size plus 1, so that we can put '\\0' at the end of a string.\n" + 
				"		res[i] = (char*)malloc((length+1)*sizeof(char));\n" + 
				"		if(res[i] == NULL) {\n" + 
				"			fprintf(stderr,\"fail to malloc %lld\", i);\n" + 
				"		 	exit(0);\n" + 
				"		}\n" + 
				"		strcpy(res[i],  buffer);\n" + 
				"	}\n" + 
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
				"	if(ptr == NULL) {fprintf(stderr,\"fail to malloc\"); exit(0);}"+
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
	 * Generates the C code to append a op to another and return the result pointer.
	 * @param writer
	 */
	public static void generateAppend(PrintWriter writer){
		String indent = "\t";
		String stats = "";		
		stats +="long long* append(long long* op_1, long long op_1_size, long long* op_2, long long op_2_size){\n" + 
				"	long long i;\n" + 
				"	long long *res;\n" + 
				"	long long res_size;\n" + 
				"	//Assign the res with op. That means both of them address to same memory location. In other word, copy the array.\n" + 
				"	//Realloc the array size of 'res'\n" + 
				"	res = op_1;\n" + 
				"	res_size = op_1_size+op_2_size;\n" + 
				"	res = (long long*)realloc(res, (op_1_size+op_2_size)*sizeof(long long));\n" +
				"	if(res == NULL) {fprintf(stderr,\"fail to realloc\"); exit(0);}"+
				"	for(i=0;i<op_2_size;i++){\n" + 
				"		res[op_1_size+i]=op_2[i];\n" + 
				"	}\n" +
				"	return res;\n" + 
				"}";				

		writer.println(stats);
		System.out.println(stats);
	}

	/**
	 * Write out the indirect_invoked method to print out each string in a list of string.
	 * @param writer
	 */
	public static void generateIndirectInvoked(PrintWriter writer){		
		String stats = "/*Print out each string in a list of string.*/\n" + 
				"void indirect_printf(char** res, long long _res_size){\n" + 
				"	long long i;\n" + 
				"	printf(\"\\n[\");\n" + 
				"	for(i=0;i<_res_size;i++){\n" + 
				"		printf(\"%s,\",res[i]);\n" + 
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
