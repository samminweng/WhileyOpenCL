#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>
#include <string.h>
#include <cilk/cilk.h>
#include <cilk/cilk_api.h>
#include <pthread.h> //pthread library	

/**
 * Slice the array into two array from start to end (exclusively).
 */
int64_t* slice(int64_t* arr, size_t arr_size, int start, int end){
	int64_t* sub_arr = NULL;
	sub_arr = (int64_t*)malloc((end - start)*sizeof(int64_t));
	if(sub_arr == NULL){
		fputs("fail to allocate the memory at slice function in Util.c\n", stderr);
		exit(-2);
	}
	memcpy(sub_arr, &arr[start], (end - start)*sizeof(int64_t));
	return sub_arr;
}

// Merge sort
int64_t* mergesort(int64_t* items, size_t item_size, int start, int end, size_t* _size){
	
	//int w_number = __cilkrts_get_worker_number();
	// Print out worker number
	//printf("Worker Number %d\n", w_number);
	int64_t* lhs = NULL;
	int64_t* rhs = NULL;
	int64_t* tmp = NULL;
	int64_t* tmp_1 = NULL;
	pthread_mutex_t m; //define the lock
	if(start+1 < end){
		// Split Phase
		int pivot = (start+end)/2;
		// LHS array
		if(lhs != NULL){free(lhs); lhs= NULL;}
		lhs = slice(items, item_size, start, pivot);
		size_t lhs_size = pivot - start;
		size_t tmp_size=0;
		// Recursive 'spwan' function call
		if(tmp != NULL){free(tmp); tmp= NULL;}
		tmp = cilk_spawn mergesort(lhs, lhs_size, 0, pivot, &tmp_size);
		lhs = tmp;
		lhs_size = tmp_size;
		cilk_sync;

		// RHS array
		if(rhs != NULL){free(rhs); rhs= NULL;}
		rhs = slice(items, item_size, pivot, end);
		size_t rhs_size = end - pivot;
		size_t tmp1_size=0;		
		// Recursive 'spawn' function call
		if(tmp_1 != NULL){free(tmp_1); tmp_1= NULL;}
		tmp_1 = cilk_spawn mergesort(rhs, rhs_size, 0, (end-pivot), &tmp_size);
		rhs = tmp_1;
		rhs_size = tmp1_size;

		cilk_sync;
		
		// Merge Phase
		//pthread_mutex_lock(&m); //lock - prevents other threads from running this code
		int l=0, r=0, i=0;
		while(i< (end -start) && l < (pivot - start) && r < (end - pivot)){
			if (lhs[l] <= rhs[r]){
				items[i] = lhs[l];
				l = l + 1;
			}else{
				items[i] = rhs[r];
				r = r + 1;
			}
			i = i +1;
		}

		while(l < (pivot -start)){
			items[i] = lhs[l];
			i = i +1;
			l = l +1;
		}

		while(r <(end - pivot)){
			items[i] = rhs[r];
			i = i +1;
			r = r +1;
		}
		//pthread_mutex_unlock(&m); //unlock - allows other threads to access this code
	}

	// Free 'lhs' and 'rhs'
	if(lhs != NULL){free(lhs); lhs=NULL;}
	if(rhs != NULL){free(rhs); rhs=NULL;}

	*_size = item_size;
	return items;

}

int main(int argc, char *argv[])
{
		
	if(argc<=1) {
        printf("Pass an integer as a command line argument...");
        exit(1);
     }  //otherwise continue on our merry way....

	int max=atoi(argv[1]);
	
	// Get the 
	int nwk = __cilkrts_get_nworkers();
	printf("The number of worker threads is %d\n", nwk);

	// Create an array
	int64_t* arr = malloc(max*sizeof(int64_t));
	size_t arr_size = max;

	// Fill in the array
	int i=0;
	while(i<max){
		arr[i] = max -i;
		//printf("arr[%d]=%d\n", i, arr[i]);
		i++;
	}
	size_t output_size=0;
	int64_t* output = cilk_spawn mergesort(arr, arr_size, 0, max, &output_size);
	cilk_sync;
	// Print out output arr
	/*i=0;
	while(i<max){
		printf("output[%d]=%d\n", i, output[i]);
		i++;
	}*/
	printf("output[%d]=%d\n", 0, output[0]);
	printf("output[%d]=%d\n", 1, output[1]);
	printf("output[%d]=%d\n", 2, output[2]);

	printf("output[%d]=%d\n", max-3, output[max-3]);
	printf("output[%d]=%d\n", max-2, output[max-2]);
	printf("output[%d]=%d\n", max-1, output[max-1]);


	free(output);
    exit(0);

}
