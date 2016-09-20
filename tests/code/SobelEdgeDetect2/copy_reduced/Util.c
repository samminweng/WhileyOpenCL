#include "Util.h"
/**
 * Slice the array into two array from start to end (exclusively).
 */
long long* slice(long long* arr, size_t arr_size, int start, int end){
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
 * Given array size and initial value, create an array of long long integers. 
 */
long long* create1DArray_LONGLONG(long long value, size_t arr_size){
	
	long long* arr = NULL;
	// Allocate the array
	arr = (long long*)malloc(arr_size*sizeof(long long));
	if(arr == NULL){
		fprintf(stderr, "fail to allocate the memory at create1DArray function in Util.c\n");
		exit(-2);
	}
	// Initialize each element with the given value.
	for(size_t i=0;i<arr_size;i++){
		arr[i] = value;
	}
	return arr;
}
/*
 * Given array size and initial value, create an array of BYTE
 */
BYTE* create1DArray_BYTE(BYTE value, size_t arr_size){
	BYTE* arr = NULL;
	// Allocate the array
	arr = (BYTE*)malloc(arr_size*sizeof(BYTE));
	if(arr == NULL){
		fprintf(stderr, "fail to allocate the memory at create1DArray_BYTE function in Util.c\n");
		exit(-2);
	}
	// Assign value
	for(size_t i =0;i<arr_size;i++){
		arr[i] = value;
	}
	return arr;
}

// Copy an array of BYTE
BYTE* copy1DArray_BYTE(BYTE *arr, size_t size){
	BYTE *ptr = NULL;
	ptr = (BYTE*)malloc(size*sizeof(BYTE));
	if(ptr == NULL){
		fprintf(stderr, "failed to malloc at copy1DArray_BYTE function in Util.c\n");
		exit(-2);
	}
	// Copy 'arr' to 'ptr' array
	memcpy(ptr, arr, size*sizeof(BYTE));
	return ptr;
}

//Copy an integer array
long long* copy1DArray_LONGLONG(long long *arr, size_t size){
	long long *ptr = NULL;
	//Clone all the values from board array due to immutable Whiley value
	ptr = (long long*) malloc(size * sizeof(long long));
	//ptr = (long long*)tcmalloc(size*sizeof(long long));
	if (ptr == NULL) {
		fprintf(stderr, "fail to malloc at copy1DArray_LONG function in Util.c\n");
		exit(-2);
	}
	//Use memcpy to clone an array
	memcpy(ptr, arr, size * sizeof(long long));
	return ptr;
}

/**
 *  Combine an array of integers into an integer,
 *  e.g. arr = {1, 0} is converted into 10
 *	And return a integer pointer
 * 
 */
long long* parseStringToInt(long long* arr){
	size_t i=0;
	long long value=0;
	while(arr[i]>=0&&arr[i]<=9){
		value = value*10+arr[i];
		i++;
	}
	long long* p = malloc(sizeof(long long));
	*p = value;
	return p;
}

/**
 *
 *  Converts command list arugments into an array of integers (0 ~ 9),
 *  e.g. args[1]={'1', '0'} is converted into arr[0] = {1, 0}.
 *  The arr_size is passed by reference, so its value is updated after
 *  the function call.
 **/
long long** convertArgsToIntArray(int argc, char** args){
	long long** arr;
	//Check if there is any command line argument
	if(argc < 2){
		fprintf(stderr, "Missing the command line arguments\n");
		exit(-2);
	}
	//Allocate the target array ('arr').
	arr = (long long**) malloc((argc-1)*sizeof(long long*));
	if(arr == NULL){
		fprintf(stderr, "fail to allocate the memory at convertCharToInt function in Util.c\n");
		exit(-2);
	}

	//Skip 1st arguement as it is the exec file name.
	for(size_t i=1;i<argc;i++){
		// Array index
		size_t index=i-1;
		// The length of each argument
		size_t max=0;
		// Check if the argument is an integer
		if(isdigit(args[i][0])){
			// Convert an integer into an array of digits
			// Calculate the array size
			while(args[i][max] != '\0'){
				if(!isdigit(args[i][max])){
					fprintf(stderr,"None numbers is passed via command line arguments\n");
					exit(-2);
				}
				max++;
			}

			//Allocate the array of arr[arr_size]
			arr[index] = (long long*)malloc((max+1)*sizeof(long long));

			//Fill in the array
			size_t j;
			for(j=0;j<max;j++){
				arr[index][j] = args[i][j] - '0';
			}
			//Add '\0' to indicate the end of the array.
			arr[index][j] = -1;
		}else{
			// Convert a string to an array of ASCII code (integer)
			//And calculate the arr_size
			while(args[i][max] != '\0'){
				max++;
			}
			//Allocate the array of arr[arr_size]
			arr[index] = (long long*)malloc((max+1)*sizeof(long long));

			//Fill in the array
			size_t j;
			for(j=0;j<max;j++){
				// Convert the char to integers
				long long long_i = args[i][j];
				arr[index][j] = long_i;
			}
			//Add '\0' to indicate the end of the array.
			arr[index][j] = '\0';
		}

	}
	return arr;
}

//Check if both arrays are the same. 1: true, 0: false.
int isArrayEqual(long long* arr1, size_t arr1_size, long long* arr2, size_t arr2_size) {
	//Check if array size is the same.
	if (arr1_size != arr2_size) {
		return 0;
	}
	//Compare each element.
	for (size_t i = 0; i < arr1_size; i++) {
		if (arr1[i] != arr2[i]) {
			return 0;
		}
	}
	//Both of arrays are the same. Return true
	return 1;
}
/*
//Create 2D array using an array of pointers, i.e. allocating each sub-array in different memory space
long long** create2DArray_LONGLONG(long long* arr, size_t n, size_t m){
	long long** _2DArray = NULL;
	// Allocate the array
	_2DArray = (long long**)malloc(n*sizeof(long long*));
	if(_2DArray == NULL){
		fprintf(stderr, "fail to allocate the memory at create2DArray_LONGLONG function in Util.c\n");
		exit(-2);
	}
	long long size = m*sizeof(long long);
	for(size_t i=0;i<n;i++){
		// Copy the input array and assign it to matrix.
		_2DArray[i] = (long long*)malloc(size);
		if(_2DArray[i] == NULL){
			fprintf(stderr, "fail to allocate the memory at create2DArray_LONGLONG function in Util.c\n");
			exit(-2);
		}
		memcpy(_2DArray[i], arr, size);
	}
	return _2DArray;
}
// Clone a 2D array 
long long** copy2DArray_LONGLONG(long long **arr, size_t n, size_t m){
	long long** _2DArray = (long long**)malloc(n*sizeof(long long*));
	if(_2DArray == NULL){
		fprintf(stderr, "fail to malloc at copy2DArray_LONGLONG function in Util.c\n");
		exit(-2);
	}
	long long size = m*sizeof(long long);
	for(size_t i=0;i<n;i++){
		// Allocate an 1D array
		_2DArray[i] = (long long*)malloc(size);
		if(_2DArray[i] == NULL){
			fprintf(stderr, "fail to allocate the memory at create2DArray_LONGLONG function in Util.c\n");
			exit(-2);
		}
		memcpy(_2DArray[i], arr[i], size);
	}
	return _2DArray;
}


// Free 2D array 
void free2DArray_LONGLONG(long long** ptr, size_t size){
	// Free each sub-pointer.
	for(int i=0;i<size;i++){
		free(ptr[i]);
		ptr[i] = NULL;
	}
	// Free upper-level pointer.
	free(ptr);
	ptr = NULL;
}
*/

// Free a flat 2D array
void free2DArray_LONGLONG(long long** ptr, size_t size){
	// Free the first pointer as it is actually allocated 
	free(ptr[0]);
	// Free upper-level pointer.
	free(ptr);
	ptr = NULL;
}
// Flatten 2D array into 1D array
/// Given 1D array, create an 2D array of given dimensions (n * m) using one chuck of contiguous memory space
long long** create2DArray_LONGLONG(long long* arr, size_t n, size_t m){
	long long** _2DArray = NULL;
	// Allocate an array of pointers
	_2DArray = (long long**)malloc(n*sizeof(long long*));
	if(_2DArray == NULL){
		fprintf(stderr, "fail to allocate the memory at create2DArray_LONGLONG function in Util.c\n");
		exit(-2);
	}
	// The size of each row
	size_t r_size = m*sizeof(long long);
	// Create a chuck of contiguous memory space to store all array elements
	_2DArray[0] = (long long*)malloc(r_size*n);
	if(_2DArray[0] == NULL){
		fprintf(stderr, "fail to allocate the memory at create2DArray_LONGLONG function in Util.c\n");
		exit(-2);
	}

	// Flatten the allocated memory to a list of pointers
	for(size_t i=0;i<n;i++){
		// Compute the address and assign the address to each pointer 
		_2DArray[i] = (*_2DArray+ i* m);
		// Copy the input array 'arr' to each sub-array
		memcpy(_2DArray[i], arr, r_size);
	}
	return _2DArray;
}

/// Clone 2D flat array with given array size.
long long** copy2DArray_LONGLONG(long long **arr, size_t n, size_t m){
	long long** _2DArray = (long long**)malloc(n*sizeof(long long*));
	if(_2DArray == NULL){
		fprintf(stderr, "fail to malloc at copy2DArray_LONGLONG function in Util.c\n");
		exit(-2);
	}
	size_t r_size = m*sizeof(long long);
	// Create a chuck of contiguous memory space
	_2DArray[0] = (long long*)malloc(r_size*n);
	if(_2DArray[0] == NULL){
		fprintf(stderr, "fail to malloc at copy2DArray_LONGLONG function in Util.c\n");
		exit(-2);
	}
	
	for(size_t i=0;i<n;i++){
		// Compute the address and assign the address to each pointer 
		_2DArray[i] = (*_2DArray+ i* m);
		memcpy(_2DArray[i], arr[i], r_size);
	}
	return _2DArray;
}

/**Print out a long long integer*/
void indirect_printf(long long input) {
	printf("%lld\n", input);
}

/*
* Print out an array of long long integers. If the array size > 10, then 
* print the first 10 items and the last item.
*/
void printf1DArray_LONGLONG(long long* input, size_t input_size) {
	//Determines whether to add ','.
	int isFirst = true;
	int max_i = 10;
	printf("[");
	size_t i;
	//Print the first 10 items
	for(i = 0; i < input_size && i < max_i; i++) {
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
	printf("]");
}
// Print out an array of bye
void printf1DArray_BYTE(BYTE* input, size_t input_size) {
	printf("%s", input);
}
// Print out the first 10 array in an 2D array
void printf2DArray_LONGLONG(long long** input, size_t input_size, size_t input_size_size){
	printf("[");
	size_t i;
	for (i = 0; i < input_size && i < 10; i++) {
		printf1DArray_LONGLONG(input[i], input_size_size);
	}
	if (input_size > i) {
		printf(" ...\n"); 
		printf1DArray_LONGLONG(input[input_size - 1], input_size_size);
	}
	printf("]");
}

/**
 * Print out an array of ASCII numbers into an array of chars.
 */
void printf_s(long long* input, size_t input_size) {
	for (size_t i = 0; i < input_size ; i++) {
		// Make int to char
		char c = input[i];
		printf("%c", c);
	}
}
/**
 * Print out an array of integers with a new line.
 */
void println_s(long long* input, size_t input_size) {
	printf_s(input, input_size);
	printf("\n");
}


/**
 * Append op1 and op2 arrays into a new array.
 * This append function meets value semantics
 * as it creates a new array and makes no change to op1 and op2 arrays.
 */
long long* append(long long *arr1, size_t arr1_size, long long* arr2, size_t arr2_size) {
	long long *ret_arr = NULL;
	long long size = 0;
	//Get the size of return array.
	size = arr1_size + arr2_size;
	//Allocate the return array.
	ret_arr = (long long*) realloc(arr1, size * sizeof(long long));
	//Check if the memory allocation is successful.
	if (ret_arr == NULL) {
		fprintf(stderr, "fail to malloc at append function in Util.c\n");
		exit(-2);
	}
	//Fill in op_2 array
	memcpy(&ret_arr[arr1_size], arr2, arr2_size * sizeof(long long));
	//Return the array
	return ret_arr;
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
long long* optimized_append(long long* op_1, size_t* op_1_size, long long* op_2, size_t* op_2_size, size_t* ret_size) {
	long long *ret;
	size_t allocated_size;
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
			fprintf(stderr, "fail to realloc at optimized_append functon in Util.c\n");
			exit(-2);
		}
	}
	//Update the item in the appended list.
	for (size_t i = 0; i < *op_2_size; i++) {
		ret[*op_1_size + i] = op_2[i];
	}
	*ret_size = *op_1_size + *op_2_size;
	return ret;
}

/*
 * Convert an array of BYTE to an integer array
 */
long long* fromBytes(BYTE* input, size_t size){
	// Create an array of integer
	long long* arr = (long long*)malloc(size*sizeof(long long));
	if(arr == NULL){
		fprintf(stderr, "fail to allocate the memory at fromBytes function in Util.c\n");
		exit(-2);
	}
	for(size_t i=0;i<size;i++){
		BYTE b = input[i];
		// Convert 'char' to ASCII code (integer)
		arr[i] = b;
	}
	return arr;
}

// Read the input file name (ASCII code) and output a file pointer
FILE* Reader(long long* arr){
	// Chars array
	char filename[1024];
	// Convert an array of ASCII code to an string
	size_t i=0;
	while(arr[i]!='\0'){
		char c = arr[i];
		filename[i] = c;
		i = i + 1;
	}
	// Add the ending char
	filename[i] = '\0';

	// Open a file pointer
	FILE *fp = fopen(filename, "r");
	if(fp == NULL){
		fprintf(stderr, "fail to open the file name at 'Reader' function in Util.c\n");
		exit(-2);
	}

	return fp;
}

// Read all lines of a file and output a BYTE array
BYTE* readAll(FILE *file, size_t* _size){
	BYTE c;
	// Calculate the output size
	size_t size = 0;
	while(feof(file) != true){
      c = fgetc(file);
      //printf("%c", c);
      size = size + 1;
	}
	// Set the file position to the beginning of the file
	rewind(file);

	// Allocated byte array
	BYTE* arr = (BYTE*)malloc((size)*sizeof(BYTE));
	if(arr == NULL){
		fprintf(stderr, "fail to allocate the array at 'readAll' function in Util.c\n");
		exit(-2);
	}

	// Read the file to 'arr' array
	if(fgets(arr, size, file) == NULL){
		fprintf(stderr, "fail to read file to the array at 'readAll' function in Util.c\n");
		exit(-2);
	}

	*_size = size;
	return arr;
}


