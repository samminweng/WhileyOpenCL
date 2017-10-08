#include "nestedwhileloop.h"
//	domain(_0)	= [43..257]	
int64_t _f_(uint16_t limit){
	int64_t _1; //domain(_1)	= [empty..empty]	
	uint16_t i; //domain(_2)	= [0..257]	
	uint64_t sum; //domain(_3)	= [0..infinity]	
	uint16_t j; //domain(_4)	= [0..257]	
	uint16_t _5; //domain(_5)	= [0..257]	
	uint64_t _6; //domain(_6)	= [0..infinity]	
	uint16_t _7; //domain(_7)	= [0..257]	
	uint32_t _8; //domain(_8)	= [0..65536]	
	uint64_t _9; //domain(_9)	= [0..infinity]	
	uint16_t _10; //domain(_10)	= [1..1]	
	uint16_t _11; //domain(_11)	= [0..257]	
	uint16_t _12; //domain(_12)	= [1..1]	
	uint16_t _13; //domain(_13)	= [0..257]	
	//const %5 = 0 : int
	_5 = 0;
	//assign %2 = %5  : int
	// isCopyEliminated = true
	i = _5;
	//const %6 = 0 : int
	_6 = 0;
	//assign %3 = %6  : int
	// isCopyEliminated = true
	sum = _6;
	//loop (%2, %3, %4, %7, %8, %9, %10, %11, %12, %13)
	while(true){
		//ifge %2, %0 goto blklab0 : int
		if(i>=limit){goto blklab0;}
		//const %7 = 0 : int
		_7 = 0;
		//assign %4 = %7  : int
		// isCopyEliminated = true
		j = _7;
		//loop (%3, %4, %8, %9, %10, %11)
		while(true){
			//ifge %4, %0 goto blklab2 : int
			if(j>=limit){goto blklab2;}
			//mul %8 = %2, %4 : int
			_8 = i * j;
			//add %9 = %3, %8 : int
			_DETECT_INT_ADD_OVERFLOW(sum,_8,_9);
			//assign %3 = %9  : int
			// isCopyEliminated = true
			sum = _9;
			//const %10 = 1 : int
			_10 = 1;
			//add %11 = %4, %10 : int
			_11 = j + _10;
			//assign %4 = %11  : int
			// isCopyEliminated = true
			j = _11;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %2, %12 : int
		_13 = i + _12;
		//assign %2 = %13  : int
		// isCopyEliminated = true
		i = _13;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
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
	uint16_t _9; //domain(_9)	= [257..257]	
	void* _10;
	int64_t _12; //domain(_12)	= [empty..empty]	
	//const %4 = 43 : int
	_4 = 43;
	//invoke (%3) = (%4) nestedwhileloop:f : function(int)->(int)
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
	//assert
	{
		//const %7 = 815409 : int
		_7 = 815409;
		//ifeq %1, %7 goto blklab4 : int
		if(a==_7){goto blklab4;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab4
blklab4:;
	//assert
	}
	//const %9 = 257 : int
	_9 = 257;
	//invoke (%8) = (%9) nestedwhileloop:f : function(int)->(int)
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
	//assert
	{
		//const %12 = 1082146816 : int
		_12 = 1082146816;
		//ifeq %2, %12 goto blklab5 : int
		if(b==_12){goto blklab5;}
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

