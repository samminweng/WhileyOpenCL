#include "Util.h"
#define WHITE 255
#define BLACK 0
typedef struct{
	_DECL_1DARRAY_MEMBER(pixels);
	long long width;
	long long height;
} Image;
void printf_Image(Image* _image);
Image* copy_Image(Image* _image);
void free_Image(Image* _image);
Image* image(long long width, long long height, _DECL_1DARRAY_PARAM(pixels));
long long convolution(Image* A, long long xCenter, long long yCenter, _DECL_1DARRAY_PARAM(filter));
Image* sobelEdgeDetection(Image* input);
void print_image(FILE* sys, Image* im);
int main(int argc, char** args);
