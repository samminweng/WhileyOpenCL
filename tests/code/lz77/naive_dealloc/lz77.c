#include "lz77.h"
Match* copy_Match(Match* _Match){
	Match* new_Match = malloc(sizeof(Match));
	new_Match->len = _Match->len;
	new_Match->offset = _Match->offset;
	return new_Match;
}
Match** copy_array_Match(Match** _Match, long long _Match_size){
	Match** new_Match = malloc(_Match_size*sizeof(Match*));
	for(int i=0;i<_Match_size;i++){
		new_Match[i] = copy_Match(_Match[i]);
	}
	return new_Match;
}
void free_Match(Match* match){
	free(match);
}
void printf_Match(Match* match){
	printf("{");
	printf(" len:");
	printf("%lld", match->len);
	printf(" offset:");
	printf("%lld", match->offset);
	printf("}");
}
long long match(BYTE* data, long long data_size, _DECL_DEALLOC_PARAM(data), long long offset, long long end){
	long long _3 = 0;
	long long pos = 0;
	long long len = 0;
	long long _6 = 0;
	long long _7 = 0;
	BYTE _8;
	BYTE _9;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	//assign %4 = %2  : int
	pos = end;
	//const %6 = 0 : int
	_6 = 0;
	//assign %5 = %6  : int
	len = _6;
	//loop (%1, %4, %5, %7, %8, %9, %10, %11, %12, %13, %14, %15, %16)
	while(true){
		//ifge %1, %4 goto blklab1 : int
		if(offset>=pos){goto blklab1;}
		//lengthof %7 = %0 : byte[]
		_7 = data_size;
		//ifge %4, %7 goto blklab1 : int
		if(pos>=_7){goto blklab1;}
		//indexof %8 = %0, %1 : byte[]
		_8=data[offset];
		//indexof %9 = %0, %4 : byte[]
		_9=data[pos];
		//ifne %8, %9 goto blklab1 : byte
		if(_8!=_9){goto blklab1;}
		//const %10 = 255 : int
		_10 = 255;
		//ifge %5, %10 goto blklab1 : int
		if(len>=_10){goto blklab1;}
		//const %11 = 1 : int
		_11 = 1;
		//add %12 = %1, %11 : int
		_12=offset+_11;
		//assign %1 = %12  : int
		offset = _12;
		//const %13 = 1 : int
		_13 = 1;
		//add %14 = %4, %13 : int
		_14=pos+_13;
		//assign %4 = %14  : int
		pos = _14;
		//const %15 = 1 : int
		_15 = 1;
		//add %16 = %5, %15 : int
		_16=len+_15;
		//assign %5 = %16  : int
		len = _16;
//.blklab2
blklab2:;
	}
//.blklab1
blklab1:;
	//return %5
	_DEALLOC(data);
	return len;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY_BYTE(data);
	_DECL_DEALLOC(data);
	_DECL_1DARRAY_BYTE(_2);
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
	_COPY_1DARRAY_BYTE(data, _2);
	_ADD_DEALLOC(data);
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

