#include "fileread.h"
int main(int argc, char** args){
	FILE* file;
	_DECL_1DARRAY_BYTE(data);
	void* _3;
	_DECL_1DARRAY(_4);
	_DECL_1DARRAY_BYTE(_5);
	void* _7;
	_DECL_1DARRAY(_9);
	void* _10;
	long long _12 = 0;
	void* _13;
	_DECL_1DARRAY(_15);
	//const %4 = [115,109,97,108,108,46,105,110] : int[]
	_NEW_1DARRAY_LONGLONG(_4, 8, 0);
	_4[0] = 115; _4[1] = 109; _4[2] = 97; _4[3] = 108; _4[4] = 108; _4[5] = 46; _4[6] = 105; _4[7] = 110; 
	//invoke (%3) = (%4) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_3 = Reader(_4);
	}
	//assign %1 = %3  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	file = _3;
	//fieldload %6 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%5) = %6 () : method()->(byte[])
	{
		_5 = readAll(file, &_5_size);
	}
	//assign %2 = %5  : byte[]
	_UPDATE_1DARRAY(data, _5);
	//fieldload %7 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %8 = %7 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %9 = [82,69,65,68,58,32,32,32,32,32,32,32,32,32] : int[]
	_NEW_1DARRAY_LONGLONG(_9, 14, 0);
	_9[0] = 82; _9[1] = 69; _9[2] = 65; _9[3] = 68; _9[4] = 58; _9[5] = 32; _9[6] = 32; _9[7] = 32; _9[8] = 32; _9[9] = 32; _9[10] = 32; _9[11] = 32; _9[12] = 32; _9[13] = 32; 
	//indirectinvoke () = %8 (%9) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_9));
	}
	//fieldload %10 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %11 = %10 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %12 = %2 : byte[]
	_12 = data_size;
	//indirectinvoke () = %11 (%12) : method(any)->()
	{
		printf("%lld", _12);
	}
	//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %14 = %13 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %15 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_LONGLONG(_15, 6, 0);
	_15[0] = 32; _15[1] = 98; _15[2] = 121; _15[3] = 116; _15[4] = 101; _15[5] = 115; 
	//indirectinvoke () = %14 (%15) : method(int[])->()
	{
		println_s(_15, _15_size);
	}
	//return
	exit(0);
}

