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
Image* image(int64_t width, int64_t height, _DECL_1DARRAY_PARAM(pixels));
int64_t convolution(Image* A, int64_t xCenter, int64_t yCenter, _DECL_1DARRAY_PARAM(filter));
Image* sobelEdgeDetection(Image* input);
void print_image(FILE* sys, Image* im);
int main(int argc, char** args);
