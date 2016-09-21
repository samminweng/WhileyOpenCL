#include "Util.h"
#define WHITE 255
#define BLACK 0
int64_t convolution(_DECL_1DARRAY_PARAM(pixels), _DECL_DEALLOC_PARAM(pixels), int64_t width, int64_t height, int64_t xCenter, int64_t yCenter, _DECL_1DARRAY_PARAM(filter), _DECL_DEALLOC_PARAM(filter));
int64_t* sobelEdgeDetection(_DECL_1DARRAY_PARAM(pixels), _DECL_DEALLOC_PARAM(pixels), int64_t width, int64_t height, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
void printImage(FILE* sys, _DECL_1DARRAY_PARAM(pixels), _DECL_DEALLOC_PARAM(pixels), int64_t width, int64_t height);
int main(int argc, char** args);
