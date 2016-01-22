#include "Fibonacci.h"
long long* fibonacci(_DECL_1DARRAY_PARAM(ls), _DECL_OWNERSHIP_PARAM(ls), long long n){
	long long _2 = 0;
	long long _3 = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	_DECL_1DARRAY(_9);
	_DECL_OWNERSHIP(_9);
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
	//const %2 = 1 : int
	_2 = 1;
	//ifgt %1, %2 goto blklab0 : int
	if(n>_2){goto blklab0;}
	//const %3 = 0 : int
	_3 = 0;
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 0 : int
	_5 = 0;
	//update %0[%4] = %5 : int[] -> int[]
	ls[_4] = _5;
	//const %6 = 1 : int
	_6 = 1;
	//const %7 = 1 : int
	_7 = 1;
	//const %8 = 1 : int
	_8 = 1;
	//update %0[%7] = %8 : int[] -> int[]
	ls[_7] = _8;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//const %10 = 1 : int
	_10 = 1;
	//sub %11 = %1, %10 : int
	_11=n-_10;
	//invoke %9 = (%0, %11) Fibonacci:fibonacci : function(int[],int) -> int[]
	_FREE(_9);
	_ADD_OWNERSHIP(ls);
	_1DARRAY_SIZE(_9, ls);
	_9 = fibonacci(_1DARRAY_COPY_PARAM(ls), true, _11);
	_ADD_OWNERSHIP(_9);
	//assign %0 = %9  : int[]
	_FREE(ls);
	_1DARRAY_COPY(ls, _9);
	_ADD_OWNERSHIP(ls);
	_ADD_OWNERSHIP(_9);
	//const %12 = 1 : int
	_12 = 1;
	//sub %13 = %1, %12 : int
	_13=n-_12;
	//indexof %14 = %0, %13 : int[]
	_14=ls[_13];
	//const %15 = 2 : int
	_15 = 2;
	//sub %16 = %1, %15 : int
	_16=n-_15;
	//indexof %17 = %0, %16 : int[]
	_17=ls[_16];
	//add %18 = %14, %17 : int
	_18=_14+_17;
	//const %19 = 1 : int
	_19 = 1;
	//sub %20 = %1, %19 : int
	_20=n-_19;
	//indexof %21 = %0, %20 : int[]
	_21=ls[_20];
	//const %22 = 2 : int
	_22 = 2;
	//sub %23 = %1, %22 : int
	_23=n-_22;
	//indexof %24 = %0, %23 : int[]
	_24=ls[_23];
	//add %25 = %21, %24 : int
	_25=_21+_24;
	//update %0[%1] = %25 : int[] -> int[]
	ls[n] = _25;
//.blklab1
blklab1:;
	//return %0 : int[]
	_FREE(_9);
	return ls;
	//return
}

