#include <stdio.h>  
#include <stdlib.h>  
#include <string.h>  
#include <errno.h>  
#include <time.h>
#include <ctype.h>
#include <stdbool.h>

/**
 * Remove the security check about unsafe 'scanf' or 'sprintf' in VS tool
 * This definition allows the portability of C code across the platforms.
 */
#define _CRT_SECURE_NO_WARNINGS
//Nullify the array variable
#define _NULLIFY(a){\
		if(a##_has_ownership){free(a);a##_has_ownership=false;}\
}

// Assign and transfer an array variable to another
#define _ASSIGN_TRANSFER(a, b){ \
					  a##_size = b##_size; \
					  _NULLIFY(a);\
					  a = b;\
					  b##_has_ownership = false;\
					  a##_has_ownership = true;\
					}


// null|int
// This code snippet aims to deal with union type in C
union UNION {
	int integer;
	char *string;
	float real;
	void *null;
};


//Built-in functions

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
// Free Operator


