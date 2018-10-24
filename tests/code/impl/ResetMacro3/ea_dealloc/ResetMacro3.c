#include "ResetMacro3.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(b), int64_t num, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(b);
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
	_NEW1DARRAY_DEALLOC(_6, _4, _5, int64_t);
	//assign %3 = %6  : int[]
	_ADD_DEALLOC(c, _6, int64_t);
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
	_NEW1DARRAY_DEALLOC(_5, _3, _4, int64_t);
	//assign %1 = %5  : int[]
	_ADD_DEALLOC(b, _5, int64_t);
	//const %7 = 11 : int
	_7 = 11;
	//invoke (%6) = (%1, %7) ResetMacro3:func : function(int[],int)->(int[])
	{
		_CALLER_DEALLOC(_6, b, "true-MAYBE_RETURN-false" , "func");
		_DEALLOC(_6);
		void* tmp_b;
		_COPY_1DARRAY_PARAM(b, tmp_b, int64_t);
		_6 = _func_(tmp_b, b_size, _7, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_6));
		_CALLER_DEALLOC_POST(_6, tmp_b);
	}
	//assign %2 = %6  : int[]
	_ADD_DEALLOC(tmp, _6, int64_t);
	//assign %1 = %2  : int[]
	_ADD_DEALLOC(b, tmp, int64_t);
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
		_CALLER_DEALLOC(_15, b, "true-MAYBE_RETURN-false" , "func");
		_DEALLOC(_15);
		void* tmp_b;
		_COPY_1DARRAY_PARAM(b, tmp_b, int64_t);
		_15 = _func_(tmp_b, b_size, _16, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_15));
		_CALLER_DEALLOC_POST(_15, tmp_b);
	}
	//assign %1 = %15  : int[]
	_ADD_DEALLOC(b, _15, int64_t);
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

