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
	long long* _21;
	long long _21_size;
	long long* _22;
	long long _22_size;
	long long _25;
	long long _27;
	long long _28;
	long long _3;
	long long* _4;
	long long _4_size;
	long long _8;
	//lengthof %3 = %0 : [int]
	_3 = _0_size;
	//assign %1 = %3  : int
	_1 = _3;
	//const %4 = [] : [void]
	_4=(long long*)malloc(1*sizeof(long long));
	_4_size = 0;
	//convert %4 = %4 [int] : [void]
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
	//loop (%1, %4)
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
		//newlist %21 = (%20) : [int]
		_21=(long long*)malloc(1*sizeof(long long));
		//newlist %21 = (%20) : [int]
		_21_size=1;
		//newlist %21 = (%20) : [int]
		_21[0]=_20;
		//append %22 = %4, %21 : [int]
		_22_size = _4_size+_21_size;
		_22=(long long*)malloc(_22_size*sizeof(long long));
		append(_4, _4_size,_21, _21_size, _22);

		//assign %4 = %22  : [int]
		_4 = clone(_22, _22_size);
		_4_size = _22_size;
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
	//return %4 : [int]
	return _4;
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
