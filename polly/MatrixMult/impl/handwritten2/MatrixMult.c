#include "Util.h"

typedef struct{
    long long* data;
    int width;
    int height;
} Matrix;

Matrix* init(int width, int height) __attribute__((noinline));
Matrix* matmult(Matrix* a, Matrix* b) __attribute__((noinline));

Matrix* init(int width, int height){

    int i, j;

    long long* data = (long long*)malloc(height*width*sizeof(long long));
    // Initialize 
    for (i=0; i<height; i++) {
        for (j=0; j<width; j++) {
            data[i*width+j] = 0;
        }
    }

    for (i=0; i<height; i++) {
        for (j=0; j<width; j++) {
            data[i*width+j] = data[i*width+j] + i;
        }
    }

    Matrix* m = malloc(sizeof(Matrix));
    m->data = data;
    m->width = width;
    m->height = height;

    return m;
}

Matrix* matmult(Matrix* a, Matrix* b){
	int i, j, k;
    int width = b->width;
    int height = a->height;
    long long* a_data = a->data;
    long long* b_data = b->data;
	

	long long* data = (long long*)malloc(height*width*sizeof(long long));
    long long* b_t = malloc(width*height*sizeof(long long));
    // Transpose b matrix to 'b_t' matrix
	for (j = 0; j < height; j++) {
		// Extract the column at 'j' index
		for (i = 0; i < width; i++) {
			b_t[j*width+i] = b_data[i*width+j];
		}
	}
	for (j = 0; j < height; j++) {
		// Multiply the a and b_v vectors.
		for (i = 0; i < width; i++) {
			data[i*width+j] =0;
			for(k=0;k<width;k++){
				data[i*width+j] = data[i*width+j] + a_data[i*width+k]*b_t[i*width+k];
			}
		}
	}


    Matrix* m = malloc(sizeof(Matrix));
    m->width = width;
    m->height = height;
    m->data = data;
    return m;
}

int main(int argc, char** args){
	//Get matrix size from command line argument
    int max;
    sscanf(args[1], "%d", &max);
    printf("N = %d\n", max);
    // Intialize matrix
    Matrix* a = init(max, max);
    Matrix* b = init(max, max);
    // Multiply matrix A and B
    Matrix* c = matmult(a, b);

    // Print out matrix c
    //print_mat(c);

    printf("Pass %d X %d matrix test case \n", max, max);
    printf("A[%dX%d+%d] = %lld, B[%dX%d+%d] =%lld, C[%dX%d+%d] =%lld \n", 
        max-1, max, max-1, a->data[(max-1)*max+max-1],
        max-1, max, max-1, b->data[(max-1)*max+max-1],  
        max-1, max, max-1, c->data[(max-1)*max+max-1]);
    
    return 0;
}
