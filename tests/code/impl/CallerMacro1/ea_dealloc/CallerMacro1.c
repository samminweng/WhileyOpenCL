#include "CallerMacro1.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(x), _DECL_DEALLOC_PARAM(x), int64_t num, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	int64_t _3;
	//const %3 = 0 : int
	_3 = 0;
	//update %0[%3] = %1 : int[] -> int[]
	x[_3] = num;
	//return %0
	_DEALLOC(_2);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(x);
	return x;
	//return
}

int64_t* _g1_(_DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_0);
	_DECL_DEALLOC(_0);
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	int64_t _3;
	int64_t _4;
	_DECL_1DARRAY(_5);
	_DECL_DEALLOC(_5);
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7;
	//const %3 = 0 : int
	_3 = 0;
	//const %4 = 3 : int
	_4 = 3;
	//arraygen %5 = [3; 4] : int[]
	_NEW1DARRAY_DEALLOC(_5, _3, _4, int64_t);
	//assign %1 = %5  : int[]
	_ADD_DEALLOC(a, _5, int64_t);
	//const %7 = 11 : int
	_7 = 11;
	//invoke (%6) = (%1, %7) CallerMacro1:func : function(int[],int)->(int[])
	{
		_CALLER_DEALLOC(_6, a, "true-true-true" , "func");
		void* tmp_x;
		_COPY_1DARRAY_PARAM(a, tmp_x, int64_t);
		_DEALLOC(_6);
		_6 = _func_(tmp_x, a_size, false, _7, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_6));
		_CALLER_DEALLOC_POST(_6, tmp_x);
	}
	//assign %2 = %6  : int[]
	_ADD_DEALLOC(b, _6, int64_t);
	//return %1
	_DEALLOC(_0);
	_DEALLOC(b);
	_DEALLOC(_5);
	_DEALLOC(_6);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	int64_t _3;
	int64_t _4;
	int64_t _5;
	void* _6;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	void* _9;
	int64_t _11;
	int64_t _12;
	//invoke (%2) = () CallerMacro1:g1 : function()->(int[])
	{
		_DEALLOC(_2);
		_2 = _g1_(_1DARRAYSIZE_PARAM_CALLBYREFERENCE(_2));
		_2_dealloc = true;
	}
	//assign %1 = %2  : int[]
	_ADD_DEALLOC(a, _2, int64_t);
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
	_DEALLOC(_8);
	_NEW_1DARRAY_int64_t(_8, 7, 0);
	_8[0] = 97; _8[1] = 91; _8[2] = 48; _8[3] = 93; _8[4] = 32; _8[5] = 61; _8[6] = 32; 
	_8_dealloc = true;
	//indirectinvoke () = %7 (%8) : method(int[])->()
	{
		printf_s(_8, _8_size);
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
	_DEALLOC(a);
	_DEALLOC(_2);
	_DEALLOC(_8);
	exit(0);
}

