#include "While.h"
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
long long f(long long _0){
	long long _13;
	long long _14;
	long long _3;
	long long _4;
	long long _5;
	long long _6;
	long long _11;
	//const %4 = 0 : int
	_4 = 0;
	//assign %3 = %4  : int
	_3 = _4;
	//const %6 = 0 : int
	_6 = 0;
	//assign %5 = %6  : int
	_5 = _6;
	//loop (%3, %5)
		//ifge %3, %0 goto blklab2 : int
	while(_3<_0){
		//add %11 = %5, %3 : int
		_11=_5+_3;
		//assign %5 = %11  : int
		_5 = _11;
		//const %13 = 1 : int
		_13 = 1;
		//add %14 = %3, %13 : int
		_14=_3+_13;
		//assign %3 = %14  : int
		_3 = _14;
		//nop
		;
	//end blklab1
	}
//.blklab2
blklab2:;
	//return %5 : int
	return _5;
}
int main(int argc, char** argv){
	long long _1;
	long long _2;
	long long _3;
	long long _6;
	long long _8;
	char str[1024];
	char _8_str[1024];
	char _9[1024];
	//const %3 = 50000 : int
	_3 = 50000;
	//assert blklab4
	{
		//const %6 = 1000000 : int
		_6 = 1000000;
		//ifle %3, %6 goto blklab3 : int
		if(_3<=_6){goto blklab3;}
		//fail ""precondition not satisfied""
		perror("fail ""precondition not satisfied""");
//.blklab3
blklab3:;
	}
//.blklab4
blklab4:;
	//invoke %2 = (%3) While:f : function(int) => int
	_2=f(_3);
	//assign %1 = %2  : int
	_1 = _2;
	//fieldload %5 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %6 = %5 println : {method(any) => void print,method(any) => void println}
	//const %7 = "Sum=" : string
	char _7[5] = "Sum=";
	//assign %8 = %1  : int
	_8 = _1;
	//invoke %8 = (%8) whiley/lang/Any:toString : function(any) => string
	sprintf(_8_str, "%lld", _8);
	//sappend %9 = %7, %8 : string
	strcpy(_9, _7);
	strcat(_9, _8_str);
	//indirectinvoke %6 (%9) : method(any) => void
	printf("%s\n",_9);
	//return
	return -1;
}
