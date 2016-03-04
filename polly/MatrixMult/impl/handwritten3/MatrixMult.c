#include <stdio.h>
#include <stdlib.h>
#define N 1024*2
int X[N][N];
int Y[N][N];
int Z[N][N];

void init(){
	int i, j;
	for (i=0; i<N; i++) {
		for (j=0; j<N; j++) {
			X[i][j] = 1;
			Y[i][j] = 1;
		}
	}
}

int *__restrict__ transpose(int *__restrict__ *__restrict__ y, int index) {
	int i;
	int *__restrict__ y_t=(int *__restrict__)malloc(N*sizeof(int));
	int splits = N/64;
	int s;
	for(s=0;s<splits;s++){
		for (i = 0; i < 64; i++) {
			y_t[s*64+i] = Y[s*64+i][index];
		}
	}
	return y_t;
}


int dot(int *__restrict__ a, int *__restrict__ b){
	int i;
	int sum[64];
	int splits = N/64;
	int s;
	int total=0;
	for(s=0;s<splits;s++){
		int tmp=0;
		for (i = 0; i < 64; i++) {
			//total += a[s*64+i] * b[s*64+i];
			tmp = tmp + a[s*64+i] * b[s*64+i];
		}
		sum[s] = tmp;
		total += sum[s];
	}
	return total;
}

void print_array()
{
	int i, j;

	for (i=0; i<N; i++) {
		for (j=0; j<N; j++) {
			fprintf(stdout, "%d ", Z[i][j]);
			if (j%80 == 79) fprintf(stdout, "\n");
		}
		fprintf(stdout, "\n");
	}
}


int main(){
	int i,j;
	init();

	for (j = 0; j < N; j++) {
		// Extract the column at 'j' index
		int* y_t = transpose(Y, j);
		// Multiply the X and y_t vectors.
		for (i = 0; i < N; i++) {
			int *__restrict__ x = X[i];
			//int *__restrict__ z = Z[i];
			int ii;
			int sum=0;
			for(ii=0;ii<N;ii++){
				sum = sum + x[ii]*y_t[ii];
			}
			Z[i][j] = sum;
			//z[j] = dot(x, y_t);
		}
		free(y_t);
	}
	printf("Pass %d X %d matrix test case (C[%d][%d]=%d)\n", N, N, N-1, N-1, Z[N-1][N-1]);

    return 0;
	//print_array();
}
