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
Matrix matrix(nat width, nat height, long long** data, bool data_has_ownership, long long data_size, long long data_size_size);
Matrix multiply(Matrix A, bool A_has_ownership, Matrix B, bool B_has_ownership);
void printMat(FILE* sys, Matrix A, bool A_has_ownership);
Matrix genMatrix(nat height, nat width);
int main(int argc, char** args);
