#include "Util.h"
typedef long long nat;
typedef struct{
	long long** data;
	long long data_size;
	long long width;
	long long height;
} Matrix;
void printf_Matrix(Matrix s);
Matrix matrix(nat _width, nat _height, long long** _data, long long _data_size);
Matrix multiply(Matrix _A, Matrix _B);
void printMat(FILE* _sys, Matrix _A);
Matrix genMatrix(nat _height, nat _width);
int main(int argc, char** args);


void printf_Matrix(Matrix s){
	printf("{");
	printf(" data:");
	printf_array(s.data, s.data_size);
	printf(" width:");
	printf("%d", s.width);
	printf(" height:");
	printf("%d", s.height);
	printf("}");
}

Matrix clone_Matrix(Matrix m){
	Matrix newMatrix;
	newMatrix.height = m.height;
	newMatrix.width = m.width;
	newMatrix.data_size = m.data_size;
	newMatrix.data = clone2DArray(m.data, m.data_size);
	return newMatrix;
}
