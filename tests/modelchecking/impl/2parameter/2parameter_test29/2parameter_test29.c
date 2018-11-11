#include "2parameter_test29.h"
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
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
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
	//const %9 = 0 : int
	_9 = 0;
	//indexof %10 = %0, %9 : int[]
	_10=a[_9];
	//const %11 = 0 : int
	_11 = 0;
	//indexof %12 = %1, %11 : int[]
	_12=b[_11];
	//ifne %10, %12 goto blklab0 : int
	if(_10!=_12){goto blklab0;}
	//const %13 = 3 : int
	_13 = 3;
	//const %14 = 3 : int
	_14 = 3;
	//arraygen %15 = [13; 14] : int[]
	_NEW1DARRAY_DEALLOC(_15, _13, _14, int64_t);
	//return %15
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(_2);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(_15);
	return _15;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//return %1
	_DEALLOC(a);
	_DEALLOC(_2);
	_DEALLOC(_15);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(b);
	return b;
//.blklab1
blklab1:;
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
	//invoke (%10) = (%1, %2) 2parameter_test29:func : function(int[],int[])->(int[])
	{
		_FUNCTIONCALL_NO_COPY_PRE(_10, b, "false-MAYBE_RETURN-false" , "func");
		_FUNCTIONCALL_NO_COPY_PRE(_10, a, "false-NEVER_RETURN-true" , "func");
		_DEALLOC(_10);
		// isCopyEliminated of '_1' = true
		// isCopyEliminated of '_2' = true
		_10 = _func_(a, a_size, b, b_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_10));
		if( _10 == b ){
			_10_dealloc = b_dealloc;
			b_dealloc = false;
		} else {
			_10_dealloc = true;
		}
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

