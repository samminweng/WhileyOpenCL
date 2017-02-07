#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>
#include <string.h>
#include <gmp.h> //GNU MP abitrary precision arithmetic operations


mpz_t* bubbleSort(mpz_t* items, size_t item_size){
	mpz_t length;
	mpz_init(length);
	mpz_set_si(length, item_size);

	mpz_t tmp;
	mpz_init(tmp);

	mpz_t index;
	mpz_init(index);

	//int last_swapped = 0;
	//while(length >0){
	while(mpz_cmp_ui(length, 0)>0){
		// int index = 1;
		mpz_set_ui(index, 1);
		//while(index <length){
		while(mpz_cmp(index, length)<0){
			// Swap items
			if(mpz_cmp(items[mpz_get_si(index)-1], items[mpz_get_si(index)])>0){
				//int64_t tmp = items[index-1];
				mpz_set(tmp, items[mpz_get_si(index)-1]);
				// items[index-1] = items[index];
				mpz_set(items[mpz_get_si(index)-1], items[mpz_get_si(index)]);
				// items[index]= tmp;
				mpz_set(items[mpz_get_si(index)], tmp);
			}
			//index = index + 1;
			mpz_add_ui(index, index, 1);
		}
		//length = length - 1;
		mpz_sub_ui(length, length, 1);
	}

	if(tmp != NULL){ mpz_clear(tmp);}
	if(length != NULL){ mpz_clear(length);}
	if(index != NULL){ mpz_clear(index);}
	
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
			mpz_set_si(arr[i], max - i);
			//gmp_printf("%Zd\n", arr[i]);
		}
		i++;
		//printf("%d\n", i);
	}

	// print out the 'arr' array before the sort
	gmp_printf("a[%d]=%Zd\n", 0, arr[0]);
	gmp_printf("a[%d]=%Zd\n", max-1, arr[max-1]);
	printf("=== Start sorting ===\n");


	// Make a function call of bubble sort 
	arr = bubbleSort(arr, arr_size);

	// print out the result 'arr'
	gmp_printf("a[%d]=%Zd\n", 0, arr[0]);
	gmp_printf("a[%d]=%Zd\n", max-1, arr[max-1]);
	printf("=== Pass BubbleSort ===\n");

	// Deep freeing each array item 
	for(int i=0;i<max;i++){
		mpz_clear(arr[i]);
	}
	free(arr);


	exit(0);
}