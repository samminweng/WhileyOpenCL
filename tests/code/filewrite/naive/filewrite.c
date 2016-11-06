#include "filewrite.h"
int main(int argc, char** args){
	FILE* r;
	_DECL_1DARRAY_BYTE(data);
	FILE* w;
	void* _4;
	_DECL_1DARRAY(_5);
	_DECL_1DARRAY_BYTE(_6);
	void* _8;
	_DECL_1DARRAY(_10);
	void* _11;
	int64_t _13 = 0;
	void* _14;
	_DECL_1DARRAY(_16);
	void* _17;
	_DECL_1DARRAY(_18);
	int64_t _19 = 0;
	//const %5 = [105,109,97,103,101,46,105,110] : int[]
	_NEW_1DARRAY_int64_t(_5, 8, 0);
	_5[0] = 105; _5[1] = 109; _5[2] = 97; _5[3] = 103; _5[4] = 101; _5[5] = 46; _5[6] = 105; _5[7] = 110; 
	//invoke (%4) = (%5) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_4 = Reader(_5, _5_size);
	}
	//assign %1 = %4  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	r = _4;
	//fieldload %7 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%6) = %7 () : method()->(byte[])
	{
		_6 = readAll(r, &_6_size);
	}
	//assign %2 = %6  : byte[]
	_COPY_1DARRAY_BYTE(data, _6);
	//fieldload %8 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %9 = %8 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %10 = [82,69,65,68,58,32,32,32,32,32,32,32,32,32] : int[]
	_NEW_1DARRAY_int64_t(_10, 14, 0);
	_10[0] = 82; _10[1] = 69; _10[2] = 65; _10[3] = 68; _10[4] = 58; _10[5] = 32; _10[6] = 32; _10[7] = 32; _10[8] = 32; _10[9] = 32; _10[10] = 32; _10[11] = 32; _10[12] = 32; _10[13] = 32; 
	//indirectinvoke () = %9 (%10) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_10));
	}
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %13 = %2 : byte[]
	_13 = data_size;
	//indirectinvoke () = %12 (%13) : method(any)->()
	{
		printf("%"PRId64, _13);
	}
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %16 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_int64_t(_16, 6, 0);
	_16[0] = 32; _16[1] = 98; _16[2] = 121; _16[3] = 116; _16[4] = 101; _16[5] = 115; 
	//indirectinvoke () = %15 (%16) : method(int[])->()
	{
		println_s(_16, _16_size);
	}
	//const %18 = [111,117,116,112,117,116,46,111,117,116] : int[]
	_NEW_1DARRAY_int64_t(_18, 10, 0);
	_18[0] = 111; _18[1] = 117; _18[2] = 116; _18[3] = 112; _18[4] = 117; _18[5] = 116; _18[6] = 46; _18[7] = 111; _18[8] = 117; _18[9] = 116; 
	//invoke (%17) = (%18) whiley/io/File:Writer : method(whiley/lang/ASCII:string)->(whiley/io/File:Writer)
	{
		_17 = Writer(_18, _18_size);
	}
	//assign %3 = %17  : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	w = _17;
	//fieldload %20 = %3 write : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke (%19) = %20 (%2) : method(byte[])->(int)
	{
		fwrite(data, 1, data_size, w);
	}
	//fieldload %21 = %3 close : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke () = %21 () : method()->()
	{
		fclose(w);
		w = NULL;
	}
	//return
	exit(0);
}

