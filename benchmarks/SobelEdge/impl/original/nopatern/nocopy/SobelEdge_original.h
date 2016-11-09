#include "Util.h"
#define SPACE 00100000b
#define BLACK 01100010b
int64_t convolution(BYTE* pixels, size_t pixels_size, int64_t width, int64_t height, int64_t xCenter, int64_t yCenter, _DECL_1DARRAY_PARAM(filter));
BYTE* sobelEdgeDetection(BYTE* pixels, size_t pixels_size, int64_t width, int64_t height, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
int main(int argc, char** args);
