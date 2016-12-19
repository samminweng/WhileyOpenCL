#include "ArrayAppend2.h"
int main(int argc, char** args){
	_DECL_1DARRAY(r);
	_DECL_DEALLOC(r);
	void* _2;
	size_t _2_size = 0;
	_DECL_DEALLOC(_2);
	_DECL_1DARRAY(_3);
	_DECL_DEALLOC(_3);
	_DECL_1DARRAY(_4);
	_DECL_DEALLOC(_4);
	void* _5;
	//const %2 = [] : void[]
	_DEALLOC(_2);
	_NEW_1DARRAY_int64_t(_2, 0, 0);
	_ADD_DEALLOC(_2);
	//assign %1 = %2  : void[]
	_DEALLOC(r);
	_COPY_1DARRAY_int64_t(r, _2);
	_ADD_DEALLOC(r);
	//const %4 = [32,84,104,105,115,32,105,115,32,97,32,116,101,115,116,32] : int[]
	_DEALLOC(_4);
	_NEW_1DARRAY_int64_t(_4, 16, 0);
	_4[0] = 32; _4[1] = 84; _4[2] = 104; _4[3] = 105; _4[4] = 115; _4[5] = 32; _4[6] = 105; _4[7] = 115; _4[8] = 32; _4[9] = 97; _4[10] = 32; _4[11] = 116; _4[12] = 101; _4[13] = 115; _4[14] = 116; _4[15] = 32; 
	_ADD_DEALLOC(_4);
	//invoke (%3) = (%1, %4) whiley/lang/Array:append : function(int[],int[])->(int[])
	{
		_3 = ArrayAppend(_1DARRAY_PARAM(r), _1DARRAY_PARAM(_4), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_3));
	}
	//assign %1 = %3  : int[]
	_DEALLOC(r);
	_COPY_1DARRAY_int64_t(r, _3);
	_ADD_DEALLOC(r);
	//fieldload %5 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %6 = %5 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %6 (%1) : method(int[])->()
	{
		println_s(r, r_size);
	}
	//return
	_DEALLOC(r);
	_DEALLOC(_2);
	_DEALLOC(_3);
	_DEALLOC(_4);
	exit(0);
}

