#include "Fibonacci.h"
int64_t* _fibonacci_(_DECL_1DARRAY_PARAM(ls), int64_t n, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	int64_t _3;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	_DECL_1DARRAY(_8);
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	int64_t _17;
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
		void* tmp_ls;
		_COPY_1DARRAY_PARAM(ls, tmp_ls, int64_t);
		_8 = _fibonacci_(tmp_ls, ls_size, _10, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_8));
	}
	//assign %0 = %8  : int[]
	_COPY_1DARRAY_int64_t(ls, _8);
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
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(ls);
	return ls;
	//return
}

int main(int argc, char** args){
	int64_t max;
	_DECL_1DARRAY(arr);
	int64_t _3;
	int64_t _4;
	_DECL_1DARRAY(_5);
	_DECL_1DARRAY(_6);
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	int64_t _17;
	int64_t _18;
	_DECL_1DARRAY(_19);
	void* _20;
	void* _22;
	_DECL_1DARRAY(_24);
	//const %3 = 10 : int
	_3 = 10;
	//assign %1 = %3  : int
	max = _3;
	//const %4 = 0 : int
	_4 = 0;
	//arraygen %5 = [4; 1] : int[]
	_NEW_1DARRAY_int64_t(_5, max, _4);
	//assign %2 = %5  : int[]
	_COPY_1DARRAY_int64_t(arr, _5);
	//const %7 = 1 : int
	_7 = 1;
	//sub %8 = %1, %7 : int
	_8=max-_7;
	//invoke (%6) = (%2, %8) Fibonacci:fibonacci : function(int[],int)->(int[])
	{
		void* tmp_ls;
		_COPY_1DARRAY_PARAM(arr, tmp_ls, int64_t);
		_6 = _fibonacci_(tmp_ls, arr_size, _8, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_6));
	}
	//assign %2 = %6  : int[]
	_COPY_1DARRAY_int64_t(arr, _6);
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
		_NEW_1DARRAY_int64_t(_19, 10, 0);
		_19[0] = _9; _19[1] = _10; _19[2] = _11; _19[3] = _12; _19[4] = _13; _19[5] = _14; _19[6] = _15; _19[7] = _16; _19[8] = _17; _19[9] = _18; 
		//ifeq %2, %19 goto blklab2 : int[]
		_IFEQ_ARRAY_int64_t(arr, _19, blklab2);
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
	{
		printf("%"PRId64, arr);
	}
	//fieldload %22 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %23 = %22 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %24 = [80,97,115,115,32,70,105,98,111,110,97,99,99,105,32,116,101,115,116,32,99,97,115,101] : int[]
	_NEW_1DARRAY_int64_t(_24, 24, 0);
	_24[0] = 80; _24[1] = 97; _24[2] = 115; _24[3] = 115; _24[4] = 32; _24[5] = 70; _24[6] = 105; _24[7] = 98; _24[8] = 111; _24[9] = 110; _24[10] = 97; _24[11] = 99; _24[12] = 99; _24[13] = 105; _24[14] = 32; _24[15] = 116; _24[16] = 101; _24[17] = 115; _24[18] = 116; _24[19] = 32; _24[20] = 99; _24[21] = 97; _24[22] = 115; _24[23] = 101; 
	//indirectinvoke () = %23 (%24) : method(int[])->()
	{
		printf_s(_24, _24_size);
	}
	//return
	exit(0);
}

