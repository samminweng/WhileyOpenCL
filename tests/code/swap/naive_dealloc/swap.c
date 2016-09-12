#include "swap.h"
int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(tmp);
	_DECL_DEALLOC(tmp);
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	_DECL_1DARRAY(_21);
	_DECL_DEALLOC(_21);
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	long long _25 = 0;
	long long _26 = 0;
	_DECL_1DARRAY(_27);
	_DECL_DEALLOC(_27);
	void* _28;
	_DECL_1DARRAY(_30);
	_DECL_DEALLOC(_30);
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 0 : int
	_5 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//const %7 = 0 : int
	_7 = 0;
	//const %8 = 0 : int
	_8 = 0;
	//newlist %9 = (%4, %5, %6, %7, %8) : int[]
	_DEALLOC(_9);
	_NEW_1DARRAY_LONGLONG(_9, 5, 0);
	_9[0] = _4; _9[1] = _5; _9[2] = _6; _9[3] = _7; _9[4] = _8; 
	_ADD_DEALLOC(_9);
	//assign %1 = %9  : int[]
	_DEALLOC(a);
	_COPY_1DARRAY_LONGLONG(a, _9);
	_ADD_DEALLOC(a);
	//const %10 = 1 : int
	_10 = 1;
	//const %11 = 1 : int
	_11 = 1;
	//const %12 = 1 : int
	_12 = 1;
	//const %13 = 1 : int
	_13 = 1;
	//const %14 = 1 : int
	_14 = 1;
	//newlist %15 = (%10, %11, %12, %13, %14) : int[]
	_DEALLOC(_15);
	_NEW_1DARRAY_LONGLONG(_15, 5, 0);
	_15[0] = _10; _15[1] = _11; _15[2] = _12; _15[3] = _13; _15[4] = _14; 
	_ADD_DEALLOC(_15);
	//assign %2 = %15  : int[]
	_DEALLOC(b);
	_COPY_1DARRAY_LONGLONG(b, _15);
	_ADD_DEALLOC(b);
	//assign %3 = %1  : int[]
	_DEALLOC(tmp);
	_COPY_1DARRAY_LONGLONG(tmp, a);
	_ADD_DEALLOC(tmp);
	//assign %1 = %2  : int[]
	_DEALLOC(a);
	_COPY_1DARRAY_LONGLONG(a, b);
	_ADD_DEALLOC(a);
	//assign %2 = %3  : int[]
	_DEALLOC(b);
	_COPY_1DARRAY_LONGLONG(b, tmp);
	_ADD_DEALLOC(b);
	//assert
	{
		//const %16 = 1 : int
		_16 = 1;
		//const %17 = 1 : int
		_17 = 1;
		//const %18 = 1 : int
		_18 = 1;
		//const %19 = 1 : int
		_19 = 1;
		//const %20 = 1 : int
		_20 = 1;
		//newlist %21 = (%16, %17, %18, %19, %20) : int[]
		_DEALLOC(_21);
		_NEW_1DARRAY_LONGLONG(_21, 5, 0);
		_21[0] = _16; _21[1] = _17; _21[2] = _18; _21[3] = _19; _21[4] = _20; 
		_ADD_DEALLOC(_21);
		//ifeq %1, %21 goto blklab0 : int[]
		_IFEQ_ARRAY(a, _21, blklab0);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab0
blklab0:;
	//assert
	}
	//assert
	{
		//const %22 = 0 : int
		_22 = 0;
		//const %23 = 0 : int
		_23 = 0;
		//const %24 = 0 : int
		_24 = 0;
		//const %25 = 0 : int
		_25 = 0;
		//const %26 = 0 : int
		_26 = 0;
		//newlist %27 = (%22, %23, %24, %25, %26) : int[]
		_DEALLOC(_27);
		_NEW_1DARRAY_LONGLONG(_27, 5, 0);
		_27[0] = _22; _27[1] = _23; _27[2] = _24; _27[3] = _25; _27[4] = _26; 
		_ADD_DEALLOC(_27);
		//ifeq %2, %27 goto blklab1 : int[]
		_IFEQ_ARRAY(b, _27, blklab1);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab1
blklab1:;
	//assert
	}
	//fieldload %28 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %29 = %28 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %30 = [80,97,115,115,32,115,119,97,112,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_30);
	_NEW_1DARRAY_LONGLONG(_30, 19, 0);
	_30[0] = 80; _30[1] = 97; _30[2] = 115; _30[3] = 115; _30[4] = 32; _30[5] = 115; _30[6] = 119; _30[7] = 97; _30[8] = 112; _30[9] = 32; _30[10] = 116; _30[11] = 101; _30[12] = 115; _30[13] = 116; _30[14] = 32; _30[15] = 99; _30[16] = 97; _30[17] = 115; _30[18] = 101; 
	_ADD_DEALLOC(_30);
	//indirectinvoke () = %29 (%30) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_30));
	//return
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(tmp);
	_DEALLOC(_9);
	_DEALLOC(_15);
	_DEALLOC(_21);
	_DEALLOC(_27);
	_DEALLOC(_30);
	exit(0);
}

