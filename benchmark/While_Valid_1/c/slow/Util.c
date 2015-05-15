#include "Util.h"
//Global variable
double diff;
clock_t start;
clock_t end;
// Convert an array of long long integer into an array of string.  
void toString(long long arr[], long long size, char** res){  
	long long i = 0;  
	char buffer[1024];
	size_t buffer_size = 0;
	if(res == NULL) {
		fprintf(stderr, "fail to malloc res in toString(long long arr[], long long size, char** res)\n");
		exit(0);
	}  
	for(i=0;i<size;i++){	  
		//Write the array element (long long) to the buffer and get the length   
		buffer_size = sprintf(buffer, "%lld", arr[i]);  
		//Allocate the memory size for the result array, based on the length.  
		//The string length is the original buffer_size plus 1, so that we can put '\\0' at the end of a string.  
		res[i] = (char*)malloc((buffer_size+1)*sizeof(char));  
		if(res[i] == NULL) {  
			fprintf(stderr,"fail to malloc %lld", i);  
			exit(0);  
		}  
		strcpy(res[i],  buffer);  
	}  
}
//Clone an array
long long* clone(long long *arr, long long size){
	long long *ptr = NULL;
	long long i = 0;
	//Clone all the values from board array due to immutable Whiley value
	ptr = (long long*)malloc(size*sizeof(long long));
	//ptr = (long long*)tcmalloc(size*sizeof(long long));
	if(ptr == NULL) {fprintf(stderr,"fail to malloc"); exit(0);}
	//Copy data from 'board' array to 'nboard' array
	for(i=0;i<size;i++){
		ptr[i]=arr[i];
	}
	return ptr;
}

//Get the starting time.
void getStartingTime(){
	//Get the starting time.
	start = clock();
}
//Get the ending time and write out the execution time to 'result.txt' file.
void getEndingTime(char* msg){
	FILE *fp = NULL;
	//Get the ending time.
	end = clock();
	fp= fopen("append.txt", "a");
	fprintf(fp, "%s\tExecution time(seconds):%.10lf\n", msg, ((double)(end - start))/CLOCKS_PER_SEC);
	fclose(fp);
}

//Append op_2 to op_1 and return the op_1.
//Resize the list one bye one and append each item to the list. Use the 'call by the reference' to update the array size.
//see http://rosettacode.org/wiki/Array_concatenation#C
long long* append(long long* op_1, long long* op_1_size, long long* op_2, long long* op_2_size, long long* ret_size){
	long long i = 0;
	long long *ret =NULL; 
	long long allocated_size = 0;
	char str[80];
	//Assign the ret with op. That means both of them address to same memory location. In other word, copy the array.
	//ret = op_1;
	//The allocated size is the original list size plus the right list size.
	allocated_size = (*op_1_size+*op_2_size)*sizeof(long long);
	//Resize the array size of 'ret'.				
	//ret = (long long*)realloc(ret, allocated_size*sizeof(long long));
	getStartingTime();
	ret = (long long*)malloc(allocated_size);
	if(ret == NULL) {fprintf(stderr,"fail to malloc %lld bytes in append function", allocated_size); exit(0);}
	//print out the allocated memory space and the required time at array size of 1 million
	if(allocated_size%(1000000*sizeof(long long))==0){
		sprintf(str, "Allocated %lld byte in append function", allocated_size);
		getEndingTime(str);
	}

	//Copy the items from op_1 source
	memcpy(ret, op_1, *op_1_size*sizeof(long long));
	//Free op_1
	free(op_1);
	//Copy the items from op_2 source and append them to the pointer of ret array at index of op_1_size. 
	memcpy(&ret[*op_1_size], op_2, *op_2_size*sizeof(long long));
	*ret_size = *op_1_size+*op_2_size;
	return ret;
}
/**Print out a long long integer*/
void indirect_printf(long long input){
	printf("%lld\n", input);
}

/**Print out an array of long long integers. If the array size > 10, then 
print the first 10 items and the last item.*/
void indirect_printf_array(long long* input, long long input_size){
	long long i = 0;
	//Determines whether to add ','.
	int isFirst = true;
	int max_i = 10;
	printf("\n[");
	//Print the first 10 items
	for(i=0;i<input_size&&i<max_i;i++){
		if(isFirst){
			printf("%lld",input[i]);
			isFirst = false;
		}else{
			printf(",%lld",input[i]);
		}
	}
	//Print the '...' to represent the remaing items and the last item.
	if(input_size>i){
		printf(" ... %lld", input[input_size-1]);
	}
	printf("]\n");
}


//Check if the number is a power of 2.
//See also http://www.exploringbinary.com/ten-ways-to-check-if-an-integer-is-a-power-of-two-in-c/
int isPowerof2(long long value){
	//0 is the exceptional case.
	if(value == 0) return 1;
	return ((value != 0) && !(value & (value - 1)));
}
//Optimizes the Append function by resizing the array by the power of 2. This reduces the number of resizing tasks.
long long* optimized_append(long long* op_1, long long* op_1_size, long long* op_2, long long* op_2_size, long long* ret_size){
	long long i;
	long long *ret;
	long long allocated_size;
	//Assign the res with op. That means both of them address to same memory location. In other word, copy the array.
	ret = op_1;
	//Check if the size is a power of 2. If so, then reallocate the array size.
	if(isPowerof2(*op_1_size)){
		allocated_size = 2;
		//Realloc the array size of 'res'. Allocate the array size by power of 2.
		while(allocated_size < (*op_1_size+*op_2_size)){
			allocated_size *= 2;
		}				
		ret = (long long*)realloc(ret, allocated_size*sizeof(long long));
		if(ret == NULL) {fprintf(stderr,"fail to realloc"); exit(0);}
	}
	//Update the item in the appended list.
	for(i=0;i<*op_2_size;i++){
		ret[*op_1_size+i]=op_2[i];
	}
	*ret_size = *op_1_size+*op_2_size;
	return ret;
}
//Read the string as a long long integer. 
void readStringAsInteger(char* str, long long* input){
	sscanf(str, "%lld", input);
}

