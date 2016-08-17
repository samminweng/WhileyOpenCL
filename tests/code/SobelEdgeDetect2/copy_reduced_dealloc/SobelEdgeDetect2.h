#include "Util.h"
#define WHITE 255
#define BLACK 0
typedef struct{
	_DECL_1DARRAY_MEMBER(pixels);
	long long width;
	long long height;
} Matrix;
void printf_Matrix(Matrix* _matrix);
Matrix* copy_Matrix(Matrix* _matrix);
void free_Matrix(Matrix* _matrix);
Matrix* matrix(long long width, long long height, _DECL_1DARRAY_PARAM(pixels), _DECL_DEALLOC_PARAM(pixels));
long long wrap(long long pos, long long size);
long long convolution(Matrix* a, _DECL_DEALLOC_PARAM(a), long long xCenter, long long yCenter, _DECL_1DARRAY_PARAM(filter), _DECL_DEALLOC_PARAM(filter));
void print_mat(FILE* sys, Matrix* a, _DECL_DEALLOC_PARAM(a));
int main(int argc, char** args);
