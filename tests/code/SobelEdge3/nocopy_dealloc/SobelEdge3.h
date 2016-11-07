#include "Util.h"
#define SPACE 00100000b
#define BLACK 01100010b
#define NEWLINE 00001010b
#define EOF 00000000b
typedef struct{
	_DECL_1DARRAY_MEMBER_BYTE(pixels);
	int64_t width;
	int64_t height;
} Image;
void printf_Image(Image* _image);
Image* copy_Image(Image* _image);
void free_Image(Image* _image);
Image* image(int64_t width, int64_t height, BYTE* pixels, size_t pixels_size, _DECL_DEALLOC_PARAM(pixels));
int64_t convolution(Image* A, _DECL_DEALLOC_PARAM(A), int64_t xCenter, int64_t yCenter, _DECL_1DARRAY_PARAM(filter), _DECL_DEALLOC_PARAM(filter));
Image* sobelEdgeDetection(Image* input, _DECL_DEALLOC_PARAM(input));
void write_image(FILE* sys, Image* im, _DECL_DEALLOC_PARAM(im));
int main(int argc, char** args);
