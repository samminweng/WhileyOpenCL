#include "WhileLoop1.h"
int64_t foo(int64_t INPUT){
	int64_t _1 = 0;
	uint16_t i = 0;
	int64_t OUTPUT = 0;
	uint16_t _4 = 0;
	uint16_t _5 = 0;
	int64_t _6 = 0;
	uint16_t _7 = 0;
	int64_t _8 = 0;
	uint16_t _9 = 0;
	uint16_t _10 = 0;
	//const %4 = 0 : int
	_4 = 0;
	//assign %2 = %4  : int
	i = _4;
	//const %5 = 0 : int
	_5 = 0;
	//assign %3 = %5  : int
	OUTPUT = _5;
	//loop (%2, %3, %6, %7, %8, %9, %10)
	while(true){
		//invariant
		{
			//const %6 = 0 : int
			_6 = 0;
			//ifge %2, %6 goto blklab3 : int
			if(i>=_6){goto blklab3;}
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab3
blklab3:;
		//invariant
		}
		//ifge %2, %0 goto blklab1 : int
		if(i>=INPUT){goto blklab1;}
		//const %7 = 2 : int
		_7 = 2;
		//add %8 = %3, %7 : int
		_DETECT_INT_ADD_OVERFLOW(OUTPUT,_7,_8);
		_8=OUTPUT+_7;
		//assign %3 = %8  : int
		OUTPUT = _8;
		//const %9 = 1 : int
		_9 = 1;
		//add %10 = %2, %9 : int
		_10=i+_9;
		//assign %2 = %10  : int
		i = _10;
//.blklab2
blklab2:;
	}
//.blklab1
blklab1:;
	//return %3
	return OUTPUT;
	//return
}

int main(int argc, char** args){
	uint16_t input = 0;
	int64_t a = 0;
	uint16_t _3 = 0;
	uint16_t _4 = 0;
	int64_t _5 = 0;
	void* _6;
	int64_t _8 = 0;
	//const %3 = 10 : int
	_3 = 10;
	//assign %1 = %3  : int
	input = _3;
	//const %4 = 20 : int
	_4 = 20;
	//assign %1 = %4  : int
	input = _4;
	//invoke (%5) = (%1) WhileLoop1:foo : function(int)->(int)
	{
		_5 = foo(input);
	}
	//assign %2 = %5  : int
	a = _5;
	//fieldload %6 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %7 = %6 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %7 (%2) : method(any)->()
	{
		printf("%"PRId64"\n", a);
	}
	//assert
	{
		//const %8 = 40 : int
		_8 = 40;
		//ifeq %2, %8 goto blklab4 : int
		if(a==_8){goto blklab4;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab4
blklab4:;
	//assert
	}
	//return
	exit(0);
}

