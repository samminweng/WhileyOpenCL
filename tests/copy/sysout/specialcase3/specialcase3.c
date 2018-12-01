#include "specialcase3.h"
int64_t _func_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAY_PARAM(b)){
	_DECL_DEALLOC(a);
	_DECL_DEALLOC(b);
	int64_t _2;
	int64_t _3;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	//const %3 = 1 : int
	_3 = 1;
	//const %4 = 0 : int
	_4 = 0;
	//update %0[%4] = %3 : int[] -> int[]
	a[_4] = _3;
	//const %5 = 2 : int
	_5 = 2;
	//const %6 = 0 : int
	_6 = 0;
	//update %1[%6] = %5 : int[] -> int[]
	b[_6] = _5;
	//assert
	{
		//const %7 = 0 : int
		_7 = 0;
		//indexof %8 = %0, %7 : int[]
		_8=a[_7];
		//const %9 = 1 : int
		_9 = 1;
		//ifeq %8, %9 goto blklab0 : int
		if(_8==_9){goto blklab0;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab0
blklab0:;
	//assert
	}
	//const %10 = 0 : int
	_10 = 0;
	//indexof %11 = %1, %10 : int[]
	_11=b[_10];
	//return %11
	_DEALLOC(a);
	_DEALLOC(b);
	return _11;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	int64_t r;
	int64_t _3;
	int64_t _4;
	_DECL_1DARRAY(_5);
	_DECL_DEALLOC(_5);
	int64_t _6;
	int64_t _7;
	//const %3 = 3 : int
	_3 = 3;
	//const %4 = 3 : int
	_4 = 3;
	//arraygen %5 = [3; 4] : int[]
	_NEW1DARRAY_DEALLOC(_5, _3, _4, int64_t);
	//assign %1 = %5  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _5);
	//invoke (%6) = (%1, %1) specialcase3:func : function(int[],int[])->(int)
	{
		_FUNCTIONCALL_COPY_PRE(_6, a, 1, "liveness: a = true, readonly: a = false, return:a = NEVER_RETURN" , "func");
		_FUNCTIONCALL_COPY_PRE(_6, a, 0, "liveness: a = true, readonly: a = false, return:a = NEVER_RETURN" , "func");
		void* tmp_a;
		_COPY_1DARRAY_PARAM(a, tmp_a, int64_t);
		void* tmp_b;
		_COPY_1DARRAY_PARAM(a, tmp_b, int64_t);
		// isCopyEliminated of 'a at 0' = false
		// isCopyEliminated of 'a at 1' = false
		_6 = _func_(tmp_a, a_size, tmp_b, a_size);
		free(tmp_a);
		free(tmp_b);
	}
	//assign %2 = %6  : int
	// isCopyEliminated = true
	r = _6;
	//assert
	{
		//const %7 = 2 : int
		_7 = 2;
		//ifeq %2, %7 goto blklab1 : int
		if(r==_7){goto blklab1;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab1
blklab1:;
	//assert
	}
	//return
	_DEALLOC(a);
	_DEALLOC(_5);
	exit(0);
}

