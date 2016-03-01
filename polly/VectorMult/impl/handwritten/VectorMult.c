#include "Util.h"
#include <locale.h>
#define SIZE 1024*1024*1024L*64//The vector takes up 137 GB (too big!!!)
#define N 64// The local vector
// The local vector are declared in heap space, not using cache,
// because we want to avoid the cache speedups and measure the actual time
int u[N]; 
int v[N];

int main(int argc, char** args) {
	int i;	
	long long R = ((long long)SIZE)/N; // The number of splits
	long long r;
	long long total=0;
	// Repeats vector multiplication for R times
	for(r=0;r<R;r++){
		//p[r] = 0;
		for (i=0;i<N;i++) {
			u[i] = 1;
			v[i] = 1;
			// Multiply two vectors and sum up to the subtotal.
			total = total + u[i]*v[i];
		}
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

