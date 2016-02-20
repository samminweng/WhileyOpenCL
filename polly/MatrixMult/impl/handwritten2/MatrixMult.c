#include <stdio.h>
#include <stdlib.h>
#define N 2048
//#define TEST 1
typedef struct{
    int *__restrict__ data;
    int width;
    int height;
} Matrix;

Matrix *__restrict__ init(int value)
{
    int i, j;

    int *__restrict__ data = (int*)malloc(N*N*sizeof(int));
    for(i=0;i<N;i++){
        for(j=0;j<N;j++){
            data[i*N+j] = value;
        }
    }
    Matrix *__restrict__ matrix = (Matrix*)malloc(sizeof(Matrix));
    matrix->data = data;
    //printf("%d\n", matrix->data[(N-1)*N+N-1]);
    return matrix;
}

Matrix *__restrict__ matrix_multiply(Matrix *__restrict__ A, Matrix *__restrict__ B){
    int i,j,k;
    int *__restrict__ C_data = (int*)malloc(N*N*sizeof(int));
    int *__restrict__ A_data = A->data;
    int *__restrict__ B_data = B->data;
    for(i=0; i<N; i++)  {
        // Apply the loop transformation
        for(j=0;j<N;j++){
            C_data[i*N+j] = 0;
            for(k=0;k<N;k++){
                C_data[i*N+j] = C_data[i*N+j] + A_data[i*N+k]*B_data[k*N+j];
            }
        }
    }

    Matrix *__restrict__ C = (Matrix*)malloc(sizeof(Matrix));
    C->data = C_data;
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
    Matrix *__restrict__ A=NULL;
    Matrix *__restrict__ B=NULL;
    Matrix *__restrict__ C=NULL;
    // 2D array
    /*
    int *__restrict__ A=NULL;
    int *__restrict__ B=NULL;
    int *__restrict__ C=NULL;
    */

    // 'A' array uses 'malloc' because local variables use stack.
    // and stack space is not sufficient for larger array size.
    A=init(1);
    B=init(1);

    C=matrix_multiply(A, B);
    printf("Pass %d X %d matrix test case (C[%d][%d]=%d)\n", N, N, N-1, N-1, (C->data)[(N-1)*N+N-1]);

    return 0;
}
