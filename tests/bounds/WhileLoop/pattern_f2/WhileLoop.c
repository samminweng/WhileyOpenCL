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

int64_t f2(int64_t limit){
	int64_t _1 = 0;
	int64_t i = 0;
	int64_t sum = 0;
	int64_t _4 = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	//const %4 = 1 : int
	_4 = 1;
	//sub %5 = %0, %4 : int
	_5=limit-_4;
	//assign %2 = %5  : int
	i = _5;
	//const %6 = 0 : int
	_6 = 0;
	//assign %3 = %6  : int
	sum = _6;
	//loop (%2, %3, %7, %8, %9, %10)
	while(true){
		//const %7 = 0 : int
		_7 = 0;
		//iflt %2, %7 goto blklab4 : int
		if(i<_7){goto blklab4;}
		//add %8 = %3, %2 : int
		_8=sum+i;
		//assign %3 = %8  : int
		sum = _8;
		//const %9 = 1 : int
		_9 = 1;
		//sub %10 = %2, %9 : int
		_10=i-_9;
		//assign %2 = %10  : int
		i = _10;
//.blklab5
blklab5:;
	}
//.blklab4
blklab4:;
	//return %3
	return sum;
	//return
}

int main(int argc, char** args){
	int64_t a = 0;
	int64_t b = 0;
	int64_t c = 0;
	int64_t d = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	void* _7;
	int64_t _9 = 0;
	int64_t _10 = 0;
	void* _11;
	int64_t _13 = 0;
	int64_t _14 = 0;
	void* _15;
	int64_t _17 = 0;
	int64_t _18 = 0;
	void* _19;
	//const %6 = 5 : int
	_6 = 5;
	//invoke (%5) = (%6) WhileLoop:f : function(int)->(int)
	{
		_5 = f(_6);
	}
	//assign %1 = %5  : int
	a = _5;
	//fieldload %7 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %8 = %7 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %8 (%1) : method(any)->()
	{
		printf("%"PRId64"\n", a);
	}
	//const %10 = 5 : int
	_10 = 5;
	//invoke (%9) = (%10) WhileLoop:f2 : function(int)->(int)
	{
		_9 = f2(_10);
	}
	//assign %2 = %9  : int
	b = _9;
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %12 (%2) : method(any)->()
	{
		printf("%"PRId64"\n", b);
	}
	//assert
	{
		//ifeq %1, %2 goto blklab6 : int
		if(a==b){goto blklab6;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab6
blklab6:;
	//assert
	}
	//const %14 = 50000 : int
	_14 = 50000;
	//invoke (%13) = (%14) WhileLoop:f : function(int)->(int)
	{
		_13 = f(_14);
	}
	//assign %3 = %13  : int
	c = _13;
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %16 (%3) : method(any)->()
	{
		printf("%"PRId64"\n", c);
	}
	//const %18 = 50000 : int
	_18 = 50000;
	//invoke (%17) = (%18) WhileLoop:f2 : function(int)->(int)
	{
		_17 = f2(_18);
	}
	//assign %4 = %17  : int
	d = _17;
	//fieldload %19 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %20 = %19 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %20 (%4) : method(any)->()
	{
		printf("%"PRId64"\n", d);
	}
	//assert
	{
		//ifeq %3, %4 goto blklab7 : int
		if(c==d){goto blklab7;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab7
blklab7:;
	//assert
	}
	//return
	exit(0);
}

