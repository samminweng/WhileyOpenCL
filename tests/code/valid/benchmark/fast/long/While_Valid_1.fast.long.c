#include "While_Valid_1.h"
long* clone(long *arr, long size){
	long *ptr;
	long i;
	//Clone all the values from board array due to immutable Whiley value
	ptr = (long*)malloc(size*sizeof(long));
	if(ptr == NULL) {fprintf(stderr,"fail to malloc"); exit(0);}	//Copy data from 'board' array to 'nboard' array
	for(i=0;i<size;i++){
		ptr[i]=arr[i];
	}
	return ptr;
}
long* append(long* op_1, long op_1_size, long* op_2, long op_2_size){
	long i;
	long *res;
	long res_size;
	//Assign the res with op. That means both of them address to same memory location. In other word, copy the array.
	//Realloc the array size of 'res'
	res = op_1;
	res_size = op_1_size+op_2_size;
	res = (long*)realloc(res, (op_1_size+op_2_size)*sizeof(long));
	if(res == NULL) {fprintf(stderr,"fail to realloc"); exit(0);}	for(i=0;i<op_2_size;i++){
		res[op_1_size+i]=op_2[i];
	}
	return res;
}
/*Print out each string in a list of string.*/
void indirect_printf(long* res, long _res_size){
	long i;
	printf("\n[");
	for(i=0;i<_res_size;i++){
		printf("%ld,",res[i]);
	}
	printf("]\n");
}
/**Frees the memory space allocated for the pointer of pointer.*/
void free_doublePtr(char** res, long res_size){
	long i;
	for(i=0;i<res_size;i++){
		free(res[i]);
	}
	free(res);
}
long* reverse(long* _0, long _0_size){
	long _1;
	long _11;
	long _13;
	long _15;
	long _16;
	long _20;
	long _25;
	long _27;
	long _28;
	long _3;
	long _30;
	long _31;
	long _32;
	long _33;
	long _34;
	long _35;
	long* _4;
	long _4_size;
	long _8;
	//lengthof %3 = %0 : [int]
	_3 = _0_size;
	//assign %1 = %3  : int
	_1 = _3;
	//lengthof %30 = %0 : [int]
	_30 = _0_size;
	//assign %4 = %0  : [int]
	_4 = clone(_0, _0_size);
	_4_size = _0_size;
	//const %31 = 0 : int
	_31 = 0;
	//assign %32 = %31  : int
	_32 = _31;
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
	//loop (%1, %4, %32)
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
		//assert blklab9
		{
			//const %33 = 0 : int
			_33 = 0;
			//ifge %32, %33 goto blklab10 : int
			if(_32>=_33){goto blklab10;}
			//fail ""index out of bounds (negative)""
			fprintf(stderr,"fail ""index out of bounds (negative)""");
			exit(0);
//.blklab10
blklab10:;
			//lengthof %33 = %4 : [int]
			_33 = _4_size;
			//iflt %32, %33 goto blklab9 : int
			if(_32<_33){goto blklab9;}
			//fail ""index out of bounds (not less than length)""
			fprintf(stderr,"fail ""index out of bounds (not less than length)""");
			exit(0);
		}
//.blklab9
blklab9:;
		//update %4[%32] = %20 : [int] -> [int]
		_4[_32] = _20;
		//const %34 = 1 : int
		_34 = 1;
		//add %35 = %32, %34 : int
		_35=_32+_34;
		//assign %32 = %35  : int
		_32 = _35;
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
	//assert blklab11
	{
		//ifeq %32, %30 goto blklab11 : int
		if(_32==_30){goto blklab11;}
		//fail ""assertion failed""
		fprintf(stderr,"fail ""assertion failed""");
		exit(0);
	}
//.blklab11
blklab11:;
	//return %4 : [int]
	return _4;
}
int main(int argc, char** argv){
	FILE *fp;
	long* _1;
	long* _10;
	long _10_size;
	long* _11;
	long _11_size;
	long* _12;
	long _12_size;
	long* _17;
	long _17_size;
	long* _18;
	long _18_size;
	long _1_size;
	long _3;
	long _4;
	long _5_size;
	long _6;
	long* _9;
	long _9_size;
	double diff;
	clock_t end;
	long iteration;
	clock_t start;
	//const %1 = [] : [void]
	_1=(long*)malloc(1*sizeof(long));
	if(_1 == NULL) {fprintf(stderr,"fail to malloc"); exit(0);}
	_1_size = 0;
	//convert %1 = %1 [int] : [void]
	//const %3 = 0 : int
	_3 = 0;
	//const %4 = 10000 : int
	//_4 = 10000;
	//const %4 = 10000 : int
	//_4 = 10000;
	//Take input parameter as the array size.
    sscanf(argv[1], "%ld", &_4);	
	//range %5 = %3, %4 : [int]
	//forall %6 in %5 (%1) : [int]
	for(_6=_3;_6<_4;_6++){
		//newlist %9 = (%6) : [int]
		_9=(long*)malloc(1*sizeof(long));
		if(_9 == NULL) {fprintf(stderr,"fail to malloc"); exit(0);}
		_9_size=1;
		//newlist %9 = (%6) : [int]
		_9[0]=_6;
		//append %10 = %1, %9 : [int]
		_10_size = _1_size+_9_size;
		_10=append(_1, _1_size,_9, _9_size);
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
	_12=NULL;
	for(iteration=0;iteration<10;iteration++){
		start = clock();
		if(_12!= NULL){ free(_12);}
		//invoke %12 = (%1) While_Valid_1:reverse : function([int]) => [int]
		_12_size=_1_size;
		_12=reverse(_1 , _1_size);
		end = clock();
		fp= fopen("result.txt", "a");
		fprintf(fp, "Array size:%ld\tExecution time of reverse function(seconds):%.10lf\n", _4, ((double)(end - start))/CLOCKS_PER_SEC);
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
	indirect_printf(_17, _17_size);

	if(_1!=NULL){free(_1);};
	if(_12!=NULL){free(_12);};
	//return
	return -1;
}
/* Convert an array of long integer into an array of string.*/
void toString(long arr[], long size, char** res){
	long i;
	char buffer[1024];	
	if(res == NULL) { fprintf(stderr,"fail to malloc res in toString(long arr[], long size, char** res)"); exit(0);}
	i=0;
	for(i=0;i<size;i++){	
		//Write the array element (long) to the buffer and get the length 
		long length = sprintf(buffer, "%ld", arr[i]);
		//Allocate the memory size for the result array, based on the length.
		//The string length is the original buffer_size plus 1, so that we can put '\0' at the end of a string.
		res[i] = (char*)malloc((length+1)*sizeof(char));
		if(res[i] == NULL) {
			fprintf(stderr,"fail to malloc %ld", i);
		 	exit(0);
		}
		strcpy(res[i],  buffer);
	}
}
