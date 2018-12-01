#include "testcase4.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(x), int64_t num, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(x);
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(c);
	_DECL_DEALLOC(c);
	_DECL_1DARRAY(d);
	_DECL_DEALLOC(d);
	int64_t _7;
	int64_t _8;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	int64_t _10;
	int64_t _11;
	_DECL_1DARRAY(_12);
	_DECL_DEALLOC(_12);
	int64_t _13;
	int64_t _14;
	//const %7 = 0 : int
	_7 = 0;
	//const %8 = 3 : int
	_8 = 3;
	//arraygen %9 = [7; 8] : int[]
	_NEW1DARRAY_DEALLOC(_9, _7, _8, int64_t);
	//assign %3 = %9  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _9);
	//const %10 = 1 : int
	_10 = 1;
	//const %11 = 3 : int
	_11 = 3;
	//arraygen %12 = [10; 11] : int[]
	_NEW1DARRAY_DEALLOC(_12, _10, _11, int64_t);
	//assign %4 = %12  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(b, _12);
	//assign %5 = %3  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(c, a);
	//assign %6 = %4  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(d, b);
	//const %13 = 10 : int
	_13 = 10;
	//ifle %1, %13 goto blklab0 : int
	if(num<=_13){goto blklab0;}
	//return %0
	_DEALLOC(_2);
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(d);
	_DEALLOC(_9);
	_DEALLOC(_12);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(x);
	return x;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//const %14 = 9 : int
	_14 = 9;
	//ifle %1, %14 goto blklab2 : int
	if(num<=_14){goto blklab2;}
	//return %5
	_DEALLOC(x);
	_DEALLOC(_2);
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(d);
	_DEALLOC(_9);
	_DEALLOC(_12);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(c);
	return c;
//.blklab2
blklab2:;
	//return %6
	_DEALLOC(x);
	_DEALLOC(_2);
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_9);
	_DEALLOC(_12);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(d);
	return d;
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
	int64_t _4;
	int64_t _5;
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7;
	int64_t _8;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	int64_t _10;
	int64_t _11;
	_DECL_1DARRAY(_12);
	_DECL_DEALLOC(_12);
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
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
	//const %10 = 2 : int
	_10 = 2;
	//const %11 = 2 : int
	_11 = 2;
	//arraygen %12 = [10; 11] : int[]
	_NEW1DARRAY_DEALLOC(_12, _10, _11, int64_t);
	//assign %3 = %12  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(c, _12);
	//const %14 = 11 : int
	_14 = 11;
	//invoke (%13) = (%2, %14) testcase4:func : function(int[],int)->(int[])
	{
		_FUNCTIONCALL_COPY_PRE(_13, b, 0, "liveness: b = true, readonly: b = true, return:b = MAYBE_RETURN" , "func");
		_DEALLOC(_13);
		void* tmp_x;
		_COPY_1DARRAY_PARAM(b, tmp_x, int64_t);
		// isCopyEliminated of 'b at 0' = false
		_13 = _func_(tmp_x, b_size, _14, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_13));
		if( _13 == tmp_x ){
			_13_dealloc = true;
		} else {
			_13_dealloc = true;
			free(tmp_x);
		}
	}
	//assign %1 = %13  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _13);
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
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_6);
	_DEALLOC(_9);
	_DEALLOC(_12);
	_DEALLOC(_13);
	exit(0);
}