int main(int argc, char** args){
	long long max;
	_DECL_1DARRAY(arr);
	_DECL_OWNERSHIP(arr);
	long long _3;
	long long _4;
	_DECL_2DARRAY(_5);
	_DECL_OWNERSHIP(_5);
	long long _6 = 0;
	_DECL_1DARRAY(_7);
	_DECL_OWNERSHIP(_7);
	_DECL_1DARRAY(_8);
	_DECL_OWNERSHIP(_8);
	long long _9 = 0;
	_DECL_1DARRAY(_10);
	_DECL_OWNERSHIP(_10);
	_DECL_1DARRAY(_11);
	_DECL_OWNERSHIP(_11);
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
	long long _28 = 0;
	long long _29 = 0;
	void* _30;
	_DECL_1DARRAY(_32);
	_DECL_OWNERSHIP(_32);
	//fieldload %5 = %0 args : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	_CONV_ARGS(_5);
	_ADD_OWNERSHIP(_5);
	//const %6 = 0 : int
	_6 = 0;
	//indexof %7 = %5, %6 : int[][]
	_7=_5[_6];
	//invoke %4 = (%7) whiley/lang/Int:parse : function(whiley/lang/ASCII:string) -> null|int
	_STR_TO_INT(_4, _7);
	//assign %3 = %4  : null|int
	_3 = _4;
	//assign %1 = %3  : null|int
	max = _3;
	//ifis %1, null goto blklab2 : null|int
	if(max == NULL) { goto blklab2;}
	//const %9 = 0 : int
	_9 = 0;
	//listgen %10 = [9; 1] : int[]
	_FREE(_10);
	_GEN_1DARRAY(_10, max, _9);
	_ADD_OWNERSHIP(_10);
	//assign %8 = %10  : int[]
	_FREE(_8);
	_1DARRAY_COPY(_8, _10);
	_ADD_OWNERSHIP(_8);
	_ADD_OWNERSHIP(_10);
	//assign %2 = %8  : int[]
	_FREE(arr);
	_1DARRAY_COPY(arr, _8);
	_ADD_OWNERSHIP(arr);
	_ADD_OWNERSHIP(_8);
	//const %12 = 1 : int
	_12 = 1;
	//sub %13 = %1, %12 : int
	_13=max-_12;
	//invoke %11 = (%2, %13) Fibonacci:fibonacci : function(int[],int) -> int[]
	_FREE(_11);
	_ADD_OWNERSHIP(arr);
	_1DARRAY_SIZE(_11, arr);
	_11 = fibonacci(_1DARRAY_COPY_PARAM(arr), true, _13);
	_ADD_OWNERSHIP(_11);
	//assign %2 = %11  : int[]
	_FREE(arr);
	_1DARRAY_COPY(arr, _11);
	_ADD_OWNERSHIP(arr);
	_ADD_OWNERSHIP(_11);
	//assert
	{
		//const %14 = 0 : int
		_14 = 0;
		//indexof %15 = %2, %14 : int[]
		_15=arr[_14];
		//const %16 = 0 : int
		_16 = 0;
		//ifeq %15, %16 goto blklab3 : int
		if(_15==_16){goto blklab3;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab3
blklab3:;
	//assert
	}
	//assert
	{
		//const %17 = 1 : int
		_17 = 1;
		//indexof %18 = %2, %17 : int[]
		_18=arr[_17];
		//const %19 = 1 : int
		_19 = 1;
		//ifeq %18, %19 goto blklab4 : int
		if(_18==_19){goto blklab4;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab4
blklab4:;
	//assert
	}
	//assert
	{
		//const %20 = 1 : int
		_20 = 1;
		//sub %21 = %1, %20 : int
		_21=max-_20;
		//indexof %22 = %2, %21 : int[]
		_22=arr[_21];
		//const %23 = 2 : int
		_23 = 2;
		//sub %24 = %1, %23 : int
		_24=max-_23;
		//indexof %25 = %2, %24 : int[]
		_25=arr[_24];
		//const %26 = 3 : int
		_26 = 3;
		//sub %27 = %1, %26 : int
		_27=max-_26;
		//indexof %28 = %2, %27 : int[]
		_28=arr[_27];
		//add %29 = %25, %28 : int
		_29=_25+_28;
		//ifeq %22, %29 goto blklab5 : int
		if(_22==_29){goto blklab5;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab5
blklab5:;
	//assert
	}
	//fieldload %30 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	//fieldload %31 = %30 print_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
	//const %32 = [80,97,115,115,32,70,105,98,111,110,97,99,99,105,32,116,101,115,116,32,99,97,115,101] : int[]
	_FREE(_32);
	_NEW_ARRAY(_32, 24);
	_32[0] = 80; _32[1] = 97; _32[2] = 115; _32[3] = 115; _32[4] = 32; _32[5] = 70; _32[6] = 105; _32[7] = 98; _32[8] = 111; _32[9] = 110; _32[10] = 97; _32[11] = 99; _32[12] = 99; _32[13] = 105; _32[14] = 32; _32[15] = 116; _32[16] = 101; _32[17] = 115; _32[18] = 116; _32[19] = 32; _32[20] = 99; _32[21] = 97; _32[22] = 115; _32[23] = 101; 
	_ADD_OWNERSHIP(_32);
	//indirectinvoke %31 (%32) : method(int[]) -> void
	printf_s(_1DARRAY_PARAM(_32));
//.blklab2
blklab2:;
	//return
	_FREE(arr);
	_FREE2DArray(_5);
	_FREE(_7);
	_FREE(_8);
	_FREE(_10);
	_FREE(_11);
	_FREE(_32);
	exit(0);
}

