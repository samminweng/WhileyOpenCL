#include "lz77_opt_compress.h"
Match* copy_Match(Match* _Match){
	Match* new_Match = malloc(sizeof(Match));
	new_Match->len = _Match->len;
	new_Match->offset = _Match->offset;
	return new_Match;
}
Match** copy_array_Match(Match** _Match, size_t _Match_size){
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
	printf("%"PRId64, match->len);
	printf(" offset:");
	printf("%"PRId64, match->offset);
	printf("}");
}
int64_t _match_(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), int64_t offset, int64_t end){
	int64_t length;
	int64_t pos;
	int64_t len;
	int64_t _6;
	int64_t _7;
	BYTE _8;
	BYTE _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	//assign %4 = %2  : int
	// isCopyEliminated = true
	pos = end;
	//const %6 = 0 : int
	_6 = 0;
	//assign %5 = %6  : int
	// isCopyEliminated = true
	len = _6;
	//loop (%1, %4, %5, %7, %8, %9, %10, %11, %12, %13, %14, %15, %16)
	while(true){
		//ifge %1, %4 goto blklab3 : int
		if(offset>=pos){goto blklab3;}
		//lengthof %7 = %0 : byte[]
		_7 = data_size;
		//ifge %4, %7 goto blklab3 : int
		if(pos>=_7){goto blklab3;}
		//indexof %8 = %0, %1 : byte[]
		_8=data[offset];
		//indexof %9 = %0, %4 : byte[]
		_9=data[pos];
		//ifne %8, %9 goto blklab3 : byte
		if(_8!=_9){goto blklab3;}
		//const %10 = 255 : int
		_10 = 255;
		//ifge %5, %10 goto blklab3 : int
		if(len>=_10){goto blklab3;}
		//const %11 = 1 : int
		_11 = 1;
		//add %12 = %1, %11 : int
		_12=offset+_11;
		//assign %1 = %12  : int
		// isCopyEliminated = true
		offset = _12;
		//const %13 = 1 : int
		_13 = 1;
		//add %14 = %4, %13 : int
		_14=pos+_13;
		//assign %4 = %14  : int
		// isCopyEliminated = true
		pos = _14;
		//const %15 = 1 : int
		_15 = 1;
		//add %16 = %5, %15 : int
		_16=len+_15;
		//assign %5 = %16  : int
		// isCopyEliminated = true
		len = _16;
//.blklab4
blklab4:;
	}
//.blklab3
blklab3:;
	//return %5
	_DEALLOC(data);
	return len;
	//return
}

Match* _findLongestMatch_(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), int64_t pos){
	Match* m;
	_DECL_DEALLOC(m);
	int64_t bestOffset;
	int64_t bestLen;
	int64_t start;
	int64_t offset;
	int64_t len;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	int64_t _12;
	int64_t _13;
	int64_t _14;
	int64_t _15;
	int64_t _16;
	int64_t _17;
	Match* _18;
	_DECL_DEALLOC(_18);
	//const %8 = 0 : int
	_8 = 0;
	//assign %3 = %8  : int
	// isCopyEliminated = true
	bestOffset = _8;
	//const %9 = 0 : int
	_9 = 0;
	//assign %4 = %9  : int
	// isCopyEliminated = true
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
	// isCopyEliminated = true
	start = _10;
	//assign %6 = %5  : int
	// isCopyEliminated = true
	offset = start;
	//loop (%3, %4, %6, %7, %14, %15, %16, %17)
	while(true){
		//ifge %6, %1 goto blklab5 : int
		if(offset>=pos){goto blklab5;}
		//invoke (%14) = (%0, %6, %1) lz77_opt_compress:match : function(byte[],lz77_opt_compress:nat,lz77_opt_compress:nat)->(int)
		{
			// isCopyEliminated of '_0' = true
			_14 = _match_(data, data_size, false, offset, pos);
			_RETAIN_DEALLOC(data, "false-false-true" , "match");
		}
		//assign %7 = %14  : int
		// isCopyEliminated = true
		len = _14;
		//ifle %7, %4 goto blklab7 : int
		if(len<=bestLen){goto blklab7;}
		//sub %15 = %1, %6 : int
		_15=pos-offset;
		//assign %3 = %15  : int
		// isCopyEliminated = true
		bestOffset = _15;
		//assign %4 = %7  : int
		// isCopyEliminated = false
		bestLen = len;
//.blklab7
blklab7:;
		//const %16 = 1 : int
		_16 = 1;
		//add %17 = %6, %16 : int
		_17=offset+_16;
		//assign %6 = %17  : int
		// isCopyEliminated = true
		offset = _17;
//.blklab6
blklab6:;
	}
//.blklab5
blklab5:;
	//newrecord %18 = (%4, %3) : {int len,int offset}
	_DEALLOC_STRUCT(_18, Match);
	_18 = malloc(sizeof(Match));
	_18->len = bestLen;
	_18->offset = bestOffset;
	_18_dealloc = true;
	//return %18
	_DEALLOC(data);
	_DEALLOC_STRUCT(m, Match);
	return _18;
	//return
}

