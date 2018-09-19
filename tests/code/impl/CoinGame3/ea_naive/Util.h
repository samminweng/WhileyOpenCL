#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <time.h>
#include <ctype.h>
#include <stdbool.h>
// http://en.cppreference.com/w/c/types/integer
#include <stdint.h> // use extact-width types, i.e. 'int16_t' 'int32_t' 'int64_t'
#include <inttypes.h> // use PRId64 macro to print 'int16_t' integer
// Good reference (https://en.wikibooks.org/wiki/C_Programming/Preprocessor)
// Remove the security check about unsafe 'scanf' or 'sprintf' in VS tool
// This definition allows the portability of C code across the platforms.
#define _CRT_SECURE_NO_WARNINGS
// Specify the maximal amounts of chars that are printed out using 'printf' function
#define MAX_LENGTH 1024
// Specify the maximal number of chars that a line in PBM should be read
// i.e. 16384 bytes, to avoid using too many memory space and stop the sobel edge
#define MAX_LINE_LENGTH 1024*16

// Define BYTE type due to missing byte primitive type in C languate
typedef uint8_t BYTE;


/**
*Built-in operation for 1D array of byte and integers
*
***/
//Create an array of int64_t integers
int64_t* create1DArray_int64_t(int64_t value, size_t arr_size);
BYTE* create1DArray_BYTE(BYTE value, size_t arr_size);
// Copy an array to another array
int64_t* copy1DArray_int64_t(int64_t *arr, size_t size);
BYTE* copy1DArray_BYTE(BYTE *arr, size_t size);
// Print out an array
void printf1DArray_int64_t(int64_t* input, size_t input_size);
void printf1DArray_BYTE(BYTE* input, size_t input_size);
/**
*Built-in operation for 2D array of byte and integers
*
***/
// Create an array of integer arrays
int64_t** create2DArray_int64_t_empty(size_t n, size_t m);
int64_t** create2DArray_int64_t(int64_t* arr, size_t n, size_t m);
int64_t** copy2DArray_int64_t(int64_t **arr, size_t x, size_t y);
// Free an array of arrays
void free2DArray_int64_t(int64_t** ptr, size_t size);
// Print out 2D array
void printf2DArray_int64_t(int64_t** input, size_t input_size, size_t input_size_size);
// Compare two arrays
bool isArrayEqual_int64_t(int64_t* arr1, size_t arr1_size, int64_t* arr2, size_t arr2_size);
bool isArrayEqual_BYTE(BYTE* arr1, size_t arr1_size, BYTE* arr2, size_t arr2_size);
/**
 * Other built-in functions
 */
void indirect_printf(int64_t input);
void printf_s(int64_t* input, size_t input_size);
void println_s(int64_t* input, size_t input_size);
// Parse a string into an integer
int64_t* parseStringToInt(int64_t* arr);
// 1D Array
int64_t** convertArgsToIntArray(int argc, char** args, size_t *arr_size, size_t *arr_size_size);
// ArrayList Operators
int64_t* slice(int64_t* arr, size_t arr_size, int start, int end);
/**
 * Macro Section
**/
// Define 'max' and 'min' macro
// Compute max and min without branches (http://graphics.stanford.edu/~seander/bithacks.html#IntegerMinOrMax)
#ifndef max
//#define max(a,b) \
		({ __typeof__ (a) _a = (a); \
		   __typeof__ (b) _b = (b); \
		   _a > _b ? _a : _b; })
#define max(a, b) a ^ ((a ^ b) & -(a < b))
#endif
#ifndef min
#define min(a, b) b ^ ((a ^ b) & -(a < b))
//#define min(a,b) \
		({ __typeof__ (a) _a = (a); \
		   __typeof__ (b) _b = (b); \
		   _a < _b ? _a : _b; })
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
#define DEBUG_PRINT(msg) if(DEBUG){fputs("\tDEBUG: " msg " (LINE:" num2str(__LINE__) " FILE: " __FILE__ ")\n", stdout);}
// CHeck if e(a) != e(b) and not e(a_dealloc)
#define DEBUG_CHECK_ASUMPTION(a, b) \
({\
	if(a != b || a##_dealloc == false){\
		fputs("The assumption holds", stdout);\
	}else{\
		fputs("Error! The assumption fails. ", stdout);\
	}\
})
#else
#define DEBUG_PRINT(msg) // Do nothing
#define DEBUG_CHECK_ASUMPTION(a, b) // Do nothing
#endif
/***
 *
 * Declaration Macros
 *
 */
