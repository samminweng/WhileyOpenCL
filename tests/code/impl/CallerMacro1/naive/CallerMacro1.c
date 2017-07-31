#include "CallerMacro1.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(x), int64_t num, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	int64_t _3 = 0;
	//const %3 = 0 : int
	_3 = 0;
	//update %0[%3] = %1 : int[] -> int[]
	x[_3] = num;
	//return %0
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(x);
	return x;
	//return
}

int64_t* _g1_(_DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_0);
	_DECL_1DARRAY(a);
	_DECL_1DARRAY(b);
	int64_t _3 = 0;
	int64_t _4 = 0;
	_DECL_1DARRAY(_5);
	_DECL_1DARRAY(_6);
	int64_t _7 = 0;
	//const %3 = 0 : int
	_3 = 0;
	//const %4 = 3 : int
	_4 = 3;
	//arraygen %5 = [3; 4] : int[]
	_NEW_1DARRAY_int64_t(_5, _4, _3);
	//assign %1 = %5  : int[]
	_COPY_1DARRAY_int64_t(a, _5);
	//const %7 = 11 : int
	_7 = 11;
	//invoke (%6) = (%1, %7) CallerMacro1:func : function(int[],int)->(int[])
	{
		void* a_tmp;
		_6 = _func_(_COPY_1DARRAY_PARAM_int64_t(a), _7, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_6));
	}
	//assign %2 = %6  : int[]
	_COPY_1DARRAY_int64_t(b, _6);
	//return %1
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_1DARRAY(_2);
	int64_t _3 = 0;
	int64_t _4 = 0;
	int64_t _5 = 0;
	void* _6;
	_DECL_1DARRAY(_8);
	void* _9;
	int64_t _11 = 0;
	int64_t _12 = 0;
	//invoke (%2) = () CallerMacro1:g1 : function()->(int[])
	{
		_2 = _g1_(_1DARRAYSIZE_PARAM_CALLBYREFERENCE(_2));
	}
	//assign %1 = %2  : int[]
	_COPY_1DARRAY_int64_t(a, _2);
	//assert
	{
		//const %3 = 0 : int
		_3 = 0;
		//indexof %4 = %1, %3 : int[]
		_4=a[_3];
		//const %5 = 0 : int
		_5 = 0;
		//ifeq %4, %5 goto blklab0 : int
		if(_4==_5){goto blklab0;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab0
blklab0:;
	//assert
	}
	//fieldload %6 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %7 = %6 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %8 = [97,91,48,93,32,61,32] : int[]
	_NEW_1DARRAY_int64_t(_8, 7, 0);
	_8[0] = 97; _8[1] = 91; _8[2] = 48; _8[3] = 93; _8[4] = 32; _8[5] = 61; _8[6] = 32; 
	//indirectinvoke () = %7 (%8) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_8));
	}
	//fieldload %9 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %10 = %9 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %11 = 0 : int
	_11 = 0;
	//indexof %12 = %1, %11 : int[]
	_12=a[_11];
	//indirectinvoke () = %10 (%12) : method(any)->()
	{
		printf("%"PRId64"\n", _12);
	}
	//return
	exit(0);
}

