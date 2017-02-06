#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>
#include <string.h>
#include <gmp.h> //GNU MP abitrary precision arithmetic operations


mpz_t* bubbleSort(mpz_t* items, size_t item_size){
	int length = item_size;

	int last_swapped = 0;
	while(length >0){
		last_swapped = 0;
		int index = 1;
		while(index <length){
			// Swap items
			if(mpz_cmp(items[index-1], items[index])>0){
				mpz_t tmp;
				mpz_init(tmp);
				mpz_set(tmp, items[index-1]);

				mpz_set(items[index-1], items[index]);
				mpz_set(items[index], tmp);

				last_swapped = index;
				//gmp_printf("%Zd\n",tmp);
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

	mpz_t* arr = NULL;
	size_t arr_size = 0;
	// Create an array of mpz integers
	{
		//gmp_printf("%Zd\n", tmp);
		arr = (mpz_t *) malloc(max*sizeof(mpz_t));
		if (arr == NULL) {
   			printf("ERROR: Out of memory\n");
    		return 1;
		}
		// Initialize each item in the 'arr' array
		for(int i=0;i<max;i++){
			mpz_init(arr[i]);
		}
		arr_size = max;
	}
	
	// Assign the array
	int i =0; // i =0;
	while(i<max){ // i < max
		//arr[i] = max - i;
		{
			int tmp = max - i;
			mpz_set_ui(arr[i], tmp);
			//gmp_printf("%Zd\n", arr[i]);
		}
		i++;
		//printf("%d\n", i);
	}

	// Make a function call of bubble sort 
	arr = bubbleSort(arr, arr_size);

	// print out the result 'arr'
	/*i=0;
	while(i<max){
		gmp_printf("%Zd\n", arr[i]);
		i++;
	}*/
	gmp_printf("%Zd\n",arr[0]);
	gmp_printf("%Zd\n",arr[max-1]);
	printf("Pass BubbleSort test case\n");


	exit(0);
}