// Declare 1D array of integers or bytes
#define _DECL_1DARRAY(a) int64_t* a = NULL; size_t a##_size = 0;
#define _DECL_1DARRAY_BYTE(a) BYTE* a = NULL; size_t a##_size = 0;
// Declare 2D array variable
#define _DECL_2DARRAY(a) int64_t** a = NULL; size_t a##_size = 0; size_t a##_size_size = 0;
// Declare the deallocation flag
#define _DECL_DEALLOC(a) bool a##_dealloc = false;
#define _DECL_DEALLOC_PARAM(a) bool a##_dealloc
// Declare the passing parameter
// 'restrict' limits pointer aliasing (https://en.wikipedia.org/wiki/Restrict)
#define _DECL_1DARRAY_PARAM(a) int64_t* a, size_t a##_size
#define _DECL_2DARRAY_PARAM(a) int64_t** a, size_t a##_size, size_t a##_size_size
// Declare a call-by-reference parameter for output array size
#define _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE size_t* _size_call_by_ref
#define _DECL_2DARRAYSIZE_PARAM_CALLBYREFERENCE size_t* _size_call_by_ref, size_t* _size_size_call_by_ref
// Declare a structure member
#define _DECL_1DARRAY_MEMBER(a) int64_t* a; size_t a##_size;
#define _DECL_1DARRAY_MEMBER_BYTE(a) BYTE* a; size_t a##_size;
#define _DECL_2DARRAY_MEMBER(a) int64_t** a; size_t a##_size; size_t a##_size_size;
/*
* Passing parameter Macros
*
*/
// Pass call-by-reference array size
#define _1DARRAYSIZE_PARAM_CALLBYREFERENCE(a) &a##_size
#define _2DARRAYSIZE_PARAM_CALLBYREFERENCE(a) &a##_size, &a##_size_size
/***
 * Create (NEW) Macros
 *
 */
// Clone an integer pointers
#define _NEW_INTEGER_POINTER(a, b) \
 		({\
			a = malloc(sizeof(int64_t));\
			*a = *b;\
		})
