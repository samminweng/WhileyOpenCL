#include "2parameter_test73.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAY_PARAM(b), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(a);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	int64_t ra;
	int64_t rb;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	int64_t _8;
	//const %5 = 0 : int
	_5 = 0;
	//indexof %6 = %0, %5 : int[]
	_6=a[_5];
	//assign %3 = %6  : int
	// isCopyEliminated = true
	ra = _6;
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %1, %7 : int[]
	_8=b[_7];
	//assign %4 = %8  : int
	// isCopyEliminated = true
	rb = _8;
	//return %0
	_DEALLOC(b);
	_DEALLOC(_2);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
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
	//invoke (%10) = (%1, %2) 2parameter_test73:func : function(int[],int[])->(int[])
	{
		_FUNCTIONCALL_NO_COPY_PRE(_10, b, "false-NEVER_RETURN-false" , "func");
		_FUNCTIONCALL_NO_COPY_PRE(_10, a, "false-ALWAYS_RETURN-false" , "func");
		_DEALLOC(_10);
		// isCopyEliminated of '_1' = true
		// isCopyEliminated of '_2' = true
		_10 = _func_(a, a_size, b, b_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_10));
		_10_dealloc = a_dealloc;
		a_dealloc = false;
	}
	//assign %3 = %10  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(r, _10);
	//return
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(r);
	_DEALLOC(_6);
	_DEALLOC(_9);
	_DEALLOC(_10);
	exit(0);
}

