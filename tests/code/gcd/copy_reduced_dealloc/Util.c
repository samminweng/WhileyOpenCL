#include "Util.h"
/**
 * Slice the array into two array from start to end (exclusively).
 */
int64_t* slice(int64_t* arr, size_t arr_size, int start, int end){
	int64_t* sub_arr = NULL;
	sub_arr = (int64_t*)malloc((end - start)*sizeof(int64_t));
	if(sub_arr == NULL){
		printf("fail to allocate the memory at slice function in Util.c\n");
		exit(-2);
	}	
	memcpy(sub_arr, &arr[start], (end - start)*sizeof(int64_t));
	return sub_arr;
}

/**
 * Given array size and initial value, create an array of int64_t integers. 
 */
int64_t* create1DArray_int64_t(int64_t value, size_t arr_size){
	
	int64_t* arr = NULL;
	// Allocate the array
	arr = (int64_t*)malloc(arr_size*sizeof(int64_t));
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
int64_t* copy1DArray_int64_t(int64_t *arr, size_t size){
	int64_t *ptr = NULL;
	//Clone all the values from board array due to immutable Whiley value
	ptr = (int64_t*) malloc(size * sizeof(int64_t));
	//ptr = (int64_t*)tcmalloc(size*sizeof(int64_t));
	if (ptr == NULL) {
		fprintf(stderr, "fail to malloc at copy1DArray_LONG function in Util.c\n");
		exit(-2);
	}
	//Use memcpy to clone an array
	memcpy(ptr, arr, size * sizeof(int64_t));
	return ptr;
}

/**
 *  Combine an array of integers into an integer,
 *  e.g. arr = {1, 0} is converted into 10
 *	And return a integer pointer
 * 
 */
int64_t* parseStringToInt(int64_t* arr){
	size_t i=0;
	int64_t value=0;
	while(arr[i]>=0&&arr[i]<=9){
		value = value*10+arr[i];
		i++;
	}
	int64_t* p = malloc(sizeof(int64_t));
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
int64_t** convertArgsToIntArray(int argc, char** args, size_t *arr_size, size_t *arr_size_size){
	int64_t** arr;
	//Check if there is any command line argument
	if(argc < 2){
		fprintf(stderr, "Missing the command line arguments\n");
		exit(-2);
	}
	//Allocate the target array ('arr').
	arr = (int64_t**) malloc((argc-1)*sizeof(int64_t*));
	if(arr == NULL){
		fprintf(stderr, "fail to allocate the memory at convertCharToInt function in Util.c\n");
		exit(-2);
	}

	// Update the output array size
	*arr_size = argc -1;

	//Skip 1st arguement as it is the exec file name.
	for(size_t i=1;i<argc;i++){
		// Array index
		size_t index=i-1;
		// The length of each argument
		size_t length=0;
		// Check if the argument is an integer
		if(isdigit(args[i][0])){
			// Convert an integer into an array of digits
			// Calculate the array size
			while(args[i][length] != '\0'){
				if(!isdigit(args[i][length])){
					fprintf(stderr,"None numbers is passed via command line arguments\n");
					exit(-2);
				}
				length++;
			}

			//Allocate the array of arr[arr_size]
			arr[index] = (int64_t*)malloc((length+1)*sizeof(int64_t));

			//Fill in the array
			size_t j;
			for(j=0;j<length;j++){
				arr[index][j] = args[i][j] - '0';
			}
			//Add '\0' to indicate the end of the array.
			arr[index][j] = -1;

			// Update the array size with length
			*arr_size_size = length + 1;

		}else{
			// Convert a string to an array of ASCII code (integer)
			//And calculate the arr_size
			while(args[i][length] != '\0'){
				length++;
			}
			//Allocate the array of arr[arr_size]
			arr[index] = (int64_t*)malloc((length+1)*sizeof(int64_t));

			//Fill in the array
			size_t j;
			for(j=0;j<length;j++){
				// Convert the char to integers
				int64_t long_i = args[i][j];
				arr[index][j] = long_i;
			}
			//Add '\0' to indicate the end of the array.
			arr[index][j] = '\0';

			// Update the array size with length
			*arr_size_size = length + 1;

		}
	}

	return arr;
}

//Check if two arrays of integers are the same 
bool isArrayEqual_int64_t(int64_t* arr1, size_t arr1_size, int64_t* arr2, size_t arr2_size) {
	//Check if array size is the same.
	if (arr1_size != arr2_size) {
		return false;
	}
	//Compare each element.
	for (size_t i = 0; i < arr1_size; i++) {
		if (arr1[i] != arr2[i]) {
			return false;
		}
	}
	//Two arrays are the same. Return true
	return true;
}

//Check if two arrays of BYTE are the same
bool isArrayEqual_BYTE(BYTE* arr1, size_t arr1_size, BYTE* arr2, size_t arr2_size) {
	//Check if array size is the same.
	if (arr1_size != arr2_size) {
		return false;
	}
	//Compare each element.
	for (size_t i = 0; i < arr1_size; i++) {
		if (arr1[i] != arr2[i]) {
			return false;
		}
	}
	//Both of arrays are the same. Return true
	return true;
}
/*
//Create 2D array using an array of pointers, i.e. allocating each sub-array in different memory space
int64_t** create2DArray_int64_t(int64_t* arr, size_t n, size_t m){
	int64_t** _2DArray = NULL;
	// Allocate the array
	_2DArray = (int64_t**)malloc(n*sizeof(int64_t*));
	if(_2DArray == NULL){
		fprintf(stderr, "fail to allocate the memory at create2DArray_int64_t function in Util.c\n");
		exit(-2);
	}
	int64_t size = m*sizeof(int64_t);
	for(size_t i=0;i<n;i++){
		// Copy the input array and assign it to matrix.
		_2DArray[i] = (int64_t*)malloc(size);
		if(_2DArray[i] == NULL){
			fprintf(stderr, "fail to allocate the memory at create2DArray_int64_t function in Util.c\n");
			exit(-2);
		}
		memcpy(_2DArray[i], arr, size);
	}
	return _2DArray;
}
// Clone a 2D array 
int64_t** copy2DArray_int64_t(int64_t **arr, size_t n, size_t m){
	int64_t** _2DArray = (int64_t**)malloc(n*sizeof(int64_t*));
	if(_2DArray == NULL){
		fprintf(stderr, "fail to malloc at copy2DArray_int64_t function in Util.c\n");
		exit(-2);
	}
	int64_t size = m*sizeof(int64_t);
	for(size_t i=0;i<n;i++){
		// Allocate an 1D array
		_2DArray[i] = (int64_t*)malloc(size);
		if(_2DArray[i] == NULL){
			fprintf(stderr, "fail to allocate the memory at create2DArray_int64_t function in Util.c\n");
			exit(-2);
		}
		memcpy(_2DArray[i], arr[i], size);
	}
	return _2DArray;
}


// Free 2D array 
void free2DArray_int64_t(int64_t** ptr, size_t size){
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
void free2DArray_int64_t(int64_t** ptr, size_t size){
	// Free the first pointer as it is actually allocated 
	free(ptr[0]);
	// Free upper-level pointer.
	free(ptr);
	ptr = NULL;
}
// Flatten 2D array into 1D array
/// Given 1D array, create an 2D array of given dimensions (n * m) using one chuck of contiguous memory space
int64_t** create2DArray_int64_t(int64_t* arr, size_t n, size_t m){
	int64_t** _2DArray = NULL;
	// Allocate an array of pointers
	_2DArray = (int64_t**)malloc(n*sizeof(int64_t*));
	if(_2DArray == NULL){
		fprintf(stderr, "fail to allocate the memory at create2DArray_int64_t function in Util.c\n");
		exit(-2);
	}
	// The size of each row
	size_t r_size = m*sizeof(int64_t);
	// Create a chuck of contiguous memory space to store all array elements
	_2DArray[0] = (int64_t*)malloc(r_size*n);
	if(_2DArray[0] == NULL){
		fprintf(stderr, "fail to allocate the memory at create2DArray_int64_t function in Util.c\n");
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
int64_t** copy2DArray_int64_t(int64_t **arr, size_t n, size_t m){
	int64_t** _2DArray = (int64_t**)malloc(n*sizeof(int64_t*));
	if(_2DArray == NULL){
		fprintf(stderr, "fail to malloc at copy2DArray_int64_t function in Util.c\n");
		exit(-2);
	}
	size_t r_size = m*sizeof(int64_t);
	// Create a chuck of contiguous memory space
	_2DArray[0] = (int64_t*)malloc(r_size*n);
	if(_2DArray[0] == NULL){
		fprintf(stderr, "fail to malloc at copy2DArray_int64_t function in Util.c\n");
		exit(-2);
	}
	
	for(size_t i=0;i<n;i++){
		// Compute the address and assign the address to each pointer 
		_2DArray[i] = (*_2DArray+ i* m);
		memcpy(_2DArray[i], arr[i], r_size);
	}
	return _2DArray;
}

/**Print out a int64_t integer*/
void indirect_printf(int64_t input) {
	printf("%"PRId64"\n", input);
}

/*
* Print out an array of int64_t integers. If the array size > 10, then 
* print the first 10 items and the last item.
*/
void printf1DArray_int64_t(int64_t* input, size_t input_size) {
	//Determines whether to add ','.
	int isFirst = true;
	//int max = 30;
	printf("[");
	size_t i = 0;
	//Print the first 10 items
	while(i < input_size && i < MAX_LENGTH) {
		if (isFirst) {
			printf("%"PRId64, input[i]);
			isFirst = false;
		} else {
			printf(",%"PRId64, input[i]);
		}
		i++;
	}
	//Print the '...' to represent the remaing items and the last item.
	if (input_size > MAX_LENGTH) {
		printf(" ... %"PRId64, input[input_size - 1]);
	}
	printf("]\n");
}
// Print out an array of bye
void printf1DArray_BYTE(BYTE* input, size_t input_size) {
	printf("%s", input);
}
// Print out the first 10 array in an 2D array
void printf2DArray_int64_t(int64_t** input, size_t input_size, size_t input_size_size){
	printf("[");	
	size_t i = 0;
	while (i < input_size && i < MAX_LENGTH) {
		printf1DArray_int64_t(input[i], input_size_size);
		i++;
	}
	if (input_size > MAX_LENGTH) {
		printf(" ...\n"); 
		printf1DArray_int64_t(input[input_size - 1], input_size_size);
	}
	printf("]\n");
}

/**
 * Print out an array of ASCII numbers into an array of chars.
 */
void printf_s(int64_t* input, size_t input_size) {
	// Print the first MAX_LENGTH chars
	size_t i =0;
	while (i < input_size && i < MAX_LENGTH) {
		// Make int to char
		char c = input[i];
		// Check if c is NOT EOF and skip 'EOF' char 
		// Note 0 (ASCII NUL) indicates the EOF
		if(c>0){
			printf("%c", c);
		}
		i++;
	}
	// Print the last char
	if (input_size > MAX_LENGTH) {
		printf(" ... ");
		char c = input[input_size - 1];
		printf("%c", c);
	}
}
/**
 * Print out an array of integers with a new line.
 */
void println_s(int64_t* input, size_t input_size) {
	printf_s(input, input_size);
	printf("\n");
}


/**
 * Append op1 and op2 arrays into a new array.
 * This append function meets value semantics
 * as it creates a new array and makes no change to op1 and op2 arrays.
 */
/*int64_t* append(int64_t *arr1, size_t arr1_size, int64_t* arr2, size_t arr2_size) {
	int64_t *ret_arr = NULL;
	int64_t size = 0;
	//Get the size of return array.
	size = arr1_size + arr2_size;
	//Allocate the return array.
	ret_arr = (int64_t*) realloc(arr1, size * sizeof(int64_t));
	//Check if the memory allocation is successful.
	if (ret_arr == NULL) {
		fprintf(stderr, "fail to malloc at append function in Util.c\n");
		exit(-2);
	}
	//Fill in op_2 array
	memcpy(&ret_arr[arr1_size], arr2, arr2_size * sizeof(int64_t));
	//Return the array
	return ret_arr;
}*/
//Check if the number is a power of 2.
//See also http://www.exploringbinary.com/ten-ways-to-check-if-an-integer-is-a-power-of-two-in-c/
int isPowerof2(int64_t value) {
	//0 is the exceptional case.
	if (value == 0)
		return 1;
	return ((value != 0) && !(value & (value - 1)));
}
//Optimizes the Append function by resizing the array by the power of 2. This reduces the number of resizing tasks.
int64_t* optimized_append(int64_t* op_1, size_t* op_1_size, int64_t* op_2, size_t* op_2_size, size_t* ret_size) {
	int64_t *ret;
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
		ret = (int64_t*) realloc(ret, allocated_size * sizeof(int64_t));
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
int64_t* fromBytes(BYTE* input, size_t size){
	// Create an array of integer
	int64_t* arr = (int64_t*)malloc(size*sizeof(int64_t));
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
FILE* Reader(int64_t* arr, size_t arr_size){
	// Chars array
	char tmp[1024];
	// Convert an array of ASCII code to an string
	size_t i=0;
	while(i<arr_size){
		char c = arr[i];
		tmp[i] = c;
		i = i + 1;
	}
	// Add the ending (null-terminated)
	tmp[i] = '\0';

	char filename[arr_size+1];
	// Copy 'tmp' string to filename;
	strcpy(filename, tmp);
	//printf("%s\n", filename);

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
	// Calculate the output size
	size_t size = 0;
	while(feof(file) != true){
      BYTE c = fgetc(file);
      //printf("%c", c);
      size = size + 1;
	}
	// Set the file position to the beginning of the file
	rewind(file);

	// Allocated byte array. Note the last char (EOF)
	BYTE* arr = (BYTE*)malloc(size*sizeof(BYTE));
	if(arr == NULL){
		fprintf(stderr, "fail to allocate the array at 'readAll' function in Util.c\n");
		exit(-2);
	}

	// Read the file to 'arr' array. Note 'fgets' reads a string upto '\n'
	// The return of 'fread' function is 0 when the file is successfully loaded to array
	size_t result = fread(arr, size, 1, file);
	if(result != 0){
		fprintf(stderr, "fail to read file to the array at 'readAll' function in Util.c\n");
		exit(-2);
	}

	*_size = size;
	return arr;
}


