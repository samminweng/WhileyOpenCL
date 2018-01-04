#include "Util.h"
#include "WyRT.h"
#define SPACE 00100000b
#define BLACK 01100010b
#define TH 640000
int _wrap_(int pos, int size);
int _convolution_(BYTE* pixels, size_t pixels_size, _DECL_DEALLOC_PARAM(pixels), int width, int height, int xCenter, int yCenter, _DECL_1DARRAY_PARAM(kernel), _DECL_DEALLOC_PARAM(kernel));
BYTE* _sobelEdgeDetection_(BYTE* pixels, size_t pixels_size, _DECL_DEALLOC_PARAM(pixels), int width, int height, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
void _print_pbm_(FILE* sys, int width, int height, BYTE* pixels, size_t pixels_size, _DECL_DEALLOC_PARAM(pixels));
int main(int argc, char** args);
