#include "Util.h"
#define N 1024*10
int A[N][N];
int B[N][N];
int C[N][N];


int getRand(){
    return rand() % 100;// Generate 0 ~ 100
}

void init()
{
    int i;
    int j;
    
    time_t t;
    int R[N][N];
    /* Intializes random number generator */
    srand((unsigned) time(&t));
    for (i=0; i<N; i++) {
        for (j=0; j<N; j++) {
            R[i][j] = rand() % 100;;
        }
    }

    for (i=0; i<N; i++) {
        for (j=0; j<N; j++) {
            A[i][j] = R[i][j]; 
            B[i][j] = 100 - R[i][j];
        }
    }
}

void mat_add(){
    int i, j, k;
    for(i=0; i<N; i++)  {
        for(j=0; j<N; j++)  {
            C[i][j] = A[i][j] + B[i][j];
        }
    }
}

void print_array()
{
    int i, j;

    for (i=0; i<N; i++) {
        for (j=0; j<N; j++) {
            printf("%d ", C[i][j]);
            if (j%80 == 79) printf("\n");
        }
        printf("\n");
    }
}

int main()
{
    int i, j, k;

    init();
    mat_add();
   
    printf("Pass %d X %d matrix test case \n", N, N);
    printf("A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%d \n", 
        N-1, N-1, A[N-1][N-1],
        N-1, N-1, B[N-1][N-1],  
        N-1, N-1, C[N-1][N-1]);
    return 0;
}
