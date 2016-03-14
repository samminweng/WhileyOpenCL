#include "Util.h"
#define N 512
int A[N][N];
int B[N][N];
int C[N][N];
int R[N][N];
void init() __attribute__((noinline));

void init(){
    int i;
    int j;
    
    /* Intializes random number generator */
    srand((unsigned) time(NULL));
    for (i=0; i<N; i++) {
        for (j=0; j<N; j++) {
            // Each rows starts with a random number
            R[i][j] = rand()%100;
        }
    }

    for (i=0; i<N; i++) {
        for (j=0; j<N; j++) {
            A[i][j] = R[i][j]; 
            B[i][j] = 100 - R[i][j];
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

/*void print_array()
{
    int i, j;

    for (i=0; i<N; i++) {
        for (j=0; j<N; j++) {
            fprintf(stdout, "%lld ", C[i][j]);
            if (j%80 == 79) fprintf(stdout, "\n");
        }
        fprintf(stdout, "\n");
    }
}*/

int main()
{
    init();
    mat_mult();
   
    printf("Pass %d X %d matrix test case \n", N, N);
    printf("A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%d \n", 
        N-1, N-1, A[N-1][N-1],
        N-1, N-1, B[N-1][N-1],  
        N-1, N-1, C[N-1][N-1]);
    return 0;
}
