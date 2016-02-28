#include "Util.h"
#include <locale.h>
#define N 65536
int u[N];
int v[N];
int p[N];

int main(int argc, char** args) {
	
	int r;
	int i;
	// Repeats N times of vector multiplication
	for(r=0;r<N;r++){
		p[r]=0;
		// Vector Multiplication
		for (i=0;i<N;i++) {
			u[i] = 1;
			v[i] = 1;
			p[r] = p[r] + u[i]*v[i];// Dot product
		}
	}

	long long sum =0;
	for(r=0;r<N;r++){
		sum = sum + p[r];
	}
	long long product = ((long long)N)*N;
	// Verify the product (should be = N*N)
	if(sum != product){
		printf("fail to multiply two unit vectors");
		exit(-2);
	}

	// Set the locale.
	setlocale(LC_ALL,"");
	
	printf("Pass the %'d X %'d vector multiplication test case with dot Product = %'lld", N, N, sum);
	return 0;
}

