#include "Util.h"
#include "WyRT.h"
#define SPACE 00100000b
#define BLACK 01100010b
#define TH 640000
int64_t _wrap_(int64_t pos, int64_t size);
int64_t _convolution_(BYTE* pixels, size_t pixels_size, int64_t width, int64_t height, int64_t xCenter, int64_t yCenter, _DECL_1DARRAY_PARAM(kernel));
BYTE* _sobelEdgeDetection_(BYTE* pixels, size_t pixels_size, int64_t width, int64_t height, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
void _print_pbm_(FILE* sys, int64_t width, int64_t height, BYTE* pixels, size_t pixels_size);
int main(int argc, char** args);
