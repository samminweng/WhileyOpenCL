#include "CallerMacro4.h"
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
	//assign %5 = %3  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(c, a);
	//assign %6 = %4  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(d, b);
	//const %13 = 10 : int
	_13 = 10;
	//ifle %1, %13 goto blklab0 : int
	if(num<=_13){goto blklab0;}
	//return %0
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
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(c);
	return c;
//.blklab2
blklab2:;
//.blklab1
blklab1:;
	//return %6
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(d);
	return d;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(x);
	_DECL_1DARRAY(y);
	int64_t _3;
	int64_t _4;
	_DECL_1DARRAY(_5);
	_DECL_1DARRAY(_6);
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	void* _11;
	_DECL_1DARRAY(_13);
	void* _14;
	int64_t _16;
	int64_t _17;
	_DECL_1DARRAY(_18);
	int64_t _19;
	int64_t _20;
	int64_t _21;
	int64_t _22;
	void* _23;
	_DECL_1DARRAY(_25);
	void* _26;
	int64_t _28;
	int64_t _29;
	_DECL_1DARRAY(_30);
	int64_t _31;
	int64_t _32;
	int64_t _33;
	int64_t _34;
	void* _35;
	_DECL_1DARRAY(_37);
	void* _38;
	int64_t _40;
	int64_t _41;
	//const %3 = 2 : int
	_3 = 2;
	//const %4 = 3 : int
	_4 = 3;
	//arraygen %5 = [3; 4] : int[]
	_NEW_1DARRAY_int64_t(_5, _4, _3);
	//assign %1 = %5  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(x, _5);
	//const %7 = 11 : int
	_7 = 11;
	//invoke (%6) = (%1, %7) CallerMacro4:func : function(int[],int)->(int[])
	{
		void* tmp_x;
		_COPY_1DARRAY_PARAM(x, tmp_x, int64_t);
		// isCopyEliminated of 'x at 0' = false
		_6 = _func_(tmp_x, x_size, _7, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_6));
	}
	//assign %2 = %6  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(y, _6);
	//assert
	{
		//const %8 = 0 : int
		_8 = 0;
		//indexof %9 = %2, %8 : int[]
		_9=y[_8];
		//const %10 = 2 : int
		_10 = 2;
		//ifeq %9, %10 goto blklab3 : int
		if(_9==_10){goto blklab3;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab3
blklab3:;
	//assert
	}
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = [121,91,48,93,32,61,32] : int[]
	_NEW_1DARRAY_int64_t(_13, 7, 0);
	_13[0] = 121; _13[1] = 91; _13[2] = 48; _13[3] = 93; _13[4] = 32; _13[5] = 61; _13[6] = 32; 
	//indirectinvoke () = %12 (%13) : method(int[])->()
	{
		printf_s(_13, _13_size);
	}
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %16 = 0 : int
	_16 = 0;
	//indexof %17 = %2, %16 : int[]
	_17=y[_16];
	//indirectinvoke () = %15 (%17) : method(any)->()
	{
		printf("%"PRId64"\n", _17);
	}
	//const %19 = 10 : int
	_19 = 10;
	//invoke (%18) = (%1, %19) CallerMacro4:func : function(int[],int)->(int[])
	{
		void* tmp_x;
		_COPY_1DARRAY_PARAM(x, tmp_x, int64_t);
		// isCopyEliminated of 'x at 0' = false
		_18 = _func_(tmp_x, x_size, _19, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_18));
	}
	//assign %2 = %18  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(y, _18);
	//assert
	{
		//const %20 = 0 : int
		_20 = 0;
		//indexof %21 = %2, %20 : int[]
		_21=y[_20];
		//const %22 = 0 : int
		_22 = 0;
		//ifeq %21, %22 goto blklab4 : int
		if(_21==_22){goto blklab4;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab4
blklab4:;
	//assert
	}
	//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %24 = %23 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %25 = [121,91,48,93,32,61,32] : int[]
	_NEW_1DARRAY_int64_t(_25, 7, 0);
	_25[0] = 121; _25[1] = 91; _25[2] = 48; _25[3] = 93; _25[4] = 32; _25[5] = 61; _25[6] = 32; 
	//indirectinvoke () = %24 (%25) : method(int[])->()
	{
		printf_s(_25, _25_size);
	}
	//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %27 = %26 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %28 = 0 : int
	_28 = 0;
	//indexof %29 = %2, %28 : int[]
	_29=y[_28];
	//indirectinvoke () = %27 (%29) : method(any)->()
	{
		printf("%"PRId64"\n", _29);
	}
	//const %31 = 9 : int
	_31 = 9;
	//invoke (%30) = (%1, %31) CallerMacro4:func : function(int[],int)->(int[])
	{
		// isCopyEliminated of 'x at 0' = true
		_30 = _func_(x, x_size, _31, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_30));
	}
	//assign %2 = %30  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(y, _30);
	//assert
	{
		//const %32 = 0 : int
		_32 = 0;
		//indexof %33 = %2, %32 : int[]
		_33=y[_32];
		//const %34 = 1 : int
		_34 = 1;
		//ifeq %33, %34 goto blklab5 : int
		if(_33==_34){goto blklab5;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab5
blklab5:;
	//assert
	}
	//fieldload %35 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %36 = %35 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %37 = [121,91,48,93,32,61,32] : int[]
	_NEW_1DARRAY_int64_t(_37, 7, 0);
	_37[0] = 121; _37[1] = 91; _37[2] = 48; _37[3] = 93; _37[4] = 32; _37[5] = 61; _37[6] = 32; 
	//indirectinvoke () = %36 (%37) : method(int[])->()
	{
		printf_s(_37, _37_size);
	}
	//fieldload %38 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %39 = %38 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %40 = 0 : int
	_40 = 0;
	//indexof %41 = %2, %40 : int[]
	_41=y[_40];
	//indirectinvoke () = %39 (%41) : method(any)->()
	{
		printf("%"PRId64"\n", _41);
	}
	//return
	exit(0);
}

