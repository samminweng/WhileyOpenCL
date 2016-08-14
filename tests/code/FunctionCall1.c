#include "FunctionCall1.h"
long long* func(_DECL_1DARRAY_PARAM(s), _DECL_DEALLOC_PARAM(s)){
	_DECL_1DARRAY(_1);
	_DECL_DEALLOC(_1);
	_DECL_1DARRAY(t);
	_DECL_DEALLOC(t);
	long long _3 = 0;
	long long _4 = 0;
	//assign %2 = %0  : int[]
	_DEALLOC(t);
	_UPDATE_1DARRAY(t, s);
	_TRANSFER_DEALLOC(t, s);
	//const %3 = 3 : int
	_3 = 3;
	//const %4 = 2 : int
	_4 = 2;
	//update %2[%4] = %3 : int[] -> int[]
	t[_4] = _3;
	//return %2
	_DEALLOC(s);
	_DEALLOC(_1);
	return t;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(s);
	_DECL_DEALLOC(s);
	long long _2 = 0;
	long long _3 = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	_DECL_1DARRAY(_7);
	_DECL_DEALLOC(_7);
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	void* _12;
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	void* _15;
	long long _17 = 0;
	long long _18 = 0;
	//const %2 = 0 : int
	_2 = 0;
	//const %3 = 0 : int
	_3 = 0;
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 0 : int
	_5 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//newlist %7 = (%2, %3, %4, %5, %6) : int[]
	_DEALLOC(_7);
	_NEW_1DARRAY(_7, 5, 0);
	_7[0] = _2; _7[1] = _3; _7[2] = _4; _7[3] = _5; _7[4] = _6; 
	_ADD_DEALLOC(_7);
	//assign %1 = %7  : int[]
	_DEALLOC(s);
	_UPDATE_1DARRAY(s, _7);
	_TRANSFER_DEALLOC(s, _7);
	//invoke (%8) = (%1) FunctionCall1:func : function(int[])->(int[])
	_UPDATE_1DARRAY_SIZE(_8, s);
	_DEALLOC(_8);
	_8 = func(_1DARRAY_PARAM(s), false);
	_REMOVE_DEALLOC(s);
	_ADD_DEALLOC(_8);
	//assign %1 = %8  : int[]
	_DEALLOC(s);
	_UPDATE_1DARRAY(s, _8);
	_TRANSFER_DEALLOC(s, _8);
	//assert
	{
		//const %9 = 2 : int
		_9 = 2;
		//indexof %10 = %1, %9 : int[]
		_10=s[_9];
		//const %11 = 3 : int
		_11 = 3;
		//ifeq %10, %11 goto blklab0 : int
		if(_10==_11){goto blklab0;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab0
blklab0:;
	//assert
	}
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %14 = [115,91,50,93,61] : int[]
	_DEALLOC(_14);
	_NEW_1DARRAY(_14, 5, 0);
	_14[0] = 115; _14[1] = 91; _14[2] = 50; _14[3] = 93; _14[4] = 61; 
	_ADD_DEALLOC(_14);
	//indirectinvoke () = %13 (%14) : method(any)->()
	printf("%lld", _14);
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %17 = 2 : int
	_17 = 2;
	//indexof %18 = %1, %17 : int[]
	_18=s[_17];
	//indirectinvoke () = %16 (%18) : method(any)->()
	printf("%lld\n", _18);
	//return
	_DEALLOC(s);
	_DEALLOC(_7);
	_DEALLOC(_8);
	_DEALLOC(_14);
	exit(0);
}

