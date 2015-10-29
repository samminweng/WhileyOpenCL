#include "While_Valid_1.h"
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

//Check if the number is a power of 2.
//See also http://www.exploringbinary.com/ten-ways-to-check-if-an-integer-is-a-power-of-two-in-c/
int isPowerof2(long long value){
	//0 is the exceptional case.
	if(value == 0) return 1;
	return ((value != 0) && !(value & (value - 1)));
}
//Call by the reference to update the array size.
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
/*Print out each string in a list of string.*/
void indirect_printf(long long* res, long long _res_size){
	long long i;
	printf("\n[");
	for(i=0;i<_res_size;i++){
		printf("%lld,",res[i]);
	}
	printf("]\n");
}
/**Frees the memory space allocated for the pointer of pointer.*/
void free_doublePtr(char** res, long long res_size){
	long long i;
	for(i=0;i<res_size;i++){
		free(res[i]);
	}
	free(res);
}


long long* reverse(long long* _0, long long _0_size){
	long long _1;
	long long _11;
	long long _13;
	long long _15;
	long long _16;
	long long _20;
	long long* _21;
	long long _21_size;
	long long* _22;
	long long _22_size;
	long long _25;
	long long _27;
	long long _28;
	long long _3;
	long long* _4;
	long long _4_size;
	long long _8;
	//Initialize all the variables of size
	_22_size = 0;
	_4_size = 0;
	//lengthof %3 = %0 : [int]
	_3 = _0_size;
	//assign %1 = %3  : int
	_1 = _3;
	//const %4 = [] : [void]
	_4=NULL;
	//convert %4 = %4 [int] : [void]
	//assert blklab2
	{
		//lengthof %8 = %0 : [int]
		_8 = _0_size;
		//ifle %3, %8 goto blklab2 : int
		if(_3<=_8){goto blklab2;}
		//fail ""loop invariant not satisfied on entry""
		fprintf(stderr,"fail ""loop invariant not satisfied on entry""");
		exit(0);
	}
//.blklab2
blklab2:;
	//loop (%1, %4)
	//assume blklab3
	{
		//lengthof %11 = %0 : [int]
		_11 = _0_size;
		//ifle %1, %11 goto blklab3 : int
		if(_1<=_11){goto blklab3;}
		//fail """"
		fprintf(stderr,"fail """"");
		exit(0);
	}
//.blklab3
blklab3:;
	//const %13 = 0 : int
	_13 = 0;
		//ifle %1, %13 goto blklab1 : int
	while(_1>_13){
		//const %15 = 1 : int
		_15 = 1;
		//sub %16 = %1, %15 : int
		_16=_1-_15;
		//assign %1 = %16  : int
		_1 = _16;
		//assert blklab8
		{
			//const %27 = 0 : int
			_27 = 0;
			//ifge %16, %27 goto blklab7 : int
			if(_16>=_27){goto blklab7;}
			//fail ""index out of bounds (negative)""
			fprintf(stderr,"fail ""index out of bounds (negative)""");
			exit(0);
//.blklab7
blklab7:;
			//lengthof %28 = %0 : [int]
			_28 = _0_size;
			//iflt %16, %28 goto blklab8 : int
			if(_16<_28){goto blklab8;}
			//fail ""index out of bounds (not less than length)""
			fprintf(stderr,"fail ""index out of bounds (not less than length)""");
			exit(0);
		}
//.blklab8
blklab8:;
		//indexof %20 = %0, %16 : [int]
		_20=_0[_16];
		//newlist %21 = (%20) : [int]
		_21=(long long*)malloc(1*sizeof(long long));
		if(_21 == NULL) {fprintf(stderr,"fail to malloc"); exit(0);}
		_21_size=1;
		//newlist %21 = (%20) : [int]
		_21[0]=_20;
		//append %22 = %4, %21 : [int]
		//_22_size = _4_size+_21_size;
		_22=optimized_append(_4, &_4_size,_21, &_21_size, &_22_size);
		free(_21);
		//assign %4 = %22  : [int]
		_4 = _22;
		_4_size = _22_size;
		//assert blklab4
		{
			//lengthof %25 = %0 : [int]
			_25 = _0_size;
			//ifle %16, %25 goto blklab4 : int
			if(_16<=_25){goto blklab4;}
			//fail ""loop invariant not restored""
			fprintf(stderr,"fail ""loop invariant not restored""");
			exit(0);
		}
//.blklab4
blklab4:;
		//nop
		;
	//end blklab0
	}
