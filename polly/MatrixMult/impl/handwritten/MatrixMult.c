#include <stdio.h>
#define N 32
long long A[N][N];
long long B[N][N];
long long C[N][N];

void init_array()
{
    int i, j;

    for (i=0; i<N; i++) {
        for (j=0; j<N; j++) {
            A[i][j] = 1;
            B[i][j] = 1;
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
    int i, j, k;
    double t_start, t_end;

    int r;
    for(r=0;r<10000;r++){
        init_array();
        mat_mult();
    }
   
    printf("Pass %d X %d matrix test case (C[N][N] =%lld) \n ", N, N, C[N-1][N-1]);
    return 0;
}
