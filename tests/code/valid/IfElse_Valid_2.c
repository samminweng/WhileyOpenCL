#include "./IfElse_Valid_2.h"
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
void append(long long* op_1, long long op_1_size, long long* op_2, long long op_2_size, long long* res){
	long long i;
	long long res_i;
	res_i=0;
	for(i=0;i<op_1_size;i++){
		res[res_i]=op_1[i];
		res_i++;
	}
	for(i=0;i<op_2_size;i++){
		res[res_i]=op_2[i];
		res_i++;
	}
}

long long f(long long _0){
	long long _2;
	long long _3;
	long long _5;
	long long _6;
	long long _7;
	//const %2 = 10 : int
	_2 = 10;
	//ifge %0, %2 goto blklab0 : int
	if(_0>=_2){goto blklab0;}
	//const %3 = 1 : int
	_3 = 1;
	//return %3 : int
	return _3;
//.blklab0
blklab0:;
	//const %5 = 10 : int
	_5 = 10;
	//ifle %0, %5 goto blklab2 : int
	if(_0<=_5){goto blklab2;}
	//const %6 = 2 : int
	_6 = 2;
	//return %6 : int
	return _6;
//.blklab2
blklab2:;
//.blklab1
blklab1:;
	//const %7 = 0 : int
	_7 = 0;
	//return %7 : int
	return _7;
}
int main(int argc, char** argv){
	char _10[1024];
	long long _11;
	long long _12;
	char _16[1024];
	long long _17;
	long long _18;
	char _22[1024];
	long long _23;
	long long _24;
	long long _25;
	char _4[1024];
	long long _5;
	long long _6;
	char str[1024];
	//fieldload %2 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %3 = %2 println : {method(any) => void print,method(any) => void println}
	//const %6 = 10 : int
	_6 = 10;
	//invoke %5 = (%6) IfElse_Valid_2:f : function(int) => int
	_5=f(_6);
	//convert %5 = %5 any : int
	//invoke %4 = (%5) whiley/lang/Any:toString : function(any) => string
	sprintf(_4, "%lld", _5);
	//convert %4 = %4 any : string
	//indirectinvoke %3 (%4) : method(any) => void
	printf("%s\n",_4);
	//fieldload %8 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %9 = %8 println : {method(any) => void print,method(any) => void println}
	//const %12 = 11 : int
	_12 = 11;
	//invoke %11 = (%12) IfElse_Valid_2:f : function(int) => int
	_11=f(_12);
	//convert %11 = %11 any : int
	//invoke %10 = (%11) whiley/lang/Any:toString : function(any) => string
	sprintf(_10, "%lld", _11);
	//convert %10 = %10 any : string
	//indirectinvoke %9 (%10) : method(any) => void
	printf("%s\n",_10);
	//fieldload %14 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %15 = %14 println : {method(any) => void print,method(any) => void println}
	//const %18 = 1212 : int
	_18 = 1212;
	//invoke %17 = (%18) IfElse_Valid_2:f : function(int) => int
	_17=f(_18);
	//convert %17 = %17 any : int
	//invoke %16 = (%17) whiley/lang/Any:toString : function(any) => string
	sprintf(_16, "%lld", _17);
	//convert %16 = %16 any : string
	//indirectinvoke %15 (%16) : method(any) => void
	printf("%s\n",_16);
	//fieldload %20 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %21 = %20 println : {method(any) => void print,method(any) => void println}
	//const %24 = 1212 : int
	_24 = 1212;
	//neg %25 = %24 : int
	_25= -_24;
	//invoke %23 = (%25) IfElse_Valid_2:f : function(int) => int
	_23=f(_25);
	//convert %23 = %23 any : int
	//invoke %22 = (%23) whiley/lang/Any:toString : function(any) => string
	sprintf(_22, "%lld", _23);
	//convert %22 = %22 any : string
	//indirectinvoke %21 (%22) : method(any) => void
	printf("%s\n",_22);
	//return
	return -1;
}
char* toString(long long arr[], long long size, char *str){
	long long i;
	i=0;
	strcpy(str, "[");
	for(i=0;i<size;i++){		
		char c[1024];
		sprintf(c, "%d", arr[i]);
		strcat(str, c);		if(i<size-1){
			strcat(str, ", ");
		}
	}
	strcat(str, "]");
	return str;
}
