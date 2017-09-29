#include "ResetMacro3.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(b), _DECL_DEALLOC_PARAM(b), int64_t num, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	_DECL_1DARRAY(c);
	_DECL_DEALLOC(c);
	int64_t _4;
	int64_t _5;
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7;
	int64_t _8;
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 3 : int
	_5 = 3;
	//arraygen %6 = [4; 5] : int[]
	_DEALLOC(_6);
	_NEW_1DARRAY_int64_t(_6, _5, _4);
	_ADD_DEALLOC(_6);
	//assign %3 = %6  : int[]
	_DEALLOC(c);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(c, _6);
	_TRANSFER_DEALLOC(c, _6);
	//const %7 = 10 : int
	_7 = 10;
	//ifle %1, %7 goto blklab0 : int
	if(num<=_7){goto blklab0;}
	//const %8 = 0 : int
	_8 = 0;
	//update %0[%8] = %1 : int[] -> int[]
	b[_8] = num;
	//return %0
	_DEALLOC(_2);
	_DEALLOC(c);
	_DEALLOC(_6);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(b);
	return b;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//return %3
	_DEALLOC(b);
	_DEALLOC(_2);
	_DEALLOC(_6);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(c);
	return c;
//.blklab1
blklab1:;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(tmp);
	_DECL_DEALLOC(tmp);
	int64_t _3;
	int64_t _4;
	_DECL_1DARRAY(_5);
	_DECL_DEALLOC(_5);
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	void* _11;
	int64_t _13;
	int64_t _14;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
	int64_t _16;
	void* _17;
	int64_t _19;
	int64_t _20;
	int64_t _21;
	int64_t _22;
	int64_t _23;
	//const %3 = 2 : int
	_3 = 2;
	//const %4 = 3 : int
	_4 = 3;
	//arraygen %5 = [3; 4] : int[]
	_DEALLOC(_5);
	_NEW_1DARRAY_int64_t(_5, _4, _3);
	_ADD_DEALLOC(_5);
	//assign %1 = %5  : int[]
	_DEALLOC(b);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(b, _5);
	_TRANSFER_DEALLOC(b, _5);
	//const %7 = 11 : int
	_7 = 11;
	//invoke (%6) = (%1, %7) ResetMacro3:func : function(int[],int)->(int[])
	{
		_DEALLOC(_6);
		// isCopyEliminated of '_1' = true
		_6 = _func_(_1DARRAY_PARAM(b), false, _7, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_6));
		_RESET_DEALLOC(_6, b, "true-true-false" , "func");
	}
	//assign %2 = %6  : int[]
	_DEALLOC(tmp);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(tmp, _6);
	_TRANSFER_DEALLOC(tmp, _6);
	//assign %1 = %2  : int[]
	_DEALLOC(b);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(b, tmp);
	_TRANSFER_DEALLOC(b, tmp);
	//assert
	{
		//const %8 = 0 : int
		_8 = 0;
		//indexof %9 = %1, %8 : int[]
		_9=b[_8];
		//const %10 = 11 : int
		_10 = 11;
		//ifeq %9, %10 goto blklab2 : int
		if(_9==_10){goto blklab2;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab2
blklab2:;
	//assert
	}
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = 0 : int
	_13 = 0;
	//indexof %14 = %1, %13 : int[]
	_14=b[_13];
	//indirectinvoke () = %12 (%14) : method(any)->()
	{
		printf("%"PRId64"\n", _14);
	}
	//const %16 = 65536 : int
	_16 = 65536;
	//invoke (%15) = (%1, %16) ResetMacro3:func : function(int[],int)->(int[])
	{
		_DEALLOC(_15);
		// isCopyEliminated of '_1' = true
		_15 = _func_(_1DARRAY_PARAM(b), false, _16, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_15));
		_RESET_DEALLOC(_15, b, "true-true-false" , "func");
	}
	//assign %1 = %15  : int[]
	_DEALLOC(b);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(b, _15);
	_TRANSFER_DEALLOC(b, _15);
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %19 = 0 : int
	_19 = 0;
	//indexof %20 = %1, %19 : int[]
	_20=b[_19];
	//indirectinvoke () = %18 (%20) : method(any)->()
	{
		printf("%"PRId64"\n", _20);
	}
	//assert
	{
		//const %21 = 0 : int
		_21 = 0;
		//indexof %22 = %1, %21 : int[]
		_22=b[_21];
		//const %23 = 65536 : int
		_23 = 65536;
		//ifeq %22, %23 goto blklab3 : int
		if(_22==_23){goto blklab3;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab3
blklab3:;
	//assert
	}
	//return
	_DEALLOC(b);
	_DEALLOC(tmp);
	_DEALLOC(_5);
	_DEALLOC(_6);
	_DEALLOC(_15);
	exit(0);
}

