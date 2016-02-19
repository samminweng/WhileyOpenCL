#include <stdio.h>
#include <stdlib.h>
#define N 2048
//#define TEST 1

//long long** init_array(long long value)
int *__restrict__ init_array(int value)
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

/*int** matrix_multiply(int** A, int** B){
    int i,j,k;
    int** C = (int**)malloc(N*sizeof(int*));
    for(i=0; i<N; i++)  {
        C[i] = (int*)malloc(N*sizeof(int));
        // Apply the loop transformation
        for(j=0;j<N;j++){
            C[i][j] = 0;
            for(k=0;k<N;k++){
                C[i][j] = C[i][j] + A[i][k]*B[k][j];
            }
        }
    }
    return C;
}*/

/* Use '__restrict__' to declare no array pointer aliasing. That means each array pointer points to 
 * different locations so that it can be updated without interference. 
 */
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
}
/*void print_array()
//void print_array()
{
    int i, j;

    for (i=0; i<N; i++) {
        for (j=0; j<N; j++) {
            printf("%lld ", C[i][j]);
            //if (j%80 == 79) fprintf(stdout, "\n");
        }
        printf("\n");
    }

    printf("\n\n\n");
}*/

int main(int argc, char** args)
{
    int i, j, jj, k, kk;
    double t_start, t_end;
    //int **A, **B, **C;
    int *__restrict__ A =NULL;
    int *__restrict__ B =NULL;
    int *__restrict__ C =NULL;

    // 'A' array uses 'malloc' because local variables use stack.
    // and stack space is not sufficient for larger array size.
    A=init_array(1);
    B=init_array(1);
    C=matrix_multiply(A, B);
    /*C=init_array(0);

    for(i=0; i<N; i++)  {
        // Apply the loop transformation
        for(j=0;j<N;j++){
            C[i*N+j] = 0;
            for(k=0;k<N;k++){
                C[i*N+j] = C[i*N+j] + A[i*N+k]*B[k*N+j];
            }
        }
    }*/
//
    printf("Pass %d X %d matrix test case (C[%d][%d]=%d)\n", N, N, N-1, N-1, C[(N-1)*N+N-1]);
    return 0;
}
