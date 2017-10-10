#include "whileloop.h"
//	domain(_0)	= [43..65536]	
int64_t _f_(uint32_t limit){
	int64_t _1; //domain(_1)	= [empty..empty]	
	uint32_t i; //domain(_2)	= [0..65536]	
	uint64_t sum; //domain(_3)	= [0..infinity]	
	uint32_t _4; //domain(_4)	= [0..65536]	
	uint64_t _5; //domain(_5)	= [0..infinity]	
	int64_t _6; //domain(_6)	= [empty..empty]	
	uint64_t _7; //domain(_7)	= [0..infinity]	
	uint16_t _8; //domain(_8)	= [1..1]	
	uint32_t _9; //domain(_9)	= [0..65536]	
	//const %4 = 0 : int
	_4 = 0;
	//assign %2 = %4  : int
	// isCopyEliminated = true
	i = _4;
	//const %5 = 0 : int
	_5 = 0;
	//assign %3 = %5  : int
	// isCopyEliminated = true
	sum = _5;
	//loop (%2, %3, %6, %7, %8, %9)
	while(true){
		//ifge %2, %0 goto blklab1 : int
		if(i>=limit){goto blklab1;}
		//add %7 = %3, %2 : int
		_DETECT_INT_ADD_OVERFLOW(sum,i,_7);
		//assign %3 = %7  : int
		// isCopyEliminated = true
		sum = _7;
		//const %8 = 1 : int
		_8 = 1;
		//add %9 = %2, %8 : int
		_9 = i + _8;
		//assign %2 = %9  : int
		// isCopyEliminated = true
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

//
int main(int argc, char** args){
	uint64_t a; //domain(_1)	= [0..infinity]	
	uint64_t b; //domain(_2)	= [0..infinity]	
	uint64_t _3; //domain(_3)	= [0..infinity]	
	uint16_t _4; //domain(_4)	= [43..43]	
	void* _5;
	int64_t _7; //domain(_7)	= [empty..empty]	
	uint64_t _8; //domain(_8)	= [0..infinity]	
	uint32_t _9; //domain(_9)	= [65536..65536]	
	void* _10;
	int64_t _12; //domain(_12)	= [empty..empty]	
	//const %4 = 43 : int
	_4 = 43;
	//invoke (%3) = (%4) whileloop:f : function(int)->(int)
	{
		_3 = _f_(_4);
	}
	//assign %1 = %3  : int
	// isCopyEliminated = true
	a = _3;
	//fieldload %5 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %6 = %5 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %6 (%1) : method(any)->()
	{
		printf("%"PRIu64"\n", a);
	}
	//const %9 = 65536 : int
	_9 = 65536;
	//invoke (%8) = (%9) whileloop:f : function(int)->(int)
	{
		_8 = _f_(_9);
	}
	//assign %2 = %8  : int
	// isCopyEliminated = true
	b = _8;
	//fieldload %10 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %11 = %10 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %11 (%2) : method(any)->()
	{
		printf("%"PRIu64"\n", b);
	}
	//return
	exit(0);
}

