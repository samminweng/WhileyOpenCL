#include "fileread2.h"
void _print_pbm_(FILE* sys, int64_t width, int64_t height, BYTE* pixels, size_t pixels_size){
	int64_t j;
	int64_t i;
	int64_t pos;
	void* _7;
	_DECL_1DARRAY(_9);
	void* _10;
	void* _12;
	_DECL_1DARRAY(_14);
	void* _15;
	int64_t _17;
	int64_t _18;
	int64_t _19;
	int64_t _20;
	BYTE _21;
	BYTE _22;
	void* _23;
	int64_t _25;
	void* _26;
	int64_t _28;
	int64_t _29;
	int64_t _30;
	void* _31;
	void* _33;
	size_t _33_size = 0;
	int64_t _34;
	int64_t _35;
	void* _36;
	void* _38;
	size_t _38_size = 0;
	//fieldload %7 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %8 = %7 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %9 = [80,49] : int[]
	_NEW_1DARRAY_int64_t(_9, 2, 0);
	_9[0] = 80; _9[1] = 49; 
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
	_NEW_1DARRAY_int64_t(_14, 1, 0);
	_14[0] = 32; 
	//indirectinvoke () = %13 (%14) : method(int[])->()
	{
		printf_s(_14, _14_size);
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
	//loop (%4, %5, %6, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35)
	while(true){
		//ifge %4, %2 goto blklab0 : int
		if(j>=height){goto blklab0;}
		//const %18 = 0 : int
		_18 = 0;
		//assign %5 = %18  : int
		i = _18;
		//loop (%5, %6, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30)
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
			//const %29 = 1 : int
			_29 = 1;
			//add %30 = %5, %29 : int
			_30=i+_29;
			//assign %5 = %30  : int
			i = _30;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//fieldload %31 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %32 = %31 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %33 = [] : void[]
		_NEW_1DARRAY_int64_t(_33, 0, 0);
		//indirectinvoke () = %32 (%33) : method(int[])->()
		{
			println_s(_33, _33_size);
		}
		//const %34 = 1 : int
		_34 = 1;
		//add %35 = %4, %34 : int
		_35=j+_34;
		//assign %4 = %35  : int
		j = _35;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//fieldload %36 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %37 = %36 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %38 = [] : void[]
	_NEW_1DARRAY_int64_t(_38, 0, 0);
	//indirectinvoke () = %37 (%38) : method(any)->()
	{
		_PRINT_1DARRAY_int64_t(_38);
	}
	//return
	return;
}

int main(int argc, char** args){
	FILE* r;
	int64_t width;
	int64_t height;
	_DECL_1DARRAY_BYTE(pixels);
	void* _5;
	_DECL_1DARRAY(_6);
	int64_t _7;
	int64_t _8;
	_DECL_1DARRAY_BYTE(_9);
	//const %6 = [46,46,47,46,46,47,46,46,47,73,110,112,117,116,102,105,108,101,115,47,105,109,97,103,101,54,52,120,54,52,46,112,98,109] : int[]
	_NEW_1DARRAY_int64_t(_6, 34, 0);
	_6[0] = 46; _6[1] = 46; _6[2] = 47; _6[3] = 46; _6[4] = 46; _6[5] = 47; _6[6] = 46; _6[7] = 46; _6[8] = 47; _6[9] = 73; _6[10] = 110; _6[11] = 112; _6[12] = 117; _6[13] = 116; _6[14] = 102; _6[15] = 105; _6[16] = 108; _6[17] = 101; _6[18] = 115; _6[19] = 47; _6[20] = 105; _6[21] = 109; _6[22] = 97; _6[23] = 103; _6[24] = 101; _6[25] = 54; _6[26] = 52; _6[27] = 120; _6[28] = 54; _6[29] = 52; _6[30] = 46; _6[31] = 112; _6[32] = 98; _6[33] = 109; 
	//invoke (%5) = (%6) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_5 = Reader(_6, _6_size);
	}
	//assign %1 = %5  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	r = _5;
	//const %7 = 64 : int
	_7 = 64;
	//assign %2 = %7  : int
	width = _7;
	//const %8 = 64 : int
	_8 = 64;
	//assign %3 = %8  : int
	height = _8;
	//fieldload %10 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%9) = %10 () : method()->(byte[])
	{
		_9 = readAll(r, &_9_size);
	}
	//assign %4 = %9  : byte[]
	_COPY_1DARRAY_BYTE(pixels, _9);
	//invoke () = (%0, %2, %3, %4) fileread2:print_pbm : method(whiley/lang/System:Console,int,int,byte[])->()
	{
		void* tmp_pixels;
		_COPY_1DARRAY_PARAM(pixels, tmp_pixels, BYTE);
		_print_pbm_(stdout, width, height, tmp_pixels, pixels_size);
	}
	//return
	exit(0);
}

