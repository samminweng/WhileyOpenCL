#include "Util.h"
// Convert an array of long long integer into an array of string.  
void toString(long long arr[], long long size, char** res){  
	long long i;  
	char buffer[1024];	  
	if(res == NULL) {
		fprintf(stderr, "fail to malloc res in toString(long long arr[], long long size, char** res)\n");
		exit(0);
	}  
	i=0;  
	for(i=0;i<size;i){	  
		//Write the array element (long long) to the buffer and get the length   
		long long length = sprintf(buffer, "%lld", arr[i]);  
		//Allocate the memory size for the result array, based on the length.  
		//The string length is the original buffer_size plus 1, so that we can put '\\0' at the end of a string.  
		res[i] = (char*)malloc((length+1)*sizeof(char));  
		if(res[i] == NULL) {  
			fprintf(stderr,"fail to malloc %lld", i);  
			exit(0);  
		}  
		strcpy(res[i],  buffer);  
	}  
}
//Clone an array
long long* clone(long long *arr, long long size){
	long long *ptr;
	long long i;
	long long threshold;
	threshold = 1000*1000;
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
//Append op_2 to op_1 and return the op_1.
//Resize the list one bye one and append each item to the list. Use the 'call by the reference' to update the array size.
long long* append(long long* op_1, long long* op_1_size, long long* op_2, long long* op_2_size, long long* ret_size){
	long long i;
	long long *ret;
	long long allocated_size;
	//Assign the ret with op. That means both of them address to same memory location. In other word, copy the array.
	ret = op_1;
	//The allocated size is the original list size plus the right list size.
	allocated_size = *op_1_size+*op_2_size;
	//Resize the array size of 'ret'.				
	ret = (long long*)realloc(ret, allocated_size*sizeof(long long));
	if(ret == NULL) {fprintf(stderr,"fail to realloc"); exit(0);}
	
	//Update the item in the appended list.
	for(i=0;i<*op_2_size;i++){
		ret[*op_1_size+i]=op_2[i];
	}
	*ret_size = *op_1_size+*op_2_size;
	return ret;
}
/**Print out a long long integer*/
void indirect_printf(long long input){
	printf("%lld\n", input);
}