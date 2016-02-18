#include <stdio.h>
#include <stdlib.h>
#define N 1024
//#define TEST 1

//long long** init_array(long long value)
void init_array(int* array, int value)
{
    int i, j;
    for(i=0;i<N;i++){
        for(j=0;j<N;j++){
            array[i*N+j] = value;
        }
    }
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
    int* A = (int*)malloc(N*N*sizeof(int));
    int* B = (int*)malloc(N*N*sizeof(int));
    int* C = (int*)malloc(N*N*sizeof(int));

    // 'A' array uses 'malloc' because local variables use stack.
    // and stack space is not sufficient for larger array size.
    init_array(A, 1);
    init_array(B, 1);
    init_array(C, 0);


   for(i=0; i<N; i++)  {
        // Apply the loop transformation
        for(j=0;j<N;j++){
            C[i*N+j] = 0;
            for(k=0;k<N;k++){
                C[i*N+j] = C[i*N+j] + A[i*N+k]*B[k*N+j];
            }
        }
    }
//
    printf("Pass %d X %d matrix test case (C[N][N] =%d) \n ", N, N, C[(N-1)*N+(N-1)]);
    return 0;
}
