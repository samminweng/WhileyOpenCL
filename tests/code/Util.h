//Remove the security check about unsafe 'scanf' or 'sprintf' in VS tool
//This definition allows the portability of C code across the platforms.
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>  
#include <stdlib.h>  
#include <string.h>  
#include <errno.h>  
#include <time.h>
#define false 0  
#define true 1
long long* clone(long long *arr, long long size);
void indirect_printf(long long input);
//No overlapping is allowed: function name must be different.
void indirect_printf_array(long long* input, long long input_size);
int isPowerof2(long long value);
long long* optimized_append(long long* op_1, long long* op_1_size, long long* op_2, long long* op_2_size, long long* ret_size);
void readStringAsInteger(char* str, long long* input);
void getStartingTime();
void getEndingTime();
int isArrayEqual(long long* arr1, long long arr1_size, long long* arr2, long long arr2_size);
long long* append(long long *arr1, long long arr1_size, long long* arr2, long long arr2_size);
long long* sublist(long long* arr, int start, int end);
