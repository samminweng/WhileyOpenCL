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
Matrix* _matrix_(int64_t width, int64_t height, _DECL_1DARRAY_PARAM(data), _DECL_DEALLOC_PARAM(data));
Matrix* _init_(int64_t width, int64_t height);
void _print_mat_(FILE* sys, Matrix* a, _DECL_DEALLOC_PARAM(a));
Matrix* _mat_mult_(Matrix* a, _DECL_DEALLOC_PARAM(a), Matrix* b, _DECL_DEALLOC_PARAM(b));
int main(int argc, char** args);
