#include "factorial.h"
long long factorial(long long n){
	long long _1 = 0;
	long long _2 = 0;
	long long _3 = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	//const %1 = 1 : int
	_1 = 1;
	//ifne %0, %1 goto blklab0 : int
	if(n!=_1){goto blklab0;}
	//const %2 = 1 : int
	_2 = 1;
	//return %2 : int
	return _2;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//const %4 = 1 : int
	_4 = 1;
	//sub %5 = %0, %4 : int
	_5=n-_4;
	//invoke %3 = (%5) factorial:factorial : function(int) -> int
	_3 = factorial(_5);
	//mul %6 = %0, %3 : int
	_6=n*_3;
	//return %6 : int
	return _6;
//.blklab1
blklab1:;
	//return
}

int main(int argc, char** args){
	long long f = 0;
	long long _2 = 0;
	long long _3 = 0;
	long long _4 = 0;
	long long _5 = 0;
	void* _6;
	_DECL_1DARRAY(_8);
	_DECL_OWNERSHIP(_8);
	//const %4 = 5 : int
	_4 = 5;
	//invoke %3 = (%4) factorial:factorial : function(int) -> int
	_3 = factorial(_4);
	//assign %2 = %3  : int
	_2 = _3;
	//assign %1 = %2  : int
	f = _2;
	//assert
	{
		//const %5 = 120 : int
		_5 = 120;
		//ifeq %1, %5 goto blklab2 : int
		if(f==_5){goto blklab2;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab2
blklab2:;
	//assert
	}
	//fieldload %6 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	//fieldload %7 = %6 print_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
	//const %8 = [80,97,115,115,32,102,97,99,116,111,114,105,97,108,32,116,101,115,116,32,99,97,115,101] : int[]
	_FREE(_8);
	_NEW_ARRAY(_8, 24);
	_8[0] = 80; _8[1] = 97; _8[2] = 115; _8[3] = 115; _8[4] = 32; _8[5] = 102; _8[6] = 97; _8[7] = 99; _8[8] = 116; _8[9] = 111; _8[10] = 114; _8[11] = 105; _8[12] = 97; _8[13] = 108; _8[14] = 32; _8[15] = 116; _8[16] = 101; _8[17] = 115; _8[18] = 116; _8[19] = 32; _8[20] = 99; _8[21] = 97; _8[22] = 115; _8[23] = 101; 
	_ADD_OWNERSHIP(_8);
	//indirectinvoke %7 (%8) : method(int[]) -> void
	printf_s(_1DARRAY_PARAM(_8));
	//return
	_FREE(_8);
	exit(0);
}

