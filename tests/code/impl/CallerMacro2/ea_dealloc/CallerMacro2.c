#include "CallerMacro2.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(x), int64_t num, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(x);
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	int64_t _3;
	//const %3 = 0 : int
	_3 = 0;
	//update %0[%3] = %1 : int[] -> int[]
	x[_3] = num;
	//return %0
	_DEALLOC(_2);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(x);
	return x;
	//return
}

int64_t* _g3_(int64_t x, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_1);
	_DECL_DEALLOC(_1);
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	int64_t _4;
	int64_t _5;
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	_DECL_1DARRAY(_7);
	_DECL_DEALLOC(_7);
	int64_t _8;
	int64_t _9;
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 3 : int
	_5 = 3;
	//arraygen %6 = [4; 5] : int[]
	_NEW1DARRAY_DEALLOC(_6, _4, _5, int64_t);
	//assign %2 = %6  : int[]
	_ADD_DEALLOC(a, _6, int64_t);
	//const %8 = 11 : int
	_8 = 11;
	//invoke (%7) = (%2, %8) CallerMacro2:func : function(int[],int)->(int[])
	{
		_FUNCTIONCALL_COPY_PRE(_7, a, 0, "liveness: a = true, readonly: a = false, return:a = ALWAYS_RETURN" , "func");
		_DEALLOC(_7);
		void* tmp_x;
		_COPY_1DARRAY_PARAM(a, tmp_x, int64_t);
		_7 = _func_(tmp_x, a_size, _8, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_7));
		_7_dealloc = true;
	}
	//assign %3 = %7  : int[]
	_ADD_DEALLOC(b, _7, int64_t);
	//const %9 = 0 : int
	_9 = 0;
	//ifle %0, %9 goto blklab0 : int
	if(x<=_9){goto blklab0;}
	//return %2
	_DEALLOC(_1);
	_DEALLOC(b);
	_DEALLOC(_6);
	_DEALLOC(_7);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//return %3
	_DEALLOC(_1);
	_DEALLOC(a);
	_DEALLOC(_6);
	_DEALLOC(_7);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(b);
	return b;
//.blklab1
blklab1:;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(_3);
	_DECL_DEALLOC(_3);
	int64_t _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	void* _8;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	void* _11;
	int64_t _13;
	int64_t _14;
	_DECL_1DARRAY(_15);
	_DECL_DEALLOC(_15);
	int64_t _16;
	int64_t _17;
	int64_t _18;
	int64_t _19;
	void* _20;
	_DECL_1DARRAY(_22);
	_DECL_DEALLOC(_22);
	void* _23;
	int64_t _25;
	int64_t _26;
	//const %4 = 1 : int
	_4 = 1;
	//invoke (%3) = (%4) CallerMacro2:g3 : function(int)->(int[])
	{
		_DEALLOC(_3);
		_3 = _g3_(_4, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_3));
		_3_dealloc = true;
	}
	//assign %1 = %3  : int[]
	_ADD_DEALLOC(a, _3, int64_t);
	//assert
	{
		//const %5 = 0 : int
		_5 = 0;
		//indexof %6 = %1, %5 : int[]
		_6=a[_5];
		//const %7 = 0 : int
		_7 = 0;
		//ifeq %6, %7 goto blklab2 : int
		if(_6==_7){goto blklab2;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab2
blklab2:;
	//assert
	}
	//fieldload %8 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %9 = %8 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %10 = [97,91,48,93,32,61,32] : int[]
	_DEALLOC(_10);
	_NEW_1DARRAY_int64_t(_10, 7, 0);
	_10[0] = 97; _10[1] = 91; _10[2] = 48; _10[3] = 93; _10[4] = 32; _10[5] = 61; _10[6] = 32; 
	_10_dealloc = true;
	//indirectinvoke () = %9 (%10) : method(int[])->()
	{
		printf_s(_10, _10_size);
	}
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = 0 : int
	_13 = 0;
	//indexof %14 = %1, %13 : int[]
	_14=a[_13];
	//indirectinvoke () = %12 (%14) : method(any)->()
	{
		printf("%"PRId64"\n", _14);
	}
	//const %16 = 0 : int
	_16 = 0;
	//invoke (%15) = (%16) CallerMacro2:g3 : function(int)->(int[])
	{
		_DEALLOC(_15);
		_15 = _g3_(_16, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_15));
		_15_dealloc = true;
	}
	//assign %2 = %15  : int[]
	_ADD_DEALLOC(b, _15, int64_t);
	//assert
	{
		//const %17 = 0 : int
		_17 = 0;
		//indexof %18 = %2, %17 : int[]
		_18=b[_17];
		//const %19 = 11 : int
		_19 = 11;
		//ifeq %18, %19 goto blklab3 : int
		if(_18==_19){goto blklab3;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab3
blklab3:;
	//assert
	}
	//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %21 = %20 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %22 = [98,91,48,93,32,61,32] : int[]
	_DEALLOC(_22);
	_NEW_1DARRAY_int64_t(_22, 7, 0);
	_22[0] = 98; _22[1] = 91; _22[2] = 48; _22[3] = 93; _22[4] = 32; _22[5] = 61; _22[6] = 32; 
	_22_dealloc = true;
	//indirectinvoke () = %21 (%22) : method(int[])->()
	{
		printf_s(_22, _22_size);
	}
	//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %24 = %23 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %25 = 0 : int
	_25 = 0;
	//indexof %26 = %2, %25 : int[]
	_26=b[_25];
	//indirectinvoke () = %24 (%26) : method(any)->()
	{
		printf("%"PRId64"\n", _26);
	}
	//return
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(_3);
	_DEALLOC(_10);
	_DEALLOC(_15);
	_DEALLOC(_22);
	exit(0);
}

