#include "SobelEdge_test.h"
int64_t _wrap_(int64_t pos, int64_t size){
	int64_t _2;
	int64_t _3;
	int64_t _4;
	int64_t _5;
	int64_t _6;
	int64_t _7;
	int64_t _8;
	int64_t _9;
	int64_t _10;
	//iflt %0, %1 goto blklab0 : int
	if(pos<size){goto blklab0;}
	//const %3 = 1 : int
	_3 = 1;
	//sub %4 = %1, %3 : int
	_4=size-_3;
	//sub %5 = %0, %1 : int
	_5=pos-size;
	//sub %6 = %4, %5 : int
	_6=_4-_5;
	//return %6
	return _6;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//const %7 = 0 : int
	_7 = 0;
	//ifge %0, %7 goto blklab2 : int
	if(pos>=_7){goto blklab2;}
	//const %8 = 1 : int
	_8 = 1;
	//neg %9 = %8 : int
	_9= -_8;
	//sub %10 = %9, %0 : int
	_10=_9-pos;
	//return %10
	return _10;
	//goto blklab3
	goto blklab3;
//.blklab2
blklab2:;
	//return %0
	return pos;
//.blklab3
blklab3:;
//.blklab1
blklab1:;
	//return
}

int64_t _convolution_(BYTE* pixels, size_t pixels_size, _DECL_DEALLOC_PARAM(pixels), int64_t width, int64_t height, int64_t xCenter, int64_t yCenter, _DECL_1DARRAY_PARAM(kernel), _DECL_DEALLOC_PARAM(kernel)){
	int64_t _6;
	int64_t sum;
	int64_t kernelSize;
	int64_t kernelHalf;
	int64_t j;
	int64_t y;
	int64_t i;
	int64_t x;
	int64_t pixel;
	int64_t kernelVal;
	int64_t _16;
	int64_t _17;
	int64_t _18;
	int64_t _19;
	int64_t _20;
	int64_t _21;
	int64_t _22;
	int64_t _23;
	int64_t _24;
	int64_t _25;
	int64_t _26;
	int64_t _27;
	int64_t _28;
	int64_t _29;
	int64_t _30;
	int64_t _31;
	BYTE _32;
	int64_t _33;
	int64_t _34;
	int64_t _35;
	int64_t _36;
	int64_t _37;
	int64_t _38;
	int64_t _39;
	int64_t _40;
	int64_t _41;
	//const %16 = 0 : int
	_16 = 0;
	//assign %7 = %16  : int
	// isCopyEliminated = true
	sum = _16;
	//const %17 = 3 : int
	_17 = 3;
	//assign %8 = %17  : int
	// isCopyEliminated = true
	kernelSize = _17;
	//const %18 = 1 : int
	_18 = 1;
	//assign %9 = %18  : int
	// isCopyEliminated = true
	kernelHalf = _18;
	//const %19 = 0 : int
	_19 = 0;
	//assign %10 = %19  : int
	// isCopyEliminated = true
	j = _19;
	//loop (%7, %10, %11, %12, %13, %14, %15, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41)
	while(true){
		//ifge %10, %8 goto blklab4 : int
		if(j>=kernelSize){goto blklab4;}
		//add %21 = %4, %10 : int
		_21=yCenter+j;
		//sub %22 = %21, %9 : int
		_22=_21-kernelHalf;
		//rem %23 = %22, %2 : int
		_23=_22%height;
		//invoke (%20) = (%23) whiley/lang/Math:abs : function(int)->(int)
		{
			_20 = llabs(_23);
		}
		//assign %11 = %20  : int
		// isCopyEliminated = true
		y = _20;
		//const %24 = 0 : int
		_24 = 0;
		//assign %12 = %24  : int
		// isCopyEliminated = true
		i = _24;
		//loop (%7, %12, %13, %14, %15, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39)
		while(true){
			//ifge %12, %8 goto blklab6 : int
			if(i>=kernelSize){goto blklab6;}
			//add %26 = %3, %12 : int
			_26=xCenter+i;
			//sub %27 = %26, %9 : int
			_27=_26-kernelHalf;
			//rem %28 = %27, %1 : int
			_28=_27%width;
			//invoke (%25) = (%28) whiley/lang/Math:abs : function(int)->(int)
			{
				_25 = llabs(_28);
			}
			//assign %13 = %25  : int
			// isCopyEliminated = true
			x = _25;
			//mul %30 = %11, %1 : int
			_30=y*width;
			//add %31 = %30, %13 : int
			_31=_30+x;
			//indexof %32 = %0, %31 : byte[]
			_32=pixels[_31];
			//invoke (%29) = (%32) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
			{
				_29 = (unsigned int)_32;
			}
			//assign %14 = %29  : int
			// isCopyEliminated = true
			pixel = _29;
			//mul %33 = %10, %8 : int
			_33=j*kernelSize;
			//add %34 = %33, %12 : int
			_34=_33+i;
			//indexof %35 = %5, %34 : int[]
			_35=kernel[_34];
			//assign %15 = %35  : int
			// isCopyEliminated = true
			kernelVal = _35;
			//mul %36 = %14, %15 : int
			_36=pixel*kernelVal;
			//add %37 = %7, %36 : int
			_37=sum+_36;
			//assign %7 = %37  : int
			// isCopyEliminated = true
			sum = _37;
			//const %38 = 1 : int
			_38 = 1;
			//add %39 = %12, %38 : int
			_39=i+_38;
			//assign %12 = %39  : int
			// isCopyEliminated = true
			i = _39;
//.blklab7
blklab7:;
		}
//.blklab6
blklab6:;
		//const %40 = 1 : int
		_40 = 1;
		//add %41 = %10, %40 : int
		_41=j+_40;
		//assign %10 = %41  : int
		// isCopyEliminated = true
		j = _41;
//.blklab5
blklab5:;
	}
//.blklab4
blklab4:;
	//return %7
	_DEALLOC(pixels);
	_DEALLOC(kernel);
	return sum;
	//return
}

