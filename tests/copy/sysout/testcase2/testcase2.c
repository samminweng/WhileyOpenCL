#include "testcase2.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAY_PARAM(b), _DECL_1DARRAY_PARAM(c), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_3);
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
	int64_t _20;
	int64_t _21;
	_DECL_1DARRAY(_22);
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
	_NEW_1DARRAY_int64_t(_19, _18, _17);
	//return %19
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
	_NEW_1DARRAY_int64_t(_22, _21, _20);
	//return %22
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(_22);
	return _22;
//.blklab1
blklab1:;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_1DARRAY(b);
	_DECL_1DARRAY(c);
	_DECL_1DARRAY(r);
	int64_t _5;
	int64_t _6;
	_DECL_1DARRAY(_7);
	int64_t _8;
	int64_t _9;
	_DECL_1DARRAY(_10);
	int64_t _11;
	int64_t _12;
	_DECL_1DARRAY(_13);
	_DECL_1DARRAY(_14);
	void* _15;
	int64_t _17;
	int64_t _18;
	void* _19;
	int64_t _21;
	int64_t _22;
	void* _23;
	int64_t _25;
	int64_t _26;
	//const %5 = 2 : int
	_5 = 2;
	//const %6 = 2 : int
	_6 = 2;
	//arraygen %7 = [5; 6] : int[]
	_NEW_1DARRAY_int64_t(_7, _6, _5);
	//assign %1 = %7  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(a, _7);
	//const %8 = 2 : int
	_8 = 2;
	//const %9 = 2 : int
	_9 = 2;
	//arraygen %10 = [8; 9] : int[]
	_NEW_1DARRAY_int64_t(_10, _9, _8);
	//assign %2 = %10  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(b, _10);
	//const %11 = 2 : int
	_11 = 2;
	//const %12 = 2 : int
	_12 = 2;
	//arraygen %13 = [11; 12] : int[]
	_NEW_1DARRAY_int64_t(_13, _12, _11);
	//assign %3 = %13  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(c, _13);
	//invoke (%14) = (%1, %2, %3) testcase2:func : function(int[],int[],int[])->(int[])
	{
		// isCopyEliminated of '_1' = true
		// isCopyEliminated of '_2' = true
		// isCopyEliminated of '_3' = true
		_14 = _func_(a, a_size, b, b_size, c, c_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_14));
	}
	//assign %4 = %14  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(r, _14);
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %17 = 0 : int
	_17 = 0;
	//indexof %18 = %1, %17 : int[]
	_18=a[_17];
	//indirectinvoke () = %16 (%18) : method(any)->()
	{
		printf("%"PRId64"\n", _18);
	}
	//fieldload %19 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %20 = %19 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %21 = 0 : int
	_21 = 0;
	//indexof %22 = %2, %21 : int[]
	_22=b[_21];
	//indirectinvoke () = %20 (%22) : method(any)->()
	{
		printf("%"PRId64"\n", _22);
	}
	//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %24 = %23 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %25 = 0 : int
	_25 = 0;
	//indexof %26 = %3, %25 : int[]
	_26=c[_25];
	//indirectinvoke () = %24 (%26) : method(any)->()
	{
		printf("%"PRId64"\n", _26);
	}
	//return
	exit(0);
}
