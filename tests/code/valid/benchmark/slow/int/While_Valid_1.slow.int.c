#include "While_Valid_1.h"
int* clone(int *arr, int size){
	int *ptr;
	int i;
	//Clone all the values from board array due to immutable Whiley value
	ptr = (int*)malloc(size*sizeof(int));
	//Copy data from 'board' array to 'nboard' array
	for(i=0;i<size;i++){
		ptr[i]=arr[i];
	}
	return ptr;
}
int* append(int* op_1, int op_1_size, int* op_2, int op_2_size){
	int i;
	int *res;
	int res_size;
	//Assign the res with op. That means both of them address to same memory location. In other word, copy the array.
	//Realloc the array size of 'res'
	res = op_1;
	res_size = op_1_size+op_2_size;
	res = (int*)realloc(res, (op_1_size+op_2_size)*sizeof(int));
	for(i=0;i<op_2_size;i++){
		res[op_1_size+i]=op_2[i];
	}
	return res;
}
/*Print out each string in a list of string.*/
void indirect_printf(char** res, int _res_size){
	int i;
	printf("\n[");
	for(i=0;i<_res_size;i++){
		printf("%s,",res[i]);
	}
	printf("]\n");
}
/**Frees the memory space allocated for the pointer of pointer.*/
void free_doublePtr(char** res, int res_size){
	int i;
	for(i=0;i<res_size;i++){
		free(res[i]);
	}
	free(res);
}
int* reverse(int* _0, int _0_size){
	int _1;
	int _11;
	int _13;
	int _15;
	int _16;
	int _20;
	int* _21;
	int _21_size;
	int* _22;
	int _22_size;
	int _25;
	int _27;
	int _28;
	int _3;
	int* _4;
	int _4_size;
	int _8;
	//lengthof %3 = %0 : [int]
	_3 = _0_size;
	//assign %1 = %3  : int
	_1 = _3;
	//const %4 = [] : [void]
	_4=(int*)malloc(1*sizeof(int));
	_4_size = 0;
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
		_21=(int*)malloc(1*sizeof(int));
		_21_size=1;
		//newlist %21 = (%20) : [int]
		_21[0]=_20;
		//append %22 = %4, %21 : [int]
		_22_size = _4_size+_21_size;
		_22=append(_4, _4_size,_21, _21_size);
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
	int* _1;
	int* _10;
	int _10_size;
	int* _11;
	int _11_size;
	int* _12;
	size_t _12_size;
	char** _17;
	size_t _17_size;
	int* _18;
	int _18_size;
	int _1_size;
	int _3;
	int _4;
	size_t _5_size;
	int _6;
	int* _9;
	int _9_size;
	double diff;
	clock_t end;
	clock_t start;
	diff=0;
	//const %1 = [] : [void]
	_1=(int*)malloc(1*sizeof(int));
	_1_size = 0;
	//convert %1 = %1 [int] : [void]
	//const %3 = 0 : int
	_3 = 0;
	//const %4 = 10000 : int
	//_4 = 10000;
	//Take input parameter as the array size.
    sscanf(argv[1], "%lld", &_4);
	//range %5 = %3, %4 : [int]
	//forall %6 in %5 (%1) : [int]
	for(_6=_3;_6<_4;_6++){
		//newlist %9 = (%6) : [int]
		_9=(int*)malloc(1*sizeof(int));
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
	start = clock();
	//invoke %12 = (%1) While_Valid_1:reverse : function([int]) => [int]
	_12_size=_1_size;
	_12=reverse(_1 , _1_size);
	end = clock();
	fp= fopen("result.txt", "a");
	fprintf(fp, "Array size:%lld\tIteration:%d\tExecution time of reverse function(seconds):%.10lf\n", _4, ((double)(end - start))/CLOCKS_PER_SEC);
	fclose(fp);
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
	_17= toString(_18, _18_size);
	_17_size =_18_size;
	//convert %17 = %17 any : string
	//indirectinvoke %16 (%17) : method(any) => void
	indirect_printf(_17, _17_size);

	free(_1);
	free(_12);
	free_doublePtr(_17, _17_size);
	//return
	return -1;
}
/* Convert an array of int integer into an array of string.*/
char** toString(int arr[], int size){
	int i;
	char** res;
	res = (char**)malloc(size*sizeof(char*));
	i=0;
	for(i=0;i<size;i++){		
		char buffer[1024];
		//Write the array element (int) to the buffer and get the length 
		int length = sprintf(buffer, "%lld", arr[i]);
		//Allocate the memory size for the result array, based on the length.
		//The string length is the original buffer_size plus 1, so that we can put '\0' at the end of a string.
		res[i] = (char*)malloc((length+1)*sizeof(char));
		strcpy(res[i],  buffer);		
	}	
	return res;
}
