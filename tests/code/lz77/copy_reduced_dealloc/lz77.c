#include "lz77.h"
int main(int argc, char** args){
	BYTE* data;
	long long data_size = 0;
	_DECL_DEALLOC(data);
	BYTE* _2;
	long long _2_size = 0;
	_DECL_DEALLOC(_2);
	void* _3;
	_DECL_1DARRAY(_5);
	_DECL_DEALLOC(_5);
	void* _6;
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	//const %2 = [01001100b,01011010b,00100000b,00110111b,00110111b,00100000b,01100011b,01101111b,01101101b,01110000b,01110010b,01100101b,01110011b,01110011b,01101001b,01101111b,01101110b] : byte[]
	_DEALLOC(_2);
	_NEW_1DARRAY_BYTE(_2, 17);
	_2[0] = 0b01001100; _2[1] = 0b01011010; _2[2] = 0b00100000; _2[3] = 0b00110111; _2[4] = 0b00110111; _2[5] = 0b00100000; _2[6] = 0b01100011; _2[7] = 0b01101111; _2[8] = 0b01101101; _2[9] = 0b01110000; _2[10] = 0b01110010; _2[11] = 0b01100101; _2[12] = 0b01110011; _2[13] = 0b01110011; _2[14] = 0b01101001; _2[15] = 0b01101111; _2[16] = 0b01101110; 
	_ADD_DEALLOC(_2);
	//assign %1 = %2  : byte[]
	_DEALLOC(data);
	_UPDATE_1DARRAY(data, _2);
	_TRANSFER_DEALLOC(data, _2);
	//fieldload %3 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %4 = %3 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %5 = [68,97,116,97,58,32,32,32,32,32,32,32,32,32] : int[]
	_DEALLOC(_5);
	_NEW_1DARRAY(_5, 14, 0);
	_5[0] = 68; _5[1] = 97; _5[2] = 116; _5[3] = 97; _5[4] = 58; _5[5] = 32; _5[6] = 32; _5[7] = 32; _5[8] = 32; _5[9] = 32; _5[10] = 32; _5[11] = 32; _5[12] = 32; _5[13] = 32; 
	_ADD_DEALLOC(_5);
	//indirectinvoke () = %4 (%5) : method(int[])->()
	println_s(_5, _5_size);
	//fieldload %6 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %7 = %6 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%8) = (%1) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	_UPDATE_1DARRAY_SIZE(_8, data);
	_DEALLOC(_8);
	_8 = fromBytes(data, data_size);
	_8_size = data_size;
	_ADD_DEALLOC(_8);
	//indirectinvoke () = %7 (%8) : method(int[])->()
	println_s(_8, _8_size);
	//return
	_DEALLOC(data);
	_DEALLOC(_2);
	_DEALLOC(_5);
	_DEALLOC(_8);
	exit(0);
}

