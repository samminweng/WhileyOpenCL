#include "Util.h"
#define WHITE 255
#define BLACK 0
typedef struct{
	_DECL_1DARRAY_MEMBER(pixels);
	int64_t width;
	int64_t height;
} Image;
void printf_Image(Image* _image);
Image* copy_Image(Image* _image);
void free_Image(Image* _image);
Image* image(int64_t width, int64_t height, _DECL_1DARRAY_PARAM(pixels), _DECL_DEALLOC_PARAM(pixels));
int64_t convolution(Image* A, _DECL_DEALLOC_PARAM(A), int64_t xCenter, int64_t yCenter, _DECL_1DARRAY_PARAM(filter), _DECL_DEALLOC_PARAM(filter));
Image* sobelEdgeDetection(Image* input, _DECL_DEALLOC_PARAM(input));
void print_image(FILE* sys, Image* im, _DECL_DEALLOC_PARAM(im));
int main(int argc, char** args);
