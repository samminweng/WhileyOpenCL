#include "Util.h"
//Global variable
/**
 * Slice the array into two array from start to end (exclusively).
 */
long long* slice(long long* arr, long long arr_size, long long start, long long end){
	long long* sub_arr = NULL;
	sub_arr = (long long*)malloc((end - start)*sizeof(long long));
	if(sub_arr == NULL){
		printf("fail to allocate the memory at slice function in Util.c\n");
		exit(-2);
	}	
	memcpy(sub_arr, &arr[start], (end - start)*sizeof(long long));
	return sub_arr;
}

/**
 * Generate an array with given size and initial value.
 */
long long* genArray(int value, int arr_size){
	long long* arr = NULL;
	long long i = 0;
	// Allocate the array
	arr = (long long*)malloc(arr_size*sizeof(long long));
	if(arr == NULL){
		printf("fail to allocate the memory at genArray function in Util.c\n");
		exit(-2);
	}
	// Initialize each element with the given value.
	for(i=0;i<arr_size;i++){
		arr[i] = value;
	}
	return arr;
}

/**
 *
 *  Converts command list arugments into an array of integers (0 ~ 9),
 *  e.g. args[1]={'1', '0'} is converted into arr[0] = {1, 0}.
 *  The arr_size is passed by reference, so its value is updated after
 *  the function call.
**/
long long** convertArgsToIntArray(int argc, char** args, int arr_size){
	long long** arr;
	long long i;
	long long j;
	long long max_j;
	//Check if there is any command line argument
	if(argc < 2){
		printf("Missing the command line arguments\n");
		exit(-2);
	}
	//Allocate the target array ('arr').
	arr = (long long**) malloc((argc-1)*sizeof(long long*));
	if(arr == NULL){
		printf("fail to allocate the memory at convertCharToInt function in Util.c\n");
		exit(-2);
	}
	//Convert each argument into an array of digits	
	arr_size=0;
	//Skip 1st arguement as it is the exec file name.
	for(i=1;i<argc;i++){
		//Check args[i][0] is an integer or not.
		if(isdigit(args[i][0])){
			//Allocated the array of 'arr'.
			max_j=0;
			//check if the char is a number or it is not ending char.
			//And calculate the arr_size
			while(args[i][max_j] != '\0' || isdigit(args[i][max_j])){
				max_j++;
			}
			//Allocate the array of arr[arr_size]
			arr[arr_size] = (long long*)malloc((max_j+1)*sizeof(long long));
			//Fill in the array
			for(j=0;j<max_j;j++){
				arr[arr_size][j] = args[i][j] - '0';
			}
			//Adding the negative value to indicate the end of the array. 
			arr[arr_size][j] = -1;
			arr_size++;
		}
	}
	//Check if the conversion is successful and array size should be >= 1.
	if(arr_size == 0){
		printf("No number is passed via command line arguments\n");
		exit(-2);
	}
	return arr;
}


/**
 *  Combine an array of integers into an integer,
 *  e.g. arr = {1, 0} is converted into 10.\
 *  */
long long parseInteger(long long* arr){
	long long value;
	long long i;
	value = 0;
	i=0;
	while(arr[i]>=0&&arr[i]<=9){
		value = value*10+arr[i];
		i++;
	}
	return value;
}


/**
* Split the array into a sub list from 'start' to 'end', and return the sublist.
*/
/*long long* sublist(long long* arr, int start, int end) {
	long long* sublist = NULL;
	long long size = 0;
	long long index = 0;
	size = end - start;
	//Create the sub list
	sublist = (long long*) malloc(size * sizeof(long long));
	if (sublist == NULL) {
		fprintf(stderr,
			"fail to allocate the memory at sublist function in Util.c");
		exit(-2);
	}
	//Fill in the values using a while-loop
	for (index = 0; index < size; index++) {
		sublist[index] = arr[index + start];
	}
	return sublist;
}*/

//Check if both arrays are the same. 1: true, 0: false.
int isArrayEqual(long long* arr1, long long arr1_size,
				 long long* arr2, long long arr2_size) {
	long long i = 0;
	//Check if array size is the same.
	if (arr1_size != arr2_size) {
		return 0;
	}
	//Compare each element.
	for (i = 0; i < arr1_size; i++) {
		if (arr1[i] != arr2[i]) {
			return 0;
		}
	}
	//Both of arrays are the same. Return true
	return 1;
}

