#include "LZ77_optimised_decompress.h"
MyArrayList* copy_MyArrayList(MyArrayList* _MyArrayList){
	MyArrayList* new_MyArrayList = malloc(sizeof(MyArrayList));
	new_MyArrayList->len = _MyArrayList->len;
	_COPY_1DARRAY_BYTE(new_MyArrayList->items, _MyArrayList->items);
	return new_MyArrayList;
}
MyArrayList** copy_array_MyArrayList(MyArrayList** _MyArrayList, size_t _MyArrayList_size){
	MyArrayList** new_MyArrayList = malloc(_MyArrayList_size*sizeof(MyArrayList*));
	for(int i=0;i<_MyArrayList_size;i++){
		new_MyArrayList[i] = copy_MyArrayList(_MyArrayList[i]);
	}
	return new_MyArrayList;
}
void free_MyArrayList(MyArrayList* myarraylist){
	free(myarraylist->items);
	myarraylist->items = NULL;
	free(myarraylist);
}
void printf_MyArrayList(MyArrayList* myarraylist){
	printf("{");
	printf(" len:");
	printf("%"PRId64, myarraylist->len);
	printf(" items:");
	_PRINT_1DARRAY_BYTE(myarraylist->items);
	printf("}");
}
MyArrayList* _opt_append_(MyArrayList* list, _DECL_DEALLOC_PARAM(list), BYTE item){
	MyArrayList* nlist;
	_DECL_DEALLOC(nlist);
	_DECL_1DARRAY_BYTE(items);
	_DECL_DEALLOC(items);
	int64_t items_length = 0;
	_DECL_1DARRAY_BYTE(nitems);
	_DECL_DEALLOC(nitems);
	int64_t i = 0;
	_DECL_1DARRAY_BYTE(_7);
	_DECL_DEALLOC(_7);
	int64_t _8 = 0;
	int64_t _9 = 0;
	BYTE _10;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	_DECL_1DARRAY_BYTE(_16);
	_DECL_DEALLOC(_16);
	int64_t _17 = 0;
	int64_t _18 = 0;
	BYTE _19;
	int64_t _20 = 0;
	int64_t _21 = 0;
	int64_t _22 = 0;
	int64_t _23 = 0;
	MyArrayList* _24;
	_DECL_DEALLOC(_24);
	//fieldload %7 = %0 items : {byte[] items,int len}
	_DEALLOC(_7);
	_UPDATE_1DARRAY(_7, list->items);
	_REMOVE_DEALLOC(_7);
	//assign %3 = %7  : byte[]
	_DEALLOC(items);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(items, _7);
	_TRANSFER_DEALLOC(items, _7);
	//fieldload %8 = %0 len : {byte[] items,int len}
	_8 = list->len;
	//assign %4 = %8  : int
	// isCopyEliminated = true
	items_length = _8;
	//lengthof %9 = %3 : byte[]
	_9 = items_size;
	//ifge %4, %9 goto blklab1 : int
	if(items_length>=_9){goto blklab1;}
	//update %3[%4] = %1 : byte[] -> byte[]
	// isCopyEliminated = false
	items[items_length] = item;
	//goto blklab2
	goto blklab2;
//.blklab1
blklab1:;
	//const %10 = 00000000b : byte
	_10 = 0b00000000;
	//lengthof %11 = %3 : byte[]
	_11 = items_size;
	//const %12 = 2 : int
	_12 = 2;
	//mul %13 = %11, %12 : int
	_13=_11*_12;
	//const %14 = 1 : int
	_14 = 1;
	//add %15 = %13, %14 : int
	_15=_13+_14;
	//arraygen %16 = [10; 15] : byte[]
	_DEALLOC(_16);
	_NEW_1DARRAY_BYTE(_16, _15, _10);
	_ADD_DEALLOC(_16);
	//assign %5 = %16  : byte[]
	_DEALLOC(nitems);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(nitems, _16);
	_TRANSFER_DEALLOC(nitems, _16);
	//const %17 = 0 : int
	_17 = 0;
	//assign %6 = %17  : int
	// isCopyEliminated = true
	i = _17;
	//loop (%5, %6, %18, %19, %20, %21)
	while(true){
		//lengthof %18 = %3 : byte[]
		_18 = items_size;
		//ifge %6, %18 goto blklab3 : int
		if(i>=_18){goto blklab3;}
		//indexof %19 = %3, %6 : byte[]
		_19=items[i];
		//update %5[%6] = %19 : byte[] -> byte[]
		// isCopyEliminated = false
		nitems[i] = _19;
		//const %20 = 1 : int
		_20 = 1;
		//add %21 = %6, %20 : int
		_21=i+_20;
		//assign %6 = %21  : int
		// isCopyEliminated = true
		i = _21;
//.blklab4
blklab4:;
	}
//.blklab3
blklab3:;
	//update %5[%6] = %1 : byte[] -> byte[]
	// isCopyEliminated = true
	nitems[i] = item;
	//assign %3 = %5  : byte[]
	_DEALLOC(items);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(items, nitems);
	_TRANSFER_DEALLOC(items, nitems);
//.blklab2
blklab2:;
	//const %22 = 1 : int
	_22 = 1;
	//add %23 = %4, %22 : int
	_23=items_length+_22;
	//assign %4 = %23  : int
	// isCopyEliminated = true
	items_length = _23;
	//newrecord %24 = (%3, %4) : {byte[] items,int len}
	_DEALLOC_STRUCT(_24, MyArrayList);
	_24 = malloc(sizeof(MyArrayList));
	// isCopyEliminated = true
	_UPDATE_1DARRAY(_24->items, items);
	// isCopyEliminated = true
	_24->len = items_length;
	_REMOVE_DEALLOC(items);
	_ADD_DEALLOC(_24);
	//assign %2 = %24  : {byte[] items,int len}
	_DEALLOC_STRUCT(nlist, MyArrayList);
	// isCopyEliminated = true
	nlist = _24;
	_TRANSFER_DEALLOC(nlist, _24);
	//return %2
	_DEALLOC_STRUCT(list, MyArrayList);
	_DEALLOC(items);
	_DEALLOC(nitems);
	_DEALLOC(_7);
	_DEALLOC(_16);
	_DEALLOC_STRUCT(_24, MyArrayList);
	return nlist;
	//return
}

