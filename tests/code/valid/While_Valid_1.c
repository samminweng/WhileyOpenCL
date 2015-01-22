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
	long long _10;
	long long _13;
	long long _15;
	long long _18;
	long long _20;
	long long _22;
	long long _24;
	long long _25;
	long long _3;
	long long _32;
	long long _34;
	long long _35;
	long long _38;
	long long _40;
	long long _44;
	long long _45;
	long long _6;
	long long* _7;
	long long _7_size;
	long long* _8;
	long long _8_size;
	long long _9;
	//lengthof %3 = %0 : [int]
	_3 = _0_size;
	//assign %1 = %3  : int
	_1 = _3;
	//lengthof %6 = %0 : [int]
	_6 = _0_size;
	//assign %8 = %0  : [int]
	_8 = clone(_0, _0_size);
	_8_size = _0_size;
	//assign %7 = %8  : [int]
	_7 = clone(_8, _8_size);
	_7_size = _8_size;
	//const %10 = 0 : int
	_10 = 0;
	//assign %9 = %10  : int
	_9 = _10;
	//assert blklab2
	{
		//lengthof %13 = %0 : [int]
		_13 = _0_size;
		//ifgt %3, %13 goto blklab3 : int
		if(_3>_13){goto blklab3;}
		//const %15 = 0 : int
		_15 = 0;
		//ifge %10, %15 goto blklab2 : int
		if(_10>=_15){goto blklab2;}
//.blklab3
blklab3:;
		//fail ""loop invariant not satisfied on entry""
		fprintf(stderr,"fail ""loop invariant not satisfied on entry""");
		exit(0);
	}
//.blklab2
blklab2:;
	//loop (%1, %7, %9)
	//assume blklab4
	{
		//lengthof %18 = %0 : [int]
		_18 = _0_size;
		//ifgt %1, %18 goto blklab5 : int
		if(_1>_18){goto blklab5;}
		//const %20 = 0 : int
		_20 = 0;
		//ifge %9, %20 goto blklab4 : int
		if(_9>=_20){goto blklab4;}
//.blklab5
blklab5:;
		//fail """"
		fprintf(stderr,"fail """"");
		exit(0);
	}
//.blklab4
blklab4:;
	//const %22 = 0 : int
	_22 = 0;
		//ifle %1, %22 goto blklab1 : int
	while(_1>_22){
		//const %24 = 1 : int
		_24 = 1;
		//sub %25 = %1, %24 : int
		_25=_1-_24;
		//assign %1 = %25  : int
		_1 = _25;
		//assert blklab10
		{
			//const %44 = 0 : int
			_44 = 0;
			//ifge %25, %44 goto blklab9 : int
			if(_25>=_44){goto blklab9;}
			//fail ""index out of bounds (negative)""
			fprintf(stderr,"fail ""index out of bounds (negative)""");
			exit(0);
//.blklab9
blklab9:;
			//lengthof %45 = %0 : [int]
			_45 = _0_size;
			//iflt %25, %45 goto blklab10 : int
			if(_25<_45){goto blklab10;}
			//fail ""index out of bounds (not less than length)""
			fprintf(stderr,"fail ""index out of bounds (not less than length)""");
			exit(0);
		}
//.blklab10
blklab10:;
		//assert blklab12
		{
			//const %44 = 0 : int
			_44 = 0;
			//ifge %25, %44 goto blklab11 : int
			if(_25>=_44){goto blklab11;}
			//fail ""index out of bounds (negative)""
			fprintf(stderr,"fail ""index out of bounds (negative)""");
			exit(0);
//.blklab11
blklab11:;
			//lengthof %45 = %0 : [int]
			_45 = _0_size;
			//iflt %25, %45 goto blklab12 : int
			if(_25<_45){goto blklab12;}
			//fail ""index out of bounds (not less than length)""
			fprintf(stderr,"fail ""index out of bounds (not less than length)""");
			exit(0);
		}
