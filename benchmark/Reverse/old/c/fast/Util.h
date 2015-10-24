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
//void toString(long long arr[], long long size, char** res);
long long* append(long long* op_1, long long* op_1_size, long long* op_2, long long* op_2_size, long long* ret_size);
void indirect_printf(long long input);
//I C, there is no overlapping so that the function name must be different.
void indirect_printf_array(long long* input, long long input_size);
int isPowerof2(long long value);
long long* optimized_append(long long* op_1, long long* op_1_size, long long* op_2, long long* op_2_size, long long* ret_size);
void readStringAsInteger(char* str, long long* input);
void getStartingTime();
void getEndingTime();