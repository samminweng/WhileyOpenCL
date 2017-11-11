#include "IntToByte.h"
int main(int argc, char** args){
	int64_t size;
	_DECL_1DARRAY_BYTE(pixels);
	_DECL_DEALLOC(pixels);
	int64_t i;
	int64_t _4;
	BYTE _5;
	_DECL_1DARRAY_BYTE(_6);
	_DECL_DEALLOC(_6);
	int64_t _7;
	BYTE _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	void* _14;
	BYTE _16;
	int64_t _17;
	int64_t _18;
	//const %4 = 300 : int
	_4 = 300;
	//assign %1 = %4  : int
	size = _4;
	//const %5 = 00100000b : byte
	_5 = 0b00100000;
	//arraygen %6 = [5; 1] : byte[]
	_DEALLOC(_6);
	_NEW_1DARRAY_BYTE(_6, size, _5);
	_ADD_DEALLOC(_6);
	//assign %2 = %6  : byte[]
	_DEALLOC(pixels);
	_COPY_1DARRAY_BYTE(pixels, _6);
	_ADD_DEALLOC(pixels);
	//const %7 = 0 : int
	_7 = 0;
	//assign %3 = %7  : int
	i = _7;
	//loop (%2, %3, %8, %9, %10, %11, %12)
	while(true){
		//ifge %3, %1 goto blklab0 : int
		if(i>=size){goto blklab0;}
		//const %9 = 256 : int
		_9 = 256;
		//rem %10 = %3, %9 : int
		_10=i%_9;
		//invoke (%8) = (%10) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
		{
			_8 = (BYTE)_10;
		}
		//update %2[%3] = %8 : byte[] -> byte[]
		pixels[i] = _8;
		//const %11 = 1 : int
		_11 = 1;
		//add %12 = %3, %11 : int
		_12=i+_11;
		//assign %3 = %12  : int
		i = _12;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//const %13 = 0 : int
	_13 = 0;
	//assign %3 = %13  : int
	i = _13;
	//loop (%3, %14, %15, %16, %17, %18)
	while(true){
		//ifge %3, %1 goto blklab2 : int
		if(i>=size){goto blklab2;}
		//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %15 = %14 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//indexof %16 = %2, %3 : byte[]
		_16=pixels[i];
		//indirectinvoke () = %15 (%16) : method(any)->()
		{
			printf("%"PRIu8"\n", _16);
		}
		//const %17 = 1 : int
		_17 = 1;
		//add %18 = %3, %17 : int
		_18=i+_17;
		//assign %3 = %18  : int
		i = _18;
//.blklab3
blklab3:;
	}
//.blklab2
blklab2:;
	//return
	_DEALLOC(pixels);
	_DEALLOC(_6);
	exit(0);
}

