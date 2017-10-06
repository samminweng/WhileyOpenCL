#include "fileread.h"
int main(int argc, char** args){
	FILE* file;
	int64_t width;
	int64_t height;
	_DECL_1DARRAY_BYTE(data);
	_DECL_DEALLOC(data);
	void* _5;
	_DECL_DEALLOC(_5);
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7;
	int64_t _8;
	_DECL_1DARRAY_BYTE(_9);
	_DECL_DEALLOC(_9);
	void* _11;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	void* _14;
	int64_t _16;
	void* _17;
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
	int64_t _20;
	int64_t _21;
	//const %6 = [46,46,47,46,46,47,46,46,47,73,110,112,117,116,102,105,108,101,115,47,105,109,97,103,101,51,50,120,51,50,46,112,98,109] : int[]
	_DEALLOC(_6);
	_NEW_1DARRAY_int64_t(_6, 34, 0);
	_6[0] = 46; _6[1] = 46; _6[2] = 47; _6[3] = 46; _6[4] = 46; _6[5] = 47; _6[6] = 46; _6[7] = 46; _6[8] = 47; _6[9] = 73; _6[10] = 110; _6[11] = 112; _6[12] = 117; _6[13] = 116; _6[14] = 102; _6[15] = 105; _6[16] = 108; _6[17] = 101; _6[18] = 115; _6[19] = 47; _6[20] = 105; _6[21] = 109; _6[22] = 97; _6[23] = 103; _6[24] = 101; _6[25] = 51; _6[26] = 50; _6[27] = 120; _6[28] = 51; _6[29] = 50; _6[30] = 46; _6[31] = 112; _6[32] = 98; _6[33] = 109; 
	_ADD_DEALLOC(_6);
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
		_ADD_DEALLOC(_9);
	}
	//assign %4 = %9  : byte[]
	_DEALLOC(data);
	_COPY_1DARRAY_BYTE(data, _9);
	_ADD_DEALLOC(data);
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = [82,69,65,68,58,32,32,32,32,32,32,32,32,32] : int[]
	_DEALLOC(_13);
	_NEW_1DARRAY_int64_t(_13, 14, 0);
	_13[0] = 82; _13[1] = 69; _13[2] = 65; _13[3] = 68; _13[4] = 58; _13[5] = 32; _13[6] = 32; _13[7] = 32; _13[8] = 32; _13[9] = 32; _13[10] = 32; _13[11] = 32; _13[12] = 32; _13[13] = 32; 
	_ADD_DEALLOC(_13);
	//indirectinvoke () = %12 (%13) : method(int[])->()
	{
		printf_s(_13, _13_size);
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
	_DEALLOC(_19);
	_NEW_1DARRAY_int64_t(_19, 6, 0);
	_19[0] = 32; _19[1] = 98; _19[2] = 121; _19[3] = 116; _19[4] = 101; _19[5] = 115; 
	_ADD_DEALLOC(_19);
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
	//fieldload %22 = %1 close : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke () = %22 () : method()->()
	{
		fclose(file);
		file = NULL;
	}
	//return
	if(file != NULL){fclose(file); file = NULL;}
	_DEALLOC(data);
	_DEALLOC(_6);
	_DEALLOC(_9);
	_DEALLOC(_13);
	_DEALLOC(_19);
	exit(0);
}

