#include "Util.h"
typedef long long nat;
typedef struct{
	long long** data;
	long long data_size;
	long long data_size_size;
	long long width;
	long long height;
} Matrix;
void printf_Matrix(Matrix _matrix);
Matrix copy_Matrix(Matrix _matrix);
void free_Matrix(Matrix _matrix);
Matrix matrix(nat width, nat height, long long** data, long long data_size, long long data_size_size);
Matrix multiply(Matrix A, Matrix B);
void printMat(FILE* sys, Matrix A);
Matrix genMatrix(nat height, nat width);
int main(int argc, char** args);
