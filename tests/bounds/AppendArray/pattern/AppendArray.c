#include "AppendArray.h"
int64_t* append(_DECL_1DARRAY_PARAM(items), int64_t item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(nitems);
	int64_t i = 0;
	int64_t _4 = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	_DECL_1DARRAY(_8);
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	//const %4 = 0 : int
	_4 = 0;
	//lengthof %5 = %0 : int[]
	_5 = items_size;
	//const %6 = 1 : int
	_6 = 1;
	//add %7 = %5, %6 : int
	_7=_5+_6;
	//arraygen %8 = [4; 7] : int[]
	_NEW_1DARRAY_int64_t(_8, _7, _4);
	//assign %2 = %8  : int[]
	_COPY_1DARRAY_int64_t(nitems, _8);
	//const %9 = 0 : int
	_9 = 0;
	//assign %3 = %9  : int
	i = _9;
	//loop (%2, %3, %10, %11, %12, %13)
	while(true){
		//lengthof %10 = %0 : int[]
		_10 = items_size;
		//ifge %3, %10 goto blklab0 : int
		if(i>=_10){goto blklab0;}
		//indexof %11 = %0, %3 : int[]
		_11=items[i];
		//update %2[%3] = %11 : int[] -> int[]
		nitems[i] = _11;
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %3, %12 : int
		_13=i+_12;
		//assign %3 = %13  : int
		i = _13;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//update %2[%3] = %1 : int[] -> int[]
	nitems[i] = item;
	//return %2
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(nitems);
	return nitems;
	//return
}

int64_t* appendArray(_DECL_1DARRAY_PARAM(data), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(output);
	int64_t pos = 0;
	int64_t _3 = 0;
	int64_t _4 = 0;
	int64_t _5 = 0;
	_DECL_1DARRAY(_6);
	int64_t _7 = 0;
	_DECL_1DARRAY(_8);
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	_DECL_1DARRAY(_12);
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	int64_t _16 = 0;
	int64_t _17 = 0;
	//const %3 = 0 : int
	_3 = 0;
	//assign %2 = %3  : int
	pos = _3;
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 0 : int
	_5 = 0;
	//arraygen %6 = [4; 5] : int[]
	_NEW_1DARRAY_int64_t(_6, _5, _4);
	//assign %1 = %6  : int[]
	_COPY_1DARRAY_int64_t(output, _6);
	//loop (%1, %2, %7, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17)
	while(true){
		//lengthof %7 = %0 : int[]
		_7 = data_size;
		//ifge %2, %7 goto blklab2 : int
		if(pos>=_7){goto blklab2;}
		//indexof %9 = %0, %2 : int[]
		_9=data[pos];
		//const %10 = 10 : int
		_10 = 10;
		//add %11 = %9, %10 : int
		_11=_9+_10;
		//invoke (%8) = (%1, %11) AppendArray:append : function(int[],int)->(int[])
		{
			void* output_tmp;
			_8 = append(_COPY_1DARRAY_PARAM_int64_t(output), _11, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_8));
		}
		//assign %1 = %8  : int[]
		_COPY_1DARRAY_int64_t(output, _8);
		//indexof %13 = %0, %2 : int[]
		_13=data[pos];
		//const %14 = 10 : int
		_14 = 10;
		//add %15 = %13, %14 : int
		_15=_13+_14;
		//invoke (%12) = (%1, %15) AppendArray:append : function(int[],int)->(int[])
		{
			void* output_tmp;
			_12 = append(_COPY_1DARRAY_PARAM_int64_t(output), _15, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_12));
		}
		//assign %1 = %12  : int[]
		_COPY_1DARRAY_int64_t(output, _12);
		//const %16 = 1 : int
		_16 = 1;
		//add %17 = %2, %16 : int
		_17=pos+_16;
		//assign %2 = %17  : int
		pos = _17;
//.blklab3
blklab3:;
	}
//.blklab2
blklab2:;
	//return %1
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output);
	return output;
	//return
}

