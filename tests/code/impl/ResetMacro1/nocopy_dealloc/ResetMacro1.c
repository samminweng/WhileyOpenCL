#include "ResetMacro1.h"
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
	_DECL_1DARRAY(tmp);
	_DECL_DEALLOC(tmp);
	int64_t _3 = 0;
	int64_t _4 = 0;
	_DECL_1DARRAY(_5);
	_DECL_DEALLOC(_5);
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7 = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	void* _11;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	void* _14;
	int64_t _16 = 0;
	int64_t _17 = 0;
	//const %3 = 2 : int
	_3 = 2;
	//const %4 = 3 : int
	_4 = 3;
	//arraygen %5 = [3; 4] : int[]
	_DEALLOC(_5);
	_NEW_1DARRAY_int64_t(_5, _4, _3);
	_ADD_DEALLOC(_5);
	//assign %1 = %5  : int[]
	_DEALLOC(x);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(x, _5);
	_TRANSFER_DEALLOC(x, _5);
	//const %7 = 11 : int
	_7 = 11;
	//invoke (%6) = (%1, %7) ResetMacro1:func : function(int[],int)->(int[])
	{
		_DEALLOC(_6);
		// isCopyEliminated of '_1' = true
		_6 = _func_(_1DARRAY_PARAM(x), false, _7, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_6));
		_RESET_DEALLOC(_6, x, "true-true-false" , "func");
	}
	//assign %2 = %6  : int[]
	_DEALLOC(tmp);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(tmp, _6);
	_TRANSFER_DEALLOC(tmp, _6);
	//assign %1 = %2  : int[]
	_DEALLOC(x);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(x, tmp);
	_TRANSFER_DEALLOC(x, tmp);
	//assert
	{
		//const %8 = 0 : int
		_8 = 0;
		//indexof %9 = %1, %8 : int[]
		_9=x[_8];
		//const %10 = 11 : int
		_10 = 11;
		//ifeq %9, %10 goto blklab0 : int
		if(_9==_10){goto blklab0;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab0
blklab0:;
	//assert
	}
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = [120,91,48,93,32,61,32] : int[]
	_DEALLOC(_13);
	_NEW_1DARRAY_int64_t(_13, 7, 0);
	_13[0] = 120; _13[1] = 91; _13[2] = 48; _13[3] = 93; _13[4] = 32; _13[5] = 61; _13[6] = 32; 
	_ADD_DEALLOC(_13);
	//indirectinvoke () = %12 (%13) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_13));
	}
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %16 = 0 : int
	_16 = 0;
	//indexof %17 = %1, %16 : int[]
	_17=x[_16];
	//indirectinvoke () = %15 (%17) : method(any)->()
	{
		printf("%"PRId64"\n", _17);
	}
	//return
	_DEALLOC(x);
	_DEALLOC(tmp);
	_DEALLOC(_5);
	_DEALLOC(_6);
	_DEALLOC(_13);
	exit(0);
}
