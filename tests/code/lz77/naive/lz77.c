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
	Match* m;
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
	{
		_10 = max(_12, _13);
	}
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
			_14 = match(_COPY_1DARRAY_PARAM_BYTE(data), offset, pos);
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

BYTE* append_byte(BYTE* items, long long items_size, BYTE item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(nitems);
	long long i = 0;
	BYTE _4;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	_DECL_1DARRAY_BYTE(_8);
	long long _9 = 0;
	long long _10 = 0;
	BYTE _11;
	long long _12 = 0;
	long long _13 = 0;
	//const %4 = 00000000b : byte
	_4 = 0b00000000;
	//lengthof %5 = %0 : byte[]
	_5 = items_size;
	//const %6 = 1 : int
	_6 = 1;
	//add %7 = %5, %6 : int
	_7=_5+_6;
	//arraygen %8 = [4; 7] : byte[]
	_NEW_1DARRAY_BYTE(_8, _7, _4);
	//assign %2 = %8  : byte[]
	_COPY_1DARRAY_BYTE(nitems, _8);
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
	i = _9;
	//loop (%2, %3, %10, %11, %12, %13)
	while(true){
		//lengthof %10 = %0 : byte[]
		_10 = items_size;
		//ifge %3, %10 goto blklab6 : int
		if(i>=_10){goto blklab6;}
		//indexof %11 = %0, %3 : byte[]
		_11=items[i];
		//update %2[%3] = %11 : byte[] -> byte[]
		nitems[i] = _11;
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %3, %12 : int
		_13=i+_12;
		//assign %3 = %13  : int
		i = _13;
//.blklab7
blklab7:;
	}
//.blklab6
blklab6:;
	//update %2[%3] = %1 : byte[] -> byte[]
	nitems[i] = item;
	//return %2
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* write_u1(BYTE* bytes, long long bytes_size, long long u1, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_1DARRAY_BYTE(_3);
	BYTE _4;
	//invoke (%4) = (%1) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
	{
		_4 = (BYTE)u1;
	}
	//invoke (%3) = (%0, %4) lz77:append_byte : function(byte[],byte)->(byte[])
	{
		void* bytes_tmp;
		_3 = append_byte(_COPY_1DARRAY_PARAM_BYTE(bytes), _4, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_3));
	}
	//assign %2 = %3  : byte[]
	_COPY_1DARRAY_BYTE(output, _3);
	//return %2
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

BYTE* compress(BYTE* data, long long data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	long long pos = 0;
	Match* m;
	long long offset = 0;
	long long len = 0;
	long long _6 = 0;
	BYTE _7;
	long long _8 = 0;
	_DECL_1DARRAY_BYTE(_9);
	long long _10 = 0;
	Match* _11;
	long long _12 = 0;
	long long _13 = 0;
	_DECL_1DARRAY_BYTE(_14);
	long long _15 = 0;
	_DECL_1DARRAY_BYTE(_16);
	BYTE _17;
	long long _18 = 0;
	long long _19 = 0;
	_DECL_1DARRAY_BYTE(_20);
	long long _21 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//assign %2 = %6  : int
	pos = _6;
	//const %7 = 00000000b : byte
	_7 = 0b00000000;
	//const %8 = 0 : int
	_8 = 0;
	//arraygen %9 = [7; 8] : byte[]
	_NEW_1DARRAY_BYTE(_9, _8, _7);
	//assign %1 = %9  : byte[]
	_COPY_1DARRAY_BYTE(output, _9);
	//loop (%1, %2, %3, %4, %5, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21)
	while(true){
		//lengthof %10 = %0 : byte[]
		_10 = data_size;
		//ifge %2, %10 goto blklab8 : int
		if(pos>=_10){goto blklab8;}
		//invoke (%11) = (%0, %2) lz77:findLongestMatch : function(byte[],lz77:nat)->(lz77:Match)
		{
			void* data_tmp;
			_11 = findLongestMatch(_COPY_1DARRAY_PARAM_BYTE(data), pos);
		}
		//assign %3 = %11  : {int len,int offset}
		m = copy_Match(_11);
		//fieldload %12 = %3 offset : {int len,int offset}
		_12 = m->offset;
		//assign %4 = %12  : int
		offset = _12;
		//fieldload %13 = %3 len : {int len,int offset}
		_13 = m->len;
		//assign %5 = %13  : int
		len = _13;
		//invoke (%14) = (%1, %4) lz77:write_u1 : function(byte[],int)->(byte[])
		{
			void* output_tmp;
			_14 = write_u1(_COPY_1DARRAY_PARAM_BYTE(output), offset, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_14));
		}
		//assign %1 = %14  : byte[]
		_COPY_1DARRAY_BYTE(output, _14);
		//const %15 = 0 : int
		_15 = 0;
		//ifne %4, %15 goto blklab10 : int
		if(offset!=_15){goto blklab10;}
		//indexof %17 = %0, %2 : byte[]
		_17=data[pos];
		//invoke (%16) = (%1, %17) lz77:append_byte : function(byte[],byte)->(byte[])
		{
			void* output_tmp;
			_16 = append_byte(_COPY_1DARRAY_PARAM_BYTE(output), _17, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_16));
		}
		//assign %1 = %16  : byte[]
		_COPY_1DARRAY_BYTE(output, _16);
		//const %18 = 1 : int
		_18 = 1;
		//add %19 = %2, %18 : int
		_19=pos+_18;
		//assign %2 = %19  : int
		pos = _19;
		//goto blklab11
		goto blklab11;
//.blklab10
blklab10:;
		//invoke (%20) = (%1, %5) lz77:write_u1 : function(byte[],int)->(byte[])
		{
			void* output_tmp;
			_20 = write_u1(_COPY_1DARRAY_PARAM_BYTE(output), len, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_20));
		}
		//assign %1 = %20  : byte[]
		_COPY_1DARRAY_BYTE(output, _20);
		//add %21 = %2, %5 : int
		_21=pos+len;
		//assign %2 = %21  : int
		pos = _21;
