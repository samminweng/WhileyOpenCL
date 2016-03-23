#include "Util.h"
#define N 2000

void init() __attribute__((noinline));
void mat_mult() __attribute__((noinline));

int A[N][N];
int B[N][N];
long long C[N][N];


void init(){
    //int i;
    //int j;
    //int* R = malloc(N*N*sizeof(int));
    /* Intializes random number generator */
    /*srand((unsigned) time(NULL));
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) {
            R[i][j] = 0;
            // Each rows starts with a random number from 0 to 10
            R[i][j] = R[i][j]+i;
        }
    }*/
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) {
            //A[i][j] = 1; 
            //B[i][j] = 1;
            A[i][j] = A[i][j] + i; 
            B[i][j] = B[i][j] + i;
        }
    }
}

void mat_mult(){
    int i, j, k;
    for(i=0; i<N; i++)  {
        for(j=0; j<N; j++)  {
            C[i][j] = 0;
            for(k=0; k<N; k++)
                C[i][j] = C[i][j] + A[i][k] * B[k][j];
        }
    }
}

void print_array()
{
    int i, j;

    for (i=0; i<N; i++) {
        for (j=0; j<N; j++) {
            fprintf(stdout, "%lld ", C[i][j]);
            if (j%80 == 79) fprintf(stdout, "\n");
        }
        fprintf(stdout, "\n");
    }
}

int main()
{
    init();
    mat_mult();
   
    printf("Pass %d X %d matrix test case \n", N, N);
    printf("A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%lld \n", 
        N-1, N-1, A[N-1][N-1],
        N-1, N-1, B[N-1][N-1],  
        N-1, N-1, C[N-1][N-1]);
    return 0;
}
