#include "3parameter_test575.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAY_PARAM(b), _DECL_1DARRAY_PARAM(c), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(a);
	_DECL_DEALLOC(b);
	_DECL_DEALLOC(c);
	_DECL_1DARRAY(_3);
	_DECL_DEALLOC(_3);
	int64_t rb;
	int64_t rc;
	int64_t _6;
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	//const %6 = 0 : int
	_6 = 0;
	//const %7 = 0 : int
	_7 = 0;
	//update %0[%7] = %6 : int[] -> int[]
	a[_7] = _6;
	//const %8 = 0 : int
	_8 = 0;
	//indexof %9 = %1, %8 : int[]
	_9=b[_8];
	//assign %4 = %9  : int
	// isCopyEliminated = true
	rb = _9;
	//const %10 = 0 : int
	_10 = 0;
	//indexof %11 = %2, %10 : int[]
	_11=c[_10];
	//assign %5 = %11  : int
	// isCopyEliminated = true
	rc = _11;
	//return %2
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(_3);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(c);
	return c;
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
	void* _15;
	int64_t _17;
	int64_t _18;
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
	//invoke (%14) = (%1, %2, %3) 3parameter_test575:func : function(int[],int[],int[])->(int[])
	{
		_FUNCTIONCALL_COPY_PRE(_14, c, "false-ALWAYS_RETURN-true" , "func");
		_FUNCTIONCALL_NO_COPY_PRE(_14, b, "false-NEVER_RETURN-false" , "func");
		_FUNCTIONCALL_NO_COPY_PRE(_14, a, "true-NEVER_RETURN-false" , "func");
		_DEALLOC(_14);
		void* tmp_c;
		_COPY_1DARRAY_PARAM(c, tmp_c, int64_t);
		// isCopyEliminated of '_1' = true
		// isCopyEliminated of '_2' = true
		// isCopyEliminated of '_3' = false
		_14 = _func_(a, a_size, b, b_size, tmp_c, c_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_14));
		_14_dealloc = true;
	}
	//assign %4 = %14  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(r, _14);
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %17 = 0 : int
	_17 = 0;
	//indexof %18 = %3, %17 : int[]
	_18=c[_17];
	//indirectinvoke () = %16 (%18) : method(any)->()
	{
		printf("%"PRId64"\n", _18);
	}
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