//.blklab11
blklab11:;
//.blklab9
blklab9:;
	}
//.blklab8
blklab8:;
	//return %1
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

BYTE* decompress(BYTE* data, long long data_size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	long long pos = 0;
	BYTE header;
	BYTE item;
	long long offset = 0;
	long long len = 0;
	long long start = 0;
	long long i = 0;
	BYTE _9;
	long long _10 = 0;
	_DECL_1DARRAY_BYTE(_11);
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	BYTE _16;
	long long _17 = 0;
	long long _18 = 0;
	BYTE _19;
	long long _20 = 0;
	long long _21 = 0;
	BYTE _22;
	_DECL_1DARRAY_BYTE(_23);
	long long _24 = 0;
	long long _25 = 0;
	long long _26 = 0;
	long long _27 = 0;
	long long _28 = 0;
	BYTE _29;
	_DECL_1DARRAY_BYTE(_30);
	long long _31 = 0;
	long long _32 = 0;
	//const %9 = 00000000b : byte
	_9 = 0b00000000;
	//const %10 = 0 : int
	_10 = 0;
	//arraygen %11 = [9; 10] : byte[]
	_NEW_1DARRAY_BYTE(_11, _10, _9);
	//assign %1 = %11  : byte[]
	_COPY_1DARRAY_BYTE(output, _11);
	//const %12 = 0 : int
	_12 = 0;
	//assign %2 = %12  : int
	pos = _12;
	//loop (%1, %2, %3, %4, %5, %6, %7, %8, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32)
	while(true){
		//const %13 = 1 : int
		_13 = 1;
		//add %14 = %2, %13 : int
		_14=pos+_13;
		//lengthof %15 = %0 : byte[]
		_15 = data_size;
		//ifge %14, %15 goto blklab12 : int
		if(_14>=_15){goto blklab12;}
		//indexof %16 = %0, %2 : byte[]
		_16=data[pos];
		//assign %3 = %16  : byte
		header = _16;
		//const %17 = 1 : int
		_17 = 1;
		//add %18 = %2, %17 : int
		_18=pos+_17;
		//indexof %19 = %0, %18 : byte[]
		_19=data[_18];
		//assign %4 = %19  : byte
		item = _19;
		//const %20 = 2 : int
		_20 = 2;
		//add %21 = %2, %20 : int
		_21=pos+_20;
		//assign %2 = %21  : int
		pos = _21;
		//const %22 = 00000000b : byte
		_22 = 0b00000000;
		//ifne %3, %22 goto blklab14 : byte
		if(header!=_22){goto blklab14;}
		//invoke (%23) = (%1, %4) lz77:append_byte : function(byte[],byte)->(byte[])
		{
			void* output_tmp;
			_23 = append_byte(_COPY_1DARRAY_PARAM_BYTE(output), item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_23));
		}
		//assign %1 = %23  : byte[]
		_COPY_1DARRAY_BYTE(output, _23);
		//goto blklab15
		goto blklab15;
//.blklab14
blklab14:;
		//invoke (%24) = (%3) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		{
			_24 = (unsigned int)header;
		}
		//assign %5 = %24  : int
		offset = _24;
		//invoke (%25) = (%4) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		{
			_25 = (unsigned int)item;
		}
		//assign %6 = %25  : int
		len = _25;
		//lengthof %26 = %1 : byte[]
		_26 = output_size;
		//sub %27 = %26, %5 : int
		_27=_26-offset;
		//assign %7 = %27  : int
		start = _27;
		//assign %8 = %7  : int
		i = start;
		//loop (%1, %4, %8, %28, %29, %30, %31, %32)
		while(true){
			//add %28 = %7, %6 : int
			_28=start+len;
			//ifge %8, %28 goto blklab16 : int
			if(i>=_28){goto blklab16;}
			//indexof %29 = %1, %8 : byte[]
			_29=output[i];
			//assign %4 = %29  : byte
			item = _29;
			//invoke (%30) = (%1, %4) lz77:append_byte : function(byte[],byte)->(byte[])
			{
				void* output_tmp;
				_30 = append_byte(_COPY_1DARRAY_PARAM_BYTE(output), item, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_30));
			}
			//assign %1 = %30  : byte[]
			_COPY_1DARRAY_BYTE(output, _30);
			//const %31 = 1 : int
			_31 = 1;
			//add %32 = %8, %31 : int
			_32=i+_31;
			//assign %8 = %32  : int
			i = _32;