BYTE* _sobelEdgeDetection_(BYTE* pixels, size_t pixels_size, _DECL_DEALLOC_PARAM(pixels), int64_t width, int64_t height, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(_3);
	_DECL_DEALLOC(_3);
	int64_t size;
	_DECL_1DARRAY_BYTE(newPixels);
	_DECL_DEALLOC(newPixels);
	_DECL_1DARRAY(v_sobel);
	_DECL_DEALLOC(v_sobel);
	_DECL_1DARRAY(h_sobel);
	_DECL_DEALLOC(h_sobel);
	int64_t y;
	int64_t x;
	int64_t pos;
	int64_t _11;
	BYTE _12;
	_DECL_1DARRAY_BYTE(_13);
	_DECL_DEALLOC(_13);
	int64_t _14;
	int64_t _15;
	int64_t _16;
	int64_t _17;
	int64_t _18;
	int64_t _19;
	int64_t _20;
	int64_t _21;
	int64_t _22;
	int64_t _23;
	int64_t _24;
	int64_t _25;
	_DECL_1DARRAY(_26);
	_DECL_DEALLOC(_26);
	int64_t _27;
	int64_t _28;
	int64_t _29;
	int64_t _30;
	int64_t _31;
	int64_t _32;
	int64_t _33;
	int64_t _34;
	int64_t _35;
	int64_t _36;
	int64_t _37;
	int64_t _38;
	_DECL_1DARRAY(_39);
	_DECL_DEALLOC(_39);
	int64_t _40;
	int64_t _41;
	int64_t _42;
	int64_t _43;
	BYTE _44;
	int64_t _45;
	int64_t _46;
	int64_t _47;
	int64_t _48;
	//mul %11 = %1, %2 : int
	_11=width*height;
	//assign %4 = %11  : int
	// isCopyEliminated = true
	size = _11;
	//const %12 = 00100000b : byte
	_12 = 0b00100000;
	//arraygen %13 = [12; 4] : byte[]
	_DEALLOC(_13);
	_NEW_1DARRAY_BYTE(_13, size, _12);
	_ADD_DEALLOC(_13);
	//assign %5 = %13  : byte[]
	_DEALLOC(newPixels);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(newPixels, _13);
	_TRANSFER_DEALLOC(newPixels, _13);
	//const %14 = 1 : int
	_14 = 1;
	//neg %15 = %14 : int
	_15= -_14;
	//const %16 = 0 : int
	_16 = 0;
	//const %17 = 1 : int
	_17 = 1;
	//const %18 = 2 : int
	_18 = 2;
	//neg %19 = %18 : int
	_19= -_18;
	//const %20 = 0 : int
	_20 = 0;
	//const %21 = 2 : int
	_21 = 2;
	//const %22 = 1 : int
	_22 = 1;
	//neg %23 = %22 : int
	_23= -_22;
	//const %24 = 0 : int
	_24 = 0;
	//const %25 = 1 : int
	_25 = 1;
	//newlist %26 = (%15, %16, %17, %19, %20, %21, %23, %24, %25) : int[]
	_DEALLOC(_26);
	_NEW_1DARRAY_int64_t(_26, 9, 0);
	_26[0] = _15; _26[1] = _16; _26[2] = _17; _26[3] = _19; _26[4] = _20; _26[5] = _21; _26[6] = _23; _26[7] = _24; _26[8] = _25; 
	_ADD_DEALLOC(_26);
	//assign %6 = %26  : int[]
	_DEALLOC(v_sobel);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(v_sobel, _26);
	_TRANSFER_DEALLOC(v_sobel, _26);
	//const %27 = 1 : int
	_27 = 1;
	//const %28 = 2 : int
	_28 = 2;
	//const %29 = 1 : int
	_29 = 1;
	//const %30 = 0 : int
	_30 = 0;
	//const %31 = 0 : int
	_31 = 0;
	//const %32 = 0 : int
	_32 = 0;
	//const %33 = 1 : int
	_33 = 1;
	//neg %34 = %33 : int
	_34= -_33;
	//const %35 = 2 : int
	_35 = 2;
	//neg %36 = %35 : int
	_36= -_35;
	//const %37 = 1 : int
	_37 = 1;
	//neg %38 = %37 : int
	_38= -_37;
	//newlist %39 = (%27, %28, %29, %30, %31, %32, %34, %36, %38) : int[]
	_DEALLOC(_39);
	_NEW_1DARRAY_int64_t(_39, 9, 0);
	_39[0] = _27; _39[1] = _28; _39[2] = _29; _39[3] = _30; _39[4] = _31; _39[5] = _32; _39[6] = _34; _39[7] = _36; _39[8] = _38; 
	_ADD_DEALLOC(_39);
	//assign %7 = %39  : int[]
	_DEALLOC(h_sobel);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(h_sobel, _39);
	_TRANSFER_DEALLOC(h_sobel, _39);
	//const %40 = 0 : int
	_40 = 0;
	//assign %8 = %40  : int
	// isCopyEliminated = true
	y = _40;
	//loop (%5, %8, %9, %10, %41, %42, %43, %44, %45, %46, %47, %48)
	while(true){
		//ifge %8, %2 goto blklab8 : int
		if(y>=height){goto blklab8;}
		//const %41 = 0 : int
		_41 = 0;
		//assign %9 = %41  : int
		// isCopyEliminated = true
		x = _41;
		//loop (%5, %9, %10, %42, %43, %44, %45, %46)
		while(true){
			//ifge %9, %1 goto blklab10 : int
			if(x>=width){goto blklab10;}
			//mul %42 = %8, %1 : int
			_42=y*width;
			//add %43 = %42, %9 : int
			_43=_42+x;
			//assign %10 = %43  : int
			// isCopyEliminated = true
			pos = _43;
			//const %44 = 01100010b : byte
			_44 = 0b01100010;
			//update %5[%10] = %44 : byte[] -> byte[]
			newPixels[pos] = _44;
			//const %45 = 1 : int
			_45 = 1;
			//add %46 = %9, %45 : int
			_46=x+_45;
			//assign %9 = %46  : int
			// isCopyEliminated = true
			x = _46;
//.blklab11
blklab11:;
		}
//.blklab10
blklab10:;
		//const %47 = 1 : int
		_47 = 1;
		//add %48 = %8, %47 : int
		_48=y+_47;
		//assign %8 = %48  : int
		// isCopyEliminated = true
		y = _48;
//.blklab9
blklab9:;
	}
//.blklab8
blklab8:;
	//return %5
	_DEALLOC(pixels);
	_DEALLOC(_3);
	_DEALLOC(v_sobel);
	_DEALLOC(h_sobel);
	_DEALLOC(_13);
	_DEALLOC(_26);
	_DEALLOC(_39);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(newPixels);
	return newPixels;
	//return
}

