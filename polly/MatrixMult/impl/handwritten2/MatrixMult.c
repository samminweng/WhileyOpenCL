#include <stdio.h>
#include <stdlib.h>
#define N 1024
//#define TEST 1

//long long** init_array(long long value)
void init_array(long long* array, long long value)
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
    long long* A = (long long*)malloc(N*N*sizeof(long long));
    long long* B = (long long*)malloc(N*N*sizeof(long long));
    long long* C = (long long*)malloc(N*N*sizeof(long long));

    // 'A' array uses 'malloc' because local variables use stack.
    // and stack space is not sufficient for larger array size.
    
    init_array(1);
    B=init_array(1);
    C=init_array(0);

   for(i=0; i<N; i++)  {
        // Apply the loop transformation
        for(j=0;j<N;j++){
            long long tmp = 0;
            for(k=0;k<N;k++){
                tmp = tmp + A[i*N+k]*B[k*N+j];
            }
            C[i*N+j] = tmp;
        }
    }
//
    printf("Pass %d X %d matrix test case (C[N][N] =%lld) \n ", N, N, C[(N-1)*N+(N-1)]);
    return 0;
}
