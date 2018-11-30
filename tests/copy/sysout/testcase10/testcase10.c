#include "testcase10.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(x), int64_t num, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(x);
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	int64_t _4;
	int64_t _5;
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7;
	int64_t _8;
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 3 : int
	_5 = 3;
	//arraygen %6 = [4; 5] : int[]
	_NEW1DARRAY_DEALLOC(_6, _4, _5, int64_t);
	//assign %3 = %6  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _6);
	//const %7 = 10 : int
	_7 = 10;
	//ifle %1, %7 goto blklab0 : int
	if(num<=_7){goto blklab0;}
	//const %8 = 0 : int
	_8 = 0;
	//update %0[%8] = %1 : int[] -> int[]
	x[_8] = num;
	//return %0
	_DEALLOC(_2);
	_DEALLOC(a);
	_DEALLOC(_6);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(x);
	return x;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//return %3
	_DEALLOC(x);
	_DEALLOC(_2);
	_DEALLOC(_6);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
//.blklab1
blklab1:;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(x);
	_DECL_DEALLOC(x);
	_DECL_1DARRAY(tmp);
	_DECL_DEALLOC(tmp);
	int64_t _3;
	int64_t _4;
	_DECL_1DARRAY(_5);
	_DECL_DEALLOC(_5);
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	void* _11;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	void* _14;
	int64_t _16;
	int64_t _17;
	_DECL_1DARRAY(_18);
	_DECL_DEALLOC(_18);
	int64_t _19;
	int64_t _20;
	int64_t _21;
	int64_t _22;
	void* _23;
	_DECL_1DARRAY(_25);
	_DECL_DEALLOC(_25);
	void* _26;
	int64_t _28;
	int64_t _29;
	int64_t _30;
	int64_t _31;
	int64_t _32;
	//const %3 = 2 : int
	_3 = 2;
	//const %4 = 3 : int
	_4 = 3;
	//arraygen %5 = [3; 4] : int[]
	_NEW1DARRAY_DEALLOC(_5, _3, _4, int64_t);
	//assign %1 = %5  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(x, _5);
	//const %7 = 11 : int
	_7 = 11;
	//invoke (%6) = (%1, %7) testcase10:func : function(int[],int)->(int[])
	{
		_FUNCTIONCALL_NO_COPY_PRE(_6, x, "true-MAYBE_RETURN-false" , "func");
		_DEALLOC(_6);
		// isCopyEliminated of '_1' = true
		_6 = _func_(x, x_size, _7, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_6));
		if( _6 == x ){
			_6_dealloc = x_dealloc;
			x_dealloc = false;
		} else {
			_6_dealloc = true;
		}
	}
	//assign %2 = %6  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(tmp, _6);
	//assign %1 = %2  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(x, tmp);
	//assert
	{
		//const %8 = 0 : int
		_8 = 0;
		//indexof %9 = %1, %8 : int[]
		_9=x[_8];
		//const %10 = 11 : int
		_10 = 11;
		//ifeq %9, %10 goto blklab2 : int
		if(_9==_10){goto blklab2;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab2
blklab2:;
	//assert
	}
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = [120,91,48,93,32,61,32] : int[]
	_DEALLOC(_13);
	_NEW_1DARRAY_int64_t(_13, 7, 0);
	_13[0] = 120; _13[1] = 91; _13[2] = 48; _13[3] = 93; _13[4] = 32; _13[5] = 61; _13[6] = 32; 
	_13_dealloc = true;
	//indirectinvoke () = %12 (%13) : method(int[])->()
	{
		printf_s(_13, _13_size);
	}
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %16 = 0 : int
	_16 = 0;
	//indexof %17 = %1, %16 : int[]
	_17=x[_16];
	//indirectinvoke () = %15 (%17) : method(any)->()
	{
		printf("%"PRId64"\n", _17);
	}
	//const %19 = 65536 : int
	_19 = 65536;
	//invoke (%18) = (%1, %19) testcase10:func : function(int[],int)->(int[])
	{
		_FUNCTIONCALL_NO_COPY_PRE(_18, x, "true-MAYBE_RETURN-false" , "func");
		_DEALLOC(_18);
		// isCopyEliminated of '_1' = true
		_18 = _func_(x, x_size, _19, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_18));
		if( _18 == x ){
			_18_dealloc = x_dealloc;
			x_dealloc = false;
		} else {
			_18_dealloc = true;
		}
	}
	//assign %1 = %18  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(x, _18);
	//assert
	{
		//const %20 = 0 : int
		_20 = 0;
		//indexof %21 = %1, %20 : int[]
		_21=x[_20];
		//const %22 = 65536 : int
		_22 = 65536;
		//ifeq %21, %22 goto blklab3 : int
		if(_21==_22){goto blklab3;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab3
blklab3:;
	//assert
	}
	//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %24 = %23 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %25 = [120,91,48,93,32,61,32] : int[]
	_DEALLOC(_25);
	_NEW_1DARRAY_int64_t(_25, 7, 0);
	_25[0] = 120; _25[1] = 91; _25[2] = 48; _25[3] = 93; _25[4] = 32; _25[5] = 61; _25[6] = 32; 
	_25_dealloc = true;
	//indirectinvoke () = %24 (%25) : method(int[])->()
	{
		printf_s(_25, _25_size);
	}
	//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %27 = %26 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %28 = 0 : int
	_28 = 0;
	//indexof %29 = %1, %28 : int[]
	_29=x[_28];
	//indirectinvoke () = %27 (%29) : method(any)->()
	{
		printf("%"PRId64"\n", _29);
	}
	//assert
	{
		//const %30 = 0 : int
		_30 = 0;
		//indexof %31 = %1, %30 : int[]
		_31=x[_30];
		//const %32 = 65536 : int
		_32 = 65536;
		//ifeq %31, %32 goto blklab4 : int
		if(_31==_32){goto blklab4;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab4
blklab4:;
	//assert
	}
	//return
	_DEALLOC(x);
	_DEALLOC(tmp);
	_DEALLOC(_5);
	_DEALLOC(_6);
	_DEALLOC(_13);
	_DEALLOC(_18);
	_DEALLOC(_25);
	exit(0);
}

