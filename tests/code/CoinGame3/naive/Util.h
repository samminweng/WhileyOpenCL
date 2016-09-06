#include <stdio.h>  
#include <stdlib.h>  
#include <string.h>  
#include <errno.h>  
#include <time.h>
#include <ctype.h>
#include <stdbool.h>
// Good reference (https://en.wikibooks.org/wiki/C_Programming/Preprocessor)
// Remove the security check about unsafe 'scanf' or 'sprintf' in VS tool
// This definition allows the portability of C code across the platforms.
#define _CRT_SECURE_NO_WARNINGS

// Define BYTE type due to missing byte primitive type in C languate
typedef unsigned char BYTE;
/***
*
* Declare an enumerated type to indicate the type and select the corresponding function 
*
*/
typedef enum {
	T_INT, // Integer type
	T_BYTE // Byte type
} TYPENUM;

/**
 * Built-in functions
 */
void printf1DArray(long long* input, long long input_size);
void indirect_printf(long long input);
//No overlapping is allowed: function name must be different.
void printf_s(long long* input, long long input_size);
void println_s(long long* input, long long input_size);
// Parse a string into an integer
long long* parseStringToInt(long long* arr);
// 1D Array
long long** convertArgsToIntArray(int argc, char** args);
long long* copy1DArray(long long *arr, long long size);
//Given array size and array type, create an array and initialize the array value 
void* create1DArray(int value, int arr_size, TYPENUM type);
int isArrayEqual(long long* arr1, long long arr1_size, long long* arr2, long long arr2_size);
// 2D Array Operator
long long** copy2DArray(long long **arr, long long x, long long y);
long long** create2DArray(long long* arr,  long long x, long long y);
void free2DArray(long long** ptr, long long size);
void printf2DArray(long long** input, long long input_size, long long input_size_size);
// ArrayList Operators
long long* slice(long long* arr, long long arr_size, long long start, long long end);
long long* append(long long *arr1, long long arr1_size, long long* arr2, long long arr2_size);
long long* sublist(long long* arr, int start, int end);
int isPowerof2(long long value);
long long* optimized_append(long long* op_1, long long* op_1_size, long long* op_2, long long* op_2_size, long long* ret_size);


//Built-in functions for BYTE type
BYTE* copy1DArray_BYTE(BYTE *arr, long long size); // Copy a BYTE array
// Convert an array of bytes to an array of char
long long* fromBytes(BYTE* arr, long long arr_size);
/**
 * Macro Section
**/
// Define 'max' and 'min' macro
// Compute max and min without branches (http://graphics.stanford.edu/~seander/bithacks.html#IntegerMinOrMax)
#ifndef max
//#define max(a,b) \
//		({ __typeof__ (a) _a = (a); \
//		   __typeof__ (b) _b = (b); \
//		   _a > _b ? _a : _b; })
#define max(a, b) a ^ ((a ^ b) & -(a < b))
#endif
#ifndef min
#define min(a, b) b ^ ((a ^ b) & -(a < b));
//#define min(a,b) \
//		({ __typeof__ (a) _a = (a); \
//		   __typeof__ (b) _b = (b); \
//		   _a < _b ? _a : _b; })
#endif
/***
**  Debug macro prints out message when debug is enabled
*   The debug can be enabled when compilation, e.g.
*
*   	$gcc -D DEBUG *.c -o exec.out
*
*   Reference: https://gcc.gnu.org/onlinedocs/gcc/Preprocessor-Options.html
**/
#define num2str(x) str(x)
#define str(x) #x
#ifdef DEBUG
// Print out the message
#define DEBUG_PRINT(msg) if(DEBUG){fputs("DEBUG: " msg " (LINE:" num2str(__LINE__) " FILE: " __FILE__ ")\n", stdout);}
#else
#define DEBUG_PRINT(msg) // Do nothing
#endif
/***
 *
 * Declaration Macros
 *
 */
// Declare 1D array of integers
#define _DECL_1DARRAY(a) long long* a = NULL; long long a##_size = 0;
// Declare 1D array of BYTE
#define _DECL_1DARRAY_BYTE(a) BYTE* a = NULL; long long a##_size = 0;
// Declare 2D array variable
#define _DECL_2DARRAY(a) long long** a = NULL; long long a##_size = 0; long long a##_size_size = 0;
// Declare the deallocation flag
#define _DECL_DEALLOC(a) bool a##_dealloc = false;
#define _DECL_DEALLOC_PARAM(a) bool a##_dealloc
#define _DECL_1DARRAY_PARAM(a) long long* a, long long a##_size
#define _DECL_1DARRAY_MEMBER(a) long long* a; long long a##_size;
// Declare a BYTE array
#define _DECL_1DARRAY_MEMBER_BYTE(a) BYTE* a; long long a##_size; 
#define _DECL_2DARRAY_PARAM(a) long long** a, long long a##_size, long long a##_size_size
#define _DECL_2DARRAY_MEMBER(a) long long** a; long long a##_size; long long a##_size_size;
/***
 * Create (NEW) Macros
 *
 */
