#include "Util.h"
#include <locale.h>
#define SIZE 1024*1024*1024L*64//The vector takes up 549 GB (too big!!!)
#define N 1024// The local vector takes up 8.1 MB
#define R ((long long)SIZE)/N
// The local vector are declared in heap space, not using cache,
// because we want to avoid the cache speedups and measure the actual time
int u[N]; 
int v[N];
int p[N];
int sum[R];
int main(int argc, char** args) {
	int i;	
	//long long R = ((long long)SIZE)/N; // The number of splits
	long long r;

	// Repeats vector multiplication for R times
	for(r=0;r<R;r++){
		// Sum up to the total
		int tmp =0;
		// Initialize u and v vectors.
		for (i=0;i<N;i++) {
			u[i] = 1;
			v[i] = 1;
			p[i] = u[i]*v[i];// Multiply two vectors and put dot to the p vector
			tmp = tmp + p[i];
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

