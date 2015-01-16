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
	char _7[1024];
	char str[1024];
	long long _8;
	long long _3;
	long long _1;
	long long _2;
	//const %3 = 1 : int
	_3 = 1;
	//invoke %2 = (%3) IfElse_Valid_2:f : function(int) => int
	_2=f(_3);

	//assign %1 = %2  : int
	_1 = _2;
	//fieldload %5 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %6 = %5 println : {method(any) => void print,method(any) => void println}
	//assign %8 = %1  : int
	_8 = _1;
	//convert %8 = %8 any : int
	//invoke %7 = (%8) whiley/lang/Any:toString : function(any) => string
	sprintf(_7, "%lld", _8);
	//convert %7 = %7 any : string
	//indirectinvoke %6 (%7) : method(any) => void
	printf("%s\n",_7);
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
