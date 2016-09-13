#include "Util.h"
#define WHITE 255
#define BLACK 0
long long convolution(_DECL_1DARRAY_PARAM(pixels), long long width, long long height, long long xCenter, long long yCenter, _DECL_1DARRAY_PARAM(filter));
long long* sobelEdgeDetection(_DECL_1DARRAY_PARAM(pixels), long long width, long long height, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
void printImage(FILE* sys, _DECL_1DARRAY_PARAM(pixels), long long width, long long height);
int main(int argc, char** args);
