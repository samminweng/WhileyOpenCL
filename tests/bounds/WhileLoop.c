#include "WhileLoop.h"
int64_t f(int64_t limit){
	int64_t _1 = 0;
	int64_t i = 0;
	int64_t sum = 0;
	int64_t _4 = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
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
	int64_t b = 0;
	int64_t _3 = 0;
	int64_t _4 = 0;
	void* _5;
	int64_t _7 = 0;
	int64_t _8 = 0;
	void* _9;
	//const %4 = 5 : int
	_4 = 5;
	//invoke (%3) = (%4) WhileLoop:f : function(int)->(int)
	{
		_3 = f(_4);
	}
	//assign %1 = %3  : int
	a = _3;
	//fieldload %5 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %6 = %5 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %6 (%1) : method(any)->()
	{
		printf("%"PRId64"\n", a);
	}
	//const %8 = 50000 : int
	_8 = 50000;
	//invoke (%7) = (%8) WhileLoop:f : function(int)->(int)
	{
		_7 = f(_8);
	}
	//assign %2 = %7  : int
	b = _7;
	//fieldload %9 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %10 = %9 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %10 (%2) : method(any)->()
	{
		printf("%"PRId64"\n", b);
	}
	//return
	exit(0);
}