//.blklab1
blklab1:;
	//return %4 : [int]
	return _4;
}
int main(int argc, char** argv){
	FILE *fp;
	long long* _1;
	long long* _10;
	long long _10_size;
	long long* _11;
	long long _11_size;
	long long* _12;
	long long _12_size;
	long long* _17;
	long long _17_size;
	long long* _18;
	long long _18_size;
	long long _1_size;
	long long _3;
	long long _4;
	long long _5_size;
	long long _6;
	long long* _9;
	long long _9_size;
	double diff;
	clock_t end;
	long long iteration;
	clock_t start;
	//Initialize all the variables.
	_10_size =0;
	_12=NULL;
	//const %1 = [] : [void]
	_1=(long long*)malloc(1*sizeof(long long));
	if(_1 == NULL) {fprintf(stderr,"fail to malloc"); exit(0);}
	_1_size = 0;
	//convert %1 = %1 [int] : [void]
	//const %3 = 0 : int
	_3 = 0;
	//const %4 = 10000 : int
	_4 = 10000;
	//Take input parameter as the array size.
    	sscanf(argv[1], "%lld", &_4);	
	//range %5 = %3, %4 : [int]
	//forall %6 in %5 (%1) : [int]
	for(_6=_3;_6<_4;_6++){
		//newlist %9 = (%6) : [int]
		_9=(long long*)malloc(1*sizeof(long long));
		if(_9 == NULL) {fprintf(stderr,"fail to malloc"); exit(0);}
		_9_size=1;
		//newlist %9 = (%6) : [int]
		_9[0]=_6;
		//append %10 = %1, %9 : [int]
		//allocate the size of power of 2
		_10=optimized_append(_1, &_1_size, _9, &_9_size, &_10_size);
		free(_9);
		//assign %1 = %10  : [int]
		_1 = _10;
		_1_size = _10_size;
		//nop
		;
	//end blklab5
	}
//.blklab6
blklab6:;
	diff=0;	
	for(iteration=0;iteration<10;iteration++){
		start = clock();
		if(_12!= NULL){ free(_12);}
		//invoke %12 = (%1) While_Valid_1:reverse : function([int]) => [int]
		_12_size=_1_size;
		_12=reverse(_1 , _1_size);
		end = clock();
		fp= fopen("result.txt", "a");
		fprintf(fp, "Array size:%lld\tExecution time of reverse function(seconds):%.10lf\n", _4, ((double)(end - start))/CLOCKS_PER_SEC);
		fclose(fp);
		diff += end - start;
	}
	printf("Execution time:%.10lf seconds", diff/(CLOCKS_PER_SEC*iteration));
	//assign %11 = %12  : [int]
	_11 = _12;
	_11_size = _12_size;
	//fieldload %15 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %16 = %15 println : {method(any) => void print,method(any) => void println}
	//assign %18 = %11  : [int]
	_18 = _11;
	_18_size = _11_size;
	//convert %18 = %18 any : [int]
	//invoke %17 = (%18) whiley/lang/Any:toString : function(any) => string
	_17=_18;
	_17_size =_18_size;
	//convert %17 = %17 any : string
	//indirectinvoke %16 (%17) : method(any) => void
	//For benchmark
	//indirect_printf(_17, _17_size);

	if(_1!=NULL){free(_1);};
	if(_12!=NULL){free(_12);};
	//return
	return -1;
}
/* Convert an array of long long integer into an array of string.*/
void toString(long long arr[], long long size, char** res){
	long long i;
	char buffer[1024];	
	if(res == NULL) { fprintf(stderr,"fail to malloc res in toString(long long arr[], long long size, char** res)"); exit(0);}
	i=0;
	for(i=0;i<size;i++){	
		//Write the array element (long long) to the buffer and get the length 
		long long length = sprintf(buffer, "%lld", arr[i]);
		//Allocate the memory size for the result array, based on the length.
		//The string length is the original buffer_size plus 1, so that we can put '\0' at the end of a string.
		res[i] = (char*)malloc((length+1)*sizeof(char));
		if(res[i] == NULL) {
			fprintf(stderr,"fail to malloc %lld", i);
		 	exit(0);
		}
		strcpy(res[i],  buffer);
	}
}
