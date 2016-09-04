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
long long match(BYTE* data, long long data_size, long long offset, long long end){
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
	return len;
	//return
}

Match* findLongestMatch(BYTE* data, long long data_size, long long pos){
	Match* _2;
	long long bestOffset = 0;
	long long bestLen = 0;
	long long start = 0;
	long long offset = 0;
	long long len = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	Match* _18;
	//const %8 = 0 : int
	_8 = 0;
	//assign %3 = %8  : int
	bestOffset = _8;
	//const %9 = 0 : int
	_9 = 0;
	//assign %4 = %9  : int
	bestLen = _9;
	//const %11 = 255 : int
	_11 = 255;
	//sub %12 = %1, %11 : int
	_12=pos-_11;
	//const %13 = 0 : int
	_13 = 0;
	//invoke (%10) = (%12, %13) whiley/lang/Math:max : function(int,int)->(int)
	_10 = max(_12, _13);
	//assign %5 = %10  : int
	start = _10;
	//assign %6 = %5  : int
	offset = start;
	//loop (%3, %4, %6, %7, %14, %15, %16, %17)
	while(true){
		//ifge %6, %1 goto blklab3 : int
		if(offset>=pos){goto blklab3;}
		//invoke (%14) = (%0, %6, %1) lz77:match : function(byte[],lz77:nat,lz77:nat)->(int)
		{
			_14 = match(_1DARRAY_PARAM(data), offset, pos);
		}
		//assign %7 = %14  : int
		len = _14;
		//ifle %7, %4 goto blklab5 : int
		if(len<=bestLen){goto blklab5;}
		//sub %15 = %1, %6 : int
		_15=pos-offset;
		//assign %3 = %15  : int
		bestOffset = _15;
		//assign %4 = %7  : int
		bestLen = len;
//.blklab5
blklab5:;
		//const %16 = 1 : int
		_16 = 1;
		//add %17 = %6, %16 : int
		_17=offset+_16;
		//assign %6 = %17  : int
		offset = _17;
//.blklab4
blklab4:;
	}
//.blklab3
blklab3:;
	//newrecord %18 = (%4, %3) : {int len,int offset}
	_18 = malloc(sizeof(Match));
	_18->len = bestLen;
	_18->offset = bestOffset;
	//return %18
	return _18;
	//return
}

BYTE* compress(BYTE* data, long long data_size){
	_DECL_1DARRAY_BYTE(_1);
	long long pos = 0;
	_DECL_1DARRAY_BYTE(output);
	Match* m;
	long long _5 = 0;
	BYTE _6;
	long long _7 = 0;
	_DECL_1DARRAY_BYTE(_8);
	long long _9 = 0;
	Match* _10;
	long long _11 = 0;
	long long _12 = 0;
	//const %5 = 0 : int
	_5 = 0;
	//assign %2 = %5  : int
	pos = _5;
	//const %6 = 00000000b : byte
	_6 = 0b00000000;
	//const %7 = 0 : int
	_7 = 0;
	//arraygen %8 = [6; 7] : byte[]
	_NEW_1DARRAY_BYTE_VALUE(_8, _7, _6);
	//assign %3 = %8  : byte[]
	_UPDATE_1DARRAY(output, _8);
	//loop (%2, %4, %9, %10, %11, %12)
	while(true){
		//lengthof %9 = %0 : byte[]
		_9 = data_size;
		//ifge %2, %9 goto blklab6 : int
		if(pos>=_9){goto blklab6;}
		//invoke (%10) = (%0, %2) lz77:findLongestMatch : function(byte[],lz77:nat)->(lz77:Match)
		{
			_10 = findLongestMatch(_1DARRAY_PARAM(data), pos);
		}
		//assign %4 = %10  : {int len,int offset}
		m = _10;
		//const %11 = 1 : int
		_11 = 1;
		//add %12 = %2, %11 : int
		_12=pos+_11;
		//assign %2 = %12  : int
		pos = _12;
//.blklab7
blklab7:;
	}
//.blklab6
blklab6:;
	//return %3
	return output;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY_BYTE(data);
	_DECL_1DARRAY_BYTE(_2);
	void* _3;
	_DECL_1DARRAY(_5);
	void* _6;
	_DECL_1DARRAY(_8);
	//const %2 = [01001100b,01011010b,00100000b,00110111b,00110111b,00100000b,01100011b,01101111b,01101101b,01110000b,01110010b,01100101b,01110011b,01110011b,01101001b,01101111b,01101110b] : byte[]
	_NEW_1DARRAY_BYTE(_2, 17);
	_2[0] = 0b01001100; _2[1] = 0b01011010; _2[2] = 0b00100000; _2[3] = 0b00110111; _2[4] = 0b00110111; _2[5] = 0b00100000; _2[6] = 0b01100011; _2[7] = 0b01101111; _2[8] = 0b01101101; _2[9] = 0b01110000; _2[10] = 0b01110010; _2[11] = 0b01100101; _2[12] = 0b01110011; _2[13] = 0b01110011; _2[14] = 0b01101001; _2[15] = 0b01101111; _2[16] = 0b01101110; 
	//assign %1 = %2  : byte[]
	_UPDATE_1DARRAY(data, _2);
	//fieldload %3 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %4 = %3 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %5 = [68,97,116,97,58,32,32,32,32,32,32,32,32,32] : int[]
	_NEW_1DARRAY(_5, 14, 0);
	_5[0] = 68; _5[1] = 97; _5[2] = 116; _5[3] = 97; _5[4] = 58; _5[5] = 32; _5[6] = 32; _5[7] = 32; _5[8] = 32; _5[9] = 32; _5[10] = 32; _5[11] = 32; _5[12] = 32; _5[13] = 32; 
	//indirectinvoke () = %4 (%5) : method(int[])->()
	println_s(_5, _5_size);
	//fieldload %6 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %7 = %6 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%8) = (%1) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	_UPDATE_1DARRAY_SIZE(_8, data);
	_8 = fromBytes(data, data_size);
	_8_size = data_size;
	//indirectinvoke () = %7 (%8) : method(int[])->()
	println_s(_8, _8_size);
	//return
	exit(0);
}