// Clone an integer pointers
#define _NEW_INTEGER_POINTER(a, b) \
 		({\
			a = malloc(sizeof(long long));\
			*a = *b;\
		})
// Create an array of integers or integer arrays
#define _NEW_1DARRAY(a, size, value) a##_size = size; a = create1DArray(value, a##_size, T_INT);
#define _NEW_1DARRAY_BYTE_VALUE(a, size, value) a##_size = size; a = create1DArray(value, a##_size, T_BYTE);
// Use '_Generic' selection, supported in GCC 4.9 (later), to choose proper creation function at compile time 
/*#define _NEW_1DARRAY(a, size, value) \
 		({\
 			a##_size = size;\
 			a = _Generic(a, BYTE*: create1DArray_BYTE , default: create1DArray)(value, a##_size);\
 		})*/
#define _NEW_2DARRAY(a, size, value) a##_size = size; a##_size_size = value##_size; a = create2DArray(value, a##_size, a##_size_size);
// Create an array of structure pointers
#define _NEW_1DARRAY_STRUCT(a, size, b, name) \
 		({\
 			a = malloc(size*sizeof(name*));\
 			for(int i=0;i<size;i++){\
 				a[i] = copy_##name(b);\
 			}\
 			a##_size = size;\
 		})
/***
 * Copy Macros
 *
 */
