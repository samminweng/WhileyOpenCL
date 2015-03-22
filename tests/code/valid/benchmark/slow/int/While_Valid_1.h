#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <time.h>
#define false 0
#define true 1
int* clone(int *arr, int size);
int* append(int* op_1, int op_1_size, int* op_2, int op_2_size);
char** toString(int arr[], int size);
void free_doublePtr(char** res, int res_size);
void indirect_printf(char** res, int _res_size);
int* reverse(int* _0, int _0_size);
int main(int argc, char** argv);

