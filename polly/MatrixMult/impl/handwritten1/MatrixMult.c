#include "Util.h"

typedef struct{
    long long* data;
    int width;
    int height;
} Matrix;

Matrix* init(int width, int height) __attribute__((noinline));
Matrix* mat_mult(Matrix* a, Matrix* b) __attribute__((noinline));

Matrix* init(int width, int height){

    int i, j;

    // Using double pointer and one malloc to create all rows
    /*A = (int**)malloc(sizeof(int*)*N);
    A[0] = (int*)malloc(sizeof(int)*N*N); // Malloc total number of memory (rows*cols)
    // Initialize each row pointer
    for(i=0;i<N;i++){
        A[i] = (*A + N*i);
    }*/

   
    long long* data = (long long*)malloc(sizeof(long long)*width*height);
    // Initialize 
    for (i=0; i<height; i++) {
        for (j=0; j<width; j++) {
            data[i*width+j] = 0;
        }
    }

    for (i=0; i<height; i++) {
        for (j=0; j<width; j++) {
            data[i*width+j] = data[i*width+j] + i;
        }
    }

    Matrix* m = malloc(sizeof(Matrix));
    m->data = data;
    m->width = width;
    m->height = height;

    return m;
}

Matrix* mat_mult(Matrix* a, Matrix* b){
    int i, j, k;
    int width = b->width;
    int height = a->height;
   
    long long* data = (long long*)malloc(sizeof(int)*width*height);

    for(i=0; i<width; i++)  {
        for(j=0; j<height; j++)  {
            data[i*width+j] = 0;
            for(k=0; k<width; k++)
                data[i*width+j] = data[i*width+j] + a->data[i*width+k] * b->data[k*width+j];
        }
    }

    Matrix* m = malloc(sizeof(Matrix));
    m->width = width;
    m->height = height;
    m->data = data;
    return m;
}


int main(int argc, char** args)
{
    //Get matrix size from command line argument
    int max;
    sscanf(args[1], "%d", &max);
    printf("N = %d\n", max);
    // Intialize matrix
    Matrix* a = init(max, max);
    Matrix* b = init(max, max);
    // Multiply matrix A and B
    Matrix* c = mat_mult(a, b);

    printf("Pass %d X %d matrix test case \n", max, max);
    printf("A[%dX%d+%d] = %lld, B[%dX%d+%d] =%lld, C[%dX%d+%d] =%lld \n", 
        max-1, max, max-1, a->data[(max-1)*max+max-1],
        max-1, max, max-1, b->data[(max-1)*max+max-1],  
        max-1, max, max-1, c->data[(max-1)*max+max-1]);
    return 0;
}
