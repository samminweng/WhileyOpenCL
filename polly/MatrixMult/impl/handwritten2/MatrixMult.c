#include <stdio.h>
#include <stdlib.h>
#define N 2048
//#define TEST 1
typedef struct{
    int *__restrict__ data;
    int width;
    int height;
} Matrix;

Matrix *__restrict__ init(int value, int width, int height)
{
    int i, j;

    int *__restrict__ data = (int*)malloc(height*width*sizeof(int));
    for(i=0;i<height;i++){
        for(j=0;j<width;j++){
            data[i*width+j] = value;
        }
    }
    Matrix *__restrict__ matrix = (Matrix*)malloc(sizeof(Matrix));
    matrix->data = data;
    matrix->width = width;
    matrix->height = height;
    //printf("%d\n", matrix->data[(N-1)*N+N-1]);
    return matrix;
}

Matrix *__restrict__ matrix_multiply(Matrix *__restrict__ A, Matrix *__restrict__ B){
    int i,j,k;
    int *__restrict__ A_data = A->data;
    int *__restrict__ B_data = B->data;
    // Extract the resulting matrix' width and height from input matrix A and B.
    int width = B->width;
    int height = A->height;
    int *__restrict__ C_data = (int*)malloc(width*height*sizeof(int));
    for(i=0; i<A->height; i++)  {
        // Apply the loop transformation
        for(j=0;j<B->width;j++){
            C_data[i*width+j] = 0;
            for(k=0;k<A->width;k++){
                C_data[i*width+j] = C_data[i*width+j] + A_data[i*width+k]*B_data[k*width+j];
            }
        }
    }

    Matrix *__restrict__ C = (Matrix*)malloc(sizeof(Matrix));
    C->data = C_data;
    C->width = width;
    C->height = height;
    //printf("%d\n", C->data[(N-1)*N+N-1]);
    return C;
}

/*
int *__restrict__ init(int value)
{
    int i, j;
    int *__restrict__ array = (int*)malloc(N*N*sizeof(int));
    for(i=0;i<N;i++){
        for(j=0;j<N;j++){
            array[i*N+j] = value;
        }
    }
    return array;
}
//Use '__restrict__' to declare no array pointer aliasing. That means each array pointer points to
//different locations so that it can be updated without interference.
int *__restrict__ matrix_multiply(int *__restrict__ A, int *__restrict__ B){
    int i,j,k;
    int *__restrict__ C = (int*)malloc(N*N*sizeof(int));
    for(i=0; i<N; i++)  {
        // Apply the loop transformation
        for(j=0;j<N;j++){
            C[i*N+j] = 0;
            for(k=0;k<N;k++){
                C[i*N+j] = C[i*N+j] + A[i*N+k]*B[k*N+j];
            }
        }
    }
    return C;
}*/


int main(int argc, char** args)
{
     // 2D array
    /*
    int *__restrict__ A=NULL;
    int *__restrict__ B=NULL;
    int *__restrict__ C=NULL;
    */
    Matrix *__restrict__ A=NULL;
    Matrix *__restrict__ B=NULL;
    Matrix *__restrict__ C=NULL;
    int width, height;
    width = N;
    height = N;
    // 'A' array uses 'malloc' because local variables use stack.
    // and stack space is not sufficient for larger array size.
    A=init(1, width, height);
    B=init(1, width, height);

    C=matrix_multiply(A, B);
    printf("Pass %d X %d matrix test case (C[%d][%d]=%d)\n", N, N, N-1, N-1, (C->data)[(N-1)*N+N-1]);

    return 0;
}
