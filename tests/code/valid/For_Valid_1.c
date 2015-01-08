#include "For_Valid_1.h"
long long* clone(long long *arr, long long size){
	long long *ptr;
	long long i;
	//Clone all the values from board array due to immutable Whiley value
	ptr = (long long*)malloc(size*sizeof(long long));
	//Copy data from 'board' array to 'nboard' array
	for(i=0;i<size;i++){
		ptr[i]=arr[i];
	}
	return ptr;
}
char* toString(long long arr[], long long size, char *str){
	long long i;
	i=0;
	strcpy(str, "[");
	for(i=0;i<size;i++){
		if(arr[i]==true){
			strcat(str, "true");
		}else{
			strcat(str, "false");
		}
		if(i<size-1){
			strcat(str, ", ");
		}
	}
	strcat(str, "]");
	return str;
}
int main(int argc, char** argv){
	long long _12;
	char _11[1024];
	long long _2;
	long long _3;
	long long _4;
	long long* _5;
	long long _5_size;
	char str[1024];
	//const %2 = 1 : int
	_2 = 1;
	//const %3 = 2 : int
	_3 = 2;
	//const %4 = 3 : int
	_4 = 3;
	//newlist %5 = (%2, %3, %4) : [int]
	_5=(long long*)malloc(3*sizeof(long long));
	//newlist %5 = (%2, %3, %4) : [int]
	_5_size=3;
	//newlist %5 = (%2, %3, %4) : [int]
	_5[0]=_2;
	//newlist %5 = (%2, %3, %4) : [int]
	_5[1]=_3;
	//newlist %5 = (%2, %3, %4) : [int]
	_5[2]=_4;
	//fieldload %9 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %10 = %9 println : {method(any) => void print,method(any) => void println}
	//assign %12 = %7  : int
	_12 = _7;
	//invoke %11 = (%12) whiley/lang/Any:toString : function(any) => string
	sprintf(_11, "%ld", _12);
	//indirectinvoke %10 (%11) : method(any) => void
	printf("%s\n",_11);
	//nop
	;
//end blklab0
}
//.blklab1
blklab1:;
//return
return -1;
}
