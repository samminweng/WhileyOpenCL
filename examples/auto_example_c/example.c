#include "example.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(b), _DECL_DEALLOC_PARAM(b), int64_t num, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	_DECL_1DARRAY(c);
	_DECL_DEALLOC(c);
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
	_DEALLOC(_6);
	_NEW_1DARRAY_int64_t(_6, _5, _4);
	_ADD_DEALLOC(_6);
	//assign %3 = %6  : int[]
	_DEALLOC(c);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(c, _6);
	_TRANSFER_DEALLOC(c, _6);
	//const %7 = 10 : int
	_7 = 10;
	//ifle %1, %7 goto blklab0 : int
	if(num<=_7){goto blklab0;}
	//const %8 = 0 : int
	_8 = 0;
	//update %0[%8] = %1 : int[] -> int[]
	b[_8] = num;
	//return %0
	_DEALLOC(_2);
	_DEALLOC(c);
	_DEALLOC(_6);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(b);
	return b;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//return %3
	_DEALLOC(b);
	_DEALLOC(_2);
	_DEALLOC(_6);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(c);
	return c;
//.blklab1
blklab1:;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(r);
	_DECL_DEALLOC(r);
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	int64_t _4;
	int64_t _5;
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	_DECL_1DARRAY(_7);
	_DECL_DEALLOC(_7);
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	void* _15;
	int64_t _17;
	int64_t _18;
	//const %4 = 2 : int
	_4 = 2;
	//const %5 = 3 : int
	_5 = 3;
	//arraygen %6 = [4; 5] : int[]
	_DEALLOC(_6);
	_NEW_1DARRAY_int64_t(_6, _5, _4);
	_ADD_DEALLOC(_6);
	//assign %1 = %6  : int[]
	_DEALLOC(b);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(b, _6);
	_TRANSFER_DEALLOC(b, _6);
	//const %8 = 11 : int
	_8 = 11;
	//invoke (%7) = (%1, %8) example:func : function(int[],int)->(int[])
	{
		void* tmp_b;
		_COPY_1DARRAY_PARAM(b, tmp_b, int64_t);
		_DEALLOC(_7);
		// isCopyEliminated of '_1' = false
		_7 = _func_(tmp_b, b_size, false, _8, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_7));
		_CALLER_DEALLOC(b, "true-true-true" , "func");
		_CALLER_DEALLOC_POST(_7, tmp_b);
	}
	//assign %2 = %7  : int[]
	_DEALLOC(r);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(r, _7);
	_TRANSFER_DEALLOC(r, _7);
	//assign %3 = %2  : int[]
	_DEALLOC(a);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(a, r);
	_TRANSFER_DEALLOC(a, r);
	//assert
	{
		//const %9 = 0 : int
		_9 = 0;
		//indexof %10 = %1, %9 : int[]
		_10=b[_9];
		//const %11 = 2 : int
		_11 = 2;
		//ifeq %10, %11 goto blklab2 : int
		if(_10==_11){goto blklab2;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab2
blklab2:;
	//assert
	}
	//assert
	{
		//const %12 = 0 : int
		_12 = 0;
		//indexof %13 = %3, %12 : int[]
		_13=a[_12];
		//const %14 = 11 : int
		_14 = 11;
		//ifeq %13, %14 goto blklab3 : int
		if(_13==_14){goto blklab3;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab3
blklab3:;
	//assert
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %17 = 0 : int
	_17 = 0;
	//indexof %18 = %1, %17 : int[]
	_18=b[_17];
	//indirectinvoke () = %16 (%18) : method(any)->()
	{
		printf("%"PRId64"\n", _18);
	}
	//return
	_DEALLOC(b);
	_DEALLOC(r);
	_DEALLOC(a);
	_DEALLOC(_6);
	_DEALLOC(_7);
	exit(0);
}

