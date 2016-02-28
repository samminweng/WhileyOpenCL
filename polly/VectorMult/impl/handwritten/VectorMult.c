#include "Util.h"
#include <locale.h>
#define SIZE 1048576*1024// Vector Size
#define N 4096// local vector size
int u[N];
int v[N];
int main(int argc, char** args) {
	long long repeats = SIZE/N;
	int *__restrict__ p = (int*)malloc(repeats*sizeof(int));

	long long r;
	int i;
	// Repeats N times of vector multiplication
	for(r=0;r<repeats;r++){
		p[r]=0;
		// Vector Multiplication
		for (i=0;i<N;i++) {
			u[i] = 1;
			v[i] = 1;
			p[r] = p[r] + u[i]*v[i];// Dot product
		}
	}

	long long sum =0;
	for(r=0;r<repeats;r++){
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
	 "The Dot Product = %'lld\n", SIZE, N, sum);
	return 0;
}