int64_t* fastAppendArray(_DECL_1DARRAY_PARAM(data), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(output);
	int64_t pos = 0;
	int64_t size = 0;
	_DECL_1DARRAY(output_1);
	int64_t size_1 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	_DECL_1DARRAY(_11);
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	int64_t _16 = 0;
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	int64_t _20 = 0;
	int64_t _21 = 0;
	int64_t _22 = 0;
	int64_t _23 = 0;
	int64_t _24 = 0;
	int64_t _25 = 0;
	int64_t _26 = 0;
	_DECL_1DARRAY(_27);
	int64_t _28 = 0;
	int64_t _29 = 0;
	int64_t _30 = 0;
	int64_t _31 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//assign %2 = %6  : int
	pos = _6;
	//const %7 = 0 : int
	_7 = 0;
	//const %8 = 2 : int
	_8 = 2;
	//lengthof %9 = %0 : int[]
	_9 = data_size;
	//mul %10 = %8, %9 : int
	_10=_8*_9;
	//arraygen %11 = [7; 10] : int[]
	_NEW_1DARRAY_int64_t(_11, _10, _7);
	//assign %1 = %11  : int[]
	_COPY_1DARRAY_int64_t(output, _11);
	//const %12 = 0 : int
	_12 = 0;
	//assign %3 = %12  : int
	size = _12;
	//loop (%1, %2, %3, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25)
	while(true){
		//lengthof %13 = %0 : int[]
		_13 = data_size;
		//ifge %2, %13 goto blklab4 : int
		if(pos>=_13){goto blklab4;}
		//indexof %14 = %0, %2 : int[]
		_14=data[pos];
		//const %15 = 10 : int
		_15 = 10;
		//add %16 = %14, %15 : int
		_16=_14+_15;
		//update %1[%3] = %16 : int[] -> int[]
		output[size] = _16;
		//const %17 = 1 : int
		_17 = 1;
		//add %18 = %3, %17 : int
		_18=size+_17;
		//assign %3 = %18  : int
		size = _18;
		//indexof %19 = %0, %2 : int[]
		_19=data[pos];
		//const %20 = 10 : int
		_20 = 10;
		//add %21 = %19, %20 : int
		_21=_19+_20;
		//update %1[%3] = %21 : int[] -> int[]
		output[size] = _21;
		//const %22 = 1 : int
		_22 = 1;
		//add %23 = %3, %22 : int
		_23=size+_22;
		//assign %3 = %23  : int
		size = _23;
		//const %24 = 1 : int
		_24 = 1;
		//add %25 = %2, %24 : int
		_25=pos+_24;
		//assign %2 = %25  : int
		pos = _25;
//.blklab5
blklab5:;
	}
//.blklab4
blklab4:;
	//const %26 = 0 : int
	_26 = 0;
	//arraygen %27 = [26; 3] : int[]
	_NEW_1DARRAY_int64_t(_27, size, _26);
	//assign %4 = %27  : int[]
	_COPY_1DARRAY_int64_t(output_1, _27);
	//const %28 = 0 : int
	_28 = 0;
	//assign %5 = %28  : int
	size_1 = _28;
	//loop (%4, %5, %29, %30, %31)
	while(true){
		//ifge %5, %3 goto blklab6 : int
		if(size_1>=size){goto blklab6;}
		//indexof %29 = %1, %5 : int[]
		_29=output[size_1];
		//update %4[%5] = %29 : int[] -> int[]
		output_1[size_1] = _29;
		//const %30 = 1 : int
		_30 = 1;
		//add %31 = %5, %30 : int
		_31=size_1+_30;
		//assign %5 = %31  : int
		size_1 = _31;
//.blklab7
blklab7:;
	}
//.blklab6
blklab6:;
	//return %4
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(output_1);
	return output_1;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(data);
	_DECL_1DARRAY(arr);
	_DECL_1DARRAY(arr1);
	int64_t _4 = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	_DECL_1DARRAY(_9);
	_DECL_1DARRAY(_10);
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	int64_t _16 = 0;
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	int64_t _20 = 0;
	_DECL_1DARRAY(_21);
	void* _22;
	_DECL_1DARRAY(_24);
	int64_t _25 = 0;
	int64_t _26 = 0;
	int64_t _27 = 0;
	int64_t _28 = 0;
	int64_t _29 = 0;
	int64_t _30 = 0;
	int64_t _31 = 0;
	int64_t _32 = 0;
	int64_t _33 = 0;
	int64_t _34 = 0;
	_DECL_1DARRAY(_35);
	void* _36;
	//const %4 = 1 : int
	_4 = 1;
	//const %5 = 2 : int
	_5 = 2;
	//const %6 = 3 : int
	_6 = 3;
	//const %7 = 4 : int
	_7 = 4;
	//const %8 = 5 : int
	_8 = 5;
	//newlist %9 = (%4, %5, %6, %7, %8) : int[]
	_NEW_1DARRAY_int64_t(_9, 5, 0);
	_9[0] = _4; _9[1] = _5; _9[2] = _6; _9[3] = _7; _9[4] = _8; 
	//assign %1 = %9  : int[]
	_COPY_1DARRAY_int64_t(data, _9);
	//invoke (%10) = (%1) AppendArray:appendArray : function(int[])->(int[])
	{
		void* data_tmp;
		_10 = appendArray(_COPY_1DARRAY_PARAM_int64_t(data), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_10));
	}
	//assign %2 = %10  : int[]
	_COPY_1DARRAY_int64_t(arr, _10);
	//assert
	{
		//const %11 = 11 : int
		_11 = 11;
		//const %12 = 11 : int
		_12 = 11;
		//const %13 = 12 : int
		_13 = 12;
		//const %14 = 12 : int
		_14 = 12;
		//const %15 = 13 : int
		_15 = 13;
		//const %16 = 13 : int
		_16 = 13;
		//const %17 = 14 : int
		_17 = 14;
		//const %18 = 14 : int
		_18 = 14;
		//const %19 = 15 : int
		_19 = 15;
		//const %20 = 15 : int
		_20 = 15;
		//newlist %21 = (%11, %12, %13, %14, %15, %16, %17, %18, %19, %20) : int[]
		_NEW_1DARRAY_int64_t(_21, 10, 0);
		_21[0] = _11; _21[1] = _12; _21[2] = _13; _21[3] = _14; _21[4] = _15; _21[5] = _16; _21[6] = _17; _21[7] = _18; _21[8] = _19; _21[9] = _20; 
		//ifeq %2, %21 goto blklab8 : int[]
		_IFEQ_ARRAY(arr, _21, blklab8);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab8
blklab8:;
	//assert
	}
	//fieldload %22 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %23 = %22 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %23 (%2) : method(any)->()
	{
		_PRINT_1DARRAY_int64_t(arr);
	}
	//invoke (%24) = (%1) AppendArray:fastAppendArray : function(int[])->(int[])
	{
		void* data_tmp;
		_24 = fastAppendArray(_COPY_1DARRAY_PARAM_int64_t(data), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_24));
	}
	//assign %3 = %24  : int[]
	_COPY_1DARRAY_int64_t(arr1, _24);
	//assert
	{
		//const %25 = 11 : int
		_25 = 11;
		//const %26 = 11 : int
		_26 = 11;
		//const %27 = 12 : int
		_27 = 12;
		//const %28 = 12 : int
		_28 = 12;
		//const %29 = 13 : int
		_29 = 13;
		//const %30 = 13 : int
		_30 = 13;
		//const %31 = 14 : int
		_31 = 14;
		//const %32 = 14 : int
		_32 = 14;
		//const %33 = 15 : int
		_33 = 15;
		//const %34 = 15 : int
		_34 = 15;
		//newlist %35 = (%25, %26, %27, %28, %29, %30, %31, %32, %33, %34) : int[]
		_NEW_1DARRAY_int64_t(_35, 10, 0);
		_35[0] = _25; _35[1] = _26; _35[2] = _27; _35[3] = _28; _35[4] = _29; _35[5] = _30; _35[6] = _31; _35[7] = _32; _35[8] = _33; _35[9] = _34; 
		//ifeq %3, %35 goto blklab9 : int[]
		_IFEQ_ARRAY(arr1, _35, blklab9);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab9
blklab9:;
	//assert
	}
	//fieldload %36 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %37 = %36 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %37 (%3) : method(any)->()
	{
		_PRINT_1DARRAY_int64_t(arr1);
	}
	//return
	exit(0);
}

