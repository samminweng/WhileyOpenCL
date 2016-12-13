#include "fileread2.h"
void print_pbm(FILE* sys, int64_t width, int64_t height, BYTE* pixels, size_t pixels_size, _DECL_DEALLOC_PARAM(pixels)){
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
	BYTE _21;
	BYTE _22;
	void* _23;
	int64_t _25 = 0;
	void* _26;
	int64_t _28 = 0;
	void* _29;
	_DECL_1DARRAY(_31);
	_DECL_DEALLOC(_31);
	int64_t _32 = 0;
	int64_t _33 = 0;
	void* _34;
	void* _36;
	size_t _36_size = 0;
	_DECL_DEALLOC(_36);
	int64_t _37 = 0;
	int64_t _38 = 0;
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
	//loop (%4, %5, %6, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38)
	while(true){
		//ifge %4, %2 goto blklab0 : int
		if(j>=height){goto blklab0;}
		//const %18 = 0 : int
		_18 = 0;
		//assign %5 = %18  : int
		i = _18;
		//loop (%5, %6, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33)
		while(true){
			//ifge %5, %1 goto blklab2 : int
			if(i>=width){goto blklab2;}
			//mul %19 = %4, %1 : int
			_19=j*width;
			//add %20 = %19, %5 : int
			_20=_19+i;
			//assign %6 = %20  : int
			pos = _20;
			//indexof %21 = %3, %6 : byte[]
			_21=pixels[pos];
			//const %22 = 00100000b : byte
			_22 = 0b00100000;
			//ifne %21, %22 goto blklab4 : byte
			if(_21!=_22){goto blklab4;}
			//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %24 = %23 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %25 = 0 : int
			_25 = 0;
			//indirectinvoke () = %24 (%25) : method(any)->()
			{
				printf("%"PRId64, _25);
			}
			//goto blklab5
			goto blklab5;
//.blklab4
blklab4:;
			//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %27 = %26 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %28 = 1 : int
			_28 = 1;
			//indirectinvoke () = %27 (%28) : method(any)->()
			{
				printf("%"PRId64, _28);
			}
//.blklab5
blklab5:;
			//fieldload %29 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %30 = %29 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %31 = [32] : int[]
			_DEALLOC(_31);
			_NEW_1DARRAY_int64_t(_31, 1, 0);
			_31[0] = 32; 
			_ADD_DEALLOC(_31);
			//indirectinvoke () = %30 (%31) : method(int[])->()
			{
				printf_s(_1DARRAY_PARAM(_31));
			}
			//const %32 = 1 : int
			_32 = 1;
			//add %33 = %5, %32 : int
			_33=i+_32;
			//assign %5 = %33  : int
			i = _33;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//fieldload %34 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %35 = %34 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %36 = [] : void[]
		_DEALLOC(_36);
		_NEW_1DARRAY_int64_t(_36, 0, 0);
		_ADD_DEALLOC(_36);
		//indirectinvoke () = %35 (%36) : method(int[])->()
		{
			println_s(_36, _36_size);
		}
		//const %37 = 1 : int
		_37 = 1;
		//add %38 = %4, %37 : int
		_38=j+_37;
		//assign %4 = %38  : int
		j = _38;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return
	_DEALLOC(pixels);
	_DEALLOC(_9);
	_DEALLOC(_14);
	_DEALLOC(_31);
	_DEALLOC(_36);
	return;
}

int main(int argc, char** args){
	FILE* r;
	int64_t width = 0;
	int64_t height = 0;
	_DECL_1DARRAY_BYTE(pixels);
	_DECL_DEALLOC(pixels);
	void* _5;
	_DECL_DEALLOC(_5);
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7 = 0;
	int64_t _8 = 0;
	_DECL_1DARRAY_BYTE(_9);
	_DECL_DEALLOC(_9);
	//const %6 = [105,109,97,103,101,51,50,120,51,50,46,112,98,109] : int[]
	_DEALLOC(_6);
	_NEW_1DARRAY_int64_t(_6, 14, 0);
	_6[0] = 105; _6[1] = 109; _6[2] = 97; _6[3] = 103; _6[4] = 101; _6[5] = 51; _6[6] = 50; _6[7] = 120; _6[8] = 51; _6[9] = 50; _6[10] = 46; _6[11] = 112; _6[12] = 98; _6[13] = 109; 
	_ADD_DEALLOC(_6);
	//invoke (%5) = (%6) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_5 = Reader(_6, _6_size);
	}
	//assign %1 = %5  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	r = _5;
	//const %7 = 32 : int
	_7 = 32;
	//assign %2 = %7  : int
	width = _7;
	//const %8 = 32 : int
	_8 = 32;
	//assign %3 = %8  : int
	height = _8;
	//fieldload %10 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%9) = %10 () : method()->(byte[])
	{
		_9 = readAll(r, &_9_size);
		_ADD_DEALLOC(_9);
	}
	//assign %4 = %9  : byte[]
	_DEALLOC(pixels);
	_COPY_1DARRAY_BYTE(pixels, _9);
	_ADD_DEALLOC(pixels);
	//invoke () = (%0, %2, %3, %4) fileread2:print_pbm : method(whiley/lang/System:Console,int,int,byte[])->()
	{
		void* pixels_tmp;
		print_pbm(stdout, width, height, _COPY_1DARRAY_PARAM_BYTE(pixels), true);
		_CALLEE_DEALLOC(pixels, "false-false-false" , "print_pbm");
	}
	//return
	if(r != NULL){fclose(r); r = NULL;}
	_DEALLOC(pixels);
	_DEALLOC(_6);
	_DEALLOC(_9);
	exit(0);
}

