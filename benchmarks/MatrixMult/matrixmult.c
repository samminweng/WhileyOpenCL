#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

int64_t* mat_mult(int64_t* a, int64_t* b, int64_t* c, int width, int height){

    int i = 0;
    while(i < height){
         int j = 0;
         while(j < width){
            int k = 0;
            c[i*width+j] = 0;
            while(k < width){
                c[i*width+j] = c[i*width+j] + a[i*width+k] * b[k*width+j];
                //c[i*width+j] = a[i*width+k] * b[k*width+j];
                k = k + 1;
            }
            j = j +1;
         }
         i = i +1;
    }
    return c;

}


int main(int argc, char ** args){

    int size = atoi(args[1]);
    //int size = 6000;
    int width = size;
    int height = size;
    // Initializ matrix A, B, C
    int64_t* a = (int64_t*)malloc(width*height*sizeof(int64_t));
    int64_t* b = (int64_t*)malloc(width*height*sizeof(int64_t));
    int64_t* c = (int64_t*)malloc(width*height*sizeof(int64_t));
    // Initialize each matrix element with the given value.
    int i = 0;
    while(i < height){
        int j = 0;
        while(j < width){
            a[i*width+j] = i;
            b[i*width+j] = i;
            j = j + 1;
        }
        i = i + 1;
    }

    c = mat_mult(a, b, c, width, height);

    printf("c[%d][%d]=%ld", width-1, height-1, c[(width-1)*width+(height-1)]);

    free(a);
    free(b);
    free(c);

}
