#include "SobelEdge_small.h"
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
			_20 = abs(_23);
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
				_25 = abs(_28);
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
			//invoke (%29) = (%32) whiley/lang/Byte:toInt : function(byte)->(int)
			{
				_29 = (int)_32;
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
	int64_t x;
	int64_t y;
	int64_t pos;
	int64_t v_g;
	int64_t h_g;
	int64_t t_g;
	int64_t _14;
	BYTE _15;
	_DECL_1DARRAY_BYTE(_16);
	_DECL_DEALLOC(_16);
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
	_DECL_1DARRAY(_29);
	_DECL_DEALLOC(_29);
	int64_t _30;
	int64_t _31;
	int64_t _32;
	int64_t _33;
	int64_t _34;
	int64_t _35;
	int64_t _36;
	int64_t _37;
	int64_t _38;
	int64_t _39;
	int64_t _40;
	int64_t _41;
	_DECL_1DARRAY(_42);
	_DECL_DEALLOC(_42);
	int64_t _43;
	int64_t _44;
	int64_t _45;
	int64_t _46;
	int64_t _47;
	int64_t _48;
	int64_t _49;
	int64_t _50;
	int64_t _51;
	int64_t _52;
	BYTE _53;
	int64_t _54;
	int64_t _55;
	int64_t _56;
	int64_t _57;
	//mul %14 = %1, %2 : int
	_14=width*height;
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
	_DEALLOC(newPixels);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(newPixels, _16);
	_TRANSFER_DEALLOC(newPixels, _16);
	//const %17 = 1 : int
	_17 = 1;
	//neg %18 = %17 : int
	_18= -_17;
	//const %19 = 0 : int
	_19 = 0;
	//const %20 = 1 : int
	_20 = 1;
	//const %21 = 2 : int
	_21 = 2;
	//neg %22 = %21 : int
	_22= -_21;
	//const %23 = 0 : int
	_23 = 0;
	//const %24 = 2 : int
	_24 = 2;
	//const %25 = 1 : int
	_25 = 1;
	//neg %26 = %25 : int
	_26= -_25;
	//const %27 = 0 : int
	_27 = 0;
	//const %28 = 1 : int
	_28 = 1;
	//newlist %29 = (%18, %19, %20, %22, %23, %24, %26, %27, %28) : int[]
	_DEALLOC(_29);
	_NEW_1DARRAY_int64_t(_29, 9, 0);
	_29[0] = _18; _29[1] = _19; _29[2] = _20; _29[3] = _22; _29[4] = _23; _29[5] = _24; _29[6] = _26; _29[7] = _27; _29[8] = _28; 
	_ADD_DEALLOC(_29);
	//assign %6 = %29  : int[]
	_DEALLOC(v_sobel);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(v_sobel, _29);
	_TRANSFER_DEALLOC(v_sobel, _29);
	//const %30 = 1 : int
	_30 = 1;
	//const %31 = 2 : int
	_31 = 2;
	//const %32 = 1 : int
	_32 = 1;
	//const %33 = 0 : int
	_33 = 0;
	//const %34 = 0 : int
	_34 = 0;
	//const %35 = 0 : int
	_35 = 0;
	//const %36 = 1 : int
	_36 = 1;
	//neg %37 = %36 : int
	_37= -_36;
	//const %38 = 2 : int
	_38 = 2;
	//neg %39 = %38 : int
	_39= -_38;
	//const %40 = 1 : int
	_40 = 1;
	//neg %41 = %40 : int
	_41= -_40;
	//newlist %42 = (%30, %31, %32, %33, %34, %35, %37, %39, %41) : int[]
	_DEALLOC(_42);
	_NEW_1DARRAY_int64_t(_42, 9, 0);
	_42[0] = _30; _42[1] = _31; _42[2] = _32; _42[3] = _33; _42[4] = _34; _42[5] = _35; _42[6] = _37; _42[7] = _39; _42[8] = _41; 
	_ADD_DEALLOC(_42);
	//assign %7 = %42  : int[]
	_DEALLOC(h_sobel);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(h_sobel, _42);
	_TRANSFER_DEALLOC(h_sobel, _42);
	//const %43 = 0 : int
	_43 = 0;
	//assign %8 = %43  : int
	// isCopyEliminated = true
	x = _43;
	//loop (%5, %8, %9, %10, %11, %12, %13, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57)
	while(true){
		//ifge %8, %1 goto blklab8 : int
		if(x>=width){goto blklab8;}
		//const %44 = 0 : int
		_44 = 0;
		//assign %9 = %44  : int
		// isCopyEliminated = true
		y = _44;
		//loop (%5, %9, %10, %11, %12, %13, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55)
		while(true){
			//ifge %9, %2 goto blklab10 : int
			if(y>=height){goto blklab10;}
			//mul %45 = %9, %1 : int
			_45=y*width;
			//add %46 = %45, %8 : int
			_46=_45+x;
			//assign %10 = %46  : int
			// isCopyEliminated = true
			pos = _46;
			//invoke (%47) = (%0, %1, %2, %8, %9, %6) SobelEdge_small:convolution : function(byte[],int,int,int,int,int[])->(int)
			{
				// isCopyEliminated of '_0' = true
				// isCopyEliminated of '_6' = true
				_47 = _convolution_(pixels, pixels_size, false, width, height, x, y, v_sobel, v_sobel_size, false);
				_RETAIN_DEALLOC(pixels, "false-false-true" , "convolution");
				_RETAIN_DEALLOC(v_sobel, "false-false-true" , "convolution");
			}
			//assign %11 = %47  : int
			// isCopyEliminated = true
			v_g = _47;
			//invoke (%48) = (%0, %1, %2, %8, %9, %7) SobelEdge_small:convolution : function(byte[],int,int,int,int,int[])->(int)
			{
				// isCopyEliminated of '_0' = true
				// isCopyEliminated of '_7' = true
				_48 = _convolution_(pixels, pixels_size, false, width, height, x, y, h_sobel, h_sobel_size, false);
				_RETAIN_DEALLOC(pixels, "false-false-true" , "convolution");
				_RETAIN_DEALLOC(h_sobel, "false-false-true" , "convolution");
			}
			//assign %12 = %48  : int
			// isCopyEliminated = true
			h_g = _48;
			//mul %49 = %11, %11 : int
			_49=v_g*v_g;
			//mul %50 = %12, %12 : int
			_50=h_g*h_g;
			//add %51 = %49, %50 : int
			_51=_49+_50;
			//assign %13 = %51  : int
			// isCopyEliminated = true
			t_g = _51;
			//const %52 = 1210000 : int
			_52 = 1210000;
			//ifle %13, %52 goto blklab12 : int
			if(t_g<=_52){goto blklab12;}
			//const %53 = 01100010b : byte
			_53 = 0b01100010;
			//update %5[%10] = %53 : byte[] -> byte[]
			newPixels[pos] = _53;
//.blklab12
blklab12:;
			//const %54 = 1 : int
			_54 = 1;
			//add %55 = %9, %54 : int
			_55=y+_54;
			//assign %9 = %55  : int
			// isCopyEliminated = true
			y = _55;
//.blklab11
blklab11:;
		}
//.blklab10
blklab10:;
		//const %56 = 1 : int
		_56 = 1;
		//add %57 = %8, %56 : int
		_57=x+_56;
		//assign %8 = %57  : int
		// isCopyEliminated = true
		x = _57;
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
	_DEALLOC(_16);
	_DEALLOC(_29);
	_DEALLOC(_42);
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
		//ifge %4, %2 goto blklab13 : int
		if(j>=height){goto blklab13;}
		//const %18 = 0 : int
		_18 = 0;
		//assign %5 = %18  : int
		// isCopyEliminated = true
		i = _18;
		//loop (%5, %6, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30)
		while(true){
			//ifge %5, %1 goto blklab15 : int
			if(i>=width){goto blklab15;}
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
			//ifne %21, %22 goto blklab17 : byte
			if(_21!=_22){goto blklab17;}
			//fieldload %23 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %24 = %23 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %25 = 0 : int
			_25 = 0;
			//indirectinvoke () = %24 (%25) : method(any)->()
			{
				printf("%"PRId64, _25);
			}
			//goto blklab18
			goto blklab18;
//.blklab17
blklab17:;
			//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %27 = %26 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %28 = 1 : int
			_28 = 1;
			//indirectinvoke () = %27 (%28) : method(any)->()
			{
				printf("%"PRId64, _28);
			}
//.blklab18
blklab18:;
			//const %29 = 1 : int
			_29 = 1;
			//add %30 = %5, %29 : int
			_30=i+_29;
			//assign %5 = %30  : int
			// isCopyEliminated = true
			i = _30;
//.blklab16
blklab16:;
		}
//.blklab15
blklab15:;
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
//.blklab14
blklab14:;
	}
//.blklab13
blklab13:;
	//return
	_DEALLOC(pixels);
	_DEALLOC(_9);
	_DEALLOC(_14);
	_DEALLOC(_33);
	return;
}

