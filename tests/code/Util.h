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
// null|int
// This code snippet aims to deal with union type in C
union UNION {
	int integer;
	char *string;
	float real;
	void *null;
};
/**
 * Built-in functions
*/
void indirect_printf(long long input);
//No overlapping is allowed: function name must be different.
void printf_s(long long* input, long long input_size);
void println_s(long long* input, long long input_size);
// Parser a string into an integer
union UNION parseInteger(long long* arr);
// 1D Array Operator
long long** convertArgsToIntArray(int argc, char** args);
long long* copy(long long *arr, long long size);
long long* gen1DArray(int value, int arr_size);
void printf1Darray(long long* input, long long input_size);
int isArrayEqual(long long* arr1, long long arr1_size, long long* arr2, long long arr2_size);
// 2D Array Operator
long long** copy2DArray(long long **arr, long long x, long long y);
long long** gen2DArray(long long* arr,  long long x, long long y);
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
// Define 1D array variable
#define _DECL_1DARRAY(a) long long* a = NULL; long long a##_size = 0;
// Define 2D array variable
#define _DECL_2DARRAY(a) long long** a = NULL; long long a##_size = 0; long long a##_size_size = 0;
// Define the ownership variable
#define _DECL_OWNERSHIP(a) bool a##_has_ownership = false;
// Concatenate array variable and array size variable
#define _DECL_1DARRAY_PARAM(a) long long* a, long long a##_size
#define _1DARRAY_PARAM(a) a, a##_size
// Concatenate 2D array variable and array size variable
#define _DECL_2DARRAY_PARAM(a) long long* a, long long a##_size, long long a##_size_size
#define _2DARRAY_PARAM(a) a, a##_size, a##_size_size
//Nullify the array variable
#define _NULLIFY(a){\
	a = NULL;\
}
// Free the array variable and ownership
#define _FREE(a){\
	if(a##_has_ownership){free(a);a##_has_ownership=false;}\
}
// Free the 2D array variable and ownership
#define _FREE2DArray(a){\
	if(a##_has_ownership){free2DArray(a, a##_size); a##_has_ownership = false;}\
}
// Print out array
#define _1DARRAY_PRINT(a){\
	printf1DArray(a, a##_size);\
}
// Print out array
#define _2DARRAY_PRINT(a){\
	printf2DArray(a, a##_size, a##_size_size);\
}
// Copy an array variable to another using copy
#define _1DARRAY_COPY(a, b){ \
	a##_size = b##_size; \
	a = copy(b, b##_size);\
}
// Assign an array variable to another using pointer
#define _1DARRAY_UPDATE(a, b){ \
	a##_size = b##_size; \
	a = b;\
}
// Copy an array variable to another using copy
#define _2DARRAY_COPY(a, b){ \
	a##_size = b##_size; \
	a##_size_size = b##_size_size; \
	a = copy2DArray(b, b##_size, b##_size_size);\
}
// Assign an array variable to another using pointer
#define _2DARRAY_UPDATE(a, b){ \
	a##_size = b##_size; \
	a##_size_size = b##_size_size; \
	a = b;\
}
// Check if two arrays are the same
#define _IFEQ_ARRAY(a, b, blklab){\
	if(isArrayEqual(a, a##_size, b, b##_size)==1){goto blklab;}\
}
// Add ownership for a given variable
#define _ADD_OWNERSHIP(a){\
	a##_has_ownership = true;\
}
// Transfer an array variable's ownership to another
#define _REMOVE_OWNERSHIP(a){ \
	a##_has_ownership = false;\
}
// Create a new array
#define _NEW_ARRAY(a, length){\
	a##_size = length;\
	a = malloc(length*sizeof(long long));\
}
// Generate an 1D array with given array size and initial value
#define _GEN_1DARRAY(a, size, value){\
	a##_size = size;\
	a = gen1DArray(value, a##_size);\
}
// Generate a 2D array with given array size and initialize it with an 1D array
#define _GEN_2DARRAY(a, size, value){\
	a##_size = size;\
	a##_size_size = value##_size;\
	a = gen2DArray(value, a##_size, a##_size_size);\
}
// Free a structure
#define _FREE_STRUCT(a, name){\
	if(a##_has_ownership){free_##name(a); a##_has_ownership = false;}\
}
