#include "fileread.h"
int main(int argc, char** args){
	FILE* file;
	int64_t width = 0;
	int64_t height = 0;
	_DECL_1DARRAY_BYTE(data);
	void* _5;
	_DECL_1DARRAY(_6);
	int64_t _7 = 0;
	int64_t _8 = 0;
	_DECL_1DARRAY_BYTE(_9);
	void* _11;
	_DECL_1DARRAY(_13);
	void* _14;
	int64_t _16 = 0;
	void* _17;
	_DECL_1DARRAY(_19);
	int64_t _20 = 0;
	int64_t _21 = 0;
	//const %6 = [105,109,97,103,101,51,50,120,51,50,46,112,98,109] : int[]
	_NEW_1DARRAY_int64_t(_6, 14, 0);
	_6[0] = 105; _6[1] = 109; _6[2] = 97; _6[3] = 103; _6[4] = 101; _6[5] = 51; _6[6] = 50; _6[7] = 120; _6[8] = 51; _6[9] = 50; _6[10] = 46; _6[11] = 112; _6[12] = 98; _6[13] = 109; 
	//invoke (%5) = (%6) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_5 = Reader(_6, _6_size);
	}
	//assign %1 = %5  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	file = _5;
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
		_9 = readAll(file, &_9_size);
	}
	//assign %4 = %9  : byte[]
	_COPY_1DARRAY_BYTE(data, _9);
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = [82,69,65,68,58,32,32,32,32,32,32,32,32,32] : int[]
	_NEW_1DARRAY_int64_t(_13, 14, 0);
	_13[0] = 82; _13[1] = 69; _13[2] = 65; _13[3] = 68; _13[4] = 58; _13[5] = 32; _13[6] = 32; _13[7] = 32; _13[8] = 32; _13[9] = 32; _13[10] = 32; _13[11] = 32; _13[12] = 32; _13[13] = 32; 
	//indirectinvoke () = %12 (%13) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_13));
	}
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %16 = %4 : byte[]
	_16 = data_size;
	//indirectinvoke () = %15 (%16) : method(any)->()
	{
		printf("%"PRId64, _16);
	}
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %19 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_int64_t(_19, 6, 0);
	_19[0] = 32; _19[1] = 98; _19[2] = 121; _19[3] = 116; _19[4] = 101; _19[5] = 115; 
	//indirectinvoke () = %18 (%19) : method(int[])->()
	{
		println_s(_19, _19_size);
	}
	//assert
	{
		//lengthof %20 = %4 : byte[]
		_20 = data_size;
		//mul %21 = %2, %3 : int
		_21=width*height;
		//ifeq %20, %21 goto blklab0 : int
		if(_20==_21){goto blklab0;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab0
blklab0:;
	//assert
	}
	//return
	exit(0);
}

