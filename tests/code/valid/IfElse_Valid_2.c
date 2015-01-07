#include "IfElse_Valid_2.h"
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
	long long _7;
	long long _3;
	long long _5;
	long long _6;
	long long _2;
	//const %2 = 10 : int
	_2 = 10;
	//ifge %0, %2 goto blklab0 : int
	if(_0>=_2){goto blklab0;}
	//const %3 = 1 : int
	_3 = 1;
	//return %3 : int
	return _3;
//.blklab0
blklab0:
	//const %5 = 10 : int
	_5 = 10;
	//ifle %0, %5 goto blklab2 : int
	if(_0<=_5){goto blklab2;}
	//const %6 = 2 : int
	_6 = 2;
	//return %6 : int
	return _6;
//.blklab2
blklab2:
//.blklab1
blklab1:
	//const %7 = 0 : int
	_7 = 0;
	//return %7 : int
	return _7;
}
int main(int argc, char** argv){
	char _10[1024];
	long long _18;
	char _22[1024];
	long long _29;
	long long _17;
	char _4[1024];
	long long _23;
	long long _24;
	long long _12;
	long long _31;
	long long _30;
	char str[1024];
	char _28[1024];
	long long _11;
	char _16[1024];
	long long _5;
	long long _6;
	//fieldload %2 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %3 = %2 println : {method(any) => void print,method(any) => void println}
	//const %6 = 1 : int
	_6 = 1;
	//invoke %5 = (%6) IfElse_Valid_2:f : function(int) => int
	_5=f(_6);
	//invoke %4 = (%5) whiley/lang/Any:toString : function(any) => string
	sprintf(_4, "%ld", _5);
	//indirectinvoke %3 (%4) : method(any) => void
	printf("%s\n",_4);
	//fieldload %8 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %9 = %8 println : {method(any) => void print,method(any) => void println}
	//const %12 = 10 : int
	_12 = 10;
	//invoke %11 = (%12) IfElse_Valid_2:f : function(int) => int
	_11=f(_12);
	//invoke %10 = (%11) whiley/lang/Any:toString : function(any) => string
	sprintf(_10, "%ld", _11);
	//indirectinvoke %9 (%10) : method(any) => void
	printf("%s\n",_10);
	//fieldload %14 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %15 = %14 println : {method(any) => void print,method(any) => void println}
	//const %18 = 11 : int
	_18 = 11;
	//invoke %17 = (%18) IfElse_Valid_2:f : function(int) => int
	_17=f(_18);
	//invoke %16 = (%17) whiley/lang/Any:toString : function(any) => string
	sprintf(_16, "%ld", _17);
	//indirectinvoke %15 (%16) : method(any) => void
	printf("%s\n",_16);
	//fieldload %20 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %21 = %20 println : {method(any) => void print,method(any) => void println}
	//const %24 = 1212 : int
	_24 = 1212;
	//invoke %23 = (%24) IfElse_Valid_2:f : function(int) => int
	_23=f(_24);
	//invoke %22 = (%23) whiley/lang/Any:toString : function(any) => string
	sprintf(_22, "%ld", _23);
	//indirectinvoke %21 (%22) : method(any) => void
	printf("%s\n",_22);
	//fieldload %26 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %27 = %26 println : {method(any) => void print,method(any) => void println}
	//const %30 = 1212 : int
	_30 = 1212;
	//neg %31 = %30 : int
	_31= -_30;
	//invoke %29 = (%31) IfElse_Valid_2:f : function(int) => int
	_29=f(_31);
	//invoke %28 = (%29) whiley/lang/Any:toString : function(any) => string
	sprintf(_28, "%ld", _29);
	//indirectinvoke %27 (%28) : method(any) => void
	printf("%s\n",_28);
	//return
	return -1;
}