int main(int argc, char** args){
	int64_t* n;
	_DECL_DEALLOC(n);
	FILE* file;
	int64_t width;
	int64_t height;
	_DECL_1DARRAY_BYTE(pixels);
	_DECL_DEALLOC(pixels);
	_DECL_1DARRAY_BYTE(newPixels);
	_DECL_DEALLOC(newPixels);
	int64_t* _7;
	_DECL_DEALLOC(_7);
	_DECL_2DARRAY(_8);
	_DECL_DEALLOC(_8);
	int64_t _9;
	_DECL_1DARRAY(_10);
	_DECL_DEALLOC(_10);
	void* _11;
	_DECL_DEALLOC(_11);
	_DECL_2DARRAY(_12);
	_DECL_DEALLOC(_12);
	int64_t _13;
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	int64_t _15;
	_DECL_1DARRAY_BYTE(_16);
	_DECL_DEALLOC(_16);
	_DECL_1DARRAY_BYTE(_18);
	_DECL_DEALLOC(_18);
	//fieldload %8 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY_int64_t(_8);
	_CONV_ARGS(_8);
	_ADD_DEALLOC(_8);
	//const %9 = 0 : int
	_9 = 0;
	//indexof %10 = %8, %9 : int[][]
	_10=_8[_9];
	_10_size = _8_size_size;
	_REMOVE_DEALLOC(_10);
	//invoke (%7) = (%10) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_7, _10);
		_ADD_DEALLOC(_7);
		_REMOVE_DEALLOC(_10);
	}
	//assign %1 = %7  : null|int
	_DEALLOC(n);
	// isCopyEliminated = true
	n = _7;
	_TRANSFER_DEALLOC(n, _7);
	//fieldload %12 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY_int64_t(_12);
	_CONV_ARGS(_12);
	_ADD_DEALLOC(_12);
	//const %13 = 1 : int
	_13 = 1;
	//indexof %14 = %12, %13 : int[][]
	_14=_12[_13];
	_14_size = _12_size_size;
	_REMOVE_DEALLOC(_14);
	//invoke (%11) = (%14) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_11 = Reader(_14, _14_size);
	}
	//assign %2 = %11  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	// isCopyEliminated = true
	file = _11;
	//ifis %1, null goto blklab19 : null|int
	if(n == NULL) { goto blklab19;}
	//const %15 = 64 : int
	_15 = 64;
	//assign %3 = %15  : int
	// isCopyEliminated = true
	width = _15;
	//assign %4 = %1  : int
	// isCopyEliminated = true
	height = *n;
	//fieldload %17 = %2 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%16) = %17 () : method()->(byte[])
	{
		_16 = readAll(file, &_16_size);
		_ADD_DEALLOC(_16);
	}
	//assign %5 = %16  : byte[]
	_DEALLOC(pixels);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(pixels, _16);
	_TRANSFER_DEALLOC(pixels, _16);
	//invoke (%18) = (%5, %3, %4) SobelEdge_small:sobelEdgeDetection : function(byte[],int,int)->(byte[])
	{
		_DEALLOC(_18);
		// isCopyEliminated of '_5' = true
		_18 = _sobelEdgeDetection_(pixels, pixels_size, false, width, height, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_18));
		_RETAIN_DEALLOC(pixels, "false-false-false" , "sobelEdgeDetection");
		_RETAIN_DEALLOC_POST(_18, pixels);
	}
	//assign %6 = %18  : byte[]
	_DEALLOC(newPixels);
	// isCopyEliminated = true
	_UPDATE_1DARRAY(newPixels, _18);
	_TRANSFER_DEALLOC(newPixels, _18);
	//invoke () = (%0, %3, %4, %6) SobelEdge_small:print_pbm : method(whiley/lang/System:Console,int,int,byte[])->()
	{
		// isCopyEliminated of '_6' = true
		_print_pbm_(stdout, width, height, newPixels, newPixels_size, false);
		_RETAIN_DEALLOC(newPixels, "false-false-false" , "print_pbm");
	}
//.blklab19
blklab19:;
	//return
	_DEALLOC(n);
	if(file != NULL){fclose(file); file = NULL;}
	_DEALLOC(pixels);
	_DEALLOC(newPixels);
	_DEALLOC(_7);
	_FREE_ARGS(_8);
	_DEALLOC(_10);
	_FREE_ARGS(_12);
	_DEALLOC(_14);
	_DEALLOC(_16);
	_DEALLOC(_18);
	exit(0);
}

