#include "3parameter_test589.h"
int64_t* _func_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAY_PARAM(b), _DECL_1DARRAY_PARAM(c), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(a);
	_DECL_DEALLOC(b);
	_DECL_DEALLOC(c);
	_DECL_1DARRAY(_3);
	_DECL_DEALLOC(_3);
	int64_t rb;
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
	int64_t _16;
	_DECL_1DARRAY(_17);
	_DECL_DEALLOC(_17);
	//const %5 = 0 : int
	_5 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//update %0[%6] = %5 : int[] -> int[]
	a[_6] = _5;
	//const %7 = 0 : int
	_7 = 0;
	//indexof %8 = %1, %7 : int[]
	_8=b[_7];
	//assign %4 = %8  : int
	// isCopyEliminated = true
	rb = _8;
	//const %9 = 0 : int
	_9 = 0;
	//const %10 = 0 : int
	_10 = 0;
	//update %2[%10] = %9 : int[] -> int[]
	c[_10] = _9;
	//const %11 = 0 : int
	_11 = 0;
	//indexof %12 = %0, %11 : int[]
	_12=a[_11];
	//const %13 = 0 : int
	_13 = 0;
	//indexof %14 = %1, %13 : int[]
	_14=b[_13];
	//ifne %12, %14 goto blklab0 : int
	if(_12!=_14){goto blklab0;}
	//return %0
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_3);
	_DEALLOC(_17);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//const %15 = 3 : int
	_15 = 3;
	//const %16 = 3 : int
	_16 = 3;
	//arraygen %17 = [15; 16] : int[]
	_NEW1DARRAY_DEALLOC(_17, _15, _16, int64_t);
	//return %17
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(c);
	_DEALLOC(_3);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(_17);
	return _17;
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
	//invoke (%14) = (%1, %2, %3) 3parameter_test589:func : function(int[],int[],int[])->(int[])
	{
		_FUNCTIONCALL_COPY_PRE(_14, c, "true-NEVER_RETURN-true" , "func");
		_FUNCTIONCALL_NO_COPY_PRE(_14, b, "false-NEVER_RETURN-false" , "func");
		_FUNCTIONCALL_NO_COPY_PRE(_14, a, "true-MAYBE_RETURN-false" , "func");
		_DEALLOC(_14);
		void* tmp_c;
		_COPY_1DARRAY_PARAM(c, tmp_c, int64_t);
		// isCopyEliminated of '_1' = true
		// isCopyEliminated of '_2' = true
		// isCopyEliminated of '_3' = false
		_14 = _func_(a, a_size, b, b_size, tmp_c, c_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_14));
		if( _14 == a ){
			_14_dealloc = a_dealloc;
			a_dealloc = false;
			free(tmp_c);
		} else {
			_14_dealloc = true;
			free(tmp_c);
		}
	}
	//assign %4 = %14  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(r, _14);
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %17 = 0 : int
	_17 = 0;
	//indexof %18 = %3, %17 : int[]
	_18=c[_17];
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