// Copy an array and pass it as function parameter
#define _COPY_1DARRAY_PARAM(a) copy1DArray(a, a##_size), a##_size
#define _COPY_2DARRAY_PARAM(a) copy2DArray(a, a##_size, a##_size_size), a##_size, a##_size_size
// Pass the copied BYTE array as function parameter 
#define _COPY_1DARRAY_BYTE_PARAM(a) copy1DArray_BYTE(a, a##_size), a##_size 
#define _COPY_STRUCT_PARAM(a, name) copy_##name(a)
#define _COPY_1DARRAY_STRUCT(a, b, name) \
		({\
			a = malloc(b##_size*sizeof(name*));\
			for(int i=0;i<b##_size;i++){\
 				a[i] = copy_##name(b[i]);\
 		  	}\
 			a##_size = b##_size;\
		})
#define _COPY_1DARRAY(a, b) a##_size = b##_size; a = copy1DArray(b, b##_size);
#define _COPY_1DARRAY_BYTE(a, b) a##_size = b##_size; a = copy1DArray_BYTE(b, b##_size);
#define _COPY_2DARRAY(a, b) a##_size = b##_size; a##_size_size = b##_size_size; a = copy2DArray(b, b##_size, b##_size_size);
/***
 * In-place Update Macros
 *
 */
// Update an array of integers or structure pointers
#define _UPDATE_1DARRAY(a, b) a##_size = b##_size; a = b;
#define _UPDATE_2DARRAY(a, b) a##_size = b##_size; a##_size_size = b##_size_size; a = b;
// Update the array size
#define _UPDATE_1DARRAY_SIZE(a, b) a##_size = b##_size;
#define _UPDATE_2DARRAY_SIZE(a, b) a##_size = b##_size; a##_size_size = b##_size_size;
// Concatenate struct and deallocation flag
#define _STRUCT_PARAM(a) a
// Concatenate 1D array variable, array size variable and deallocation flag
#define _1DARRAY_PARAM(a) a, a##_size
// Concatenate 2D array variable and array size variable
#define _2DARRAY_PARAM(a) a, a##_size, a##_size_size
/***
*  Print Macros
* 
*/
// Print an array of integers
#define _PRINT_1DARRAY(a) printf1DArray(a, a##_size);
// Print an array of Bytes using '%s' format
#define _PRINT_1DARRAY_BYTE(a) printf("%s", a);
// Print two dimensional arrays of integers
#define _PRINT_2DARRAY(a) printf2DArray(a, a##_size, a##_size_size);
// Print an array of structure pointer
#define _PRINT_1DARRAY_STRUCT(name, a) \
		({\
			for(int i=0;i<a##_size;i++){\
				printf_##name(a[i]);\
			}\
		})
/***
* Deallocation Macros
*
*/
// Release the structure pointers without checking de-allocated flag.
// The standard structure member function code to free an array of structure pointers
#define _FREE_1DARRAY_STRUCT(a, name) \
		({\
			for(int i=0;i<a##_size;i++){\
				free_##name(a[i]);\
				a[i] = NULL;\
			}\
			free(a);\
			a = NULL;\
		})

// Deallocate any previously allocated heap variable 
#define _DEALLOC(a) \
		({\
			if(a##_dealloc){\
				free(a);\
				a = NULL;\
				a##_dealloc=false;\
			}\
		})
// Deallocate an array of integer arrays
#define _DEALLOC_2DArray(a) \
		({\
			if(a##_dealloc){\
				free2DArray(a, a##_size);\
				a = NULL;\
				a##_dealloc = false;\
			}\
		})
// Deallocate a structure pointer
#define _DEALLOC_STRUCT(a, name) \
		({\
			if(a##_dealloc){\
				free_##name(a);\
				a = NULL;\
				a##_dealloc = false;\
			}\
		})
	
// Deallocate an array of structure pointers
#define _DEALLOC_1DARRAY_STRUCT(a, name) \
		({\
			if(a##_dealloc){\
				for(int i=0;i<a##_size;i++){\
					free_##name(a[i]);\
					a[i] = NULL;\
				}\
				free(a);\
				a = NULL;\
				a##_dealloc = false;\
		  	}\
		})
// Deallocate a member whose type is a structure pointer
// This macro does NOT check 'de-alloc' flag and is used at 'update' byte-code
#define _DEALLOC_MEMBER_STRUCT_UPDATECODE(a, b, name) \
		({\
			free_##name(b);\
			b = NULL;\
		})

// Deallocate a member whose type is an array of structure pointers
#define _DEALLOC_MEMBER_STRUCT(a, b, name) \
		({\
			if(a##_dealloc){\
				free_##name(b);\
				b = NULL;\
			}\
		})

/**
* Deallocation Macros for assignment 
*
*/
// Add deallocation flag for a given variable
#define _ADD_DEALLOC(a) a##_dealloc = true;
// Take out a variable's deallocation flag
#define _REMOVE_DEALLOC(a) a##_dealloc = false;
// Transfer one variable's deallocation flag to another
#define _TRANSFER_DEALLOC(a, b) a##_dealloc = b##_dealloc; b##_dealloc = false;

/***
*
* Deallocation Macros for function call 'a = func(b)'
*
*/
// '_CALLER_DEALLOC' macro makes a copy of actual argument and delegates caller
//  to free passing parameter 'a = func(copy(b), false)'
// This macro also print out debugging message on memory leaks, due to 
// the fact a and b_tmp (extra copy) are not aliased and the copy is not freed
// either at caller nor callee. 

// 'result' contains the analysis results of parameter 'b', e.g. 'true-true-false' 
// Mutable check = true, return check = true, live variable check = false
#define _CALLER_DEALLOC(a, b, result) \
		({\
			DEBUG_PRINT("_CALLER_DEALLOC macro on "str(#b) " ("str(result)")");\
			if(a != b##_tmp){\
				DEBUG_PRINT("Memory leaks at " str(#b)"_tmp");\
			}\
		})
// '_CALLEE_DEALLOC' macro makes a copy of actual argument and delegates callee
// to free the passing parameter 'a = func(copy(b), true)'
#define _CALLEE_DEALLOC(b, result) DEBUG_PRINT("_CALLEE_DEALLOC macro on "str(#b) " ("str(result)")");
// '_RETAIN_DEALLOC' macro does NOT make the copy of argument and delegates caller
// to free the passing parameter 'a = func(b, false)'
#define _RETAIN_DEALLOC(b, result) DEBUG_PRINT("_RETAIN_DEALLOC macro on "str(#b) " ("str(result)")");
// '_RESET_DEALLOC' macro does NOT make the copy of argument and delegates caller
// to reset the flag of actual argument 'a = func(b, false)'
#define _RESET_DEALLOC(b, result) \
		({\
			DEBUG_PRINT("_RESET_DEALLOC macro on "str(#b) " ("str(result)")");\
			b##_dealloc = false;\
		})
/*
* Other Macros 
*
*/
//Nullify the array variable
#define _NULLIFY(a) a = NULL;
// Converts command line arguments into integer arrays
#define _CONV_ARGS(a) a = convertArgsToIntArray(argc, args); a##_size = argc - 1;
// Parse a string into an integer
#define _STR_TO_INT(a, b) a = parseStringToInt(b);
// Slice an array 'b' into a new array 'a' 
#define _SLICE_ARRAY(a, b, start, end) a = slice(b, b##_size, start, end); a##_size = end - start;
// Compare two arrays of integers
#define _IFEQ_ARRAY(a, b, blklab) if(isArrayEqual(a, a##_size, b, b##_size)==1){goto blklab;}