//.blklab12
blklab12:;
		//indexof %32 = %0, %25 : [int]
		_32=_0[_25];
		//assert blklab14
		{
			//const %45 = 0 : int
			_45 = 0;
			//ifge %9, %45 goto blklab13 : int
			if(_9>=_45){goto blklab13;}
			//fail ""index out of bounds (negative)""
			fprintf(stderr,"fail ""index out of bounds (negative)""");
			exit(0);
//.blklab13
blklab13:;
			//lengthof %45 = %7 : [int]
			_45 = _7_size;
			//iflt %9, %45 goto blklab14 : int
			if(_9<_45){goto blklab14;}
			//fail ""index out of bounds (not less than length)""
			fprintf(stderr,"fail ""index out of bounds (not less than length)""");
			exit(0);
		}
//.blklab14
blklab14:;
		//update %7[%9] = %32 : [int] -> [int]
		_7[_9] = _32;
		//const %34 = 1 : int
		_34 = 1;
		//add %35 = %9, %34 : int
		_35=_9+_34;
		//assign %9 = %35  : int
		_9 = _35;
		//assert blklab6
		{
			//lengthof %38 = %0 : [int]
			_38 = _0_size;
			//ifgt %25, %38 goto blklab7 : int
			if(_25>_38){goto blklab7;}
			//const %40 = 0 : int
			_40 = 0;
			//ifge %35, %40 goto blklab6 : int
			if(_35>=_40){goto blklab6;}
//.blklab7
blklab7:;
			//fail ""loop invariant not restored""
			fprintf(stderr,"fail ""loop invariant not restored""");
			exit(0);
		}
//.blklab6
blklab6:;
		//nop
		;
	//end blklab0
	}
//.blklab1
blklab1:;
	//assert blklab8
	{
		//ifeq %9, %6 goto blklab8 : int
		if(_9==_6){goto blklab8;}
		//fail ""assertion failed""
		fprintf(stderr,"fail ""assertion failed""");
		exit(0);
	}
//.blklab8
blklab8:;
	//return %7 : [int]
	return _7;
}
int main(int argc, char** argv){
	long long* _1;
	char _12[1024];
	long long* _13;
	long long _13_size;
	long long _1_size;
	long long* _2;
	size_t _2_size;
	long long _3;
	long long _4;
	long long _5;
	long long _6;
	long long _7;
	long long* _8;
	long long _8_size;
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
	//newlist %8 = (%3, %4, %5, %6, %7) : [int]
	_8=(long long*)malloc(5*sizeof(long long));
	//newlist %8 = (%3, %4, %5, %6, %7) : [int]
	_8_size=5;
	//newlist %8 = (%3, %4, %5, %6, %7) : [int]
	_8[0]=_3;
	//newlist %8 = (%3, %4, %5, %6, %7) : [int]
	_8[1]=_4;
	//newlist %8 = (%3, %4, %5, %6, %7) : [int]
	_8[2]=_5;
	//newlist %8 = (%3, %4, %5, %6, %7) : [int]
	_8[3]=_6;
	//newlist %8 = (%3, %4, %5, %6, %7) : [int]
	_8[4]=_7;
	//invoke %2 = (%8) While_Valid_1:reverse : function([int]) => [int]
	_2_size=_8_size;
	_2=reverse(_8 , _8_size);
	//assign %1 = %2  : [int]
	_1 = clone(_2, _2_size);
	_1_size = _2_size;
	//fieldload %10 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %11 = %10 println : {method(any) => void print,method(any) => void println}
	//assign %13 = %1  : [int]
	_13 = clone(_1, _1_size);
	_13_size = _1_size;
	//convert %13 = %13 any : [int]
	//invoke %12 = (%13) whiley/lang/Any:toString : function(any) => string
	toString(_13 , _13_size, _12);
	//convert %12 = %12 any : string
	//indirectinvoke %11 (%12) : method(any) => void
	printf("%s\n",_12);
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