void _print_pbm_(FILE* sys, int64_t width, int64_t height, BYTE* pixels, size_t pixels_size, _DECL_DEALLOC_PARAM(pixels)){
	int64_t j;
	int64_t i;
	int64_t pos;
	void* _7;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	void* _10;
	void* _12;
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	void* _15;
	int64_t _17;
	int64_t _18;
	int64_t _19;
	int64_t _20;
	BYTE _21;
	BYTE _22;
	void* _23;
	int64_t _25;
	void* _26;
	int64_t _28;
	int64_t _29;
	int64_t _30;
	void* _31;
	void* _33;
	size_t _33_size = 0;
	_DECL_DEALLOC(_33);
	int64_t _34;
	int64_t _35;
	//fieldload %7 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %8 = %7 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %9 = [80,49] : int[]
	_DEALLOC(_9);
	_NEW_1DARRAY_int64_t(_9, 2, 0);
	_9[0] = 80; _9[1] = 49; 
	_ADD_DEALLOC(_9);
	//indirectinvoke () = %8 (%9) : method(int[])->()
	{
		println_s(_9, _9_size);
	}
	//fieldload %10 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %11 = %10 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %11 (%1) : method(any)->()
	{
		printf("%"PRId64, width);
	}
	//fieldload %12 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %13 = %12 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %14 = [32] : int[]
	_DEALLOC(_14);
	_NEW_1DARRAY_int64_t(_14, 1, 0);
	_14[0] = 32; 
	_ADD_DEALLOC(_14);
	//indirectinvoke () = %13 (%14) : method(int[])->()
	{
		printf_s(_14, _14_size);
	}
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %16 (%2) : method(any)->()
	{
		printf("%"PRId64"\n", height);
	}
	//const %17 = 0 : int
	_17 = 0;
	//assign %4 = %17  : int
	// isCopyEliminated = true
	j = _17;
	//loop (%4, %5, %6, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35)
	while(true){
		//ifge %4, %2 goto blklab12 : int
		if(j>=height){goto blklab12;}
		//const %18 = 0 : int
		_18 = 0;
		//assign %5 = %18  : int
		// isCopyEliminated = true
		i = _18;
		//loop (%5, %6, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30)
		while(true){
			//ifge %5, %1 goto blklab14 : int
			if(i>=width){goto blklab14;}
			//mul %19 = %4, %1 : int
			_19=j*width;
			//add %20 = %19, %5 : int
			_20=_19+i;
			//assign %6 = %20  : int
			// isCopyEliminated = true
			pos = _20;
			//indexof %21 = %3, %6 : byte[]
			_21=pixels[pos];
			//const %22 = 00100000b : byte
			_22 = 0b00100000;
			//ifne %21, %22 goto blklab16 : byte
			if(_21!=_22){goto blklab16;}
			//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %24 = %23 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %25 = 0 : int
			_25 = 0;
			//indirectinvoke () = %24 (%25) : method(any)->()
			{
				printf("%"PRId64, _25);
			}
			//goto blklab17
			goto blklab17;
//.blklab16
blklab16:;
			//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %27 = %26 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %28 = 1 : int
			_28 = 1;
			//indirectinvoke () = %27 (%28) : method(any)->()
			{
				printf("%"PRId64, _28);
			}
//.blklab17
blklab17:;
			//const %29 = 1 : int
			_29 = 1;
			//add %30 = %5, %29 : int
			_30=i+_29;
			//assign %5 = %30  : int
			// isCopyEliminated = true
			i = _30;
//.blklab15
blklab15:;
		}
//.blklab14
blklab14:;
		//fieldload %31 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %32 = %31 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %33 = [] : void[]
		_DEALLOC(_33);
		_NEW_1DARRAY_int64_t(_33, 0, 0);
		_ADD_DEALLOC(_33);
		//indirectinvoke () = %32 (%33) : method(int[])->()
		{
			println_s(_33, _33_size);
		}
		//const %34 = 1 : int
		_34 = 1;
		//add %35 = %4, %34 : int
		_35=j+_34;
		//assign %4 = %35  : int
		// isCopyEliminated = true
		j = _35;
//.blklab13
blklab13:;
	}
//.blklab12
blklab12:;
	//return
	_DEALLOC(pixels);
	_DEALLOC(_9);
	_DEALLOC(_14);
	_DEALLOC(_33);
	return;
}

