#include "whileloop.h"
//	domain(_0)	= [43..65536]	
int64_t _f_(uint32_t limit){
	int64_t _1 = 0; //domain(_1)	= [empty..empty]	
	uint32_t i = 0; //domain(_2)	= [0..65536]	
	uint64_t sum = 0; //domain(_3)	= [0..infinity]	
	uint16_t _4 = 0; //domain(_4)	= [0..0]	
	uint16_t _5 = 0; //domain(_5)	= [0..0]	
	int64_t _6 = 0; //domain(_6)	= [empty..empty]	
	uint64_t _7 = 0; //domain(_7)	= [0..infinity]	
	uint16_t _8 = 0; //domain(_8)	= [1..1]	
	uint32_t _9 = 0; //domain(_9)	= [1..65536]	
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
		//ifge %2, %0 goto blklab1 : int
		if(i>=limit){goto blklab1;}
		//add %7 = %3, %2 : int
		_DETECT_INT_ADD_OVERFLOW(sum,i,_7);
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

//
int main(int argc, char** args){
	uint64_t a = 0; //domain(_1)	= [0..infinity]	
	uint64_t b = 0; //domain(_2)	= [0..infinity]	
	uint64_t _3 = 0; //domain(_3)	= [0..infinity]	
	uint16_t _4 = 0; //domain(_4)	= [43..43]	
	void* _5;
	int64_t _7 = 0; //domain(_7)	= [empty..empty]	
	uint64_t _8 = 0; //domain(_8)	= [0..infinity]	
	uint32_t _9 = 0; //domain(_9)	= [65536..65536]	
	void* _10;
	int64_t _12 = 0; //domain(_12)	= [empty..empty]	
	//const %4 = 43 : int
	_4 = 43;
	//invoke (%3) = (%4) whileloop:f : function(int)->(int)
	{
		_3 = _f_(_4);
	}
	//assign %1 = %3  : int
	a = _3;
	//fieldload %5 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %6 = %5 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %6 (%1) : method(any)->()
	{
		printf("%"PRId64"\n", a);
	}
	//assert
	{
		//const %7 = 903 : int
		_7 = 903;
		//ifeq %1, %7 goto blklab4 : int
		if(a==_7){goto blklab4;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab4
blklab4:;
	//assert
	}
	//const %9 = 65536 : int
	_9 = 65536;
	//invoke (%8) = (%9) whileloop:f : function(int)->(int)
	{
		_8 = _f_(_9);
	}
	//assign %2 = %8  : int
	b = _8;
	//fieldload %10 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %11 = %10 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %11 (%2) : method(any)->()
	{
		printf("%"PRId64"\n", b);
	}
	//assert
	{
		//const %12 = 2147450880 : int
		_12 = 2147450880;
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

