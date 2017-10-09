#include "factorial.h"
int64_t _factorial_(int64_t n){
	int64_t _1;
	int64_t _2;
	int64_t _3;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	//const %2 = 1 : int
	_2 = 1;
	//ifne %0, %2 goto blklab0 : int
	if(n!=_2){goto blklab0;}
	//const %3 = 1 : int
	_3 = 1;
	//return %3
	return _3;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//const %5 = 1 : int
	_5 = 1;
	//sub %6 = %0, %5 : int
	_6=n-_5;
	//invoke (%4) = (%6) factorial:factorial : function(int)->(int)
	{
		_4 = _factorial_(_6);
	}
	//mul %7 = %0, %4 : int
	_7=n*_4;
	//return %7
	return _7;
//.blklab1
blklab1:;
	//return
}

int main(int argc, char** args){
	int64_t f;
	int64_t _2;
	int64_t _3;
	int64_t _4;
	void* _5;
	_DECL_1DARRAY(_7);
	//const %3 = 5 : int
	_3 = 5;
	//invoke (%2) = (%3) factorial:factorial : function(int)->(int)
	{
		_2 = _factorial_(_3);
	}
	//assign %1 = %2  : int
	f = _2;
	//assert
	{
		//const %4 = 120 : int
		_4 = 120;
		//ifeq %1, %4 goto blklab2 : int
		if(f==_4){goto blklab2;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab2
blklab2:;
	//assert
	}
	//fieldload %5 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %6 = %5 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %7 = [80,97,115,115,32,102,97,99,116,111,114,105,97,108,32,116,101,115,116,32,99,97,115,101] : int[]
	_NEW_1DARRAY_int64_t(_7, 24, 0);
	_7[0] = 80; _7[1] = 97; _7[2] = 115; _7[3] = 115; _7[4] = 32; _7[5] = 102; _7[6] = 97; _7[7] = 99; _7[8] = 116; _7[9] = 111; _7[10] = 114; _7[11] = 105; _7[12] = 97; _7[13] = 108; _7[14] = 32; _7[15] = 116; _7[16] = 101; _7[17] = 115; _7[18] = 116; _7[19] = 32; _7[20] = 99; _7[21] = 97; _7[22] = 115; _7[23] = 101; 
	//indirectinvoke () = %6 (%7) : method(int[])->()
	{
		printf_s(_7, _7_size);
	}
	//return
	exit(0);
}

