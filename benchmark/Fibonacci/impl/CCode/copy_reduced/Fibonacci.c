#include "Fibonacci.h"
long long* fibonacci(_DECL_1DARRAY_PARAM(ls), long long n){
	_DECL_1DARRAY(_2);
	long long _3 = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	_DECL_1DARRAY(_8);
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	//const %3 = 1 : int
	_3 = 1;
	//ifgt %1, %3 goto blklab0 : int
	if(n>_3){goto blklab0;}
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 0 : int
	_5 = 0;
	//update %0[%5] = %4 : int[] -> int[]
	ls[_5] = _4;
	//const %6 = 1 : int
	_6 = 1;
	//const %7 = 1 : int
	_7 = 1;
	//update %0[%7] = %6 : int[] -> int[]
	ls[_7] = _6;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//const %9 = 1 : int
	_9 = 1;
	//sub %10 = %1, %9 : int
	_10=n-_9;
	//invoke (%8) = (%0, %10) Fibonacci:fibonacci : function(int[],int)->(int[])
	_1DARRAY_SIZE(_8, ls);
	_8 = fibonacci(_1DARRAY_PARAM(ls), _10);
	//assign %0 = %8  : int[]
	_1DARRAY_UPDATE(ls, _8);
	//const %11 = 1 : int
	_11 = 1;
	//sub %12 = %1, %11 : int
	_12=n-_11;
	//indexof %13 = %0, %12 : int[]
	_13=ls[_12];
	//const %14 = 2 : int
	_14 = 2;
	//sub %15 = %1, %14 : int
	_15=n-_14;
	//indexof %16 = %0, %15 : int[]
	_16=ls[_15];
	//add %17 = %13, %16 : int
	_17=_13+_16;
	//update %0[%1] = %17 : int[] -> int[]
	ls[n] = _17;
//.blklab1
blklab1:;
	//return %0
	return ls;
	//return
}

int main(int argc, char** args){
	long long max;
	_DECL_1DARRAY(arr);
	long long _3;
	_DECL_2DARRAY(_4);
	long long _5 = 0;
	_DECL_1DARRAY(_6);
	long long _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_1DARRAY(_9);
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	long long _25 = 0;
	long long _26 = 0;
	long long _27 = 0;
	void* _28;
	_DECL_1DARRAY(_30);
	//fieldload %4 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_4);
	//const %5 = 0 : int
	_5 = 0;
	//indexof %6 = %4, %5 : int[][]
	_6=_4[_5];
	//invoke (%3) = (%6) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_3, _6);
	//assign %1 = %3  : null|int
	max = _3;
	//ifis %1, null goto blklab2 : null|int
	if(max == NULL) { goto blklab2;}
	//const %7 = 0 : int
	_7 = 0;
	//arraygen %8 = [7; 1] : int[]
	_GEN_1DARRAY(_8, max, _7);
	//assign %2 = %8  : int[]
	_1DARRAY_UPDATE(arr, _8);
	//const %10 = 1 : int
	_10 = 1;
	//sub %11 = %1, %10 : int
	_11=max-_10;
	//invoke (%9) = (%2, %11) Fibonacci:fibonacci : function(int[],int)->(int[])
	_1DARRAY_SIZE(_9, arr);
	_9 = fibonacci(_1DARRAY_PARAM(arr), _11);
	//assign %2 = %9  : int[]
	_1DARRAY_UPDATE(arr, _9);
	//assert
	{
		//const %12 = 0 : int
		_12 = 0;
		//indexof %13 = %2, %12 : int[]
		_13=arr[_12];
		//const %14 = 0 : int
		_14 = 0;
		//ifeq %13, %14 goto blklab3 : int
		if(_13==_14){goto blklab3;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab3
blklab3:;
	//assert
	}
	//assert
	{
		//const %15 = 1 : int
		_15 = 1;
		//indexof %16 = %2, %15 : int[]
		_16=arr[_15];
		//const %17 = 1 : int
		_17 = 1;
		//ifeq %16, %17 goto blklab4 : int
		if(_16==_17){goto blklab4;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab4
blklab4:;
	//assert
	}
	//assert
	{
		//const %18 = 1 : int
		_18 = 1;
		//sub %19 = %1, %18 : int
		_19=max-_18;
		//indexof %20 = %2, %19 : int[]
		_20=arr[_19];
		//const %21 = 2 : int
		_21 = 2;
		//sub %22 = %1, %21 : int
		_22=max-_21;
		//indexof %23 = %2, %22 : int[]
		_23=arr[_22];
		//const %24 = 3 : int
		_24 = 3;
		//sub %25 = %1, %24 : int
		_25=max-_24;
		//indexof %26 = %2, %25 : int[]
		_26=arr[_25];
		//add %27 = %23, %26 : int
		_27=_23+_26;
		//ifeq %20, %27 goto blklab5 : int
		if(_20==_27){goto blklab5;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab5
blklab5:;
	//assert
	}
	//fieldload %28 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %29 = %28 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %30 = [80,97,115,115,32,70,105,98,111,110,97,99,99,105,32,116,101,115,116,32,99,97,115,101] : int[]
	_NEW_ARRAY(_30, 24);
	_30[0] = 80; _30[1] = 97; _30[2] = 115; _30[3] = 115; _30[4] = 32; _30[5] = 70; _30[6] = 105; _30[7] = 98; _30[8] = 111; _30[9] = 110; _30[10] = 97; _30[11] = 99; _30[12] = 99; _30[13] = 105; _30[14] = 32; _30[15] = 116; _30[16] = 101; _30[17] = 115; _30[18] = 116; _30[19] = 32; _30[20] = 99; _30[21] = 97; _30[22] = 115; _30[23] = 101; 
	//indirectinvoke () = %29 (%30) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_30));
//.blklab2
blklab2:;
	//return
	exit(0);
}