// Create an array of integers or integer arrays
#define _NEW_1DARRAY_int64_t(a, size, value) a##_size = size; a = create1DArray_int64_t(value, a##_size);
#define _NEW_1DARRAY(a, size, value, type)\
         ({\
            a##_size = size;\
            a = (type*)malloc(a##_size*sizeof(type));\
         	if(a == NULL){\
         		fputs("fail to allocate the memory at _NEW_1DARRAY function in Util.h\n", stderr);\
         		exit(-2);\
         	}\
         	for(size_t i=0;i<a##_size;i++){\
         		a[i] = value;\
         	}\
        })
#define _NEW_1DARRAY_BYTE(a, size, value) a##_size = size; a = create1DArray_BYTE(value, a##_size);
// Create an array of structure pointers
#define _NEW_1DARRAY_STRUCT(a, size, b, name) \
 		({\
 			a = malloc(size*sizeof(name*));\
 			for(size_t i=0;i<size;i++){\
 				a[i] = copy_##name(b);\
 			}\
 			a##_size = size;\
 		})
// Create 2D array and initialize each subarray with the value
#define _NEW_2DARRAY_int64_t(a, size, value) a##_size = size; a##_size_size = value##_size; \
											 a = create2DArray_int64_t(value, a##_size, a##_size_size);
// Create an empty 2D array without initial values
#define _NEW_2DARRAY_int64_t_EMPTY(a, size, size_size) a##_size = size; a##_size_size = size_size; \
													   a = create2DArray_int64_t_empty(size, size_size);
/***
 * Copy Macros
 *
 */
// Pass the copied structure (void* a_tmp) as a function parameter
#define _COPY_STRUCT_PARAM(a, tmp, name) tmp = copy_##name(a)
// Copied 'a' to 'tmp'
#define _COPY_1DARRAY_PARAM(a, tmp, type)\
        ({\
            tmp = (type*) malloc(a##_size * sizeof(type));\
        	if (a == NULL) {\
        		fputs("fail to malloc at COPY_1DARRAY_PARAM macro in Util.h\n", stderr);\
        		exit(-2);\
        	}\
        	memcpy(tmp, a, a##_size * sizeof(type));\
        })
#define _COPY_1DARRAY_PARAM_BYTE(a, tmp) tmp = copy1DArray_BYTE(a, a##_size);
#define _COPY_2DARRAY_PARAM_int64_t(a, tmp) tmp = copy2DArray_int64_t(a, a##_size, a##_size_size), a##_size, a##_size_size

// Pass the copied array of structures as a function parameter
#define _COPY_1DARRAY_PARAM_STRUCT(a, tmp, name) tmp = copy_array_##name(a, a##_size);
// Assign the copied array to a variable
#define _COPY_STRUCT(a, b, name) a = copy_##name(b);
#define _COPY_1DARRAY_int64_t(a, b) a##_size = b##_size; a = copy1DArray_int64_t(b, b##_size);
#define _COPY_1DARRAY(a, b, type) \
        ({\
            a##_size = b##_size;\
            a = (type*) malloc(a##_size * sizeof(type));\
        	if (a == NULL) {\
        		fputs("fail to malloc at copy1DArray macro in Util.h\n", stderr);\
        		exit(-2);\
        	}\
        	memcpy(a, b, a##_size * sizeof(type));\
        })
#define _COPY_1DARRAY_BYTE(a, b) a##_size = b##_size; a = copy1DArray_BYTE(b, b##_size);
#define _COPY_2DARRAY_int64_t(a, b) a##_size = b##_size; a##_size_size = b##_size_size; a = copy2DArray_int64_t(b, b##_size, b##_size_size);
#define _COPY_1DARRAY_STRUCT(a, b, name) \
		({\
			a = malloc(b##_size*sizeof(name*));\
			for(size_t i=0;i<b##_size;i++){\
 				a[i] = copy_##name(b[i]);\
 		  	}\
 			a##_size = b##_size;\
		})
/***
 * In-place Update Macros
 *
 */
// Update an array of integers or structure pointers along with array size
#define _UPDATE_1DARRAY(a, b) a##_size = b##_size; a = b;
#define _UPDATE_2DARRAY(a, b) a##_size = b##_size; a##_size_size = b##_size_size; a = b;
// Update the call-by-reference passing parameter with the size variable of 1D array
#define _UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a) *_size_call_by_ref = a##_size
// Update the call-by-reference passing parameter with the size variable of 2D array
#define _UPDATE_2DARRAYSZIE_PARAM_CALLBYREFERENCE(a) *_size_call_by_ref = a##_size; *_size_size_call_by_ref = a##_size_size;
/***
*  Print Macros
*
*/
// Print an array of integers or bytes
#define _PRINT_1DARRAY_int64_t(a) printf1DArray_int64_t(a, a##_size);
#define _PRINT_1DARRAY_BYTE(a) printf1DArray_BYTE(a, a##_size);
// Print two dimensional arrays of integers
#define _PRINT_2DARRAY_int64_t(a) printf2DArray_int64_t(a, a##_size, a##_size_size);
// Print an array of structure pointer
#define _PRINT_1DARRAY_STRUCT(name, a) \
		({\
			for(size_t i=0;i<a##_size;i++){\
				printf_##name(a[i]);\
			}\
		})
// Print the first MAX_LENGTH chars and last 10 chars
#define _PRINT_STR(a) \
    ({\
        for(size_t i=0; i < a##_size; i++){\
           if(i >= 1024){break;}\
           printf("%c", a[i]);\
        }\
        if (a##_size >= 1024) {\
            printf(" ... ");\
            for(size_t i=a##_size-10; i<a##_size; i++){\
                printf("%c", a[i]);\
            }\
        }\
    })
// Print the first MAX_LENGTH chars and last 10 chars
#define _PRINTLN_STR(a) \
    ({\
        for(size_t i=0; i < a##_size; i++){\
           if(i >= 1024){break;}\
           printf("%c", a[i]);\
        }\
        if (a##_size >= 1024) {\
            printf(" ... ");\
            for(size_t i=a##_size-10; i<a##_size; i++){\
                printf("%c", a[i]);\
            }\
        }\
        printf("\n");\
    })
/***
* Deallocation Macros
*
*/
// Release the structure pointers without checking de-allocated flag.
// The standard structure member function code to free an array of structure pointers
#define _FREE_1DARRAY_STRUCT(a, name) \
		({\
			for(size_t i=0;i<a##_size;i++){\
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
// Deallocate an array of an array of integers
#define _DEALLOC_2DARRAY_int64_t(a) \
		({\
			if(a##_dealloc){\
				free2DArray_int64_t(a, a##_size);\
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
// New Array generator 
#define _NEW1DARRAY_DEALLOC(a, value, size) \
		({\
			DEBUG_PRINT("_NEW1DARRAY_DEALLOC macro on  ( "str(a)" )");\
			a##_dealloc = true;\
		})
// Add deallocation flag for a given variable
#define _ADD_DEALLOC(a) \
        ({\
		    DEBUG_PRINT("_ADD_DEALLOC macro on  ( "str(a)" )");\
			a##_dealloc = true;\
		})
// Take out a variable's deallocation flag
#define _REMOVE_DEALLOC(a) \
        ({\
			DEBUG_PRINT("_REMOVE_DEALLOC macro on  ( "str(a)" )");\
			a##_dealloc = false;\
		})
// Transfer one variable's deallocation flag to another
#define _TRANSFER_DEALLOC(a, b, dimension)  \
        ({\
			DEBUG_PRINT("_TRANSFER_DEALLOC macro on  ( "str(a)" and "str(b)" )");\
			DEBUG_CHECK_ASUMPTION(a, b);\
			_DEALLOC(a);\
			_UPDATE_##dimension##DARRAY(a, b);\
			a##_dealloc = b##_dealloc;\
			b##_dealloc = false;\
		})
// Transfer structure variable's deallocation flag to another
#define _TRANSFER_DEALLOC_STRUCT(a, b) \
        ({\
			DEBUG_PRINT("_TRANSFER_DEALLOC_STRUCT macro on  ( "str(a)" and "str(b)" )");\
			a##_dealloc = b##_dealloc;\
			b##_dealloc = false;\
		})
/***
*
* Deallocation Macros for function call 'ret = func(param)'
*
*/
// '_RETAIN_DEALLOC' macro does NOT make the copy of argument and delegates caller
// to free the passing parameter 'ret = func(param, false)'
#define _RETAIN_DEALLOC(param, checks, func_name)  \
		({\
            DEBUG_PRINT("_RETAIN_DEALLOC macro on  ( "str(checks)" "str(#param) " "str(func_name)" )");\
        })
#define _RETAIN_DEALLOC_POST(ret, param)  \
		({\
            ret##_dealloc = true; \
        })
// 'RESET_DEALLOC' macro does not copy 'param' and delegate calle to free 'param', e.g. 'ret = func(param, false)'
#define _RESET_DEALLOC(param, checks, func_name) \
		({\
		    DEBUG_PRINT("_RESET_DEALLOC macro on  ( "str(checks)" "str(#param)" "str(func_name)" )");\
        })
#define _RESET_DEALLOC_POST(ret, param) \
		({\
            if (ret != param) {\
                ret##_dealloc = true;\
            }else{\
                ret##_dealloc = param##_dealloc;\
                param##_dealloc = false;\
            }\
        })
// '_CALLER_DEALLOC' macro makes a copy of actual argument and delegates caller
//  to free passing parameter 'ret = func(tmp=copy(param), false)'
// This macro also print out debugging message on memory leaks, due to
// the fact a and tmp (extra copy) are not aliased and the copy is not freed
// either at caller nor callee.
// 'checks' contains the analysis results of parameter 'param', e.g. 'true-true-false'
// Mutable check = true, return check = true, live variable check = false
#define _CALLER_DEALLOC(tmp, checks, func_name) \
		({\
			DEBUG_PRINT("_CALLER_DEALLOC macro on ( "str(checks)" "str(#tmp)" "str(func_name)" )");\
            DEBUG_PRINT("Potential memory leaks at ( "str(checks)" "str(#tmp)" "str(func_name)" )");\
        })
#define _CALLER_DEALLOC_POST(ret, tmp) \
		({\
			if(ret != tmp){\
				free(tmp);\
				tmp = NULL;\
			}\
            ret##_dealloc = true;\
		})
// Free the extra copy of the structure using built-in structure free function
#define _CALLER_DEALLOC_STRUCT_POST(ret, tmp, name) \
		({\
			if(ret != tmp){\
				free_##name(tmp);\
				tmp = NULL;\
			}\
            ret##_dealloc = true;\
		})
// '_CALLEE_DEALLOC' macro makes a copy of actual parameter and delegates callee
// to free the passing parameter 'ret = func(tmp=copy(param), true)'
#define _CALLEE_DEALLOC(tmp, checks, func_name)  \
		({\
            DEBUG_PRINT("_CALLEE_DEALLOC macro on ( "str(checks)" "str(#tmp) " "str(func_name)" )");\
        })
#define _CALLEE_DEALLOC_POST(ret, tmp)  \
	   ({\
            ret##_dealloc = true; \
        })
// '_SUBSTRUCTURE_DEALLOC' macro applies the subtructure parameter
#define _SUBSTRUCTURE_DEALLOC(param, checks, func_name) \
        ({\
            DEBUG_PRINT("_SUBSTRUCTURE_DEALLOC macro on  ( "str(checks)" "str(#param) " "str(func_name)" )");\
        })
/***
*
* Overflow Checking Macros for arithmetic operations
* https://gcc.gnu.org/onlinedocs/gcc/Integer-Overflow-Builtins.html
*/
// Detect the addition overflow 'c = a + b'
#define _DETECT_INT_ADD_OVERFLOW(a, b, c)\
	({\
		if(__builtin_add_overflow(a, b, &c)){\
			fputs("Detected ADD Overflow on "str(c) " = "str(a) " + " str(b)"\n", stderr);\
			exit(-2);\
		}\
	})
// Detect the subtraction overflow
#define _DETECT_INT_SUB_OVERFLOW(a, b, c)\
	({\
		if(__builtin_sub_overflow(a, b, &c)){\
			fputs("Detected SUB Overflow on "str(c) " = "str(a) " - " str(b)"\n", stderr);\
			exit(-2);\
		}\
	})
// Detect the multiplication overflow
#define _DETECT_INT_MUL_OVERFLOW(a, b, c)\
	({\
		if(__builtin_mul_overflow(a, b, &c)){\
			fputs("Detected MUL Overflow on "str(c) " = "str(a) " * " str(b)"\n", stderr);\
			exit(-2);\
		}\
	})
/*
* Other Macros
*
*/
//Nullify the array variable
#define _NULLIFY(a) a = NULL;
// Converts command line arguments into integer arrays
#define _CONV_ARGS(a) a = convertArgsToIntArray(argc, args, &a##_size, &a##_size_size);
// Free ARGS
#define _FREE_ARGS(a) \
    ({\
        for(size_t i=0;i<a##_size;i++){\
            free(a[i]);\
            a[i] = NULL;\
        }\
        free(a);\
        a = NULL;\
    })
// Parse a string into an integer
#define _STR_TO_INT(a, b) a = parseStringToInt(b);
// Slice an array 'b' into a new array 'a'
#define _SLICE_ARRAY(a, b, start, end) a = slice(b, b##_size, start, end); a##_size = end - start;
// Compare two arrays of integers
#define _IFEQ_ARRAY_int64_t(a, b, blklab) if(isArrayEqual_int64_t(a, a##_size, b, b##_size)){goto blklab;}
// Compare two arrays of BYTE
#define _IFEQ_ARRAY_BYTE(a, b, blklab) if(isArrayEqual_BYTE(a, a##_size, b, b##_size)==1){goto blklab;}
