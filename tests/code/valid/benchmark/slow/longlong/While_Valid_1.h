#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <time.h>
#define false 0
#define true 1
long long* clone(long long *arr, long long size);
long long* append(long long* op_1, long long op_1_size, long long* op_2, long long op_2_size);
char** toString(long long arr[], long long size);
void free_doublePtr(char** res, long long res_size);
void indirect_printf(char** res, long long _res_size);
long long* reverse(long long* _0, long long _0_size);
int main(int argc, char** argv);

