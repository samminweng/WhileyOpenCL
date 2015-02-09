#include "./While.h"
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
	long long _11;
	long long _13;
	long long _14;
	long long _3;
	long long _4;
	long long _5;
	long long _6;
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
	char _11[5];
	long long _12;
	char _12_str[1024];
	long long _13;
	char _14[1024];
	long long _16;
	char _4[5];
	long long _5;
	char _5_str[1024];
	long long _6;
	char _7[1024];
	long long _9;
	char str[1024];
	//fieldload %2 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %3 = %2 println : {method(any) => void print,method(any) => void println}
	//const %4 = "Sum=" : string
	strcpy(_4, "Sum=");
	//const %6 = 5 : int
	_6 = 5;
	//assert blklab4
	{
		//const %9 = 1000000 : int
		_9 = 1000000;
		//ifle %6, %9 goto blklab3 : int
		if(_6<=_9){goto blklab3;}
		//fail ""precondition not satisfied""
		fprintf(stderr,"fail ""precondition not satisfied""");
		exit(0);
//.blklab3
blklab3:;
	}
//.blklab4
blklab4:;
	//invoke %5 = (%6) While:f : function(int) => int
	_5=f(_6);
	//convert %5 = %5 any : int
	//invoke %5 = (%5) whiley/lang/Any:toString : function(any) => string
	sprintf(_5_str, "%lld", _5);
	//sappend %7 = %4, %5 : string
	strcpy(_7, _4);
	strcat(_7, _5_str);
	//convert %7 = %7 any : string
	//indirectinvoke %3 (%7) : method(any) => void
	printf("%s\n",_7);
	//fieldload %9 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %10 = %9 println : {method(any) => void print,method(any) => void println}
	//const %11 = "Sum=" : string
	strcpy(_11, "Sum=");
	//const %13 = 50000 : int
	_13 = 50000;
	//assert blklab6
	{
		//const %16 = 1000000 : int
		_16 = 1000000;
		//ifle %13, %16 goto blklab5 : int
		if(_13<=_16){goto blklab5;}
		//fail ""precondition not satisfied""
		fprintf(stderr,"fail ""precondition not satisfied""");
		exit(0);
//.blklab5
blklab5:;
	}
//.blklab6
blklab6:;
	//invoke %12 = (%13) While:f : function(int) => int
	_12=f(_13);
	//convert %12 = %12 any : int
	//invoke %12 = (%12) whiley/lang/Any:toString : function(any) => string
	sprintf(_12_str, "%lld", _12);
	//sappend %14 = %11, %12 : string
	strcpy(_14, _11);
	strcat(_14, _12_str);
	//convert %14 = %14 any : string
	//indirectinvoke %10 (%14) : method(any) => void
	printf("%s\n",_14);
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
