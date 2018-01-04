#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
typedef uint8_t BYTE;
const int TH = 640000;
const BYTE SPACE = 32;
const BYTE BLACK = 98;

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

int convolution(BYTE* pixels, size_t pixels_size, int width, int height, int xCenter, int yCenter, int* kernel){
    int sum = 0;
	int kernelSize = 3;
	int kernelHalf = 1;
	int j = 0;
    while(j < kernelSize){
        int y = abs((yCenter+j-kernelHalf)%height);
        int i = 0;
        while(i < kernelSize){
            int x=abs((xCenter + i - kernelHalf)%width);
			int pixel = (unsigned int) pixels[y*width+x];// pixels[x, y]
			int kernelVal = kernel[j*kernelSize+i];	// Get kernel[i, j]
			sum = sum + pixel * kernelVal;//sum += pixels[x, y]*kernel[i, j]
			i = i + 1;
        }
        j = j + 1;
    }
    return sum;
}

BYTE* sobelEdgeDetection(BYTE* pixels, size_t pixels_size, int width, int height, size_t newPixels_size){//Sobel edge detection
    BYTE* newPixels = (BYTE*) malloc(sizeof(BYTE)*newPixels_size);// The output image of sobel edge detection
    int i =0;
    while(i<newPixels_size){// A blank picture
        newPixels[i] = SPACE; // Default value is ' '
        i++;
    }
    // vertical and horizontal sobel filter (3x3 kernel)
    int v_sobel[9]={-1,0,1,-2,0,2,-1,0,1};
    //int* v_sobel=malloc(sizeof(int)*9);
    //v_sobel[0]=-1;v_sobel[1]=0;v_sobel[2]=1;v_sobel[3]=-2;v_sobel[4]=0;v_sobel[5]=2;v_sobel[6]=-1;v_sobel[7]=0;v_sobel[8]=1;
    int h_sobel[9]={1,2,1,0,0,0,-1,-2,-1};
    //int* h_sobel=malloc(sizeof(int)*9);
    //h_sobel[0]=1;h_sobel[1]=2;h_sobel[2]=1;h_sobel[3]=0;h_sobel[4]=0;h_sobel[5]=0;h_sobel[6]=-1;h_sobel[7]=-2;h_sobel[8]=-1;
    // Perform sobel edge detection
    int x = 0;
    while(x<width){
        int y = 0;
        while(y<height){
            int pos = y*width + x;
            int v_g = convolution(pixels, pixels_size, width, height, x, y, v_sobel);// Get vertical gradient
            int h_g = convolution(pixels, pixels_size, width, height, x, y, h_sobel);// Get horizontal gradient
            int t_g = (v_g*v_g) + (h_g*h_g);// Get total gradient
            if(t_g > TH){// Large thresholds generate few edges
                newPixels[pos] = BLACK;// Color other pixels as black
            }
            y = y + 1;
        }
        x = x + 1;
    }
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
    if(argc != 2){
        printf("Height is required");
        exit(-1);
    }
    int width = 2000;
    int height = atoi(args[1]);
    printf("height=%d\n", height);
    int size = width * height;
    printf("size=%d\n", size);
    size_t pixels_size = size;
    BYTE* pixels = (BYTE*)malloc(sizeof(BYTE)*pixels_size);
    int i =0;
    while(i<pixels_size){// Initialise each pixel with SPACE
        pixels[i] = SPACE;
        i++;
    }
    i =0;
    while(i<pixels_size){// Randomly generate each pixel
        pixels[i] = (BYTE)(i%256);
        i++;
    }
    printf("pixels[1000]=%d\n",pixels[1000]);
    size_t newPixels_size = pixels_size;
    BYTE* newPixels = sobelEdgeDetection(pixels, pixels_size, width, height, newPixels_size);
    printf("Blurred Image sizes: %zu bytes\n", newPixels_size);
    printf("newPixels[1000]=%d\n", newPixels[1000]);
    //print_pbm(width, height, newPixels, newPixels_size);
    free(pixels);
    free(newPixels);
    return 0;
}
