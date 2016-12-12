#include "Util.h"
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
Image* image(int64_t width, int64_t height, BYTE* pixels, size_t pixels_size);
int64_t wrap(int64_t pos, int64_t size);
int64_t convolution(Image* A, int64_t xCenter, int64_t yCenter, _DECL_1DARRAY_PARAM(filter));
Image* sobelEdgeDetection(Image* input);
void print_pbm(FILE* sys, int64_t width, int64_t height, BYTE* pixels, size_t pixels_size);
int main(int argc, char** args);
