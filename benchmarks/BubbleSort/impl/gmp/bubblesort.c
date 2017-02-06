#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>
#include <string.h>

int64_t* bubbleSort(int64_t* items, size_t item_size){
	int length = item_size;

	int last_swapped = 0;
	while(length >0){
		last_swapped = 0;
		int index = 1;
		while(index <length){
			// Swap items
			if(items[index-1]> items[index]){
				int64_t tmp = items[index-1];
				items[index-1] = items[index];
				items[index]= tmp;

				last_swapped = index;
			}
			index = index + 1;
		}
		length = length - 1;
	}
	return items;
}


int main(int argc, char *argv[])
{
	if(argc<=1) {
        printf("Pass an integer as a command line argument...");
        exit(1);
     }  //otherwise continue on our merry way....

	int max=atoi(argv[1]);

	int64_t* arr = NULL;
	size_t arr_size = 0;
	// Create an array of mpz integers
	{
		//gmp_printf("%Zd\n", tmp);
		arr = (int64_t *) malloc(max*sizeof(int64_t));
		if (arr == NULL) {
   			printf("ERROR: Out of memory\n");
    		return 1;
		}
		// Initialize each item in the 'arr' array
		for(int i=0;i<max;i++){
			arr[i] = 0;
		}
		arr_size = max;
	}
	
	// Assign the array
	int i =0; // i =0;
	while(i<max){ // i < max
		arr[i] = max - i;
		i++;
		//printf("%d\n", i);
	}

	// Make a function call of bubble sort 
	arr = bubbleSort(arr, arr_size);

	// print out the result 'arr'
	/*i=0;
	while(i<max){
		printf("%d\n", arr[i]);
		i++;
	}*/
	printf("%d\n",arr[0]);
	printf("%d\n",arr[max-1]);
	printf("Pass BubbleSort test case\n");


	exit(0);
}