BYTE* _resize_(BYTE* items, size_t items_size, _DECL_DEALLOC_PARAM(items), int64_t size, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(nitems);
	_DECL_DEALLOC(nitems);
	int64_t i = 0;
	BYTE _4;
	_DECL_1DARRAY_BYTE(_5);
	_DECL_DEALLOC(_5);
	int64_t _6 = 0;
	BYTE _7;
	int64_t _8 = 0;
	int64_t _9 = 0;
	//const %4 = 00000000b : byte
	_4 = 0b00000000;
	//arraygen %5 = [4; 1] : byte[]
	_DEALLOC(_5);
	_NEW_1DARRAY_BYTE(_5, size, _4);
	_ADD_DEALLOC(_5);
	//assign %2 = %5  : byte[]
	_DEALLOC(nitems);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(nitems, _5);
	_TRANSFER_DEALLOC(nitems, _5);
	//const %6 = 0 : int
	_6 = 0;
	//assign %3 = %6  : int
	// isCopyEliminated = true
	i = _6;
	//loop (%2, %3, %7, %8, %9)
	while(true){
		//ifge %3, %1 goto blklab7 : int
		if(i>=size){goto blklab7;}
		//indexof %7 = %0, %3 : byte[]
		_7=items[i];
		//update %2[%3] = %7 : byte[] -> byte[]
		// isCopyEliminated = false
		nitems[i] = _7;
		//const %8 = 1 : int
		_8 = 1;
		//add %9 = %3, %8 : int
		_9=i+_8;
		//assign %3 = %9  : int
		// isCopyEliminated = true
		i = _9;
//.blklab8
blklab8:;
	}
//.blklab7
blklab7:;
	//return %2
	_DEALLOC(items);
	_DEALLOC(_5);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

BYTE* _decompress_(BYTE* data, size_t data_size, _DECL_DEALLOC_PARAM(data), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(output);
	_DECL_DEALLOC(output);
	MyArrayList* list;
	_DECL_DEALLOC(list);
	int64_t pos = 0;
	BYTE header;
	BYTE item;
	int64_t offset = 0;
	int64_t len = 0;
	int64_t start = 0;
	int64_t i = 0;
	_DECL_1DARRAY_BYTE(items);
	_DECL_DEALLOC(items);
	BYTE _11;
	int64_t _12 = 0;
	_DECL_1DARRAY_BYTE(_13);
	_DECL_DEALLOC(_13);
	int64_t _14 = 0;
	MyArrayList* _15;
	_DECL_DEALLOC(_15);
	int64_t _16 = 0;
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	BYTE _20;
	int64_t _21 = 0;
	int64_t _22 = 0;
	BYTE _23;
	int64_t _24 = 0;
	int64_t _25 = 0;
	BYTE _26;
	MyArrayList* _27;
	_DECL_DEALLOC(_27);
	int64_t _28 = 0;
	int64_t _29 = 0;
	int64_t _30 = 0;
	int64_t _31 = 0;
	int64_t _32 = 0;
	_DECL_1DARRAY_BYTE(_33);
	_DECL_DEALLOC(_33);
	BYTE _34;
	MyArrayList* _35;
	_DECL_DEALLOC(_35);
	int64_t _36 = 0;
	int64_t _37 = 0;
	_DECL_1DARRAY_BYTE(_38);
	_DECL_DEALLOC(_38);
	_DECL_1DARRAY_BYTE(_39);
	_DECL_DEALLOC(_39);
	int64_t _40 = 0;
	//const %11 = 00000000b : byte
	_11 = 0b00000000;
	//const %12 = 0 : int
	_12 = 0;
	//arraygen %13 = [11; 12] : byte[]
	_DEALLOC(_13);
	_NEW_1DARRAY_BYTE(_13, _12, _11);
	_ADD_DEALLOC(_13);
	//const %14 = 0 : int
	_14 = 0;
	//newrecord %15 = (%13, %14) : {byte[] items,int len}
	_DEALLOC_STRUCT(_15, MyArrayList);
	_15 = malloc(sizeof(MyArrayList));
	// isCopyEliminated = true
	_UPDATE_1DARRAY(_15->items, _13);
	// isCopyEliminated = true
	_15->len = _14;
	_REMOVE_DEALLOC(_13);
	_ADD_DEALLOC(_15);
	//assign %2 = %15  : {byte[] items,int len}
	_DEALLOC_STRUCT(list, MyArrayList);
	// isCopyEliminated = true
	list = _15;
	_TRANSFER_DEALLOC(list, _15);
	//const %16 = 0 : int
	_16 = 0;
	//assign %3 = %16  : int
	// isCopyEliminated = true
	pos = _16;
	//loop (%2, %3, %4, %5, %6, %7, %8, %9, %10, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37)
	while(true){
		//const %17 = 1 : int
		_17 = 1;
		//add %18 = %3, %17 : int
		_18=pos+_17;
		//lengthof %19 = %0 : byte[]
		_19 = data_size;
		//ifge %18, %19 goto blklab9 : int
		if(_18>=_19){goto blklab9;}
		//indexof %20 = %0, %3 : byte[]
		_20=data[pos];
		//assign %4 = %20  : byte
		// isCopyEliminated = true
		header = _20;
		//const %21 = 1 : int
		_21 = 1;
		//add %22 = %3, %21 : int
		_22=pos+_21;
		//indexof %23 = %0, %22 : byte[]
		_23=data[_22];
		//assign %5 = %23  : byte
		// isCopyEliminated = true
		item = _23;
		//const %24 = 2 : int
		_24 = 2;
		//add %25 = %3, %24 : int
		_25=pos+_24;
		//assign %3 = %25  : int
		// isCopyEliminated = true
		pos = _25;
		//const %26 = 00000000b : byte
		_26 = 0b00000000;
		//ifne %4, %26 goto blklab11 : byte
		if(header!=_26){goto blklab11;}
		//invoke (%27) = (%2, %5) LZ77_optimised_decompress:opt_append : function(LZ77_optimised_decompress:MyArrayList,byte)->(LZ77_optimised_decompress:MyArrayList)
		{
			_DEALLOC_STRUCT(_27, MyArrayList);
			// isCopyEliminated of '_2' = true
			_27 = _opt_append_(_STRUCT_PARAM(list), false, item);
			_RETAIN_DEALLOC(list, "false-false-false" , "opt_append");
			_ADD_DEALLOC(_27);
		}
		//assign %2 = %27  : {byte[] items,int len}
		_DEALLOC_STRUCT(list, MyArrayList);
		// isCopyEliminated = true
		list = _27;
		_TRANSFER_DEALLOC(list, _27);
		//goto blklab12
		goto blklab12;
//.blklab11
blklab11:;
		//invoke (%28) = (%4) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		{
			_28 = (unsigned int)header;
		}
		//assign %6 = %28  : int
		// isCopyEliminated = true
		offset = _28;
		//invoke (%29) = (%5) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
		{
			_29 = (unsigned int)item;
		}
		//assign %7 = %29  : int
		// isCopyEliminated = true
		len = _29;
		//fieldload %30 = %2 len : {byte[] items,int len}
		_30 = list->len;
		//sub %31 = %30, %6 : int
		_31=_30-offset;
		//assign %8 = %31  : int
		// isCopyEliminated = true
		start = _31;
		//assign %9 = %8  : int
		// isCopyEliminated = false
		i = start;
		//loop (%2, %5, %9, %10, %32, %33, %34, %35, %36, %37)
		while(true){
			//add %32 = %8, %7 : int
			_32=start+len;
			//ifge %9, %32 goto blklab13 : int
			if(i>=_32){goto blklab13;}
			//fieldload %33 = %2 items : {byte[] items,int len}
			_DEALLOC(_33);
			_UPDATE_1DARRAY(_33, list->items);
			_REMOVE_DEALLOC(_33);
			//assign %10 = %33  : byte[]
			_DEALLOC(items);
			// isCopyEliminated = true
			_UPDATE_1DARRAY(items, _33);
			_TRANSFER_DEALLOC(items, _33);
			//indexof %34 = %10, %9 : byte[]
			_34=items[i];
			//assign %5 = %34  : byte
			// isCopyEliminated = true
			item = _34;
			//invoke (%35) = (%2, %5) LZ77_optimised_decompress:opt_append : function(LZ77_optimised_decompress:MyArrayList,byte)->(LZ77_optimised_decompress:MyArrayList)
			{
				_DEALLOC_STRUCT(_35, MyArrayList);
				// isCopyEliminated of '_2' = true
				_35 = _opt_append_(_STRUCT_PARAM(list), false, item);
				_RETAIN_DEALLOC(list, "false-false-false" , "opt_append");
				_ADD_DEALLOC(_35);
			}
			//assign %2 = %35  : {byte[] items,int len}
			_DEALLOC_STRUCT(list, MyArrayList);
			// isCopyEliminated = true
			list = _35;
			_TRANSFER_DEALLOC(list, _35);
			//const %36 = 1 : int
			_36 = 1;
			//add %37 = %9, %36 : int
			_37=i+_36;
			//assign %9 = %37  : int
			// isCopyEliminated = true
			i = _37;
//.blklab14
blklab14:;
		}
//.blklab13
blklab13:;
//.blklab12
blklab12:;
//.blklab10
blklab10:;
	}
//.blklab9
blklab9:;
	//fieldload %39 = %2 items : {byte[] items,int len}
	_DEALLOC(_39);
	_UPDATE_1DARRAY(_39, list->items);
	_REMOVE_DEALLOC(_39);
	//fieldload %40 = %2 len : {byte[] items,int len}
	_40 = list->len;
	//invoke (%38) = (%39, %40) LZ77_optimised_decompress:resize : function(byte[],int)->(byte[])
	{
		_DEALLOC(_38);
		// isCopyEliminated of '_39' = true
		_38 = _resize_(_1DARRAY_PARAM(_39), false, _40, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_38));
		_RETAIN_DEALLOC(_39, "false-false-false" , "resize");
		_ADD_DEALLOC(_38);
	}
	//assign %1 = %38  : byte[]
	_DEALLOC(output);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(output, _38);
	_TRANSFER_DEALLOC(output, _38);
	//return %1
	_DEALLOC(data);
	_DEALLOC_STRUCT(list, MyArrayList);
	_DEALLOC(items);
	_DEALLOC(_13);
	_DEALLOC_STRUCT(_15, MyArrayList);
	_DEALLOC_STRUCT(_27, MyArrayList);
	_DEALLOC(_33);
	_DEALLOC_STRUCT(_35, MyArrayList);
	_DEALLOC(_38);
	_DEALLOC(_39);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

