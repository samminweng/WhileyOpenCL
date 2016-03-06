#include "Util.h"
#include <locale.h>
#define SIZE 1024*1024*10//The vector takes up 549 GB (too big!!!)
#define N 1024// The local vector takes up 8.1 MB
#define R ((long long)SIZE)/N
// The local vector are declared in heap space, not using cache,
// because we want to avoid the cache speedups and measure the actual time
int main(int argc, char** args) {
	int i;	
	//long long R = ((long long)SIZE)/N; // The number of splits
	long long r;
	int* u = (int *)malloc(SIZE*sizeof(int));
	int* v = (int *)malloc(SIZE*sizeof(int));
	int* sum = (int *)malloc(R*sizeof(int));

	// Initialize vecotors 
	for(r=0;r<R;r++){
		//Initialize
		for (i=0;i<N;i++) {
			u[r*N+i] = 1;
			v[r*N+i] = 1;
		}
	}
	// Repeats vector multiplication for R times
	for(r=0;r<R;r++){
		int tmp=0;
		for (i=0;i<N;i++) {
			// Multiply two vectors and sum up to the subtotal.
			tmp= tmp + u[r*N+i]*v[r*N+i];
		}
		sum[r] = tmp;
	}
	
	long long total=0;
	for(r=0;r<R;r++){
		total = total + sum[r];
	}

	// Verify the product (should be = SIZE)
	if(total != SIZE){
		printf("fail to multiply two unit vectors");
		exit(-2);
	}

	// Set the locale.
	setlocale(LC_ALL,"");
	printf("Pass the %'lld vector multiplication test case with local vector size = %d\n"
	 "The Dot Product = %'lld\n", (long long)SIZE, N, total);
	return 0;
}