int main(int argc, char** args){
	int64_t* input;
	_DECL_DEALLOC(input);
	int64_t n;
	int64_t m;
	int64_t size;
	_DECL_1DARRAY_BYTE(a);
	_DECL_DEALLOC(a);
	int64_t x;
	int64_t p;
	int64_t y;
	int64_t* _9;
	_DECL_DEALLOC(_9);
	_DECL_2DARRAY(_10);
	_DECL_DEALLOC(_10);
	int64_t _11;
	_DECL_1DARRAY(_12);
	_DECL_DEALLOC(_12);
	int64_t _13;
	int64_t _14;
	BYTE _15;
	_DECL_1DARRAY_BYTE(_16);
	_DECL_DEALLOC(_16);
	int64_t _17;
	int64_t _18;
	BYTE _19;
	int64_t _20;
	int64_t _21;
	int64_t _22;
	int64_t _23;
	int64_t _24;
	int64_t _25;
	void* _26;
	_DECL_1DARRAY(_28);
	_DECL_DEALLOC(_28);
	//fieldload %10 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY_int64_t(_10);
	_CONV_ARGS(_10);
	_ADD_DEALLOC(_10);
	//const %11 = 0 : int
	_11 = 0;
	//indexof %12 = %10, %11 : int[][]
	_12=_10[_11];
	_12_size = _10_size_size;
	_REMOVE_DEALLOC(_12);
	//invoke (%9) = (%12) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_9, _12);
		_ADD_DEALLOC(_9);
		_REMOVE_DEALLOC(_12);
	}
	//assign %1 = %9  : null|int
	_DEALLOC(input);
	// isCopyEliminated = true
	input = _9;
	_TRANSFER_DEALLOC(input, _9);
	//ifis %1, null goto blklab18 : null|int
	if(input == NULL) { goto blklab18;}
	//assign %2 = %1  : int
	// isCopyEliminated = true
	n = *input;
	//const %13 = 16384 : int
	_13 = 16384;
	//assign %3 = %13  : int
	// isCopyEliminated = true
	m = _13;
	//mul %14 = %2, %3 : int
	_14=n*m;
	//assign %4 = %14  : int
	// isCopyEliminated = true
	size = _14;
	//const %15 = 00100000b : byte
	_15 = 0b00100000;
	//arraygen %16 = [15; 4] : byte[]
	_DEALLOC(_16);
	_NEW_1DARRAY_BYTE(_16, size, _15);
	_ADD_DEALLOC(_16);
	//assign %5 = %16  : byte[]
	_DEALLOC(a);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(a, _16);
	_TRANSFER_DEALLOC(a, _16);
	//const %17 = 0 : int
	_17 = 0;
	//assign %6 = %17  : int
	// isCopyEliminated = true
	x = _17;
	//loop (%5, %6, %7, %8, %18, %19, %20, %21, %22, %23, %24, %25)
	while(true){
		//ifge %6, %2 goto blklab19 : int
		if(x>=n){goto blklab19;}
		//assign %7 = %6  : int
		// isCopyEliminated = false
		p = x;
		//const %18 = 0 : int
		_18 = 0;
		//assign %8 = %18  : int
		// isCopyEliminated = true
		y = _18;
		//loop (%5, %7, %8, %19, %20, %21, %22, %23)
		while(true){
			//ifge %8, %3 goto blklab21 : int
			if(y>=m){goto blklab21;}
			//const %20 = 7 : int
			_20 = 7;
			//invoke (%19) = (%20) whiley/lang/Int:toUnsignedByte : function(whiley/lang/Int:u8)->(byte)
			{
				_19 = (BYTE)_20;
			}
			//update %5[%7] = %19 : byte[] -> byte[]
			a[p] = _19;
			//add %21 = %7, %2 : int
			_21=p+n;
			//assign %7 = %21  : int
			// isCopyEliminated = true
			p = _21;
			//const %22 = 1 : int
			_22 = 1;
			//add %23 = %8, %22 : int
			_23=y+_22;
			//assign %8 = %23  : int
			// isCopyEliminated = true
			y = _23;
//.blklab22
blklab22:;
		}
//.blklab21
blklab21:;
		//const %24 = 1 : int
		_24 = 1;
		//add %25 = %6, %24 : int
		_25=x+_24;
		//assign %6 = %25  : int
		// isCopyEliminated = true
		x = _25;
//.blklab20
blklab20:;
	}
//.blklab19
blklab19:;
	//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %27 = %26 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %28 = [80,97,115,115,32,116,104,101,32,116,101,115,116] : int[]
	_DEALLOC(_28);
	_NEW_1DARRAY_int64_t(_28, 13, 0);
	_28[0] = 80; _28[1] = 97; _28[2] = 115; _28[3] = 115; _28[4] = 32; _28[5] = 116; _28[6] = 104; _28[7] = 101; _28[8] = 32; _28[9] = 116; _28[10] = 101; _28[11] = 115; _28[12] = 116; 
	_ADD_DEALLOC(_28);
	//indirectinvoke () = %27 (%28) : method(int[])->()
	{
		println_s(_28, _28_size);
	}
//.blklab18
blklab18:;
	//return
	_DEALLOC(input);
	_DEALLOC(a);
	_DEALLOC(_9);
	_FREE_ARGS(_10);
	_DEALLOC(_12);
	_DEALLOC(_16);
	_DEALLOC(_28);
	exit(0);
}

