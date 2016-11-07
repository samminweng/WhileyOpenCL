#include "Util.h"
#define N 20
typedef int64_t nat;
typedef struct{
	_DECL_1DARRAY_MEMBER(data);
	int64_t width;
	int64_t height;
} Matrix;
void printf_Matrix(Matrix* _matrix);
Matrix* copy_Matrix(Matrix* _matrix);
void free_Matrix(Matrix* _matrix);
Matrix* matrix(int64_t width, int64_t height, _DECL_1DARRAY_PARAM(data));
Matrix* init(int64_t width, int64_t height);
void print_mat(FILE* sys, Matrix* a);
Matrix* mat_mult(Matrix* a, Matrix* b);
int main(int argc, char** args);