BYTE* _append_(BYTE* items, size_t items_size, _DECL_DEALLOC_PARAM(items), BYTE item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(nitems);
	_DECL_DEALLOC(nitems);
	int64_t i;
	BYTE _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	_DECL_1DARRAY_BYTE(_8);
	_DECL_DEALLOC(_8);
	int64_t _9;
	int64_t _10;
	BYTE _11;
	int64_t _12;
	int64_t _13;
	//const %4 = 00000000b : byte
	_4 = 0b00000000;
	//lengthof %5 = %0 : byte[]
	_5 = items_size;
	//const %6 = 1 : int
	_6 = 1;
	//add %7 = %5, %6 : int
	_7=_5+_6;
	//arraygen %8 = [4; 7] : byte[]
	_DEALLOC(_8);
	_NEW_1DARRAY_BYTE(_8, _7, _4);
	_NEW1DARRAY_DEALLOC(_8, _4, _7);
	//assign %2 = %8  : byte[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(nitems, _8);
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
	// isCopyEliminated = true
	i = _9;
	//loop (%2, %3, %10, %11, %12, %13)
	while(true){
		//lengthof %10 = %0 : byte[]
		_10 = items_size;
		//ifge %3, %10 goto blklab8 : int
		if(i>=_10){goto blklab8;}
		//indexof %11 = %0, %3 : byte[]
		_11=items[i];
		//update %2[%3] = %11 : byte[] -> byte[]
		nitems[i] = _11;
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %3, %12 : int
		_13=i+_12;
		//assign %3 = %13  : int
		// isCopyEliminated = true
		i = _13;
//.blklab9
blklab9:;
	}
//.blklab8
blklab8:;
	//update %2[%3] = %1 : byte[] -> byte[]
	nitems[i] = item;
	//return %2
	_DEALLOC(items);
	_DEALLOC(_8);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* _resize_(BYTE* items, size_t items_size, _DECL_DEALLOC_PARAM(items), int64_t size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(nitems);
	_DECL_DEALLOC(nitems);
	int64_t i;
	BYTE _4;
	_DECL_1DARRAY_BYTE(_5);
	_DECL_DEALLOC(_5);
	int64_t _6;
	BYTE _7;
	int64_t _8;
	int64_t _9;
	//const %4 = 00000000b : byte
	_4 = 0b00000000;
	//arraygen %5 = [4; 1] : byte[]
	_DEALLOC(_5);
	_NEW_1DARRAY_BYTE(_5, size, _4);
	_NEW1DARRAY_DEALLOC(_5, _4, size);
	//assign %2 = %5  : byte[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(nitems, _5);
	//const %6 = 0 : int
	_6 = 0;
	//assign %3 = %6  : int
	// isCopyEliminated = true
	i = _6;
	//loop (%2, %3, %7, %8, %9)
	while(true){
		//ifge %3, %1 goto blklab12 : int
		if(i>=size){goto blklab12;}
		//indexof %7 = %0, %3 : byte[]
		_7=items[i];
		//update %2[%3] = %7 : byte[] -> byte[]
		nitems[i] = _7;
		//const %8 = 1 : int
		_8 = 1;
		//add %9 = %3, %8 : int
		_9=i+_8;
		//assign %3 = %9  : int
		// isCopyEliminated = true
		i = _9;
//.blklab13
blklab13:;
	}
//.blklab12
blklab12:;
	//return %2
	_DEALLOC(items);
	_DEALLOC(_5);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* _compress_(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
	int64_t pos;
	int64_t arr_capacity;
	int64_t arr_size;
	Match* m;
	_DECL_DEALLOC(m);
	BYTE offset;
	BYTE length;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	int64_t _11;
	BYTE _12;
	_DECL_1DARRAY_BYTE(_13);
	_DECL_DEALLOC(_13);
	int64_t _14;
	int64_t _15;
	Match* _16;
	_DECL_DEALLOC(_16);
	BYTE _17;
	int64_t _18;
	BYTE _19;
	int64_t _20;
	BYTE _21;
	BYTE _22;
	int64_t _23;
	int64_t _24;
	int64_t _25;
	int64_t _26;
	int64_t _27;
	int64_t _28;
	int64_t _29;
	int64_t _30;
	_DECL_1DARRAY_BYTE(_31);
	_DECL_DEALLOC(_31);
	//const %8 = 0 : int
	_8 = 0;
	//assign %2 = %8  : int
	// isCopyEliminated = true
	pos = _8;
	//const %9 = 2 : int
	_9 = 2;
	//lengthof %10 = %0 : byte[]
	_10 = data_size;
	//mul %11 = %9, %10 : int
	_11=_9*_10;
	//assign %3 = %11  : int
	// isCopyEliminated = true
	arr_capacity = _11;
	//const %12 = 00000000b : byte
	_12 = 0b00000000;
	//arraygen %13 = [12; 3] : byte[]
	_DEALLOC(_13);
	_NEW_1DARRAY_BYTE(_13, arr_capacity, _12);
	_NEW1DARRAY_DEALLOC(_13, _12, arr_capacity);
	//assign %1 = %13  : byte[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(output, _13);
	//const %14 = 0 : int
	_14 = 0;
	//assign %4 = %14  : int
	// isCopyEliminated = true
	arr_size = _14;
	//loop (%1, %2, %4, %5, %6, %7, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30)
	while(true){
		//lengthof %15 = %0 : byte[]
		_15 = data_size;
		//ifge %2, %15 goto blklab14 : int
		if(pos>=_15){goto blklab14;}
		//invoke (%16) = (%0, %2) lz77_opt_compress:findLongestMatch : function(byte[],lz77_opt_compress:nat)->(lz77_opt_compress:Match)
		{
			_DEALLOC_STRUCT(_16, Match);
			// isCopyEliminated of '_0' = true
			_16 = _findLongestMatch_(data, data_size, false, pos);
			_RETAIN_DEALLOC(data, "false-false-true" , "findLongestMatch");
			_RETAIN_DEALLOC_POST(_16, data);
		}
		//assign %5 = %16  : {int len,int offset}
		// isCopyEliminated = true
		_DEALLOC_STRUCT(m, Match);
		m = _16;
		_TRANSFER_DEALLOC_POST(m, _16);
		//fieldload %18 = %5 offset : {int len,int offset}
		_18 = m->offset;
		//invoke (%17) = (%18) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
		{
			_17 = (BYTE)_18;
		}
		//assign %6 = %17  : byte
		// isCopyEliminated = true
		offset = _17;
		//fieldload %20 = %5 len : {int len,int offset}
		_20 = m->len;
		//invoke (%19) = (%20) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
		{
			_19 = (BYTE)_20;
		}
		//assign %7 = %19  : byte
		// isCopyEliminated = true
		length = _19;
		//const %21 = 00000000b : byte
		_21 = 0b00000000;
		//ifne %6, %21 goto blklab16 : byte
		if(offset!=_21){goto blklab16;}
		//indexof %22 = %0, %2 : byte[]
		_22=data[pos];
		//assign %7 = %22  : byte
		// isCopyEliminated = true
		length = _22;
		//const %23 = 1 : int
		_23 = 1;
		//add %24 = %2, %23 : int
		_24=pos+_23;
		//assign %2 = %24  : int
		// isCopyEliminated = true
		pos = _24;
		//goto blklab17
		goto blklab17;
//.blklab16
blklab16:;
		//fieldload %25 = %5 len : {int len,int offset}
		_25 = m->len;
		//add %26 = %2, %25 : int
		_26=pos+_25;
		//assign %2 = %26  : int
		// isCopyEliminated = true
		pos = _26;
//.blklab17
blklab17:;
		//update %1[%4] = %6 : byte[] -> byte[]
		output[arr_size] = offset;
		//const %27 = 1 : int
		_27 = 1;
		//add %28 = %4, %27 : int
		_28=arr_size+_27;
		//assign %4 = %28  : int
		// isCopyEliminated = true
		arr_size = _28;
		//update %1[%4] = %7 : byte[] -> byte[]
		output[arr_size] = length;
		//const %29 = 1 : int
		_29 = 1;
		//add %30 = %4, %29 : int
		_30=arr_size+_29;
		//assign %4 = %30  : int
		// isCopyEliminated = true
		arr_size = _30;
//.blklab15
blklab15:;
	}
//.blklab14
blklab14:;
	//assert
	{
		//ifge %3, %4 goto blklab18 : int
		if(arr_capacity>=arr_size){goto blklab18;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab18
blklab18:;
	//assert
	}
	//invoke (%31) = (%1, %4) lz77_opt_compress:resize : function(byte[],int)->(byte[])
	{
		_DEALLOC(_31);
		// isCopyEliminated of '_1' = true
		_31 = _resize_(output, output_size, false, arr_size, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_31));
		_RETAIN_DEALLOC(output, "false-false-false" , "resize");
		_RETAIN_DEALLOC_POST(_31, output);
	}
	//assign %1 = %31  : byte[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(output, _31);
	//return %1
	_DEALLOC(data);
	_DEALLOC_STRUCT(m, Match);
	_DEALLOC(_13);
	_DEALLOC_STRUCT(_16, Match);
	_DEALLOC(_31);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

int main(int argc, char** args){
	FILE* file;
	_DECL_1DARRAY_BYTE(data);
	_DECL_DEALLOC(data);
	_DECL_1DARRAY_BYTE(compress_data);
	_DECL_DEALLOC(compress_data);
	FILE* outfile;
	void* _5;
	_DECL_DEALLOC(_5);
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	_DECL_1DARRAY_BYTE(_7);
	_DECL_DEALLOC(_7);
	void* _9;
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	void* _12;
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	void* _15;
	int64_t _17;
	void* _18;
	_DECL_1DARRAY(_20);
	_DECL_DEALLOC(_20);
	_DECL_1DARRAY_BYTE(_21);
	_DECL_DEALLOC(_21);
	void* _22;
	_DECL_1DARRAY(_24);
	_DECL_DEALLOC(_24);
	void* _25;
	void* _27;
	int64_t _29;
	void* _30;
	_DECL_1DARRAY(_32);
	_DECL_DEALLOC(_32);
	void* _33;
	_DECL_DEALLOC(_33);
	_DECL_1DARRAY(_34);
	_DECL_DEALLOC(_34);
	int64_t _35;
	//const %6 = [46,46,47,46,46,47,46,46,47,73,110,112,117,116,102,105,108,101,115,47,115,109,97,108,108,46,105,110] : int[]
	_DEALLOC(_6);
	_NEW_1DARRAY_int64_t(_6, 28, 0);
	_6[0] = 46; _6[1] = 46; _6[2] = 47; _6[3] = 46; _6[4] = 46; _6[5] = 47; _6[6] = 46; _6[7] = 46; _6[8] = 47; _6[9] = 73; _6[10] = 110; _6[11] = 112; _6[12] = 117; _6[13] = 116; _6[14] = 102; _6[15] = 105; _6[16] = 108; _6[17] = 101; _6[18] = 115; _6[19] = 47; _6[20] = 115; _6[21] = 109; _6[22] = 97; _6[23] = 108; _6[24] = 108; _6[25] = 46; _6[26] = 105; _6[27] = 110; 
	_6_dealloc = true;
	//invoke (%5) = (%6) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_5 = Reader(_6, _6_size);
	}
	//assign %1 = %5  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	// isCopyEliminated = true
	file = _5;
	//fieldload %8 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%7) = %8 () : method()->(byte[])
	{
		_7 = readAll(file, &_7_size);
		_7_dealloc = true;
	}
	//assign %2 = %7  : byte[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(data, _7);
	//fieldload %9 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %10 = %9 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %11 = [68,97,116,97,58,32,32,32,32,32,32,32,32,32] : int[]
	_DEALLOC(_11);
	_NEW_1DARRAY_int64_t(_11, 14, 0);
	_11[0] = 68; _11[1] = 97; _11[2] = 116; _11[3] = 97; _11[4] = 58; _11[5] = 32; _11[6] = 32; _11[7] = 32; _11[8] = 32; _11[9] = 32; _11[10] = 32; _11[11] = 32; _11[12] = 32; _11[13] = 32; 
	_11_dealloc = true;
	//indirectinvoke () = %10 (%11) : method(int[])->()
	{
		println_s(_11, _11_size);
	}
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%14) = (%2) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_DEALLOC(_14);
		_14 = fromBytes(data, data_size);
		_14_size = data_size;
		_14_dealloc = true;
	}
	//indirectinvoke () = %13 (%14) : method(int[])->()
	{
		println_s(_14, _14_size);
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %17 = %2 : byte[]
	_17 = data_size;
	//indirectinvoke () = %16 (%17) : method(any)->()
	{
		printf("%"PRId64, _17);
	}
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %20 = [32,98,121,116,101,115] : int[]
	_DEALLOC(_20);
	_NEW_1DARRAY_int64_t(_20, 6, 0);
	_20[0] = 32; _20[1] = 98; _20[2] = 121; _20[3] = 116; _20[4] = 101; _20[5] = 115; 
	_20_dealloc = true;
	//indirectinvoke () = %19 (%20) : method(int[])->()
	{
		println_s(_20, _20_size);
	}
	//invoke (%21) = (%2) lz77_opt_compress:compress : function(byte[])->(byte[])
	{
		_DEALLOC(_21);
		// isCopyEliminated of '_2' = true
		_21 = _compress_(data, data_size, false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_21));
		_RETAIN_DEALLOC(data, "false-false-false" , "compress");
		_RETAIN_DEALLOC_POST(_21, data);
	}
	//assign %3 = %21  : byte[]
	// isCopyEliminated = true
	_TRANSFER_DEALLOC(compress_data, _21);
	//fieldload %22 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %23 = %22 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %24 = [67,79,77,80,82,69,83,83,69,68,32,68,97,116,97,58,32,32,32] : int[]
	_DEALLOC(_24);
	_NEW_1DARRAY_int64_t(_24, 19, 0);
	_24[0] = 67; _24[1] = 79; _24[2] = 77; _24[3] = 80; _24[4] = 82; _24[5] = 69; _24[6] = 83; _24[7] = 83; _24[8] = 69; _24[9] = 68; _24[10] = 32; _24[11] = 68; _24[12] = 97; _24[13] = 116; _24[14] = 97; _24[15] = 58; _24[16] = 32; _24[17] = 32; _24[18] = 32; 
	_24_dealloc = true;
	//indirectinvoke () = %23 (%24) : method(int[])->()
	{
		printf_s(_24, _24_size);
	}
	//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %26 = %25 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %26 (%3) : method(any)->()
	{
		_PRINT_1DARRAY_BYTE(compress_data);
	}
	//fieldload %27 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %28 = %27 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %29 = %3 : byte[]
	_29 = compress_data_size;
	//indirectinvoke () = %28 (%29) : method(any)->()
	{
		printf("%"PRId64, _29);
	}
	//fieldload %30 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %31 = %30 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %32 = [32,98,121,116,101,115] : int[]
	_DEALLOC(_32);
	_NEW_1DARRAY_int64_t(_32, 6, 0);
	_32[0] = 32; _32[1] = 98; _32[2] = 121; _32[3] = 116; _32[4] = 101; _32[5] = 115; 
	_32_dealloc = true;
	//indirectinvoke () = %31 (%32) : method(int[])->()
	{
		println_s(_32, _32_size);
	}
	//const %34 = [46,46,47,46,46,47,46,46,47,73,110,112,117,116,102,105,108,101,115,47,115,109,97,108,108,95,111,112,116,46,100,97,116] : int[]
	_DEALLOC(_34);
	_NEW_1DARRAY_int64_t(_34, 33, 0);
	_34[0] = 46; _34[1] = 46; _34[2] = 47; _34[3] = 46; _34[4] = 46; _34[5] = 47; _34[6] = 46; _34[7] = 46; _34[8] = 47; _34[9] = 73; _34[10] = 110; _34[11] = 112; _34[12] = 117; _34[13] = 116; _34[14] = 102; _34[15] = 105; _34[16] = 108; _34[17] = 101; _34[18] = 115; _34[19] = 47; _34[20] = 115; _34[21] = 109; _34[22] = 97; _34[23] = 108; _34[24] = 108; _34[25] = 95; _34[26] = 111; _34[27] = 112; _34[28] = 116; _34[29] = 46; _34[30] = 100; _34[31] = 97; _34[32] = 116; 
	_34_dealloc = true;
	//invoke (%33) = (%34) whiley/io/File:Writer : method(whiley/lang/ASCII:string)->(whiley/io/File:Writer)
	{
		_33 = Writer(_34, _34_size);
	}
	//assign %4 = %33  : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	// isCopyEliminated = true
	outfile = _33;
	//fieldload %36 = %4 write : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke (%35) = %36 (%3) : method(byte[])->(int)
	{
		writeAll(outfile, compress_data, compress_data_size);
	}
	//fieldload %37 = %4 close : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke () = %37 () : method()->()
	{
		fclose(outfile);
		outfile = NULL;
	}
	//fieldload %38 = %1 close : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke () = %38 () : method()->()
	{
		fclose(file);
		file = NULL;
	}
	//return
	if(file != NULL){fclose(file); file = NULL;}
	_DEALLOC(data);
	_DEALLOC(compress_data);
	if(outfile != NULL){fclose(outfile); outfile = NULL;}
	_DEALLOC(_6);
	_DEALLOC(_7);
	_DEALLOC(_11);
	_DEALLOC(_14);
	_DEALLOC(_20);
	_DEALLOC(_21);
	_DEALLOC(_24);
	_DEALLOC(_32);
	_DEALLOC(_34);
	exit(0);
}

