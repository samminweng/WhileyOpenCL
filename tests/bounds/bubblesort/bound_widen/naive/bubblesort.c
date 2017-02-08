#include "bubblesort.h"
int64_t* _bubbleSort_(_DECL_1DARRAY_PARAM(items), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_1);
	uint16_t length = 0;
	int64_t last_swapped = 0;
	int64_t index = 0;
	int64_t tmp = 0;
	uint16_t _6 = 0;
	uint16_t _7 = 0;
	uint16_t _8 = 0;
	uint16_t _9 = 0;
	uint16_t _10 = 0;
	int16_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int16_t _15 = 0;
	int64_t _16 = 0;
	int64_t _17 = 0;
	int64_t _18 = 0;
	int16_t _19 = 0;
	int64_t _20 = 0;
	uint16_t _21 = 0;
	int64_t _22 = 0;
	//lengthof %6 = %0 : int[]
	_6 = items_size;
	//assign %2 = %6  : int
	length = _6;
	//const %7 = 0 : int
	_7 = 0;
	//assign %3 = %7  : int
	last_swapped = _7;
	//loop (%0, %2, %3, %4, %5, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22)
	while(true){
		//const %8 = 0 : int
		_8 = 0;
		//ifle %2, %8 goto blklab0 : int
		if(length<=_8){goto blklab0;}
		//const %9 = 0 : int
		_9 = 0;
		//assign %3 = %9  : int
		last_swapped = _9;
		//const %10 = 1 : int
		_10 = 1;
		//assign %4 = %10  : int
		index = _10;
		//loop (%0, %3, %4, %5, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22)
		while(true){
			//ifge %4, %2 goto blklab2 : int
			if(index>=length){goto blklab2;}
			//const %11 = 1 : int
			_11 = 1;
			//sub %12 = %4, %11 : int
			_DETECT_INT_SUB_OVERFLOW(index,_11,_12);
			_12=index-_11;
			//indexof %13 = %0, %12 : int[]
			_13=items[_12];
			//indexof %14 = %0, %4 : int[]
			_14=items[index];
			//ifle %13, %14 goto blklab4 : int
			if(_13<=_14){goto blklab4;}
			//const %15 = 1 : int
			_15 = 1;
			//sub %16 = %4, %15 : int
			_DETECT_INT_SUB_OVERFLOW(index,_15,_16);
			_16=index-_15;
			//indexof %17 = %0, %16 : int[]
			_17=items[_16];
			//assign %5 = %17  : int
			tmp = _17;
			//indexof %18 = %0, %4 : int[]
			_18=items[index];
			//const %19 = 1 : int
			_19 = 1;
			//sub %20 = %4, %19 : int
			_DETECT_INT_SUB_OVERFLOW(index,_19,_20);
			_20=index-_19;
			//update %0[%20] = %18 : int[] -> int[]
			items[_20] = _18;
			//update %0[%4] = %5 : int[] -> int[]
			items[index] = tmp;
			//assign %3 = %4  : int
			last_swapped = index;
//.blklab4
blklab4:;
			//const %21 = 1 : int
			_21 = 1;
			//add %22 = %4, %21 : int
			_DETECT_INT_ADD_OVERFLOW(index,_21,_22);
			_22=index+_21;
			//assign %4 = %22  : int
			index = _22;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//assign %2 = %3  : int
		length = last_swapped;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %0
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(items);
	return items;
	//return
}

int main(int argc, char** args){
	_DECL_1DARRAY(ys);
	uint16_t _2 = 0;
	uint16_t _3 = 0;
	uint16_t _4 = 0;
	uint16_t _5 = 0;
	uint16_t _6 = 0;
	_DECL_1DARRAY(_7);
	_DECL_1DARRAY(_8);
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	_DECL_1DARRAY(_14);
	void* _15;
	//const %2 = 3 : int
	_2 = 3;
	//const %3 = 4 : int
	_3 = 4;
	//const %4 = 7 : int
	_4 = 7;
	//const %5 = 1 : int
	_5 = 1;
	//const %6 = 2 : int
	_6 = 2;
	//newlist %7 = (%2, %3, %4, %5, %6) : int[]
	_NEW_1DARRAY_int64_t(_7, 5, 0);
	_7[0] = _2; _7[1] = _3; _7[2] = _4; _7[3] = _5; _7[4] = _6; 
	//assign %1 = %7  : int[]
	_COPY_1DARRAY_int64_t(ys, _7);
	//invoke (%8) = (%1) bubblesort:bubbleSort : function(int[])->(int[])
	{
		void* ys_tmp;
		_8 = _bubbleSort_(_COPY_1DARRAY_PARAM_int64_t(ys), _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_8));
	}
	//assign %1 = %8  : int[]
	_COPY_1DARRAY_int64_t(ys, _8);
	//assert
	{
		//const %9 = 1 : int
		_9 = 1;
		//const %10 = 2 : int
		_10 = 2;
		//const %11 = 3 : int
		_11 = 3;
		//const %12 = 4 : int
		_12 = 4;
		//const %13 = 7 : int
		_13 = 7;
		//newlist %14 = (%9, %10, %11, %12, %13) : int[]
		_NEW_1DARRAY_int64_t(_14, 5, 0);
		_14[0] = _9; _14[1] = _10; _14[2] = _11; _14[3] = _12; _14[4] = _13; 
		//ifeq %1, %14 goto blklab5 : int[]
		_IFEQ_ARRAY_int64_t(ys, _14, blklab5);
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab5
blklab5:;
	//assert
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %16 (%1) : method(any)->()
	{
		_PRINT_1DARRAY_int64_t(ys);
	}
	//return
	exit(0);
}

