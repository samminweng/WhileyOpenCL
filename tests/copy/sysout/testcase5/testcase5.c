#include "testcase5.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(x), int64_t num, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	_DECL_1DARRAY(a);
	_DECL_1DARRAY(b);
	_DECL_1DARRAY(c);
	_DECL_1DARRAY(d);
	int64_t _7;
	int64_t _8;
	_DECL_1DARRAY(_9);
	int64_t _10;
	int64_t _11;
	_DECL_1DARRAY(_12);
	int64_t _13;
	int64_t _14;
	//const %7 = 0 : int
	_7 = 0;
	//const %8 = 3 : int
	_8 = 3;
	//arraygen %9 = [7; 8] : int[]
	_NEW_1DARRAY_int64_t(_9, _8, _7);
	//assign %3 = %9  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(a, _9);
	//const %10 = 1 : int
	_10 = 1;
	//const %11 = 3 : int
	_11 = 3;
	//arraygen %12 = [10; 11] : int[]
	_NEW_1DARRAY_int64_t(_12, _11, _10);
	//assign %4 = %12  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(b, _12);
	//const %13 = 0 : int
	_13 = 0;
	//update %0[%13] = %1 : int[] -> int[]
	x[_13] = num;
	//assign %5 = %3  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(c, a);
	//assign %6 = %4  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(d, b);
	//const %14 = 9 : int
	_14 = 9;
	//ifle %1, %14 goto blklab0 : int
	if(num<=_14){goto blklab0;}
	//return %5
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(c);
	return c;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//return %6
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(d);
	return d;
//.blklab1
blklab1:;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_1DARRAY(b);
	_DECL_1DARRAY(c);
	int64_t _4;
	int64_t _5;
	_DECL_1DARRAY(_6);
	int64_t _7;
	int64_t _8;
	_DECL_1DARRAY(_9);
	int64_t _10;
	int64_t _11;
	_DECL_1DARRAY(_12);
	_DECL_1DARRAY(_13);
	int64_t _14;
	void* _15;
	int64_t _17;
	int64_t _18;
	void* _19;
	int64_t _21;
	int64_t _22;
	void* _23;
	int64_t _25;
	int64_t _26;
	//const %4 = 2 : int
	_4 = 2;
	//const %5 = 2 : int
	_5 = 2;
	//arraygen %6 = [4; 5] : int[]
	_NEW_1DARRAY_int64_t(_6, _5, _4);
	//assign %1 = %6  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(a, _6);
	//const %7 = 2 : int
	_7 = 2;
	//const %8 = 2 : int
	_8 = 2;
	//arraygen %9 = [7; 8] : int[]
	_NEW_1DARRAY_int64_t(_9, _8, _7);
	//assign %2 = %9  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(b, _9);
	//const %10 = 2 : int
	_10 = 2;
	//const %11 = 2 : int
	_11 = 2;
	//arraygen %12 = [10; 11] : int[]
	_NEW_1DARRAY_int64_t(_12, _11, _10);
	//assign %3 = %12  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(c, _12);
	//const %14 = 11 : int
	_14 = 11;
	//invoke (%13) = (%2, %14) testcase5:func : function(int[],int)->(int[])
	{
		void* tmp_x;
		_COPY_1DARRAY_PARAM(b, tmp_x, int64_t);
		// isCopyEliminated of '_2' = false
		_13 = _func_(tmp_x, b_size, _14, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_13));
	}
	//assign %1 = %13  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(a, _13);
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

