#include "Util.h"
#include "WyRT.h"
typedef int64_t nat;
typedef struct{
	_DECL_1DARRAY_MEMBER(data);
	int64_t width;
	int64_t height;
} Matrix;
void printf_Matrix(Matrix* _matrix);
Matrix* copy_Matrix(Matrix* _matrix);
void free_Matrix(Matrix* _matrix);
Matrix* _matrix_(int64_t width, int64_t height, _DECL_1DARRAY_PARAM(data));
Matrix* _init_(int64_t width, int64_t height);
void _print_mat_(FILE* sys, Matrix* a);
Matrix* _mat_mult_(Matrix* a, Matrix* b);
int main(int argc, char** args);