//.blklab17
blklab17:;
		}
//.blklab16
blklab16:;
//.blklab15
blklab15:;
//.blklab13
blklab13:;
	}
//.blklab12
blklab12:;
	//return %1
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

BYTE* init(long long repeat, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(items);
	long long length = 0;
	long long pos = 0;
	long long _4 = 0;
	long long _5 = 0;
	BYTE _6;
	_DECL_1DARRAY_BYTE(_7);
	long long _8 = 0;
	_DECL_1DARRAY_BYTE(_9);
	long long _10 = 0;
	long long _11 = 0;
	BYTE _12;
	long long _13 = 0;
	long long _14 = 0;
	//const %4 = 15 : int
	_4 = 15;
	//mul %5 = %0, %4 : int
	_5=repeat*_4;
	//assign %2 = %5  : int
	length = _5;
	//const %6 = 00000000b : byte
	_6 = 0b00000000;
	//arraygen %7 = [6; 2] : byte[]
	_NEW_1DARRAY_BYTE(_7, length, _6);
	//assign %1 = %7  : byte[]
	_COPY_1DARRAY_BYTE(items, _7);
	//const %8 = 0 : int
	_8 = 0;
	//assign %3 = %8  : int
	pos = _8;
	//loop (%1, %3, %9, %10, %11, %12, %13, %14)
	while(true){
		//ifge %3, %2 goto blklab18 : int
		if(pos>=length){goto blklab18;}
		//const %9 = [01100001b,01100001b,01100011b,01100001b,01100001b,01100011b,01100001b,01100010b,01100011b,01100001b,01100010b,01100001b,01100001b,01100001b,01100011b] : byte[]
		_NEW_1DARRAY_BYTE(_9, 15, 0b0);
		_9[0] = 0b01100001; _9[1] = 0b01100001; _9[2] = 0b01100011; _9[3] = 0b01100001; _9[4] = 0b01100001; _9[5] = 0b01100011; _9[6] = 0b01100001; _9[7] = 0b01100010; _9[8] = 0b01100011; _9[9] = 0b01100001; _9[10] = 0b01100010; _9[11] = 0b01100001; _9[12] = 0b01100001; _9[13] = 0b01100001; _9[14] = 0b01100011; 
		//const %10 = 15 : int
		_10 = 15;
		//rem %11 = %3, %10 : int
		_11=pos%_10;
		//indexof %12 = %9, %11 : byte[]
		_12=_9[_11];
		//update %1[%3] = %12 : byte[] -> byte[]
		items[pos] = _12;
		//const %13 = 1 : int
		_13 = 1;
		//add %14 = %3, %13 : int
		_14=pos+_13;
		//assign %3 = %14  : int
		pos = _14;
//.blklab19
blklab19:;
	}
//.blklab18
blklab18:;
	//return %1
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(items);
	return items;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY_BYTE(data);
	_DECL_1DARRAY_BYTE(compress_data);
	_DECL_1DARRAY_BYTE(decompress_data);
	_DECL_1DARRAY_BYTE(_4);
	long long _5 = 0;
	void* _6;
	_DECL_1DARRAY(_8);
	void* _9;
	_DECL_1DARRAY(_11);
	void* _12;
	long long _14 = 0;
	void* _15;
	_DECL_1DARRAY(_17);
	_DECL_1DARRAY_BYTE(_18);
	void* _19;
	_DECL_1DARRAY(_21);
	void* _22;
	_DECL_1DARRAY(_24);
	void* _25;
	long long _27 = 0;
	void* _28;
	_DECL_1DARRAY(_30);
	_DECL_1DARRAY_BYTE(_31);
	void* _32;
	_DECL_1DARRAY(_34);
	void* _35;
	_DECL_1DARRAY(_37);
	void* _38;
	long long _40 = 0;
	void* _41;
	_DECL_1DARRAY(_43);
	//const %5 = 2 : int
	_5 = 2;
	//invoke (%4) = (%5) lz77:init : function(int)->(byte[])
	{
		_4 = init(_5, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_4));
	}
	//assign %1 = %4  : byte[]
	_COPY_1DARRAY_BYTE(data, _4);
	//fieldload %6 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %7 = %6 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %8 = [68,97,116,97,58,32,32,32,32,32,32,32,32,32] : int[]
	_NEW_1DARRAY_LONGLONG(_8, 14, 0);
	_8[0] = 68; _8[1] = 97; _8[2] = 116; _8[3] = 97; _8[4] = 58; _8[5] = 32; _8[6] = 32; _8[7] = 32; _8[8] = 32; _8[9] = 32; _8[10] = 32; _8[11] = 32; _8[12] = 32; _8[13] = 32; 
	//indirectinvoke () = %7 (%8) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_8));
	}
	//fieldload %9 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %10 = %9 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%11) = (%1) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_11 = fromBytes(data, data_size);
		_11_size = data_size;
	}
	//indirectinvoke () = %10 (%11) : method(int[])->()
	{
		println_s(_11, _11_size);
	}
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %14 = %1 : byte[]
	_14 = data_size;
	//indirectinvoke () = %13 (%14) : method(any)->()
	{
		printf("%lld", _14);
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %17 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_LONGLONG(_17, 6, 0);
	_17[0] = 32; _17[1] = 98; _17[2] = 121; _17[3] = 116; _17[4] = 101; _17[5] = 115; 
	//indirectinvoke () = %16 (%17) : method(int[])->()
	{
		println_s(_17, _17_size);
	}
	//invoke (%18) = (%1) lz77:compress : function(byte[])->(byte[])
	{
		void* data_tmp;
		_18 = compress(_COPY_1DARRAY_PARAM_BYTE(data), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_18));
	}
	//assign %2 = %18  : byte[]
	_COPY_1DARRAY_BYTE(compress_data, _18);
	//fieldload %19 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %20 = %19 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %21 = [67,79,77,80,82,69,83,83,69,68,32,68,97,116,97,58,32,32,32] : int[]
	_NEW_1DARRAY_LONGLONG(_21, 19, 0);
	_21[0] = 67; _21[1] = 79; _21[2] = 77; _21[3] = 80; _21[4] = 82; _21[5] = 69; _21[6] = 83; _21[7] = 83; _21[8] = 69; _21[9] = 68; _21[10] = 32; _21[11] = 68; _21[12] = 97; _21[13] = 116; _21[14] = 97; _21[15] = 58; _21[16] = 32; _21[17] = 32; _21[18] = 32; 
	//indirectinvoke () = %20 (%21) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_21));
	}
	//fieldload %22 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %23 = %22 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%24) = (%2) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_24 = fromBytes(compress_data, compress_data_size);
		_24_size = compress_data_size;
	}
	//indirectinvoke () = %23 (%24) : method(int[])->()
	{
		println_s(_24, _24_size);
	}
	//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %26 = %25 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %27 = %2 : byte[]
	_27 = compress_data_size;
	//indirectinvoke () = %26 (%27) : method(any)->()
	{
		printf("%lld", _27);
	}
	//fieldload %28 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %29 = %28 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %30 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_LONGLONG(_30, 6, 0);
	_30[0] = 32; _30[1] = 98; _30[2] = 121; _30[3] = 116; _30[4] = 101; _30[5] = 115; 
	//indirectinvoke () = %29 (%30) : method(int[])->()
	{
		println_s(_30, _30_size);
	}
	//invoke (%31) = (%2) lz77:decompress : function(byte[])->(byte[])
	{
		void* compress_data_tmp;
		_31 = decompress(_COPY_1DARRAY_PARAM_BYTE(compress_data), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_31));
	}
	//assign %3 = %31  : byte[]
	_COPY_1DARRAY_BYTE(decompress_data, _31);
	//fieldload %32 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %33 = %32 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %34 = [68,69,67,79,77,80,82,69,83,83,69,68,58,32,32,32] : int[]
	_NEW_1DARRAY_LONGLONG(_34, 16, 0);
	_34[0] = 68; _34[1] = 69; _34[2] = 67; _34[3] = 79; _34[4] = 77; _34[5] = 80; _34[6] = 82; _34[7] = 69; _34[8] = 83; _34[9] = 83; _34[10] = 69; _34[11] = 68; _34[12] = 58; _34[13] = 32; _34[14] = 32; _34[15] = 32; 
	//indirectinvoke () = %33 (%34) : method(int[])->()
	{
		printf_s(_1DARRAY_PARAM(_34));
	}
	//fieldload %35 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %36 = %35 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%37) = (%3) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_37 = fromBytes(decompress_data, decompress_data_size);
		_37_size = decompress_data_size;
	}
	//indirectinvoke () = %36 (%37) : method(int[])->()
	{
		println_s(_37, _37_size);
	}
	//fieldload %38 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %39 = %38 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %40 = %3 : byte[]
	_40 = decompress_data_size;
	//indirectinvoke () = %39 (%40) : method(any)->()
	{
		printf("%lld", _40);
	}
	//fieldload %41 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %42 = %41 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %43 = [32,98,121,116,101,115] : int[]
	_NEW_1DARRAY_LONGLONG(_43, 6, 0);
	_43[0] = 32; _43[1] = 98; _43[2] = 121; _43[3] = 116; _43[4] = 101; _43[5] = 115; 
	//indirectinvoke () = %42 (%43) : method(int[])->()
	{
		println_s(_43, _43_size);
	}
	//return
	exit(0);
}

