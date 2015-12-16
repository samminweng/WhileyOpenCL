#include "Util.h"
typedef long long nat;
typedef struct{
	long long** data;
	long long data_size;
	long long data_size_size;
	long long width;
	long long height;
} Matrix;
Matrix create_Matrix();
void printf_Matrix(Matrix _matrix);
Matrix copy_Matrix(Matrix _matrix);
void free_Matrix(Matrix _matrix);
Matrix matrix(long long width, long long height, long long** data, bool data_has_ownership, long long data_size, long long data_size_size);
Matrix multiply(Matrix A, bool A_has_ownership, Matrix B, bool B_has_ownership);
void* printMat(FILE* sys, Matrix A, bool A_has_ownership);
Matrix genMatrix(long long height, long long width);
int main(int argc, char** args);
