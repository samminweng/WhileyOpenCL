#include "Factorial.h"
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
	//invoke %3 = (%5) Factorial:factorial : function(int) -> int
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
	long long max;
	long long f = 0;
	long long factor = 0;
	long long i = 0;
	long long _5;
	long long _6;
	_DECL_2DARRAY(_7);
	_DECL_OWNERSHIP(_7);
	long long _8 = 0;
	_DECL_1DARRAY(_9);
	_DECL_OWNERSHIP(_9);
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	void* _19;
	_DECL_1DARRAY(_21);
	_DECL_OWNERSHIP(_21);
	//fieldload %7 = %0 args : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	_CONV_ARGS(_7);
	_ADD_OWNERSHIP(_7);
	//const %8 = 0 : int
	_8 = 0;
	//indexof %9 = %7, %8 : int[][]
	_9=_7[_8];
	//invoke %6 = (%9) whiley/lang/Int:parse : function(whiley/lang/ASCII:string) -> null|int
	_STR_TO_INT(_6, _9);
	//assign %5 = %6  : null|int
	_5 = _6;
	//assign %1 = %5  : null|int
	max = _5;
	//ifis %1, null goto blklab2 : null|int
	if(max == NULL) { goto blklab2;}
	//invoke %11 = (%1) Factorial:factorial : function(int) -> int
	_11 = factorial(max);
	//assign %10 = %11  : int
	_10 = _11;
	//assign %2 = %10  : int
	f = _10;
	//const %13 = 1 : int
	_13 = 1;
	//assign %12 = %13  : int
	_12 = _13;
	//assign %3 = %12  : int
	factor = _12;
	//const %15 = 1 : int
	_15 = 1;
	//assign %14 = %15  : int
	_14 = _15;
	//assign %4 = %14  : int
	i = _14;
	//loop (%3, %4, %16, %17, %18)
	while(true){
		//ifgt %4, %1 goto blklab3 : int
		if(i>max){goto blklab3;}
		//mul %16 = %3, %4 : int
		_16=factor*i;
		//assign %3 = %16  : int
		factor = _16;
		//const %17 = 1 : int
		_17 = 1;
		//add %18 = %4, %17 : int
		_18=i+_17;
		//assign %4 = %18  : int
		i = _18;
	}
//.blklab3
blklab3:;
	//assert
	{
		//ifeq %2, %3 goto blklab4 : int
		if(f==factor){goto blklab4;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab4
blklab4:;
	//assert
	}
	//fieldload %19 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	//fieldload %20 = %19 print_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
	//const %21 = [80,97,115,115,32,102,97,99,116,111,114,105,97,108,32,116,101,115,116,32,99,97,115,101] : int[]
	_FREE(_21);
	_NEW_ARRAY(_21, 24);
	_21[0] = 80; _21[1] = 97; _21[2] = 115; _21[3] = 115; _21[4] = 32; _21[5] = 102; _21[6] = 97; _21[7] = 99; _21[8] = 116; _21[9] = 111; _21[10] = 114; _21[11] = 105; _21[12] = 97; _21[13] = 108; _21[14] = 32; _21[15] = 116; _21[16] = 101; _21[17] = 115; _21[18] = 116; _21[19] = 32; _21[20] = 99; _21[21] = 97; _21[22] = 115; _21[23] = 101; 
	_ADD_OWNERSHIP(_21);
	//indirectinvoke %20 (%21) : method(int[]) -> void
	printf_s(_1DARRAY_PARAM(_21));
//.blklab2
blklab2:;
	//return
	_FREE2DArray(_7);
	_FREE(_9);
	_FREE(_21);
	exit(0);
}

