#include "3parameter_test450.h"
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
	int64_t _15;
	int64_t _16;
	int64_t _17;
	int64_t _18;
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
	int64_t _20;
	int64_t _21;
	_DECL_1DARRAY(_22);
	_DECL_DEALLOC(_22);
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
	//const %13 = 0 : int
	_13 = 0;
	//indexof %14 = %0, %13 : int[]
	_14=a[_13];
	//const %15 = 0 : int
	_15 = 0;
	//indexof %16 = %1, %15 : int[]
	_16=b[_15];
	//ifne %14, %16 goto blklab0 : int
	if(_14!=_16){goto blklab0;}
	//const %17 = 3 : int
	_17 = 3;
	//const %18 = 3 : int
	_18 = 3;
	//arraygen %19 = [17; 18] : int[]
	_NEW1DARRAY_DEALLOC(_19, _17, _18, int64_t);
	//return %19
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_3);
	_DEALLOC(_22);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(_19);
	return _19;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//const %20 = 3 : int
	_20 = 3;
	//const %21 = 3 : int
	_21 = 3;
	//arraygen %22 = [20; 21] : int[]
	_NEW1DARRAY_DEALLOC(_22, _20, _21, int64_t);
	//return %22
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_3);
	_DEALLOC(_19);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(_22);
	return _22;
//.blklab1
blklab1:;
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
	//invoke (%14) = (%1, %2, %3) 3parameter_test450:func : function(int[],int[],int[])->(int[])
	{
		_FUNCTIONCALL_NO_COPY_PRE(_14, c, "false-NEVER_RETURN-false" , "func");
		_FUNCTIONCALL_NO_COPY_PRE(_14, b, "false-NEVER_RETURN-true" , "func");
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
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %17 = 0 : int
	_17 = 0;
	//indexof %18 = %2, %17 : int[]
	_18=b[_17];
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

