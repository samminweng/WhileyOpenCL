#include <stdio.h>  
#include <stdlib.h>  
#include <string.h>  
#include <errno.h>  
#include <time.h>
#include <ctype.h>
#include <stdbool.h>
// Remove the security check about unsafe 'scanf' or 'sprintf' in VS tool
// This definition allows the portability of C code across the platforms.
#define _CRT_SECURE_NO_WARNINGS
/**
 * Built-in functions
*/
void printf1DArray(long long* input, long long input_size);
void indirect_printf(long long input);
//No overlapping is allowed: function name must be different.
void printf_s(long long* input, long long input_size);
void println_s(long long* input, long long input_size);
// Parser a string into an integer
long long* parseStringToInt(long long* arr);
// 1D Array Operator
long long** convertArgsToIntArray(int argc, char** args);
long long* copy(long long *arr, long long size);
long long* create1DArray(int value, int arr_size);
int isArrayEqual(long long* arr1, long long arr1_size, long long* arr2, long long arr2_size);
// 2D Array Operator
long long** copy2DArray(long long **arr, long long x, long long y);
long long** create2DArray(long long* arr,  long long x, long long y);
void free2DArray(long long** ptr, long long size);
void printf2DArray(long long** input, long long input_size, long long input_size_size);
// List Operator.
long long* slice(long long* arr, long long arr_size, long long start, long long end);
long long* append(long long *arr1, long long arr1_size, long long* arr2, long long arr2_size);
long long* sublist(long long* arr, int start, int end);
int isPowerof2(long long value);
long long* optimized_append(long long* op_1, long long* op_1_size, long long* op_2, long long* op_2_size, long long* ret_size);
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
 *
 * Declaration Macros
 *
 */
// Define 1D array of integers
#define _DECL_1DARRAY(a) long long* a = NULL; long long a##_size = 0;
// Define 2D array variable
#define _DECL_2DARRAY(a) long long** a = NULL; long long a##_size = 0; long long a##_size_size = 0;
// Define the deallocation flag
#define _DECL_DEALLOC(a) bool a##_dealloc = false;
#define _DECL_DEALLOC_PARAM(a) bool a##_dealloc
#define _DECL_1DARRAY_PARAM(a) long long* a, long long a##_size
#define _DECL_1DARRAY_MEMBER(a) long long* a; long long a##_size;
#define _DECL_2DARRAY_PARAM(a) long long** a, long long a##_size, long long a##_size_size
#define _DECL_2DARRAY_MEMBER(a) long long** a; long long a##_size; long long a##_size_size;
/***
 * Create (NEW) Macros
 *
 */
// Create an array of integers or integer arrays
#define _NEW_1DARRAY(a, size, value) a##_size = size; a = create1DArray(value, a##_size);
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
// Copy an array and pass it as function argument
#define _COPY_1DARRAY_PARAM(a) copy(a, a##_size), a##_size
#define _COPY_2DARRAY_PARAM(a) copy2DArray(a, a##_size, a##_size_size), a##_size, a##_size_size
#define _COPY_STRUCT_PARAM(a, name) copy_##name(a)
#define _COPY_1DARRAY_STRUCT(a, b, name) \
		({\
			a = malloc(b##_size*sizeof(name*));\
			for(int i=0;i<b##_size;i++){\
 				a[i] = copy_##name(b[i]);\
 		  	}\
 			a##_size = b##_size;\
		})
#define _COPY_1DARRAY(a, b) a##_size = b##_size; a = copy(b, b##_size);
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
#define _DEALLOC_MEMBER_STRUCT(a, b, name) \
		({\
			free_##name(b);\
			b = NULL;\
		})
/*
#define _DEALLOC_MEMBER_STRUCT(a, b, name) \
		({\
			if(a##_dealloc){\
				free_##name(b);\
				b = NULL;\
			}\
		})

// Currently this marco is not used yet.
// Deallocate a member whose type is an array of structure pointers
#define _DEALLOC_MEMBER_1DARRAY_STRUCT(a, b, name) \
		({\
			if(a##_dealloc){\
				for(int i=0;i<b##_size;i++){\
					free_##name(b[i]);\
					b[i] = NULL;\
				}\
				free(b);\
				b = NULL;\
			}\
		})
*/

/**
* Deallocation Flag Macros used in assignment 
*
*/
// Add deallocation flag for a given variable
#define _ADD_DEALLOC(a) a##_dealloc = true;
// Take out a variable's deallocation flag
#define _REMOVE_DEALLOC(a) a##_dealloc = false;
// Transfer one variable's deallocation flag to another
#define _TRANSFER_DEALLOC(a, b) a##_dealloc = b##_dealloc; b##_dealloc = false;
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