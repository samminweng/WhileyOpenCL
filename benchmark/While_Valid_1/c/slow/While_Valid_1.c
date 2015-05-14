#include "While_Valid_1.h"
long long* reverse(long long* _ls, long long _ls_size){
	long long _i = 0;
	long long* _r = NULL;
	long long _r_size = 0;
	long long _3 = 0;
	long long _4 = 0;
	long long* _5 = NULL;
	long long _5_size = 0;
	long long* _6 = NULL;
	long long _6_size = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long* _12 = NULL;
	long long _12_size = 0;
	long long* _13 = NULL;
	long long _13_size = 0;
	//lengthof %4 = %0 : [int]
	_4 = _ls_size;
	//assign %3 = %4  : int
	_3 = _4;
	//assign %1 = %3  : int
	_i = _3;
	//newlist %6 = () : [void]
	//assign %5 = %6  : [void]
	_5 = _6;
	_5_size = _6_size;
	//assign %2 = %5  : [int]
	_r = _5;
	_r_size = _5_size;
	//ifle %1, %8 goto blklab0 : int
	while(_i>_8){

		//invariant
		{
			//lengthof %7 = %0 : [int]
			_7 = _ls_size;
			//ifle %1, %7 goto blklab1 : int
			if(_i<=_7){goto blklab1;}
			//fail
			fprintf(stderr,"fail");
			exit(0);
			//.blklab1
blklab1:;
			//return
			;
			//invariant
		}
		//const %8 = 0 : int
		_8 = 0;
		//const %9 = 1 : int
		_9 = 1;
		//sub %10 = %1, %9 : int
		_10=_i-_9;
		//assign %1 = %10  : int
		_i = _10;
		//indexof %11 = %0, %1 : [int]
		_11=_ls[_i];
		//newlist %12 = (%11) : [int]
		_12_size=1;
		_12=(long long*)malloc(_12_size*sizeof(long long));
		_12[0]=_11;
		//append %13 = %2, %12 : [int]
		_13_size = _r_size+_12_size;
		_13=append(_r, &_r_size, _12, &_12_size, &_13_size);
		free(_12);
		//assign %2 = %13  : [int]
		_r = _13;
		_r_size = _13_size;
	}
	//.blklab0
blklab0:;
	//return %2 : [int]
	return _r;
	//return
	;
}
int main(int argc, char** argv){
	long long* _xs = NULL;
	long long _xs_size = 0;
	long long _i = 0;
	long long* _rs = NULL;
	long long _rs_size = 0;
	long long* _4 = NULL;
	long long _4_size = 0;
	long long* _5 = NULL;
	long long _5_size = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long* _8 = NULL;
	long long _8_size = 0;
	long long* _9 = NULL;
	long long _9_size = 0;
	long long* _10 = NULL;
	long long _10_size = 0;
	long long* _11 = NULL;
	long long _11_size = 0;
	long long* _12 = NULL;
	long long _12_size = 0;
	//newlist %5 = () : [void]
	//assign %4 = %5  : [void]
	_4 = _5;
	_4_size = _5_size;
	//assign %1 = %4  : [int]
	_xs = _4;
	_xs_size = _4_size;
	//const %6 = 0 : int
	_6 = 0;
	//const %7 = 10000 : int
	//_7 = 10000;
	//Take input parameter as the array size.
	readStringAsInteger(argv[1], &_7);	
	//range %8 = %6, %7 : [int]
	//forall %2 in %8 (%1, %9, %10) : [int]
	for(_i=_6; _i<_7; _i++){
		//newlist %9 = (%2) : [int]
		_9_size=1;
		_9=(long long*)malloc(_9_size*sizeof(long long));
		_9[0]=_i;
		//append %10 = %1, %9 : [int]
		_10_size = _xs_size+_9_size;
		_10=append(_xs, &_xs_size, _9, &_9_size, &_10_size);
		free(_9);
		//assign %1 = %10  : [int]
		_xs = _10;
		_xs_size = _10_size;
	}
	//.blklab2
blklab2:;
	//getStartingTime();
	//invoke %12 = (%1) While_Valid_1:reverse : function([int]) -> [int]
	_12_size=_xs_size;
	_12=reverse(_xs , _xs_size);
	//getEndingTime();
	//assign %11 = %12  : [int]
	_11 = _12;
	_11_size = _12_size;
	//assign %3 = %11  : [int]
	_rs = _11;
	_rs_size = _11_size;
	//fieldload %13 = %0 out : {[[int]] args,{method(any) -> void print,method([int]) -> void print_s,method(any) -> void println,method([int]) -> void println_s} out}
	//fieldload %14 = %13 println : {method(any) -> void print,method([int]) -> void print_s,method(any) -> void println,method([int]) -> void println_s}
	//indirectinvoke %14 (%3) : method(any) -> void
	indirect_printf_array(_rs, _rs_size);

	//return
	;
}
