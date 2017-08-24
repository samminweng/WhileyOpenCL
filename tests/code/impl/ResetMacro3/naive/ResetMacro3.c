#include "ResetMacro3.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(x), int64_t num, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	_DECL_1DARRAY(a);
	int64_t b;
	int64_t _5;
	int64_t _6;
	_DECL_1DARRAY(_7);
	int64_t _8;
	int64_t _9;
	//const %5 = 0 : int
	_5 = 0;
	//const %6 = 3 : int
	_6 = 3;
	//arraygen %7 = [5; 6] : int[]
	_NEW_1DARRAY_int64_t(_7, _6, _5);
	//assign %3 = %7  : int[]
	_COPY_1DARRAY_int64_t(a, _7);
	//const %8 = 10 : int
	_8 = 10;
	//assign %4 = %8  : int
	b = _8;
	//ifle %1, %4 goto blklab0 : int
	if(num<=b){goto blklab0;}
	//const %9 = 0 : int
	_9 = 0;
	//update %0[%9] = %1 : int[] -> int[]
	x[_9] = num;
	//return %0
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(x);
	return x;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//return %3
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
//.blklab1
blklab1:;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(x);
	int64_t num;
	_DECL_1DARRAY(tmp);
	int64_t _4;
	int64_t _5;
	_DECL_1DARRAY(_6);
	int64_t _7;
	_DECL_1DARRAY(_8);
	int64_t _9;
	int64_t _10;
	int64_t _11;
	void* _12;
	_DECL_1DARRAY(_14);
	void* _15;
	int64_t _17;
	int64_t _18;
	//const %4 = 2 : int
	_4 = 2;
	//const %5 = 3 : int
	_5 = 3;
	//arraygen %6 = [4; 5] : int[]
	_NEW_1DARRAY_int64_t(_6, _5, _4);
	//assign %1 = %6  : int[]
	_COPY_1DARRAY_int64_t(x, _6);
	//const %7 = 11 : int
	_7 = 11;
	//assign %2 = %7  : int
	num = _7;
	//invoke (%8) = (%1, %2) ResetMacro3:func : function(int[],int)->(int[])
	{
		void* x_tmp;
		_8 = _func_(_COPY_1DARRAY_PARAM_int64_t(x), num, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_8));
	}
	//assign %3 = %8  : int[]
	_COPY_1DARRAY_int64_t(tmp, _8);
	//assign %1 = %3  : int[]
	_COPY_1DARRAY_int64_t(x, tmp);
	//assert
	{
		//const %9 = 0 : int
		_9 = 0;
		//indexof %10 = %1, %9 : int[]
		_10=x[_9];
		//const %11 = 11 : int
		_11 = 11;
		//ifeq %10, %11 goto blklab2 : int
		if(_10==_11){goto blklab2;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab2
blklab2:;
	//assert
	}
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %14 = [120,91,48,93,32,61,32] : int[]
	_NEW_1DARRAY_int64_t(_14, 7, 0);
	_14[0] = 120; _14[1] = 91; _14[2] = 48; _14[3] = 93; _14[4] = 32; _14[5] = 61; _14[6] = 32; 
	//indirectinvoke () = %13 (%14) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_14));
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %17 = 0 : int
	_17 = 0;
	//indexof %18 = %1, %17 : int[]
	_18=x[_17];
	//indirectinvoke () = %16 (%18) : method(any)->()
	{
		printf("%"PRId64"\n", _18);
	}
	//return
	exit(0);
}

