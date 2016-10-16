#include "Util.h"
typedef int64_t nat;
typedef struct{
	_DECL_2DARRAY_MEMBER(data);
	int64_t width;
	int64_t height;
} Matrix;
void printf_Matrix(Matrix* _matrix);
Matrix* copy_Matrix(Matrix* _matrix);
void free_Matrix(Matrix* _matrix);
Matrix* matrix(int64_t width, int64_t height, _DECL_2DARRAY_PARAM(data));
Matrix* multiply(Matrix* A, Matrix* B);
void printMat(FILE* sys, Matrix* A);
Matrix* init(int64_t height, int64_t width);
int main(int argc, char** args);
