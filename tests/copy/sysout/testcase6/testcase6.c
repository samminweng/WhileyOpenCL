#include "testcase6.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(_1);
	_DECL_DEALLOC(_1);
	int64_t i;
	int64_t _3;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	//const %3 = 0 : int
	_3 = 0;
	//assign %2 = %3  : int
	// isCopyEliminated = true
	i = _3;
	//loop (%0, %2, %4, %5, %6, %7)
	while(true){
		//lengthof %4 = %0 : int[]
		_4 = a_size;
		//ifge %2, %4 goto blklab0 : int
		if(i>=_4){goto blklab0;}
		//const %5 = 5 : int
		_5 = 5;
		//update %0[%2] = %5 : int[] -> int[]
		a[i] = _5;
		//const %6 = 1 : int
		_6 = 1;
		//add %7 = %2, %6 : int
		_7=i+_6;
		//assign %2 = %7  : int
		// isCopyEliminated = true
		i = _7;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %0
	_DEALLOC(_1);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
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
	void* _14;
	int64_t _16;
	int64_t _17;
	void* _18;
	int64_t _20;
	int64_t _21;
	void* _22;
	int64_t _24;
	int64_t _25;
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
	//invoke (%13) = (%2) testcase6:func : function(int[])->(int[])
	{
		_FUNCTIONCALL_COPY_PRE(_13, b, "true-ALWAYS_RETURN-true" , "func");
		_DEALLOC(_13);
		void* tmp_a;
		_COPY_1DARRAY_PARAM(b, tmp_a, int64_t);
		// isCopyEliminated of '_2' = false
		_13 = _func_(tmp_a, b_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_13));
		_13_dealloc = true;
	}
	//assign %1 = %13  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _13);
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %16 = 0 : int
	_16 = 0;
	//indexof %17 = %1, %16 : int[]
	_17=a[_16];
	//indirectinvoke () = %15 (%17) : method(any)->()
	{
		printf("%"PRId64"\n", _17);
	}
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %20 = 0 : int
	_20 = 0;
	//indexof %21 = %2, %20 : int[]
	_21=b[_20];
	//indirectinvoke () = %19 (%21) : method(any)->()
	{
		printf("%"PRId64"\n", _21);
	}
	//fieldload %22 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %23 = %22 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %24 = 0 : int
	_24 = 0;
	//indexof %25 = %3, %24 : int[]
	_25=c[_24];
	//indirectinvoke () = %23 (%25) : method(any)->()
	{
		printf("%"PRId64"\n", _25);
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

