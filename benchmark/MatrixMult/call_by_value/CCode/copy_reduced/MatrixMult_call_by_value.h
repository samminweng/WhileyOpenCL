#include "Util.h"
typedef long long nat;
typedef struct{
	long long** data;
	long long data_size;
	long long data_size_size;
	long long width;
	long long height;
} Matrix;
Matrix clone_Matrix(Matrix m);
Matrix matrix(nat _width, nat _height, long long** _data, long long _data_size, long long _data_size_size);
Matrix multiply(Matrix A, Matrix B);
void printMat(FILE* sys, Matrix A);
Matrix genMatrix(nat _height, nat _width);
int main(int argc, char** args);


