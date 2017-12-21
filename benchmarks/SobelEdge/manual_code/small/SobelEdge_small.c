#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
const int TH = 640000;
typedef uint8_t BYTE;
int wrap(int pos, int size){
    if(pos>=size){
        return (size -1) - (pos - size);
    }else{
        if (pos <0){
            return -1 - pos;
        }else{
            return pos;
        }
    }
}

int convolution(BYTE* pixels, size_t pixels_size, int width, int height, int xCenter, int yCenter, int[] kernel){
    int sum = 0;
	int kernelSize = 3;
	int kernelHalf = 1;
	int j = 0;
    while(j < kernelSize){
        int y = abs((yCenter+j-kernelHalf)%height);
        int i = 0;
        while(i < kernelSize){
            int x=abs((xCenter + i - kernelHalf)%width);
			int pixel = (int)(pixels[y*width+x]);// pixels[x, y]
			int kernelVal = kernel[j*kernelSize+i];	// Get kernel[i, j]
			sum = sum + pixel * kernelVal;//sum += pixels[x, y]*kernel[i, j]
			i = i + 1;
        }
        j = j + 1;
    }
    return sum;
}

BYTE* sobelEdgeDetection(BYTE* pixels, size_t pixels_size, int width, int height, size_t* _size){//Sobel edge detection
    int size = width * height;
    BYTE* newPixels = malloc(sizeof(BYTE)*size);// The output image of sobel edge detection
    int i =0;
    while(i<size){// A blank picture
        newPixels[i] = ' ' - '0'; // Default value is ' '
        i++;
    }
    // vertical and horizontal sobel filter (3x3 kernel)
	int[] v_sobel = {-1,0,1,-2,0,2,-1,0,1};
	int[] h_sobel = {1,2,1,0,0,0,-1,-2,-1};
	// Perform sobel edge detection
	int x = 0;
    while(x<width){
        int y = 0;
		while(y<height){
            int pos = y*width + x;
			int v_g = convolution(pixels, pixels_size, width, height, x, y, v_sobel);// Get vertical gradient
			int h_g = convolution(pixels, pixels_size, width, height, x, y, h_sobel);// Get horizontal gradient
			int t_g = (v_g*v_g) + (h_g*h_g);// Get total gradient
			if(t_g > TH){// Edge threshold (64) Note that large thresholds generate few edges
                newPixels[pos] = 'b' -'0';// Color other pixels as black
            }
			y = y + 1;
        }
    }
    *_size = size;
    return newPixels;
}

int main(int argc, char** args){

    return 0;
}
