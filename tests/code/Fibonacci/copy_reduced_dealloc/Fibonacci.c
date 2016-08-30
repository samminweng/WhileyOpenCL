#include "Fibonacci.h"
long long* fibonacci(_DECL_1DARRAY_PARAM(ls), _DECL_DEALLOC_PARAM(ls), long long n){
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	long long _3 = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
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
	{
		_UPDATE_1DARRAY_SIZE(_8, ls);
		_DEALLOC(_8);
		_8 = fibonacci(_1DARRAY_PARAM(ls), false, _10);
		_REMOVE_DEALLOC(ls);
		_ADD_DEALLOC(_8);
	}
	//assign %0 = %8  : int[]
	_DEALLOC(ls);
	_UPDATE_1DARRAY(ls, _8);
	_TRANSFER_DEALLOC(ls, _8);
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
	_DEALLOC(_2);
	_DEALLOC(_8);
	return ls;
	//return
}

int main(int argc, char** args){
	long long max = 0;
	_DECL_1DARRAY(arr);
	_DECL_DEALLOC(arr);
	long long _3 = 0;
	long long _4 = 0;
	_DECL_1DARRAY(_5);
	_DECL_DEALLOC(_5);
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
	void* _20;
	void* _22;
	_DECL_1DARRAY(_24);
	_DECL_DEALLOC(_24);
	//const %3 = 10 : int
	_3 = 10;
	//assign %1 = %3  : int
	max = _3;
	//const %4 = 0 : int
	_4 = 0;
	//arraygen %5 = [4; 1] : int[]
	_DEALLOC(_5);
	_NEW_1DARRAY(_5, max, _4);
	_ADD_DEALLOC(_5);
	//assign %2 = %5  : int[]
	_DEALLOC(arr);
	_UPDATE_1DARRAY(arr, _5);
	_TRANSFER_DEALLOC(arr, _5);
	//const %7 = 1 : int
	_7 = 1;
	//sub %8 = %1, %7 : int
	_8=max-_7;
	//invoke (%6) = (%2, %8) Fibonacci:fibonacci : function(int[],int)->(int[])
	{
		_UPDATE_1DARRAY_SIZE(_6, arr);
		_DEALLOC(_6);
		_6 = fibonacci(_1DARRAY_PARAM(arr), false, _8);
		_REMOVE_DEALLOC(arr);
		_ADD_DEALLOC(_6);
	}
	//assign %2 = %6  : int[]
	_DEALLOC(arr);
	_UPDATE_1DARRAY(arr, _6);
	_TRANSFER_DEALLOC(arr, _6);
	//assert
	{
		//const %9 = 0 : int
		_9 = 0;
		//const %10 = 1 : int
		_10 = 1;
		//const %11 = 1 : int
		_11 = 1;
		//const %12 = 2 : int
		_12 = 2;
		//const %13 = 3 : int
		_13 = 3;
		//const %14 = 5 : int
		_14 = 5;
		//const %15 = 8 : int
		_15 = 8;
		//const %16 = 13 : int
		_16 = 13;
		//const %17 = 21 : int
		_17 = 21;
		//const %18 = 34 : int
		_18 = 34;
		//newlist %19 = (%9, %10, %11, %12, %13, %14, %15, %16, %17, %18) : int[]
		_DEALLOC(_19);
		_NEW_1DARRAY(_19, 10, 0);
		_19[0] = _9; _19[1] = _10; _19[2] = _11; _19[3] = _12; _19[4] = _13; _19[5] = _14; _19[6] = _15; _19[7] = _16; _19[8] = _17; _19[9] = _18; 
		_ADD_DEALLOC(_19);
		//ifeq %2, %19 goto blklab2 : int[]
		_IFEQ_ARRAY(arr, _19, blklab2);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab2
blklab2:;
	//assert
	}
	//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %21 = %20 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %21 (%2) : method(any)->()
	printf("%lld", arr);
	//fieldload %22 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %23 = %22 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %24 = [80,97,115,115,32,70,105,98,111,110,97,99,99,105,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_24);
	_NEW_1DARRAY(_24, 24, 0);
	_24[0] = 80; _24[1] = 97; _24[2] = 115; _24[3] = 115; _24[4] = 32; _24[5] = 70; _24[6] = 105; _24[7] = 98; _24[8] = 111; _24[9] = 110; _24[10] = 97; _24[11] = 99; _24[12] = 99; _24[13] = 105; _24[14] = 32; _24[15] = 116; _24[16] = 101; _24[17] = 115; _24[18] = 116; _24[19] = 32; _24[20] = 99; _24[21] = 97; _24[22] = 115; _24[23] = 101; 
	_ADD_DEALLOC(_24);
	//indirectinvoke () = %23 (%24) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_24));
	//return
	_DEALLOC(arr);
	_DEALLOC(_5);
	_DEALLOC(_6);
	_DEALLOC(_19);
	_DEALLOC(_24);
	exit(0);
}

