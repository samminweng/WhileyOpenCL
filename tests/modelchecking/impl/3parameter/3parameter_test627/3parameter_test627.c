#include "3parameter_test627.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAY_PARAM(b), _DECL_1DARRAY_PARAM(c), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(a);
	_DECL_DEALLOC(b);
	_DECL_DEALLOC(c);
	_DECL_1DARRAY(_3);
	_DECL_DEALLOC(_3);
	int64_t ra;
	int64_t rb;
	int64_t rc;
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
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %0, %7 : int[]
	_8=a[_7];
	//assign %4 = %8  : int
	// isCopyEliminated = true
	ra = _8;
	//const %9 = 0 : int
	_9 = 0;
	//indexof %10 = %1, %9 : int[]
	_10=b[_9];
	//assign %5 = %10  : int
	// isCopyEliminated = true
	rb = _10;
	//const %11 = 0 : int
	_11 = 0;
	//indexof %12 = %2, %11 : int[]
	_12=c[_11];
	//assign %6 = %12  : int
	// isCopyEliminated = true
	rc = _12;
	//const %13 = 3 : int
	_13 = 3;
	//const %14 = 3 : int
	_14 = 3;
	//arraygen %15 = [13; 14] : int[]
	_NEW1DARRAY_DEALLOC(_15, _13, _14, int64_t);
	//return %15
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_3);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(_15);
	return _15;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(c);
	_DECL_DEALLOC(c);
	_DECL_1DARRAY(r);
	_DECL_DEALLOC(r);
	int64_t _5;
	int64_t _6;
	_DECL_1DARRAY(_7);
	_DECL_DEALLOC(_7);
	int64_t _8;
	int64_t _9;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	int64_t _11;
	int64_t _12;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	//const %5 = 2 : int
	_5 = 2;
	//const %6 = 2 : int
	_6 = 2;
	//arraygen %7 = [5; 6] : int[]
	_NEW1DARRAY_DEALLOC(_7, _5, _6, int64_t);
	//assign %1 = %7  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _7);
	//const %8 = 2 : int
	_8 = 2;
	//const %9 = 2 : int
	_9 = 2;
	//arraygen %10 = [8; 9] : int[]
	_NEW1DARRAY_DEALLOC(_10, _8, _9, int64_t);
	//assign %2 = %10  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(b, _10);
	//const %11 = 2 : int
	_11 = 2;
	//const %12 = 2 : int
	_12 = 2;
	//arraygen %13 = [11; 12] : int[]
	_NEW1DARRAY_DEALLOC(_13, _11, _12, int64_t);
	//assign %3 = %13  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(c, _13);
	//invoke (%14) = (%1, %2, %3) 3parameter_test627:func : function(int[],int[],int[])->(int[])
	{
		_FUNCTIONCALL_NO_COPY_PRE(_14, c, "false-NEVER_RETURN-false" , "func");
		_FUNCTIONCALL_NO_COPY_PRE(_14, b, "false-NEVER_RETURN-false" , "func");
		_FUNCTIONCALL_NO_COPY_PRE(_14, a, "false-NEVER_RETURN-false" , "func");
		_DEALLOC(_14);
		// isCopyEliminated of '_1' = true
		// isCopyEliminated of '_2' = true
		// isCopyEliminated of '_3' = true
		_14 = _func_(a, a_size, b, b_size, c, c_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_14));
		_14_dealloc = true;
	}
	//assign %4 = %14  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(r, _14);
	//return
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(r);
	_DEALLOC(_7);
	_DEALLOC(_10);
	_DEALLOC(_13);
	_DEALLOC(_14);
	exit(0);
}

