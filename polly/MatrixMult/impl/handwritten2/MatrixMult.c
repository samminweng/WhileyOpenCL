#include <stdio.h>
#include "Util.h"
#define N 2000

/*
long long A[N][N];
long long B[N][N];
long long C[N][N];*/

long long** init_array(long long value)
{
    int i, j;
    long long** array = (long long**)malloc(N*sizeof(long long*));
    for(i=0;i<N;i++){
        // Copy the input array and assign it to matrix.
        array[i] = (long long*)malloc(N*sizeof(long long));
    }

    for (i=0; i<N; i++) {
        for (j=0; j<N; j++) {
            array[i][j] = value;
        }
    }

    return array;
}

void print_array(long long** array)
{
    int i, j;

    for (i=0; i<N; i++) {
        for (j=0; j<N; j++) {
            fprintf(stdout, "%lld ", array[i][j]);
            //if (j%80 == 79) fprintf(stdout, "\n");
        }
        fprintf(stdout, "\n");
    }
}

int main(int argc, char** args)
{
    int i, j, k;
    double t_start, t_end;
    long long** A;
    long long** B;
    long long** C;

    A = init_array(1);
    B = init_array(1);
    C = init_array(0);

    for(i=0; i<N; i++)  {
        for(j=0; j<N; j++)  {
            C[i][j] = 0;
            for(k=0; k<N; k++){
                C[i][j] = C[i][j] + A[i][k] * B[k][j];
            }
        }
    }

// #ifdef TEST
    print_array(C);
// #endif
    return 0;
}
