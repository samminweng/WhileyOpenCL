#include "specialcase2.h"
int64_t* _g_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAY_PARAM(b), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	//return %0
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
	//return
}

int64_t* _func_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAY_PARAM(b), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	int64_t ra;
	int64_t rb;
	_DECL_1DARRAY(r);
	int64_t _6;
	int64_t _7;
	int64_t _8;
	int64_t _9;
	_DECL_1DARRAY(_10);
	int64_t _11;
	int64_t _12;
	//const %6 = 0 : int
	_6 = 0;
	//indexof %7 = %0, %6 : int[]
	_7=a[_6];
	//assign %3 = %7  : int
	// isCopyEliminated = true
	ra = _7;
	//const %8 = 0 : int
	_8 = 0;
	//indexof %9 = %1, %8 : int[]
	_9=b[_8];
	//assign %4 = %9  : int
	// isCopyEliminated = true
	rb = _9;
	//invoke (%10) = (%0, %1) specialcase2:g : function(int[],int[])->(int[])
	{
		// isCopyEliminated of '_0' = true
		// isCopyEliminated of '_1' = true
		_10 = _g_(a, a_size, b, b_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_10));
	}
	//assign %5 = %10  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(r, _10);
	//const %11 = 1 : int
	_11 = 1;
	//const %12 = 0 : int
	_12 = 0;
	//update %5[%12] = %11 : int[] -> int[]
	r[_12] = _11;
	//return %1
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(b);
	return b;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_1DARRAY(r);
	int64_t _3;
	int64_t _4;
	_DECL_1DARRAY(_5);
	_DECL_1DARRAY(_6);
	int64_t _7;
	int64_t _8;
	int64_t _9;
	//const %3 = 2 : int
	_3 = 2;
	//const %4 = 2 : int
	_4 = 2;
	//arraygen %5 = [3; 4] : int[]
	_NEW_1DARRAY_int64_t(_5, _4, _3);
	//assign %1 = %5  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(a, _5);
	//invoke (%6) = (%1, %1) specialcase2:func : function(int[],int[])->(int[])
	{
		void* tmp_a;
		_COPY_1DARRAY_PARAM(a, tmp_a, int64_t);
		void* tmp_b;
		_COPY_1DARRAY_PARAM(a, tmp_b, int64_t);
		// isCopyEliminated of '_1' = false
		// isCopyEliminated of '_1' = false
		_6 = _func_(tmp_a, a_size, tmp_b, a_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_6));
	}
	//assign %2 = %6  : int[]
	// isCopyEliminated = true
	_UPDATE_1DARRAY(r, _6);
	//assert
	{
		//const %7 = 0 : int
		_7 = 0;
		//indexof %8 = %1, %7 : int[]
		_8=a[_7];
		//const %9 = 2 : int
		_9 = 2;
		//ifeq %8, %9 goto blklab0 : int
		if(_8==_9){goto blklab0;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab0
blklab0:;
	//assert
	}
	//return
	exit(0);
}

