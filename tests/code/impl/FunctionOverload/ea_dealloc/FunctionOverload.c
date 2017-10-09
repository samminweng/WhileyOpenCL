#include "FunctionOverload.h"
int64_t* _Cash_(_DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_0);
	_DECL_DEALLOC(_0);
	int64_t _1;
	int64_t _2;
	int64_t _3;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	int64_t _8;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	//const %1 = 0 : int
	_1 = 0;
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
	//const %7 = 0 : int
	_7 = 0;
	//const %8 = 0 : int
	_8 = 0;
	//newlist %9 = (%1, %2, %3, %4, %5, %6, %7, %8) : int[]
	_DEALLOC(_9);
	_NEW_1DARRAY_int64_t(_9, 8, 0);
	_9[0] = _1; _9[1] = _2; _9[2] = _3; _9[3] = _4; _9[4] = _5; _9[5] = _6; _9[6] = _7; _9[7] = _8; 
	_ADD_DEALLOC(_9);
	//return %9
	_DEALLOC(_0);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(_9);
	return _9;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(empty);
	_DECL_DEALLOC(empty);
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	//invoke (%2) = () FunctionOverload:Cash : function()->(FunctionOverload:Cash)
	{
		_DEALLOC(_2);
		_2 = _Cash_(_1DARRAYSIZE_PARAM_CALLBYREFERENCE(_2));
		_2_dealloc = true;
	}
	//assign %1 = %2  : int[]
	_DEALLOC(empty);
	_COPY_1DARRAY_int64_t(empty, _2);
	_ADD_DEALLOC(empty);
	//return
	_DEALLOC(empty);
	_DEALLOC(_2);
	exit(0);
}

