#include "Loop.h"
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
	long long _10;
	long long _15;
	long long _17;
	long long _18;
	long long _20;
	long long _3;
	long long _4;
	long long _5;
	long long _6;
	long long _8;
	//const %4 = 0 : int
	_4 = 0;
	//assign %3 = %4  : int
	_3 = _4;
	//const %6 = 0 : int
	_6 = 0;
	//assign %5 = %6  : int
	_5 = _6;
	//assert blklab3
	{
		//const %8 = 0 : int
		_8 = 0;
		//ifge %4, %8 goto blklab3 : int
		if(_4>=_8){goto blklab3;}
		//fail ""loop invariant not satisfied on entry""
		fprintf(stderr,"fail ""loop invariant not satisfied on entry""");
		exit(0);
	}
//.blklab3
blklab3:;
	//loop (%3, %5)
	//assume blklab4
	{
		//const %10 = 0 : int
		_10 = 0;
		//ifge %3, %10 goto blklab4 : int
		if(_3>=_10){goto blklab4;}
		//fail """"
		fprintf(stderr,"fail """"");
		exit(0);
	}
//.blklab4
blklab4:;
		//ifge %3, %0 goto blklab2 : int
	while(_3<_0){
		//add %15 = %5, %3 : int
		_15=_5+_3;
		//assign %5 = %15  : int
		_5 = _15;
		//const %17 = 1 : int
		_17 = 1;
		//add %18 = %3, %17 : int
		_18=_3+_17;
		//assign %3 = %18  : int
		_3 = _18;
		//assert blklab5
		{
			//const %20 = 0 : int
			_20 = 0;
			//ifge %18, %20 goto blklab5 : int
			if(_18>=_20){goto blklab5;}
			//fail ""loop invariant not restored""
			fprintf(stderr,"fail ""loop invariant not restored""");
			exit(0);
		}
//.blklab5
blklab5:;
		//nop
		;
	//end blklab1
	}
//.blklab2
blklab2:;
	//return %5 : int
	return _5;
}
long long f2(long long _0){
	long long _12;
	long long _15;
	long long _17;
	long long _18;
	long long _3;
	long long _4;
	long long _5;
	long long _6;
	//assign %4 = %0  : int
	_4 = _0;
	//assign %3 = %4  : int
	_3 = _4;
	//const %6 = 0 : int
	_6 = 0;
	//assign %5 = %6  : int
	_5 = _6;
	//assert blklab9
	{
		//ifle %0, %0 goto blklab9 : int
		if(_0<=_0){goto blklab9;}
		//fail ""loop invariant not satisfied on entry""
		fprintf(stderr,"fail ""loop invariant not satisfied on entry""");
		exit(0);
	}
//.blklab9
blklab9:;
	//loop (%3, %5)
	//assume blklab10
	{
		//ifle %3, %0 goto blklab10 : int
		if(_3<=_0){goto blklab10;}
		//fail """"
		fprintf(stderr,"fail """"");
		exit(0);
	}
//.blklab10
blklab10:;
	//const %12 = 0 : int
	_12 = 0;
		//iflt %3, %12 goto blklab8 : int
	while(_3>=_12){
		//add %15 = %5, %3 : int
		_15=_5+_3;
		//assign %5 = %15  : int
		_5 = _15;
		//const %17 = 1 : int
		_17 = 1;
		//sub %18 = %3, %17 : int
		_18=_3-_17;
		//assign %3 = %18  : int
		_3 = _18;
		//assert blklab11
		{
			//ifle %18, %0 goto blklab11 : int
			if(_18<=_0){goto blklab11;}
			//fail ""loop invariant not restored""
			fprintf(stderr,"fail ""loop invariant not restored""");
			exit(0);
		}
//.blklab11
blklab11:;
		//nop
		;
	//end blklab7
	}
//.blklab8
blklab8:;
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
	char _18[5];
	long long _19;
	char _19_str[1024];
	long long _20;
	char _21[1024];
	long long _23;
	char _25[5];
	long long _26;
	char _26_str[1024];
	long long _27;
	char _28[1024];
	long long _30;
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
	//assert blklab13
	{
		//const %9 = 1000000 : int
		_9 = 1000000;
		//ifle %6, %9 goto blklab12 : int
		if(_6<=_9){goto blklab12;}
		//fail ""precondition not satisfied""
		fprintf(stderr,"fail ""precondition not satisfied""");
		exit(0);
//.blklab12
blklab12:;
	}
//.blklab13
blklab13:;
	//invoke %5 = (%6) Loop:f : function(int) => int
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
	//assert blklab15
	{
		//const %16 = 1000000 : int
		_16 = 1000000;
		//ifle %13, %16 goto blklab14 : int
		if(_13<=_16){goto blklab14;}
		//fail ""precondition not satisfied""
		fprintf(stderr,"fail ""precondition not satisfied""");
		exit(0);
//.blklab14
blklab14:;
	}
//.blklab15
blklab15:;
	//invoke %12 = (%13) Loop:f : function(int) => int
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
	//fieldload %16 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %17 = %16 println : {method(any) => void print,method(any) => void println}
	//const %18 = "Sum=" : string
	strcpy(_18, "Sum=");
	//const %20 = 5 : int
	_20 = 5;
	//assert blklab17
	{
		//const %23 = 1000000 : int
		_23 = 1000000;
		//ifle %20, %23 goto blklab16 : int
		if(_20<=_23){goto blklab16;}
		//fail ""precondition not satisfied""
		fprintf(stderr,"fail ""precondition not satisfied""");
		exit(0);
//.blklab16
blklab16:;
	}
//.blklab17
blklab17:;
	//invoke %19 = (%20) Loop:f2 : function(int) => int
	_19=f2(_20);
	//convert %19 = %19 any : int
	//invoke %19 = (%19) whiley/lang/Any:toString : function(any) => string
	sprintf(_19_str, "%lld", _19);
	//sappend %21 = %18, %19 : string
	strcpy(_21, _18);
	strcat(_21, _19_str);
	//convert %21 = %21 any : string
	//indirectinvoke %17 (%21) : method(any) => void
	printf("%s\n",_21);
	//fieldload %23 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %24 = %23 println : {method(any) => void print,method(any) => void println}
	//const %25 = "Sum=" : string
	strcpy(_25, "Sum=");
	//const %27 = 50000 : int
	_27 = 50000;
	//assert blklab19
	{
		//const %30 = 1000000 : int
		_30 = 1000000;
		//ifle %27, %30 goto blklab18 : int
		if(_27<=_30){goto blklab18;}
		//fail ""precondition not satisfied""
		fprintf(stderr,"fail ""precondition not satisfied""");
		exit(0);
//.blklab18
blklab18:;
	}
//.blklab19
blklab19:;
	//invoke %26 = (%27) Loop:f2 : function(int) => int
	_26=f2(_27);
	//convert %26 = %26 any : int
	//invoke %26 = (%26) whiley/lang/Any:toString : function(any) => string
	sprintf(_26_str, "%lld", _26);
	//sappend %28 = %25, %26 : string
	strcpy(_28, _25);
	strcat(_28, _26_str);
	//convert %28 = %28 any : string
	//indirectinvoke %24 (%28) : method(any) => void
	printf("%s\n",_28);
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
