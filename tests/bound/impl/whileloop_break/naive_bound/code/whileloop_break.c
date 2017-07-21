#include "whileloop_break.h"
//	domain(_0)	= [43..65536]		domain(_0)	= [43..65536]	
int64_t _find_(uint32_t limit, uint16_t item){
	int64_t _2 = 0; //domain(_2)	= [empty..empty]	
	uint32_t r = 0; //domain(_3)	= [0..65536]	
	uint16_t _4 = 0; //domain(_4)	= [0..0]	
	int64_t _5 = 0; //domain(_5)	= [empty..empty]	
	uint16_t _6 = 0; //domain(_6)	= [1..1]	
	uint32_t _7 = 0; //domain(_7)	= [1..65536]	
	//const %4 = 0 : int
	_4 = 0;
	//assign %3 = %4  : int
	r = _4;
	//loop (%3, %5, %6, %7)
	while(true){
		//ifge %3, %0 goto blklab0 : int
		if(r>=limit){goto blklab0;}
		//ifne %3, %1 goto blklab3 : int
		if(r!=item){goto blklab3;}
		//goto blklab0
		goto blklab0;
//.blklab3
blklab3:;
		//const %6 = 1 : int
		_6 = 1;
		//add %7 = %3, %6 : int
		_7 = r + _6;
		//assign %3 = %7  : int
		r = _7;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %3
	return r;
	//return
}

//
int main(int argc, char** args){
	uint16_t a = 0; //domain(_1)	= [43..43]	
	uint32_t b = 0; //domain(_2)	= [65536..65536]	
	uint16_t _3 = 0; //domain(_3)	= [43..43]	
	uint16_t _4 = 0; //domain(_4)	= [43..43]	
	uint16_t _5 = 0; //domain(_5)	= [10..10]	
	void* _6;
	int64_t _8 = 0; //domain(_8)	= [empty..empty]	
	uint32_t _9 = 0; //domain(_9)	= [65536..65536]	
	uint32_t _10 = 0; //domain(_10)	= [65536..65536]	
	uint16_t _11 = 0; //domain(_11)	= [10..10]	
	void* _12;
	int64_t _14 = 0; //domain(_14)	= [empty..empty]	
	//const %4 = 43 : int
	_4 = 43;
	//const %5 = 10 : int
	_5 = 10;
	//invoke (%3) = (%4, %5) whileloop_break:find : function(int,int)->(int)
	{
		_3 = _find_(_4, _5);
	}
	//assign %1 = %3  : int
	a = _3;
	//fieldload %6 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %7 = %6 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %7 (%1) : method(any)->()
	{
		printf("%"PRId64"\n", a);
	}
	//assert
	{
		//const %8 = 10 : int
		_8 = 10;
		//ifeq %1, %8 goto blklab4 : int
		if(a==_8){goto blklab4;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab4
blklab4:;
	//assert
	}
	//const %10 = 65536 : int
	_10 = 65536;
	//const %11 = 10 : int
	_11 = 10;
	//invoke (%9) = (%10, %11) whileloop_break:find : function(int,int)->(int)
	{
		_9 = _find_(_10, _11);
	}
	//assign %2 = %9  : int
	b = _9;
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %13 (%2) : method(any)->()
	{
		printf("%"PRId64"\n", b);
	}
	//assert
	{
		//const %14 = 10 : int
		_14 = 10;
		//ifeq %2, %14 goto blklab5 : int
		if(b==_14){goto blklab5;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab5
blklab5:;
	//assert
	}
	//return
	exit(0);
}

