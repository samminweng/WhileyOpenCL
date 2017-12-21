#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#define MAX_LINE_LENGTH 1024*16
typedef uint8_t BYTE;
const int TH = 640000;
const BYTE SPACE = ' ' - '0';
const BYTE BLACK = 'b' - '0';


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

int convolution(BYTE* pixels, size_t pixels_size, int width, int height, int xCenter, int yCenter, int kernel[9]){
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
        newPixels[i] = SPACE; // Default value is ' '
        i++;
    }
    // vertical and horizontal sobel filter (3x3 kernel)
	int v_sobel[9]= {-1,0,1,-2,0,2,-1,0,1};
	int h_sobel[9]= {1,2,1,0,0,0,-1,-2,-1};
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
                newPixels[pos] = BLACK;// Color other pixels as black
            }
			y = y + 1;
        }
		x = x + 1;
    }
    *_size = size;
    return newPixels;
}

void print_pbm(int width, int height, BYTE* pixels, size_t pixels_size){
	FILE* fp;
	fp = fopen("output.pbm", "w+");
	fprintf(fp, "P1\n");
	fprintf(fp, "%d %d\n", width, height);

	int j = 0;
	while(j<height){
		int i = 0;
		while(i<width){
			int pos = j*width + i;
			if(pixels[pos] == SPACE){
				fprintf(fp, "0");
			}else{
				fprintf(fp, "1");
			}
			i = i + 1;
		}
		fprintf(fp, "\n");
		j = j + 1;
	}
	fclose(fp);

}


int main(int argc, char** args){
    /*FILE* fp;
    fp = fopen("../../images/input/image64x64.pbm", "r");
    if(!fp){
        printf("File does not exit\n");
        exit(-2);
    }
	// Read a PBM image as a byte array
    size_t pixels_size = 0;
    BYTE* pixels = readPBM(fp, &pixels_size);
	fclose(fp);
	*/
    int width = 64;
    int height = 640;
	int size = width * height;
	size_t pixels_size = size;
	BYTE* pixels = malloc(sizeof(BYTE)*size);
	int i =0;
	while(i<size){// Randomly generate each pixel
		pixels[i] = i%256;
		i++;
	}

    size_t newPixels_size = 0;
    BYTE* newPixels = sobelEdgeDetection(pixels, pixels_size, width, height, &newPixels_size);
    printf("Blurred Image sizes: %zu bytes", newPixels_size);

    print_pbm(width, height, newPixels, newPixels_size);
    free(pixels);
    free(newPixels);
    return 0;
}
