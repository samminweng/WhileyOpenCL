#include "Util.h"
typedef long long nat;
typedef struct{
	_DECL_2DARRAY_MEMBER(data);
	long long width;
	long long height;
} Matrix;
void printf_Matrix(Matrix* _matrix);
Matrix* copy_Matrix(Matrix* _matrix);
void free_Matrix(Matrix* _matrix);
Matrix* matrix(long long width, long long height, _DECL_2DARRAY_PARAM(data), _DECL_DEALLOC_PARAM(data));
Matrix* multiply(Matrix* A, _DECL_DEALLOC_PARAM(A), Matrix* B, _DECL_DEALLOC_PARAM(B));
void printMat(FILE* sys, Matrix* A, _DECL_DEALLOC_PARAM(A));
Matrix* init(long long height, long long width);
int main(int argc, char** args);
