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
/*int *__restrict__ transpose(int index) {
	int i;
	int *__restrict__ y_t=(int *__restrict__)malloc(N*sizeof(int));
	for (i = 0; i < N; i++) {
		y_t[i] = Y[i][index];
	}
	return y_t;
}*/


/*int dot(int *__restrict__ a, int *__restrict__ b){
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
}*/

/*void print_array()
{
	int i, j;

	for (i=0; i<N; i++) {
		for (j=0; j<N; j++) {
			fprintf(stdout, "%d ", Z[i][j]);
			if (j%80 == 79) fprintf(stdout, "\n");
		}
		fprintf(stdout, "\n");
	}
}*/


int main(){
	int i,j,k;
	init();
	int b_t[N];



	for (j = 0; j < N; j++) {
		// Extract the column at 'j' index
		for (i = 0; i < N; i++) {
			b_t[i] = B[i][j];
		}
		// Multiply the X and y_t vectors.
		for (i = 0; i < N; i++) {
			int sum=0;
			for(k=0;k<N;k++){
				sum = sum + A[i][k]*b_t[k];
			}
			C[i][j] = sum;
		}
	}
	
	printf("Pass %d X %d matrix test case \n", N, N);
    printf("A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%d \n", 
        N-1, N-1, A[N-1][N-1],
        N-1, N-1, B[N-1][N-1],  
        N-1, N-1, C[N-1][N-1]);

    return 0;
	//print_array();
}