// Convert an array of long long integer into an array of string.  
/*void toString(long long arr[], long long size, char** res) {
long long i = 0;
char buffer[1024];
size_t buffer_size = 0;
if (res == NULL) {
fprintf(stderr,
"fail to malloc res in toString(long long arr[], long long size, char** res)\n");
exit(-2);
}
for (i = 0; i < size; i++) {
//Write the array element (long long) to the buffer and get the length   
buffer_size = sprintf(buffer, "%lld", arr[i]);
//Allocate the memory size for the result array, based on the length.  
//The string length is the original buffer_size plus 1, so that we can put '\\0' at the end of a string.  
res[i] = (char*) malloc((buffer_size + 1) * sizeof(char));
if (res[i] == NULL) {
fprintf(stderr, "fail to malloc %lld", i);
exit(-2);
}
strcpy(res[i], buffer);
}
}
*/
//Clone an array
long long* clone(long long *arr, long long size) {
	long long *ptr = NULL;
	//Clone all the values from board array due to immutable Whiley value
	ptr = (long long*) malloc(size * sizeof(long long));
	//ptr = (long long*)tcmalloc(size*sizeof(long long));
	if (ptr == NULL) {
		printf("fail to malloc at clone function in Util.c\n");
		exit(-2);
	}
	//Use memcpy to clone an array
	memcpy(ptr, arr, size * sizeof(long long));
	return ptr;
}

/**
* Append op1 and op2 arrays into a new array.
* This append function meets value semantics
* as it creates a new array and makes no change to op1 and op2 arrays.
*/
long long* append(long long *arr1, long long arr1_size,
				  long long* arr2, long long arr2_size) {
	long long *ret_arr = NULL;
	long long size = 0;
	//Get the size of return array.
	size = arr1_size + arr2_size;
	//Allocate the return array.
	ret_arr = (long long*) realloc(arr1, size * sizeof(long long));
	//Check if the memory allocation is successful.
	if (ret_arr == NULL) {
		printf("fail to allocate the memory at append function in Util.c\n");
		exit(-2);
	}
	 //Fill in op_2 array
	memcpy(&ret_arr[arr1_size], arr2, arr2_size * sizeof(long long));
	//Return the array
	return ret_arr;
}

//Append op_2 to op_1 and return the op_1.
//Resize the list one bye one and append each item to the list. Use the 'call by the reference' to update the array size.
//see http://rosettacode.org/wiki/Array_concatenation#C
/*long long* append(long long* op_1, long long* op_1_size, long long* op_2, long long* op_2_size, long long* ret_size){
long long i = 0;
long long *ret =NULL;
long long allocated_size = 0;
//Assign the ret with op. That means both of them address to same memory location. In other word, copy the array.
ret = op_1;
//The allocated size is the original list size plus the right list size.
allocated_size = *op_1_size+*op_2_size;
//Resize the array size of 'ret'.
ret = (long long*)realloc(ret, allocated_size*sizeof(long long));
if(ret == NULL) {fprintf(stderr,"fail to realloc"); exit(0);}

//Copy the items from op_2 source and append them to the pointer of ret array at index of op_1_size.
memcpy(&ret[*op_1_size], op_2, *op_2_size*sizeof(long long));
*ret_size = *op_1_size+*op_2_size;
return ret;
}*/
/**Print out a long long integer*/
void indirect_printf(long long input) {
	printf("%lld\n", input);
}

/**Print out an array of long long integers. If the array size > 10, then 
print the first 10 items and the last item.*/
void indirect_printf_array(long long* input, long long input_size) {
	long long i = 0;
	//Determines whether to add ','.
	int isFirst = true;
	int max_i = 10;
	printf("\n[");
	//Print the first 10 items
	for (i = 0; i < input_size && i < max_i; i++) {
		if (isFirst) {
			printf("%lld", input[i]);
			isFirst = false;
		} else {
			printf(",%lld", input[i]);
		}
	}
	//Print the '...' to represent the remaing items and the last item.
	if (input_size > i) {
		printf(" ... %lld", input[input_size - 1]);
	}
	printf("]\n");
}

//Check if the number is a power of 2.
//See also http://www.exploringbinary.com/ten-ways-to-check-if-an-integer-is-a-power-of-two-in-c/
int isPowerof2(long long value) {
	//0 is the exceptional case.
	if (value == 0)
		return 1;
	return ((value != 0) && !(value & (value - 1)));
}
//Optimizes the Append function by resizing the array by the power of 2. This reduces the number of resizing tasks.
long long* optimized_append(long long* op_1, long long* op_1_size, long long* op_2, long long* op_2_size, long long* ret_size) {
	long long i;
	long long *ret;
	long long allocated_size;
	//Assign the res with op. That means both of them address to same memory location. In other word, copy the array.
	ret = op_1;
	//Check if the size is a power of 2. If so, then reallocate the array size.
	if (isPowerof2(*op_1_size)) {
		allocated_size = 2;
		//Realloc the array size of 'res'. Allocate the array size by power of 2.
		while (allocated_size < (*op_1_size + *op_2_size)) {
			allocated_size *= 2;
		}
		ret = (long long*) realloc(ret, allocated_size * sizeof(long long));
		if (ret == NULL) {
			printf("fail to realloc at optimized_append functon in Util.c\n");
			exit(-2);
		}
	}
	//Update the item in the appended list.
	for (i = 0; i < *op_2_size; i++) {
		ret[*op_1_size + i] = op_2[i];
	}
	*ret_size = *op_1_size + *op_2_size;
	return ret;
}