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
Matrix matrix(long long width, long long height, long long** data, long long data_size, long long data_size_size);
Matrix multiply(Matrix A, Matrix B);
void* printMat(FILE* sys, Matrix A);
Matrix genMatrix(long long height, long long width);
int main(int argc, char** args);
