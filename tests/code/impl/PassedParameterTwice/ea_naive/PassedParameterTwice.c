#include "PassedParameterTwice.h"
int64_t* _f_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAY_PARAM(b), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	int64_t _3;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	//const %3 = 0 : int
	_3 = 0;
	//indexof %4 = %0, %3 : int[]
	_4=a[_3];
	//const %5 = 0 : int
	_5 = 0;
	//indexof %6 = %1, %5 : int[]
	_6=b[_5];
	//ifne %4, %6 goto blklab0 : int
	if(_4!=_6){goto blklab0;}
	//return %0
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//return %1
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(b);
	return b;
//.blklab1
blklab1:;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_1DARRAY(b);
	int64_t _3;
	int64_t _4;
	_DECL_1DARRAY(_5);
	_DECL_1DARRAY(_6);
	void* _7;
	int64_t _9;
	int64_t _10;
	//const %3 = 2 : int
	_3 = 2;
	//const %4 = 2 : int
	_4 = 2;
	//arraygen %5 = [3; 4] : int[]
	_NEW_1DARRAY_int64_t(_5, _4, _3);
	//assign %1 = %5  : int[]
	_COPY_1DARRAY_int64_t(a, _5);
	//invoke (%6) = (%1, %1) PassedParameterTwice:f : function(int[],int[])->(int[])
	{
		void* tmp_a;
		_COPY_1DARRAY_PARAM(a, tmp_a, int64_t);
		void* tmp_b;
		_COPY_1DARRAY_PARAM(a, tmp_b, int64_t);
		_6 = _f_(tmp_a, a_size, tmp_b, a_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_6));
	}
	//assign %2 = %6  : int[]
	_COPY_1DARRAY_int64_t(b, _6);
	//fieldload %7 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %8 = %7 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %9 = 0 : int
	_9 = 0;
	//indexof %10 = %2, %9 : int[]
	_10=b[_9];
	//indirectinvoke () = %8 (%10) : method(any)->()
	{
		printf("%"PRId64"\n", _10);
	}
	//return
	exit(0);
}

