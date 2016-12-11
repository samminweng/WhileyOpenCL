#include "fileread2.h"
void print_pbm(FILE* sys, int64_t width, int64_t height, BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data)){
	int64_t j = 0;
	int64_t i = 0;
	int64_t pos = 0;
	void* _7;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	void* _10;
	void* _12;
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	void* _15;
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	int64_t _20 = 0;
	void* _21;
	int64_t _23 = 0;
	BYTE _24;
	void* _25;
	_DECL_1DARRAY(_27);
	_DECL_DEALLOC(_27);
	int64_t _28 = 0;
	int64_t _29 = 0;
	void* _30;
	void* _32;
	size_t _32_size = 0;
	_DECL_DEALLOC(_32);
	int64_t _33 = 0;
	int64_t _34 = 0;
	//fieldload %7 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %8 = %7 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %9 = [80,49] : int[]
	_DEALLOC(_9);
	_NEW_1DARRAY_int64_t(_9, 2, 0);
	_9[0] = 80; _9[1] = 49; 
	_ADD_DEALLOC(_9);
	//indirectinvoke () = %8 (%9) : method(int[])->()
	{
		println_s(_9, _9_size);
	}
	//fieldload %10 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %11 = %10 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %11 (%1) : method(any)->()
	{
		printf("%"PRId64, width);
	}
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %14 = [32] : int[]
	_DEALLOC(_14);
	_NEW_1DARRAY_int64_t(_14, 1, 0);
	_14[0] = 32; 
	_ADD_DEALLOC(_14);
	//indirectinvoke () = %13 (%14) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_14));
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %16 (%2) : method(any)->()
	{
		printf("%"PRId64"\n", height);
	}
	//const %17 = 0 : int
	_17 = 0;
	//assign %4 = %17  : int
	j = _17;
	//loop (%4, %5, %6, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34)
	while(true){
		//ifge %4, %2 goto blklab0 : int
		if(j>=height){goto blklab0;}
		//const %18 = 0 : int
		_18 = 0;
		//assign %5 = %18  : int
		i = _18;
		//loop (%5, %6, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29)
		while(true){
			//ifge %5, %1 goto blklab2 : int
			if(i>=width){goto blklab2;}
			//mul %19 = %4, %1 : int
			_19=j*width;
			//add %20 = %19, %5 : int
			_20=_19+i;
			//assign %6 = %20  : int
			pos = _20;
			//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %22 = %21 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indexof %24 = %3, %6 : byte[]
			_24=data[pos];
			//invoke (%23) = (%24) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
			{
				_23 = (unsigned int)_24;
			}
			//indirectinvoke () = %22 (%23) : method(any)->()
			{
				printf("%"PRId64, _23);
			}
			//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %26 = %25 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %27 = [32] : int[]
			_DEALLOC(_27);
			_NEW_1DARRAY_int64_t(_27, 1, 0);
			_27[0] = 32; 
			_ADD_DEALLOC(_27);
			//indirectinvoke () = %26 (%27) : method(int[])->()
			{
				printf_s(_1DARRAY_PARAM(_27));
			}
			//const %28 = 1 : int
			_28 = 1;
			//add %29 = %5, %28 : int
			_29=i+_28;
			//assign %5 = %29  : int
			i = _29;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//fieldload %30 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %31 = %30 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %32 = [] : void[]
		_DEALLOC(_32);
		_NEW_1DARRAY_int64_t(_32, 0, 0);
		_ADD_DEALLOC(_32);
		//indirectinvoke () = %31 (%32) : method(int[])->()
		{
			println_s(_32, _32_size);
		}
		//const %33 = 1 : int
		_33 = 1;
		//add %34 = %4, %33 : int
		_34=j+_33;
		//assign %4 = %34  : int
		j = _34;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return
	_DEALLOC(data);
	_DEALLOC(_9);
	_DEALLOC(_14);
	_DEALLOC(_27);
	_DEALLOC(_32);
	return;
}

int main(int argc, char** args){
	FILE* r;
	int64_t width = 0;
	int64_t height = 0;
	_DECL_1DARRAY_BYTE(data);
	_DECL_DEALLOC(data);
	void* _5;
	_DECL_DEALLOC(_5);
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7 = 0;
	int64_t _8 = 0;
	_DECL_1DARRAY_BYTE(_9);
	_DECL_DEALLOC(_9);
	//const %6 = [102,101,101,112,46,112,98,109] : int[]
	_DEALLOC(_6);
	_NEW_1DARRAY_int64_t(_6, 8, 0);
	_6[0] = 102; _6[1] = 101; _6[2] = 101; _6[3] = 112; _6[4] = 46; _6[5] = 112; _6[6] = 98; _6[7] = 109; 
	_ADD_DEALLOC(_6);
	//invoke (%5) = (%6) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_5 = Reader(_6, _6_size);
	}
	//assign %1 = %5  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	r = _5;
	//const %7 = 24 : int
	_7 = 24;
	//assign %2 = %7  : int
	width = _7;
	//const %8 = 7 : int
	_8 = 7;
	//assign %3 = %8  : int
	height = _8;
	//fieldload %10 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%9) = %10 () : method()->(byte[])
	{
		_9 = readAll(r, &_9_size);
		_ADD_DEALLOC(_9);
	}
	//assign %4 = %9  : byte[]
	_DEALLOC(data);
	_COPY_1DARRAY_BYTE(data, _9);
	_ADD_DEALLOC(data);
	//invoke () = (%0, %2, %3, %4) fileread2:print_pbm : method(whiley/lang/System:Console,int,int,byte[])->()
	{
		void* data_tmp;
		print_pbm(stdout, width, height, _COPY_1DARRAY_PARAM_BYTE(data), true);
		_CALLEE_DEALLOC(data, "false-false-false" , "print_pbm");
	}
	//return
	if(r != NULL){fclose(r); r = NULL;}
	_DEALLOC(data);
	_DEALLOC(_6);
	_DEALLOC(_9);
	exit(0);
}

