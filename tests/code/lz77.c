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
			void* data_tmp;
			_14 = match(data_tmp = _COPY_1DARRAY_BYTE_PARAM(data), offset, pos);
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

BYTE* append_byte(BYTE* items, long long items_size, BYTE item){
	_DECL_1DARRAY_BYTE(_2);
	_DECL_1DARRAY_BYTE(nitems);
	long long i = 0;
	BYTE _5;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	_DECL_1DARRAY_BYTE(_9);
	long long _10 = 0;
	long long _11 = 0;
	BYTE _12;
	long long _13 = 0;
	long long _14 = 0;
	//const %5 = 00000000b : byte
	_5 = 0b00000000;
	//lengthof %6 = %0 : byte[]
	_6 = items_size;
	//const %7 = 1 : int
	_7 = 1;
	//add %8 = %6, %7 : int
	_8=_6+_7;
	//arraygen %9 = [5; 8] : byte[]
	_NEW_1DARRAY_BYTE_VALUE(_9, _8, _5);
	//assign %3 = %9  : byte[]
	_COPY_1DARRAY_BYTE(nitems, _9);
	//const %10 = 0 : int
	_10 = 0;
	//assign %4 = %10  : int
	i = _10;
	//loop (%3, %4, %11, %12, %13, %14)
	while(true){
		//lengthof %11 = %0 : byte[]
		_11 = items_size;
		//ifge %4, %11 goto blklab6 : int
		if(i>=_11){goto blklab6;}
		//indexof %12 = %0, %4 : byte[]
		_12=items[i];
		//update %3[%4] = %12 : byte[] -> byte[]
		nitems[i] = _12;
		//const %13 = 1 : int
		_13 = 1;
		//add %14 = %4, %13 : int
		_14=i+_13;
		//assign %4 = %14  : int
		i = _14;
//.blklab7
blklab7:;
	}
//.blklab6
blklab6:;
	//update %3[%4] = %1 : byte[] -> byte[]
	nitems[i] = item;
	//return %3
	return nitems;
	//return
}

BYTE* write_u1(BYTE* bytes, long long bytes_size, long long u1){
	_DECL_1DARRAY_BYTE(_2);
	_DECL_1DARRAY_BYTE(_3);
	BYTE _4;
	//invoke (%4) = (%1) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
	_4 = toUnsignedByte(u1);
	//invoke (%3) = (%0, %4) lz77:append_byte : function(byte[],byte)->(byte[])
	{
		void* bytes_tmp;
		_UPDATE_1DARRAY_SIZE(_3, bytes);
		_3 = append_byte(bytes_tmp = _COPY_1DARRAY_BYTE_PARAM(bytes), _4);
	}
	//return %3
	return _3;
	//return
}

