#include "Util.h"
#define N 20
typedef long long nat;
typedef struct{
	_DECL_1DARRAY_MEMBER(data);
	long long width;
	long long height;
} Matrix;
void printf_Matrix(Matrix* _matrix);
Matrix* copy_Matrix(Matrix* _matrix);
void free_Matrix(Matrix* _matrix);
Matrix* matrix(long long width, long long height, _DECL_1DARRAY_PARAM(data), _DECL_DEALLOC_PARAM(data));
Matrix* init(long long width, long long height);
void print_mat(FILE* sys, Matrix* a, _DECL_DEALLOC_PARAM(a));
Matrix* mat_mult(Matrix* a, _DECL_DEALLOC_PARAM(a), Matrix* b, _DECL_DEALLOC_PARAM(b));
int main(int argc, char** args);
