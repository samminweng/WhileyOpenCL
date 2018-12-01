#include "specialcase5.h"
int64_t _func_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAY_PARAM(b)){
	_DECL_DEALLOC(a);
	_DECL_DEALLOC(b);
	int64_t _2;
	int64_t _3;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	//const %3 = 2 : int
	_3 = 2;
	//const %4 = 0 : int
	_4 = 0;
	//update %1[%4] = %3 : int[] -> int[]
	b[_4] = _3;
	//const %5 = 0 : int
	_5 = 0;
	//indexof %6 = %0, %5 : int[]
	_6=a[_5];
	//return %6
	_DEALLOC(a);
	_DEALLOC(b);
	return _6;
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
	//const %3 = 1 : int
	_3 = 1;
	//const %4 = 1 : int
	_4 = 1;
	//arraygen %5 = [3; 4] : int[]
	_NEW1DARRAY_DEALLOC(_5, _3, _4, int64_t);
	//assign %1 = %5  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _5);
	//invoke (%6) = (%1, %1) specialcase5:func : function(int[],int[])->(int)
	{
		_FUNCTIONCALL_COPY_PRE(_6, a, 1, "liveness: a = true, readonly: a = false, return:a = NEVER_RETURN" , "func");
		_FUNCTIONCALL_NO_COPY_PRE(_6, a, 0, "liveness: a = true, readonly: a = true, return:a = NEVER_RETURN" , "func");
		void* tmp_b;
		_COPY_1DARRAY_PARAM(a, tmp_b, int64_t);
		// isCopyEliminated of 'a at 0' = true
		// isCopyEliminated of 'a at 1' = false
		_6 = _func_(a, a_size, tmp_b, a_size);
		free(tmp_b);
	}
	//assign %2 = %6  : int
	// isCopyEliminated = true
	r = _6;
	//assert
	{
		//const %7 = 1 : int
		_7 = 1;
		//ifeq %2, %7 goto blklab0 : int
		if(r==_7){goto blklab0;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab0
blklab0:;
	//assert
	}
	//return
	_DEALLOC(a);
	_DEALLOC(_5);
	exit(0);
}

