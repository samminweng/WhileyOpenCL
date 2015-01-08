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
	char _7[1024];
	long long _5;
	long long _6;
	long long _9;
	char _5_str[1024];
	char str[1024];
	//fieldload %2 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %3 = %2 println : {method(any) => void print,method(any) => void println}
	//const %4 = "Sum=" : string
	char _4[5] = "Sum=";
	//const %6 = 5 : int
	_6 = 5;
	//assert blklab4
	{
		//const %9 = 1000000 : int
		_9 = 1000000;
		//ifle %6, %9 goto blklab3 : int
		if(_6<=_9){goto blklab3;}
		//fail ""precondition not satisfied""
		perror("fail ""precondition not satisfied""");
//.blklab3
blklab3:;
	}
//.blklab4
blklab4:;
	//invoke %5 = (%6) While:f : function(int) => int
	_5=f(_6);
	//invoke %5 = (%5) whiley/lang/Any:toString : function(any) => string
	sprintf(_5_str, "%ld", _5);
	//sappend %7 = %4, %5 : string
	strcpy(_7, _4);
	strcat(_7, _5_str);
	//indirectinvoke %3 (%7) : method(any) => void
	printf("%s\n",_7);
	//return
	return -1;
}
