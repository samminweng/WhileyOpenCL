#include "CallerMacro3.h"
int64_t* _f_(_DECL_1DARRAY_PARAM(x), _DECL_DEALLOC_PARAM(x), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_1);
	_DECL_DEALLOC(_1);
	//return %0
	_DEALLOC(_1);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(x);
	return x;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	int64_t _3 = 0;
	int64_t _4 = 0;
	_DECL_1DARRAY(_5);
	_DECL_DEALLOC(_5);
	int64_t _6 = 0;
	int64_t _7 = 0;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	int64_t _16 = 0;
	void* _17;
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
	void* _20;
	int64_t _22 = 0;
	int64_t _23 = 0;
	void* _24;
	_DECL_1DARRAY(_26);
	_DECL_DEALLOC(_26);
	void* _27;
	int64_t _29 = 0;
	int64_t _30 = 0;
	//const %3 = 0 : int
	_3 = 0;
	//const %4 = 10 : int
	_4 = 10;
	//arraygen %5 = [3; 4] : int[]
	_DEALLOC(_5);
	_NEW_1DARRAY_int64_t(_5, _4, _3);
	_ADD_DEALLOC(_5);
	//assign %1 = %5  : int[]
	_DEALLOC(b);
	_COPY_1DARRAY_int64_t(b, _5);
	_ADD_DEALLOC(b);
	//const %6 = 1 : int
	_6 = 1;
	//const %7 = 1 : int
	_7 = 1;
	//update %1[%7] = %6 : int[] -> int[]
	b[_7] = _6;
	//invoke (%8) = (%1) CallerMacro3:f : function(int[])->(int[])
	{
		void* b_tmp;
		_DEALLOC(_8);
		_8 = _f_(_COPY_1DARRAY_PARAM_int64_t(b), false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_8));
		_CALLER_DEALLOC(_8, b, "false-true-true" , "f");
	}
	//assign %2 = %8  : int[]
	_DEALLOC(a);
	_COPY_1DARRAY_int64_t(a, _8);
	_ADD_DEALLOC(a);
	//const %9 = 0 : int
	_9 = 0;
	//const %10 = 1 : int
	_10 = 1;
	//update %1[%10] = %9 : int[] -> int[]
	b[_10] = _9;
	//assert
	{
		//const %11 = 1 : int
		_11 = 1;
		//indexof %12 = %2, %11 : int[]
		_12=a[_11];
		//const %13 = 1 : int
		_13 = 1;
		//ifeq %12, %13 goto blklab0 : int
		if(_12==_13){goto blklab0;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab0
blklab0:;
	//assert
	}
	//assert
	{
		//const %14 = 1 : int
		_14 = 1;
		//indexof %15 = %1, %14 : int[]
		_15=b[_14];
		//const %16 = 0 : int
		_16 = 0;
		//ifeq %15, %16 goto blklab1 : int
		if(_15==_16){goto blklab1;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab1
blklab1:;
	//assert
	}
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %19 = [97,91,49,93,32,61,32] : int[]
	_DEALLOC(_19);
	_NEW_1DARRAY_int64_t(_19, 7, 0);
	_19[0] = 97; _19[1] = 91; _19[2] = 49; _19[3] = 93; _19[4] = 32; _19[5] = 61; _19[6] = 32; 
	_ADD_DEALLOC(_19);
	//indirectinvoke () = %18 (%19) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_19));
	}
	//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %21 = %20 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %22 = 1 : int
	_22 = 1;
	//indexof %23 = %2, %22 : int[]
	_23=a[_22];
	//indirectinvoke () = %21 (%23) : method(any)->()
	{
		printf("%"PRId64"\n", _23);
	}
	//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %25 = %24 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %26 = [98,91,49,93,32,61,32] : int[]
	_DEALLOC(_26);
	_NEW_1DARRAY_int64_t(_26, 7, 0);
	_26[0] = 98; _26[1] = 91; _26[2] = 49; _26[3] = 93; _26[4] = 32; _26[5] = 61; _26[6] = 32; 
	_ADD_DEALLOC(_26);
	//indirectinvoke () = %25 (%26) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_26));
	}
	//fieldload %27 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %28 = %27 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %29 = 1 : int
	_29 = 1;
	//indexof %30 = %1, %29 : int[]
	_30=b[_29];
	//indirectinvoke () = %28 (%30) : method(any)->()
	{
		printf("%"PRId64"\n", _30);
	}
	//return
	_DEALLOC(b);
	_DEALLOC(a);
	_DEALLOC(_5);
	_DEALLOC(_8);
	_DEALLOC(_19);
	_DEALLOC(_26);
	exit(0);
}

