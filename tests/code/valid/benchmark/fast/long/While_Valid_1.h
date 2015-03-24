#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <time.h>
#define false 0
#define true 1
long* clone(long *arr, long size);
long* append(long* op_1, long op_1_size, long* op_2, long op_2_size);
char** toString(long arr[], long size);
void free_doublePtr(char** res, int res_size);
void indirect_prlongf(char** res, int _res_size);
long* reverse(long* _0, long _0_size);
long main(long argc, char** argv);