int main(int argc, char** args){
	FILE* file;
	_DECL_1DARRAY_BYTE(input_data);
	_DECL_DEALLOC(input_data);
	_DECL_1DARRAY_BYTE(decompress_data);
	_DECL_DEALLOC(decompress_data);
	void* _4;
	_DECL_DEALLOC(_4);
	_DECL_2DARRAY(_5);
	_DECL_DEALLOC(_5);
	int64_t _6 = 0;
	_DECL_1DARRAY(_7);
	_DECL_DEALLOC(_7);
	_DECL_1DARRAY_BYTE(_8);
	_DECL_DEALLOC(_8);
	_DECL_1DARRAY_BYTE(_10);
	_DECL_DEALLOC(_10);
	void* _11;
	_DECL_1DARRAY(_13);
	_DECL_DEALLOC(_13);
	void* _14;
	_DECL_1DARRAY(_16);
	_DECL_DEALLOC(_16);
	void* _17;
	int64_t _19 = 0;
	void* _20;
	_DECL_1DARRAY(_22);
	_DECL_DEALLOC(_22);
	//fieldload %5 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY_int64_t(_5);
	_CONV_ARGS(_5);
	_ADD_DEALLOC(_5);
	//const %6 = 0 : int
	_6 = 0;
	//indexof %7 = %5, %6 : int[][]
	_7=_5[_6];
	_7_size = _5_size_size;
	_REMOVE_DEALLOC(_7);
	//invoke (%4) = (%7) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_4 = Reader(_7, _7_size);
	}
	//assign %1 = %4  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	// isCopyEliminated = true
	file = _4;
	//fieldload %9 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%8) = %9 () : method()->(byte[])
	{
		_8 = readAll(file, &_8_size);
		_ADD_DEALLOC(_8);
	}
	//assign %2 = %8  : byte[]
	_DEALLOC(input_data);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(input_data, _8);
	_TRANSFER_DEALLOC(input_data, _8);
	//invoke (%10) = (%2) LZ77_optimised_decompress:decompress : function(byte[])->(byte[])
	{
		_DEALLOC(_10);
		// isCopyEliminated of '_2' = true
		_10 = _decompress_(_1DARRAY_PARAM(input_data), false, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_10));
		_RETAIN_DEALLOC(input_data, "false-false-false" , "decompress");
		_ADD_DEALLOC(_10);
	}
	//assign %3 = %10  : byte[]
	_DEALLOC(decompress_data);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(decompress_data, _10);
	_TRANSFER_DEALLOC(decompress_data, _10);
	//fieldload %11 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %12 = %11 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %13 = [68,69,67,79,77,80,82,69,83,83,69,68,58,32,32,32] : int[]
	_DEALLOC(_13);
	_NEW_1DARRAY_int64_t(_13, 16, 0);
	_13[0] = 68; _13[1] = 69; _13[2] = 67; _13[3] = 79; _13[4] = 77; _13[5] = 80; _13[6] = 82; _13[7] = 69; _13[8] = 83; _13[9] = 83; _13[10] = 69; _13[11] = 68; _13[12] = 58; _13[13] = 32; _13[14] = 32; _13[15] = 32; 
	_ADD_DEALLOC(_13);
	//indirectinvoke () = %12 (%13) : method(int[])->()
	{
		println_s(_13, _13_size);
	}
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//invoke (%16) = (%3) whiley/lang/ASCII:fromBytes : function(byte[])->(whiley/lang/ASCII:string)
	{
		_DEALLOC(_16);
		_16 = fromBytes(decompress_data, decompress_data_size);
		_16_size = decompress_data_size;
		_ADD_DEALLOC(_16);
	}
	//indirectinvoke () = %15 (%16) : method(int[])->()
	{
		println_s(_16, _16_size);
	}
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//lengthof %19 = %3 : byte[]
	_19 = decompress_data_size;
	//indirectinvoke () = %18 (%19) : method(any)->()
	{
		printf("%"PRId64, _19);
	}
	//fieldload %20 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %21 = %20 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %22 = [32,98,121,116,101,115] : int[]
	_DEALLOC(_22);
	_NEW_1DARRAY_int64_t(_22, 6, 0);
	_22[0] = 32; _22[1] = 98; _22[2] = 121; _22[3] = 116; _22[4] = 101; _22[5] = 115; 
	_ADD_DEALLOC(_22);
	//indirectinvoke () = %21 (%22) : method(int[])->()
	{
		println_s(_22, _22_size);
	}
	//return
	if(file != NULL){fclose(file); file = NULL;}
	_DEALLOC(input_data);
	_DEALLOC(decompress_data);
	_DEALLOC_2DARRAY_int64_t(_5);
	_DEALLOC(_7);
	_DEALLOC(_8);
	_DEALLOC(_10);
	_DEALLOC(_13);
	_DEALLOC(_16);
	_DEALLOC(_22);
	exit(0);
}

