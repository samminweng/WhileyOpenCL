#include <stdio.h>
#include "Util.h"

#define N 2000
long long A[N][N];
long long B[N][N];
long long C[N][N];

void init_array(long long value)
{
    int i, j;
    /*long long** A = (long long**)malloc(N*sizeof(long long*));
    for(i=0;i<N;i++){
        // Copy the input array and assign it to matrix.
        A[i] = (long long*)malloc(N*sizeof(long long));
    }*/

    for (i=0; i<N; i++) {
        for (j=0; j<N; j++) {
            A[i][j] = value;
            B[i][j] = value;
        }
    }
}

void print_array()
{
    int i, j;

    for (i=0; i<N; i++) {
        for (j=0; j<N; j++) {
            fprintf(stdout, "%lld ", C[i][j]);
            //if (j%80 == 79) fprintf(stdout, "\n");
        }
        fprintf(stdout, "\n");
    }
}

int main(int argc, char** args)
{
    int i, j, k;
    double t_start, t_end;
    /*long long** A;
    long long** B;
    long long** C;*/

    init_array(1);

    for(i=0; i<N; i++)  {
        for(j=0; j<N; j++)  {
            C[i][j] = 0;
            for(k=0; k<N; k++)
                C[i][j] = C[i][j] + A[i][k] * B[k][j];
        }
    }

// #ifdef TEST
    print_array();
// #endif
    return 0;
}
