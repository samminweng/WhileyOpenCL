#include "While_Valid_1.h"
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

long long* reverse(long long* _0, long long _0_size){
	long long _1;
	long long _11;
	long long _13;
	long long _15;
	long long _16;
	long long _20;
	long long _25;
	long long _27;
	long long _28;
	long long _3;
	long long _30;
	long long _31;
	long long _32;
	long long _33;
	long long _34;
	long long _35;
	long long* _4;
	long long _4_size;
	long long _8;
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
		//assert blklab6
		{
			//const %27 = 0 : int
			_27 = 0;
			//ifge %16, %27 goto blklab5 : int
			if(_16>=_27){goto blklab5;}
			//fail ""index out of bounds (negative)""
			fprintf(stderr,"fail ""index out of bounds (negative)""");
			exit(0);
//.blklab5
blklab5:;
			//lengthof %28 = %0 : [int]
			_28 = _0_size;
			//iflt %16, %28 goto blklab6 : int
			if(_16<_28){goto blklab6;}
			//fail ""index out of bounds (not less than length)""
			fprintf(stderr,"fail ""index out of bounds (not less than length)""");
			exit(0);
		}
//.blklab6
blklab6:;
		//indexof %20 = %0, %16 : [int]
		_20=_0[_16];
		//assert blklab7
		{
			//const %33 = 0 : int
			_33 = 0;
			//ifge %32, %33 goto blklab8 : int
			if(_32>=_33){goto blklab8;}
			//fail ""index out of bounds (negative)""
			fprintf(stderr,"fail ""index out of bounds (negative)""");
			exit(0);
//.blklab8
blklab8:;
			//lengthof %33 = %4 : [int]
			_33 = _4_size;
			//iflt %32, %33 goto blklab7 : int
			if(_32<_33){goto blklab7;}
			//fail ""index out of bounds (not less than length)""
			fprintf(stderr,"fail ""index out of bounds (not less than length)""");
			exit(0);
		}
//.blklab7
blklab7:;
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
	//assert blklab9
	{
		//ifeq %32, %30 goto blklab9 : int
		if(_32==_30){goto blklab9;}
		//fail ""assertion failed""
		fprintf(stderr,"fail ""assertion failed""");
		exit(0);
	}
//.blklab9
blklab9:;
	//return %4 : [int]
	return _4;
}
int main(int argc, char** argv){
	long long* _1;
	long long* _10;
	long long _10_size;
	char _14[1024];
	long long* _15;
	long long _15_size;
	long long _1_size;
	long long* _2;
	size_t _2_size;
	long long _3;
	long long _4;
	long long _5;
	long long _6;
	long long _7;
	long long _8;
	long long _9;
	char str[1024];
	//const %3 = 1 : int
	_3 = 1;
	//const %4 = 2 : int
	_4 = 2;
	//const %5 = 3 : int
	_5 = 3;
	//const %6 = 4 : int
	_6 = 4;
	//const %7 = 5 : int
	_7 = 5;
	//const %8 = 6 : int
	_8 = 6;
	//const %9 = 7 : int
	_9 = 7;
	//newlist %10 = (%3, %4, %5, %6, %7, %8, %9) : [int]
	_10=(long long*)malloc(7*sizeof(long long));
	//newlist %10 = (%3, %4, %5, %6, %7, %8, %9) : [int]
	_10_size=7;
	//newlist %10 = (%3, %4, %5, %6, %7, %8, %9) : [int]
	_10[0]=_3;
	//newlist %10 = (%3, %4, %5, %6, %7, %8, %9) : [int]
	_10[1]=_4;
	//newlist %10 = (%3, %4, %5, %6, %7, %8, %9) : [int]
	_10[2]=_5;
	//newlist %10 = (%3, %4, %5, %6, %7, %8, %9) : [int]
	_10[3]=_6;
	//newlist %10 = (%3, %4, %5, %6, %7, %8, %9) : [int]
	_10[4]=_7;
	//newlist %10 = (%3, %4, %5, %6, %7, %8, %9) : [int]
	_10[5]=_8;
	//newlist %10 = (%3, %4, %5, %6, %7, %8, %9) : [int]
	_10[6]=_9;
	//invoke %2 = (%10) While_Valid_1:reverse : function([int]) => [int]
	_2_size=_10_size;
	_2=reverse(_10 , _10_size);
	//assign %1 = %2  : [int]
	_1 = clone(_2, _2_size);
	_1_size = _2_size;
	//fieldload %12 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %13 = %12 println : {method(any) => void print,method(any) => void println}
	//assign %15 = %1  : [int]
	_15 = clone(_1, _1_size);
	_15_size = _1_size;
	//convert %15 = %15 any : [int]
	//invoke %14 = (%15) whiley/lang/Any:toString : function(any) => string
	toString(_15 , _15_size, _14);
	//convert %14 = %14 any : string
	//indirectinvoke %13 (%14) : method(any) => void
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
