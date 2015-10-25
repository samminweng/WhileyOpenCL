#include <stdio.h>  
#include <stdlib.h>  
#include <string.h>  
#include <errno.h>  
#include <time.h>
#include <ctype.h>

// Define the NULL pointer
// #define NULL ( (void *) 0)

// Define the boolean values
#define false 0  
#define true 1

/**
 * Remove the security check about unsafe 'scanf' or 'sprintf' in VS tool
 * This definition allows the portability of C code across the platforms.
 */
#define _CRT_SECURE_NO_WARNINGS

//Built-in functions
long long* clone(long long *arr, long long size);
void indirect_printf(long long input);
//No overlapping is allowed: function name must be different.
void printf_array(long long* input, long long input_size);
void printf_s(long long* input, long long input_size);
void println_s(long long* input, long long input_size);
int isPowerof2(long long value);
long long* optimized_append(long long* op_1, long long* op_1_size, long long* op_2, long long* op_2_size, long long* ret_size);
int isArrayEqual(long long* arr1, long long arr1_size, long long* arr2, long long arr2_size);
long long* append(long long *arr1, long long arr1_size, long long* arr2, long long arr2_size);
long long* sublist(long long* arr, int start, int end);
long long** convertArgsToIntArray(int argc, char** args);
long long parseInteger(long long* arr);
long long* genArray(int value, int arr_size);
long long* slice(long long* arr, long long arr_size, long long start, long long end);
void freeDoublePointer(long long** ptr, long long size);

