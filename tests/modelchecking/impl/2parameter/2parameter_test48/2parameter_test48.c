#include "2parameter_test48.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAY_PARAM(b), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(a);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	int64_t _3;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	int64_t _8;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	//const %3 = 0 : int
	_3 = 0;
	//const %4 = 0 : int
	_4 = 0;
	//update %0[%4] = %3 : int[] -> int[]
	a[_4] = _3;
	//const %5 = 0 : int
	_5 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//update %1[%6] = %5 : int[] -> int[]
	b[_6] = _5;
	//const %7 = 3 : int
	_7 = 3;
	//const %8 = 3 : int
	_8 = 3;
	//arraygen %9 = [7; 8] : int[]
	_NEW1DARRAY_DEALLOC(_9, _7, _8, int64_t);
	//return %9
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(_2);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(_9);
	return _9;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(r);
	_DECL_DEALLOC(r);
	int64_t _4;
	int64_t _5;
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7;
	int64_t _8;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	void* _11;
	int64_t _13;
	int64_t _14;
	//const %4 = 2 : int
	_4 = 2;
	//const %5 = 2 : int
	_5 = 2;
	//arraygen %6 = [4; 5] : int[]
	_NEW1DARRAY_DEALLOC(_6, _4, _5, int64_t);
	//assign %1 = %6  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _6);
	//const %7 = 2 : int
	_7 = 2;
	//const %8 = 2 : int
	_8 = 2;
	//arraygen %9 = [7; 8] : int[]
	_NEW1DARRAY_DEALLOC(_9, _7, _8, int64_t);
	//assign %2 = %9  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(b, _9);
	//invoke (%10) = (%1, %2) 2parameter_test48:func : function(int[],int[])->(int[])
	{
		_FUNCTIONCALL_NO_COPY_PRE(_10, b, "true-NEVER_RETURN-false" , "func");
		_FUNCTIONCALL_COPY_PRE(_10, a, "true-NEVER_RETURN-true" , "func");
		_DEALLOC(_10);
		void* tmp_a;
		_COPY_1DARRAY_PARAM(a, tmp_a, int64_t);
		// isCopyEliminated of '_1' = false
		// isCopyEliminated of '_2' = true
		_10 = _func_(tmp_a, a_size, b, b_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_10));
		_10_dealloc = true;
		free(tmp_a);
	}
	//assign %3 = %10  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(r, _10);
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = 0 : int
	_13 = 0;
	//indexof %14 = %1, %13 : int[]
	_14=a[_13];
	//indirectinvoke () = %12 (%14) : method(any)->()
	{
		printf("%"PRId64"\n", _14);
	}
	//return
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(r);
	_DEALLOC(_6);
	_DEALLOC(_9);
	_DEALLOC(_10);
	exit(0);
}

