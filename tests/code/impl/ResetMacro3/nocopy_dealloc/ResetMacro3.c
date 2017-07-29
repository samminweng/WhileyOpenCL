#include "ResetMacro3.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(x), _DECL_DEALLOC_PARAM(x), int64_t num, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	int64_t _3 = 0;
	//const %3 = 0 : int
	_3 = 0;
	//update %0[%3] = %1 : int[] -> int[]
	// isCopyEliminated = true
	x[_3] = num;
	//return %0
	_DEALLOC(_2);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(x);
	return x;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(x);
	_DECL_DEALLOC(x);
	int64_t _2 = 0;
	int64_t _3 = 0;
	_DECL_1DARRAY(_4);
	_DECL_DEALLOC(_4);
	_DECL_1DARRAY(_5);
	_DECL_DEALLOC(_5);
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	void* _10;
	_DECL_1DARRAY(_12);
	_DECL_DEALLOC(_12);
	void* _13;
	int64_t _15 = 0;
	int64_t _16 = 0;
	//const %2 = 2 : int
	_2 = 2;
	//const %3 = 3 : int
	_3 = 3;
	//arraygen %4 = [2; 3] : int[]
	_DEALLOC(_4);
	_NEW_1DARRAY_int64_t(_4, _3, _2);
	_ADD_DEALLOC(_4);
	//assign %1 = %4  : int[]
	_DEALLOC(x);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(x, _4);
	_TRANSFER_DEALLOC(x, _4);
	//const %6 = 11 : int
	_6 = 11;
	//invoke (%5) = (%1, %6) ResetMacro3:func : function(int[],int)->(int[])
	{
		_DEALLOC(_5);
		// isCopyEliminated of '_1' = true
		_5 = _func_(_1DARRAY_PARAM(x), false, _6, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_5));
		_RESET_DEALLOC(_5, x, "true-true-false" , "func");
	}
	//assign %1 = %5  : int[]
	_DEALLOC(x);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(x, _5);
	_TRANSFER_DEALLOC(x, _5);
	//assert
	{
		//const %7 = 0 : int
		_7 = 0;
		//indexof %8 = %1, %7 : int[]
		_8=x[_7];
		//const %9 = 11 : int
		_9 = 11;
		//ifeq %8, %9 goto blklab0 : int
		if(_8==_9){goto blklab0;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab0
blklab0:;
	//assert
	}
	//fieldload %10 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %11 = %10 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %12 = [120,91,48,93,32,61,32] : int[]
	_DEALLOC(_12);
	_NEW_1DARRAY_int64_t(_12, 7, 0);
	_12[0] = 120; _12[1] = 91; _12[2] = 48; _12[3] = 93; _12[4] = 32; _12[5] = 61; _12[6] = 32; 
	_ADD_DEALLOC(_12);
	//indirectinvoke () = %11 (%12) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_12));
	}
	//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %14 = %13 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %15 = 0 : int
	_15 = 0;
	//indexof %16 = %1, %15 : int[]
	_16=x[_15];
	//indirectinvoke () = %14 (%16) : method(any)->()
	{
		printf("%"PRId64"\n", _16);
	}
	//return
	_DEALLOC(x);
	_DEALLOC(_4);
	_DEALLOC(_5);
	_DEALLOC(_12);
	exit(0);
}

