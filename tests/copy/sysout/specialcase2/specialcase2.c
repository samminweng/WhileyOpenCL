#include "specialcase2.h"
int64_t* _g_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAY_PARAM(b), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(a);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	//return %0
	_DEALLOC(b);
	_DEALLOC(_2);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(a);
	return a;
	//return
}

int64_t* _func_(_DECL_1DARRAY_PARAM(a), _DECL_1DARRAY_PARAM(b), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_DEALLOC(a);
	_DECL_DEALLOC(b);
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	int64_t ra;
	int64_t rb;
	_DECL_1DARRAY(r);
	_DECL_DEALLOC(r);
	int64_t _6;
	int64_t _7;
	int64_t _8;
	int64_t _9;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
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
		_FUNCTIONCALL_NO_COPY_PRE(_10, b, 1, "liveness: b = true, readonly: b = true, return:b = NEVER_RETURN" , "g");
		_FUNCTIONCALL_NO_COPY_PRE(_10, a, 0, "liveness: a = false, readonly: a = true, return:a = ALWAYS_RETURN" , "g");
		_DEALLOC(_10);
		// isCopyEliminated of 'a at 0' = true
		// isCopyEliminated of 'b at 1' = true
		_10 = _g_(a, a_size, b, b_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_10));
		_10_dealloc = a_dealloc;
		a_dealloc = false;
	}
	//assign %5 = %10  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(r, _10);
	//const %11 = 1 : int
	_11 = 1;
	//const %12 = 0 : int
	_12 = 0;
	//update %5[%12] = %11 : int[] -> int[]
	r[_12] = _11;
	//return %1
	_DEALLOC(a);
	_DEALLOC(_2);
	_DEALLOC(r);
	_DEALLOC(_10);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(b);
	return b;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(r);
	_DECL_DEALLOC(r);
	int64_t _3;
	int64_t _4;
	_DECL_1DARRAY(_5);
	_DECL_DEALLOC(_5);
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	//const %3 = 2 : int
	_3 = 2;
	//const %4 = 2 : int
	_4 = 2;
	//arraygen %5 = [3; 4] : int[]
	_NEW1DARRAY_DEALLOC(_5, _3, _4, int64_t);
	//assign %1 = %5  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(a, _5);
	//invoke (%6) = (%1, %1) specialcase2:func : function(int[],int[])->(int[])
	{
		_FUNCTIONCALL_COPY_PRE(_6, a, 1, "liveness: a = true, readonly: a = true, return:a = ALWAYS_RETURN" , "func");
		_FUNCTIONCALL_COPY_PRE(_6, a, 0, "liveness: a = true, readonly: a = false, return:a = NEVER_RETURN" , "func");
		_DEALLOC(_6);
		void* tmp_a;
		_COPY_1DARRAY_PARAM(a, tmp_a, int64_t);
		void* tmp_b;
		_COPY_1DARRAY_PARAM(a, tmp_b, int64_t);
		// isCopyEliminated of 'a at 0' = false
		// isCopyEliminated of 'a at 1' = false
		_6 = _func_(tmp_a, a_size, tmp_b, a_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_6));
		_6_dealloc = true;
			free(tmp_a);
	}
	//assign %2 = %6  : int[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(r, _6);
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
	//assert
	{
		//const %10 = 0 : int
		_10 = 0;
		//indexof %11 = %2, %10 : int[]
		_11=r[_10];
		//const %12 = 2 : int
		_12 = 2;
		//ifeq %11, %12 goto blklab1 : int
		if(_11==_12){goto blklab1;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab1
blklab1:;
	//assert
	}
	//return
	_DEALLOC(a);
	_DEALLOC(r);
	_DEALLOC(_5);
	_DEALLOC(_6);
	exit(0);
}