BYTE* compress(BYTE* data, long long data_size){
	_DECL_1DARRAY_BYTE(_1);
	long long pos = 0;
	_DECL_1DARRAY_BYTE(output);
	Match* m;
	long long offset = 0;
	long long _6 = 0;
	BYTE _7;
	long long _8 = 0;
	_DECL_1DARRAY_BYTE(_9);
	long long _10 = 0;
	Match* _11;
	long long _12 = 0;
	_DECL_1DARRAY_BYTE(_13);
	long long _14 = 0;
	long long _15 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//assign %2 = %6  : int
	pos = _6;
	//const %7 = 00000000b : byte
	_7 = 0b00000000;
	//const %8 = 0 : int
	_8 = 0;
	//arraygen %9 = [7; 8] : byte[]
	_NEW_1DARRAY_BYTE_VALUE(_9, _8, _7);
	//assign %3 = %9  : byte[]
	_COPY_1DARRAY_BYTE(output, _9);
	//loop (%2, %3, %4, %5, %10, %11, %12, %13, %14, %15)
	while(true){
		//lengthof %10 = %0 : byte[]
		_10 = data_size;
		//ifge %2, %10 goto blklab8 : int
		if(pos>=_10){goto blklab8;}
		//invoke (%11) = (%0, %2) lz77:findLongestMatch : function(byte[],lz77:nat)->(lz77:Match)
		{
			void* data_tmp;
			_11 = findLongestMatch(data_tmp = _COPY_1DARRAY_BYTE_PARAM(data), pos);
		}
		//assign %4 = %11  : {int len,int offset}
		m = copy_Match(_11);
		//fieldload %12 = %4 offset : {int len,int offset}
		_12 = m->offset;
		//assign %5 = %12  : int
		offset = _12;
		//invoke (%13) = (%3, %5) lz77:write_u1 : function(byte[],int)->(byte[])
		{
			void* output_tmp;
			_UPDATE_1DARRAY_SIZE(_13, output);
			_13 = write_u1(output_tmp = _COPY_1DARRAY_BYTE_PARAM(output), offset);
		}
		//assign %3 = %13  : byte[]
		_COPY_1DARRAY_BYTE(output, _13);
		//const %14 = 1 : int
		_14 = 1;
		//add %15 = %2, %14 : int
		_15=pos+_14;
		//assign %2 = %15  : int
		pos = _15;
//.blklab9
blklab9:;
	}
//.blklab8
blklab8:;
	//return %3
	return output;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY_BYTE(data);
	_DECL_1DARRAY_BYTE(compress_data);
	_DECL_1DARRAY_BYTE(_3);
	void* _4;
	_DECL_1DARRAY(_6);
	void* _7;
	_DECL_1DARRAY(_9);
	_DECL_1DARRAY_BYTE(_10);
	void* _11;
	_DECL_1DARRAY(_13);
	void* _14;
	_DECL_1DARRAY(_16);
	long long _17 = 0;
	void* _18;
	_DECL_1DARRAY(_20);
	//const %3 = [01001100b,01011010b,00100000b,00110111b,00110111b,00100000b,01100011b,01101111b,01101101b,01110000b,01110010b,01100101b,01110011b,01110011b,01101001b,01101111b,01101110b] : byte[]
	_NEW_1DARRAY_BYTE(_3, 17);
	_3[0] = 0b01001100; _3[1] = 0b01011010; _3[2] = 0b00100000; _3[3] = 0b00110111; _3[4] = 0b00110111; _3[5] = 0b00100000; _3[6] = 0b01100011; _3[7] = 0b01101111; _3[8] = 0b01101101; _3[9] = 0b01110000; _3[10] = 0b01110010; _3[11] = 0b01100101; _3[12] = 0b01110011; _3[13] = 0b01110011; _3[14] = 0b01101001; _3[15] = 0b01101111; _3[16] = 0b01101110; 
	//assign %1 = %3  : byte[]
	_COPY_1DARRAY_BYTE(data, _3);
	//fieldload %4 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %5 = %4 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %6 = [68,97,116,97,58,32,32,32,32,32,32,32,32,32] : int[]
	_NEW_1DARRAY(_6, 14, 0);
	_6[0] = 68; _6[1] = 97; _6[2] = 116; _6[3] = 97; _6[4] = 58; _6[5] = 32; _6[6] = 32; _6[7] = 32; _6[8] = 32; _6[9] = 32; _6[10] = 32; _6[11] = 32; _6[12] = 32; _6[13] = 32; 
	//indirectinvoke () = %5 (%6) : method(int[])->()
	println_s(_6, _6_size);
	//fieldload %7 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %8 = %7 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%9) = (%1) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	_UPDATE_1DARRAY_SIZE(_9, data);
	_9 = fromBytes(data, data_size);
	_9_size = data_size;
	//indirectinvoke () = %8 (%9) : method(int[])->()
	println_s(_9, _9_size);
	//invoke (%10) = (%1) lz77:compress : function(byte[])->(byte[])
	{
		void* data_tmp;
		_UPDATE_1DARRAY_SIZE(_10, data);
		_10 = compress(data_tmp = _COPY_1DARRAY_BYTE_PARAM(data));
	}
	//assign %2 = %10  : byte[]
	_COPY_1DARRAY_BYTE(compress_data, _10);
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = [67,79,77,80,82,69,83,83,69,68,58,32,32,32] : int[]
	_NEW_1DARRAY(_13, 14, 0);
	_13[0] = 67; _13[1] = 79; _13[2] = 77; _13[3] = 80; _13[4] = 82; _13[5] = 69; _13[6] = 83; _13[7] = 83; _13[8] = 69; _13[9] = 68; _13[10] = 58; _13[11] = 32; _13[12] = 32; _13[13] = 32; 
	//indirectinvoke () = %12 (%13) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_13));
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %17 = %2 : byte[]
	_17 = compress_data_size;
	//invoke (%16) = (%17) whiley/lang/Int:toString : function(int)->(whiley/lang/ASCII:string)
	_16 = _17;
	//indirectinvoke () = %15 (%16) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_16));
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %20 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY(_20, 6, 0);
	_20[0] = 32; _20[1] = 98; _20[2] = 121; _20[3] = 116; _20[4] = 101; _20[5] = 115; 
	//indirectinvoke () = %19 (%20) : method(int[])->()
	println_s(_20, _20_size);
	//return
	exit(0);
}

