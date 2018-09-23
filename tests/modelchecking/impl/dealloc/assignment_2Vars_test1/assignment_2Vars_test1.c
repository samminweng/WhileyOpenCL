#include "assignment_2Vars_test1.h"
int main(int argc, char** args){
	_DECL_1DARRAY(a);
	_DECL_DEALLOC(a);
	_DECL_1DARRAY(b);
	_DECL_DEALLOC(b);
	int64_t _3;
	int64_t _4;
	_DECL_1DARRAY(_5);
	_DECL_DEALLOC(_5);
	int64_t _6;
	int64_t _7;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	//const %3 = 1 : int
	_3 = 1;
	//const %4 = 5 : int
	_4 = 5;
	//arraygen %5 = [3; 4] : int[]
	_DEALLOC(_5);
	_NEW_1DARRAY_int64_t(_5, _4, _3);
	_NEW1DARRAY_DEALLOC(_5, _3, _4);
	//assign %1 = %5  : int[]
	_ADD_DEALLOC(a, _5, int64_t);
	//const %6 = 2 : int
	_6 = 2;
	//const %7 = 5 : int
	_7 = 5;
	//arraygen %8 = [6; 7] : int[]
	_DEALLOC(_8);
	_NEW_1DARRAY_int64_t(_8, _7, _6);
	_NEW1DARRAY_DEALLOC(_8, _6, _7);
	//assign %2 = %8  : int[]
	_ADD_DEALLOC(b, _8, int64_t);
	//assign %1 = %2  : int[]
	_ADD_DEALLOC(a, b, int64_t);
	//assign %2 = %1  : int[]
	_ADD_DEALLOC(b, a, int64_t);
	//return
	_DEALLOC(a);
	_DEALLOC(b);
	_DEALLOC(_5);
	_DEALLOC(_8);
	exit(0);
}

