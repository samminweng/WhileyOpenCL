#include "Util.h"
#include <locale.h>
#define SIZE 1024*1024*1024*16L // The problem vector takes up 137 GB (too big!!!)
#define N (1024*1024)// The local vector 
int u[N]; // The local vector takes up 8.3 MB (>= Cache size)
int v[N];
int main(int argc, char** args) {
	long long splits = SIZE/N; // The number of splits 
	int *__restrict__ p = (int*)malloc(splits*sizeof(int)); // The product array stores 
															// the dot product for each split
	long long r;
	int i;
	// Repeats vector multiplication for 'splits' times
	for(r=0;r<splits;r++){
		p[r]=0;
		// Vector Multiplication
		for (i=0;i<N;i++) {
			u[i] = 1;
			v[i] = 1;
			p[r] = p[r] + u[i]*v[i];// Dot product
		}
	}
	long long sum =0;
	for(r=0;r<splits;r++){
		sum = sum + p[r];
	}
	// Verify the product (should be = N*N)
	if(sum != SIZE){
		printf("fail to multiply two unit vectors");
		exit(-2);
	}

	// Set the locale.
	setlocale(LC_ALL,"");
	printf("Pass the %'lld vector multiplication test case with local vectors = %d size.\n"
	 "The Dot Product = %'lld\n", (long long)SIZE, N, sum);
	return 0;
}

