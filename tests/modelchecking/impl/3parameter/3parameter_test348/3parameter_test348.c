#include "3parameter_test348.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAY_PARAM(b), _DECL_1DARRAY_PARAM(c), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(a);
	_DECL_DEALLOC(b);
	_DECL_DEALLOC(c);
	_DECL_1DARRAY(_3);
	_DECL_DEALLOC(_3);
	int64_t _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	_DECL_1DARRAY(_16);
	_DECL_DEALLOC(_16);
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 0 : int
	_5 = 0;
	//update %0[%5] = %4 : int[] -> int[]
	a[_5] = _4;
	//const %6 = 0 : int
	_6 = 0;
	//const %7 = 0 : int
	_7 = 0;
	//update %1[%7] = %6 : int[] -> int[]
	b[_7] = _6;
	//const %8 = 0 : int
	_8 = 0;
	//const %9 = 0 : int
	_9 = 0;
	//update %2[%9] = %8 : int[] -> int[]
	c[_9] = _8;
	//const %10 = 0 : int
	_10 = 0;
	//indexof %11 = %0, %10 : int[]
	_11=a[_10];
	//const %12 = 0 : int
	_12 = 0;
	//indexof %13 = %1, %12 : int[]
	_13=b[_12];
	//ifne %11, %13 goto blklab0 : int
	if(_11!=_13){goto blklab0;}
	//return %0
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_3);
	_DEALLOC(_16);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//const %14 = 3 : int
	_14 = 3;
	//const %15 = 3 : int
	_15 = 3;
	//arraygen %16 = [14; 15] : int[]
	_NEW1DARRAY_DEALLOC(_16, _14, _15, int64_t);
	//return %16
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_3);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(_16);
	return _16;
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
	_DECL_1DARRAY(r);
	_DECL_DEALLOC(r);
	int64_t _5;
	int64_t _6;
	_DECL_1DARRAY(_7);
	_DECL_DEALLOC(_7);
	int64_t _8;
	int64_t _9;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	int64_t _11;
	int64_t _12;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	void* _15;
	int64_t _17;
	int64_t _18;
	//const %5 = 2 : int
	_5 = 2;
	//const %6 = 2 : int
	_6 = 2;
	//arraygen %7 = [5; 6] : int[]
	_NEW1DARRAY_DEALLOC(_7, _5, _6, int64_t);
	//assign %1 = %7  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _7);
	//const %8 = 2 : int
	_8 = 2;
	//const %9 = 2 : int
	_9 = 2;
	//arraygen %10 = [8; 9] : int[]
	_NEW1DARRAY_DEALLOC(_10, _8, _9, int64_t);
	//assign %2 = %10  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(b, _10);
	//const %11 = 2 : int
	_11 = 2;
	//const %12 = 2 : int
	_12 = 2;
	//arraygen %13 = [11; 12] : int[]
	_NEW1DARRAY_DEALLOC(_13, _11, _12, int64_t);
	//assign %3 = %13  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(c, _13);
	//invoke (%14) = (%1, %2, %3) 3parameter_test348:func : function(int[],int[],int[])->(int[])
	{
		_FUNCTIONCALL_NO_COPY_PRE(_14, c, "true-NEVER_RETURN-false" , "func");
		_FUNCTIONCALL_NO_COPY_PRE(_14, b, "true-NEVER_RETURN-false" , "func");
		_FUNCTIONCALL_COPY_PRE(_14, a, "true-MAYBE_RETURN-true" , "func");
		_DEALLOC(_14);
		void* tmp_a;
		_COPY_1DARRAY_PARAM(a, tmp_a, int64_t);
		// isCopyEliminated of '_1' = false
		// isCopyEliminated of '_2' = true
		// isCopyEliminated of '_3' = true
		_14 = _func_(tmp_a, a_size, b, b_size, c, c_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_14));
		if( _14 == tmp_a ){
			_14_dealloc = true;
		} else {
			_14_dealloc = true;
			free(tmp_a);
		}
	}
	//assign %4 = %14  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(r, _14);
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
	//return
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(r);
	_DEALLOC(_7);
	_DEALLOC(_10);
	_DEALLOC(_13);
	_DEALLOC(_14);
	exit(0);
}

