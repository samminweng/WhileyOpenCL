#include "Util.h"
#include "WyRT.h"
#define SPACE 00100000b
#define BLACK 01100010b
#define TH 64
typedef struct{
	_DECL_1DARRAY_MEMBER_BYTE(pixels);
	int64_t width;
	int64_t height;
} Image;
void printf_Image(Image* _image);
Image* copy_Image(Image* _image);
void free_Image(Image* _image);
Image* _image_(int64_t width, int64_t height, BYTE* pixels, size_t pixels_size, _DECL_DEALLOC_PARAM(pixels));
int64_t _wrap_(int64_t pos, int64_t size);
int64_t _convolution_(Image* A, _DECL_DEALLOC_PARAM(A), int64_t xCenter, int64_t yCenter, _DECL_1DARRAY_PARAM(filter), _DECL_DEALLOC_PARAM(filter));
Image* _sobelEdgeDetection_(Image* input, _DECL_DEALLOC_PARAM(input));
void _print_pbm_(FILE* sys, int64_t width, int64_t height, BYTE* pixels, size_t pixels_size, _DECL_DEALLOC_PARAM(pixels));
int main(int argc, char** args);
