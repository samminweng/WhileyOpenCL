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
Matrix* _matrix_(int64_t width, int64_t height, _DECL_2DARRAY_PARAM(data));
Matrix* _multiply_(Matrix* A, Matrix* B);
void _printMat_(FILE* sys, Matrix* A);
Matrix* _init_(int64_t height, int64_t width);
int main(int argc, char** args);
