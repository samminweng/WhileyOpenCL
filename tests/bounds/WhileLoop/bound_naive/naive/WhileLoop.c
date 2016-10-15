#include "WhileLoop.h"
int64_t f(int64_t limit){
	int64_t _1 = 0;
	uint16_t i = 0;
	int64_t sum = 0;
	uint16_t _4 = 0;
	uint16_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	uint16_t _8 = 0;
	uint16_t _9 = 0;
	//const %4 = 0 : int
	_4 = 0;
	//assign %2 = %4  : int
	i = _4;
	//const %5 = 0 : int
	_5 = 0;
	//assign %3 = %5  : int
	sum = _5;
	//loop (%2, %3, %6, %7, %8, %9)
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
		if(i>=limit){goto blklab1;}
		//add %7 = %3, %2 : int
		_7=sum+i;
		//assign %3 = %7  : int
		sum = _7;
		//const %8 = 1 : int
		_8 = 1;
		//add %9 = %2, %8 : int
		_9=i+_8;
		//assign %2 = %9  : int
		i = _9;
//.blklab2
blklab2:;
	}
//.blklab1
blklab1:;
	//return %3
	return sum;
	//return
}

int main(int argc, char** args){
	int64_t a = 0;
	int64_t _2 = 0;
	uint16_t _3 = 0;
	void* _4;
	//const %3 = 5 : int
	_3 = 5;
	//invoke (%2) = (%3) WhileLoop:f : function(int)->(int)
	{
		_2 = f(_3);
	}
	//assign %1 = %2  : int
	a = _2;
	//fieldload %4 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %5 = %4 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %5 (%1) : method(any)->()
	{
		printf("%"PRId64"\n", a);
	}
	//return
	exit(0);
}

