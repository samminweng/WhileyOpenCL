#include <stdio.h>
#include <stdlib.h>

long long f(long long _limit){
	long long _i = 0;
	long long _sum = 0;
	long long _3 = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	//const %4 = 0 : int
	_4 = 0;
	//assign %3 = %4  : int
	_3 = _4;
	//assign %1 = %3  : int
	_i = _3;
	//const %6 = 0 : int
	_6 = 0;
	//assign %5 = %6  : int
	_5 = _6;
	//assign %2 = %5  : int
	_sum = _5;
	//ifge %1, %0 goto blklab1 : int
	while(_i<_limit){
		//invariant
		{
			//const %7 = 0 : int
			_7 = 0;
			//ifge %1, %7 goto blklab2 : int
			if(_i>=_7){goto blklab2;}
			//fail
			fprintf(stderr,"fail");
			exit(0);
//.blklab2
blklab2:;
			//return
			//;
		//invariant
		}
		//add %8 = %2, %1 : int
		_8=_sum+_i;
		//assign %2 = %8  : int
		_sum = _8;
		//const %9 = 1 : int
		_9 = 1;
		//add %10 = %1, %9 : int
		_10=_i+_9;
		//assign %1 = %10  : int
		_i = _10;
	}
//.blklab1
blklab1:;
	//return %2 : int
	return _sum;
	//return
	//;
}
int main(int argc, char** argv){
	long long _3 = 0;
	long long _4 = 0;
	long long _7 = 0;
	long long _8 = 0;
	//fieldload %1 = %0 out : {[[int]] args,{method(any) -> void print,method([int]) -> void print_s,method(any) -> void println,method([int]) -> void println_s} out}
	//fieldload %2 = %1 println : {method(any) -> void print,method([int]) -> void print_s,method(any) -> void println,method([int]) -> void println_s}
	//const %4 = 5 : int
	_4 = 5;
	//invoke %3 = (%4) WhileLoop:f : function(int) -> int
	_3=f(_4);
	//indirectinvoke %2 (%3) : method(any) -> void
	//indirect_printf(_3);
	fprintf(stdout, "%lld\n", _3);
	//fieldload %5 = %0 out : {[[int]] args,{method(any) -> void print,method([int]) -> void print_s,method(any) -> void println,method([int]) -> void println_s} out}
	//fieldload %6 = %5 println : {method(any) -> void print,method([int]) -> void print_s,method(any) -> void println,method([int]) -> void println_s}
	//const %8 = 50000 : int
	_8 = 150000000;
	//invoke %7 = (%8) WhileLoop:f : function(int) -> int
	_7=f(_8);
	//indirectinvoke %6 (%7) : method(any) -> void
	//indirect_printf(_7);
	fprintf(stdout, "%lld\n", _7);
	//return
	return 0;
}
