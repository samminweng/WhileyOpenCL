#include "nestedwhileloop.h"
int64_t _f_(int64_t limit){
	int64_t _1 = 0;
	uint16_t i = 0;
	int64_t sum = 0;
	uint16_t j = 0;
	uint16_t _5 = 0;
	uint16_t _6 = 0;
	uint16_t _7 = 0;
	uint32_t _8 = 0;
	int64_t _9 = 0;
	uint16_t _10 = 0;
	uint16_t _11 = 0;
	uint16_t _12 = 0;
	uint32_t _13 = 0;
	//const %5 = 0 : int
	_5 = 0;
	//assign %2 = %5  : int
	i = _5;
	//const %6 = 0 : int
	_6 = 0;
	//assign %3 = %6  : int
	sum = _6;
	//loop (%2, %3, %4, %7, %8, %9, %10, %11, %12, %13)
	while(true){
		//ifge %2, %0 goto blklab0 : int
		if(i>=limit){goto blklab0;}
		//const %7 = 0 : int
		_7 = 0;
		//assign %4 = %7  : int
		j = _7;
		//loop (%3, %4, %8, %9, %10, %11)
		while(true){
			//ifge %4, %0 goto blklab2 : int
			if(j>=limit){goto blklab2;}
			//mul %8 = %2, %4 : int
			_8=i*j;
			//add %9 = %3, %8 : int
			_DETECT_INT_ADD_OVERFLOW(sum,_8,_9);
			_9=sum+_8;
			//assign %3 = %9  : int
			sum = _9;
			//const %10 = 1 : int
			_10 = 1;
			//add %11 = %4, %10 : int
			_11=j+_10;
			//assign %4 = %11  : int
			j = _11;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %2, %12 : int
		_13=i+_12;
		//assign %2 = %13  : int
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

int main(int argc, char** args){
	int64_t a = 0;
	int64_t _2 = 0;
	uint16_t _3 = 0;
	void* _4;
	int64_t _6 = 0;
	//const %3 = 5 : int
	_3 = 5;
	//invoke (%2) = (%3) nestedwhileloop:f : function(int)->(int)
	{
		_2 = _f_(_3);
	}
	//assign %1 = %2  : int
	a = _2;
	//fieldload %4 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %5 = %4 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %5 (%1) : method(any)->()
	{
		printf("%"PRId64"\n", a);
	}
	//assert
	{
		//const %6 = 100 : int
		_6 = 100;
		//ifeq %1, %6 goto blklab4 : int
		if(a==_6){goto blklab4;}
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

