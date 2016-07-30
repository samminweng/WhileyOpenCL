#include "Fibonacci_original.h"
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
	//invoke (%8) = (%0, %10) Fibonacci_original:fibonacci : function(int[],int)->(int[])
	_UPDATE_1DARRAY_SIZE(_8, ls);
	_DEALLOC(_8);
	_8 = fibonacci(_COPY_1DARRAY_PARAM(ls), false, _10);
	_ADD_DEALLOC(ls);
	_ADD_DEALLOC(_8);
	//assign %0 = %8  : int[]
	_DEALLOC(ls);
	_COPY_1DARRAY(ls, _8);
	_ADD_DEALLOC(ls);
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
	long long* n;
	_DECL_DEALLOC(n);
	long long max = 0;
	_DECL_1DARRAY(arr);
	_DECL_DEALLOC(arr);
	long long* _4;
	_DECL_DEALLOC(_4);
	_DECL_2DARRAY(_5);
	_DECL_DEALLOC(_5);
	long long _6 = 0;
	_DECL_1DARRAY(_7);
	_DECL_DEALLOC(_7);
	long long _8 = 0;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	long long _11 = 0;
	long long _12 = 0;
	void* _13;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	void* _18;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	void* _23;
	long long _25 = 0;
	long long _26 = 0;
	long long _27 = 0;
	void* _28;
	_DECL_1DARRAY(_30);
	_DECL_DEALLOC(_30);
	//fieldload %5 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DArray(_5);
	_CONV_ARGS(_5);
	_ADD_DEALLOC(_5);
	//const %6 = 0 : int
	_6 = 0;
	//indexof %7 = %5, %6 : int[][]
	_7=_5[_6];
	_REMOVE_DEALLOC(_7);
	//invoke (%4) = (%7) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_4, _7);
	_ADD_DEALLOC(_4);
	_REMOVE_DEALLOC(_7);
	//assign %1 = %4  : null|int
	_DEALLOC(n);
	_NEW_INTEGER_POINTER(n, _4);
	_ADD_DEALLOC(n);
	//ifis %1, null goto blklab2 : null|int
	if(n == NULL) { goto blklab2;}
	//assign %2 = %1  : int
	max = *n;
	//const %8 = 0 : int
	_8 = 0;
	//arraygen %9 = [8; 2] : int[]
	_DEALLOC(_9);
	_NEW_1DARRAY(_9, max, _8);
	_ADD_DEALLOC(_9);
	//assign %3 = %9  : int[]
	_DEALLOC(arr);
	_COPY_1DARRAY(arr, _9);
	_ADD_DEALLOC(arr);
	//const %11 = 1 : int
	_11 = 1;
	//sub %12 = %2, %11 : int
	_12=max-_11;
	//invoke (%10) = (%3, %12) Fibonacci_original:fibonacci : function(int[],int)->(int[])
	_UPDATE_1DARRAY_SIZE(_10, arr);
	_DEALLOC(_10);
	_10 = fibonacci(_COPY_1DARRAY_PARAM(arr), false, _12);
	_ADD_DEALLOC(arr);
	_ADD_DEALLOC(_10);
	//assign %3 = %10  : int[]
	_DEALLOC(arr);
	_COPY_1DARRAY(arr, _10);
	_ADD_DEALLOC(arr);
	//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %14 = %13 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %15 = 3 : int
	_15 = 3;
	//sub %16 = %2, %15 : int
	_16=max-_15;
	//indexof %17 = %3, %16 : int[]
	_17=arr[_16];
	//indirectinvoke () = %14 (%17) : method(any)->()
	printf("%lld\n", _17);
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %20 = 2 : int
	_20 = 2;
	//sub %21 = %2, %20 : int
	_21=max-_20;
	//indexof %22 = %3, %21 : int[]
	_22=arr[_21];
	//indirectinvoke () = %19 (%22) : method(any)->()
	printf("%lld\n", _22);
	//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %24 = %23 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %25 = 1 : int
	_25 = 1;
	//sub %26 = %2, %25 : int
	_26=max-_25;
	//indexof %27 = %3, %26 : int[]
	_27=arr[_26];
	//indirectinvoke () = %24 (%27) : method(any)->()
	printf("%lld\n", _27);
	//fieldload %28 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %29 = %28 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %30 = [80,97,115,115,32,70,105,98,111,110,97,99,99,105,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_30);
	_NEW_1DARRAY(_30, 24, 0);
	_30[0] = 80; _30[1] = 97; _30[2] = 115; _30[3] = 115; _30[4] = 32; _30[5] = 70; _30[6] = 105; _30[7] = 98; _30[8] = 111; _30[9] = 110; _30[10] = 97; _30[11] = 99; _30[12] = 99; _30[13] = 105; _30[14] = 32; _30[15] = 116; _30[16] = 101; _30[17] = 115; _30[18] = 116; _30[19] = 32; _30[20] = 99; _30[21] = 97; _30[22] = 115; _30[23] = 101; 
	_ADD_DEALLOC(_30);
	//indirectinvoke () = %29 (%30) : method(int[])->()
	println_s(_30, _30_size);
//.blklab2
blklab2:;
	//return
	_DEALLOC(n);
	_DEALLOC(arr);
	_DEALLOC(_4);
	_DEALLOC_2DArray(_5);
	_DEALLOC(_7);
	_DEALLOC(_9);
	_DEALLOC(_10);
	_DEALLOC(_30);
	exit(0);
}

