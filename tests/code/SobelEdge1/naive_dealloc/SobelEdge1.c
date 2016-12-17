#include "SobelEdge1.h"
int64_t _wrap_(int64_t pos, int64_t size){
	int64_t _2 = 0;
	int64_t _3 = 0;
	int64_t _4 = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
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

int64_t _convolution_(BYTE* pixels, size_t pixels_size, _DECL_DEALLOC_PARAM(pixels), int64_t width, int64_t height, int64_t xCenter, int64_t yCenter, _DECL_1DARRAY_PARAM(filter), _DECL_DEALLOC_PARAM(filter)){
	int64_t _6 = 0;
	int64_t sum = 0;
	int64_t filterSize = 0;
	int64_t filterHalf = 0;
	int64_t filterY = 0;
	int64_t y = 0;
	int64_t filterX = 0;
	int64_t x = 0;
	int64_t pixel = 0;
	int64_t filterVal = 0;
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
	int64_t _27 = 0;
	int64_t _28 = 0;
	int64_t _29 = 0;
	BYTE _30;
	int64_t _31 = 0;
	int64_t _32 = 0;
	int64_t _33 = 0;
	int64_t _34 = 0;
	int64_t _35 = 0;
	int64_t _36 = 0;
	int64_t _37 = 0;
	int64_t _38 = 0;
	int64_t _39 = 0;
	//const %16 = 0 : int
	_16 = 0;
	//assign %7 = %16  : int
	sum = _16;
	//const %17 = 3 : int
	_17 = 3;
	//assign %8 = %17  : int
	filterSize = _17;
	//const %18 = 1 : int
	_18 = 1;
	//assign %9 = %18  : int
	filterHalf = _18;
	//const %19 = 0 : int
	_19 = 0;
	//assign %10 = %19  : int
	filterY = _19;
	//loop (%7, %10, %11, %12, %13, %14, %15, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39)
	while(true){
		//ifge %10, %8 goto blklab4 : int
		if(filterY>=filterSize){goto blklab4;}
		//add %21 = %4, %10 : int
		_21=yCenter+filterY;
		//sub %22 = %21, %9 : int
		_22=_21-filterHalf;
		//invoke (%20) = (%22, %2) SobelEdge1:wrap : function(int,int)->(int)
		{
			_20 = _wrap_(_22, height);
		}
		//assign %11 = %20  : int
		y = _20;
		//const %23 = 0 : int
		_23 = 0;
		//assign %12 = %23  : int
		filterX = _23;
		//loop (%7, %12, %13, %14, %15, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37)
		while(true){
			//ifge %12, %8 goto blklab6 : int
			if(filterX>=filterSize){goto blklab6;}
			//add %25 = %3, %12 : int
			_25=xCenter+filterX;
			//sub %26 = %25, %9 : int
			_26=_25-filterHalf;
			//invoke (%24) = (%26, %1) SobelEdge1:wrap : function(int,int)->(int)
			{
				_24 = _wrap_(_26, width);
			}
			//assign %13 = %24  : int
			x = _24;
			//mul %28 = %11, %1 : int
			_28=y*width;
			//add %29 = %28, %13 : int
			_29=_28+x;
			//indexof %30 = %0, %29 : byte[]
			_30=pixels[_29];
			//invoke (%27) = (%30) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
			{
				_27 = (unsigned int)_30;
			}
			//assign %14 = %27  : int
			pixel = _27;
			//mul %31 = %10, %8 : int
			_31=filterY*filterSize;
			//add %32 = %31, %12 : int
			_32=_31+filterX;
			//indexof %33 = %5, %32 : int[]
			_33=filter[_32];
			//assign %15 = %33  : int
			filterVal = _33;
			//mul %34 = %14, %15 : int
			_34=pixel*filterVal;
			//add %35 = %7, %34 : int
			_35=sum+_34;
			//assign %7 = %35  : int
			sum = _35;
			//const %36 = 1 : int
			_36 = 1;
			//add %37 = %12, %36 : int
			_37=filterX+_36;
			//assign %12 = %37  : int
			filterX = _37;
//.blklab7
blklab7:;
		}
//.blklab6
blklab6:;
		//const %38 = 1 : int
		_38 = 1;
		//add %39 = %10, %38 : int
		_39=filterY+_38;
		//assign %10 = %39  : int
		filterY = _39;
//.blklab5
blklab5:;
	}
//.blklab4
blklab4:;
	//return %7
	_DEALLOC(pixels);
	_DEALLOC(filter);
	return sum;
	//return
}

BYTE* _sobelEdgeDetection_(BYTE* pixels, size_t pixels_size, _DECL_DEALLOC_PARAM(pixels), int64_t width, int64_t height, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(_3);
	_DECL_DEALLOC(_3);
	int64_t size = 0;
	_DECL_1DARRAY_BYTE(newPixels);
	_DECL_DEALLOC(newPixels);
	_DECL_1DARRAY(v_sobel);
	_DECL_DEALLOC(v_sobel);
	_DECL_1DARRAY(h_sobel);
	_DECL_DEALLOC(h_sobel);
	int64_t x = 0;
	int64_t y = 0;
	int64_t pos = 0;
	int64_t v_g = 0;
	int64_t h_g = 0;
	int64_t t_g = 0;
	int64_t _14 = 0;
	BYTE _15;
	_DECL_1DARRAY_BYTE(_16);
	_DECL_DEALLOC(_16);
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
	int64_t _27 = 0;
	int64_t _28 = 0;
	_DECL_1DARRAY(_29);
	_DECL_DEALLOC(_29);
	int64_t _30 = 0;
	int64_t _31 = 0;
	int64_t _32 = 0;
	int64_t _33 = 0;
	int64_t _34 = 0;
	int64_t _35 = 0;
	int64_t _36 = 0;
	int64_t _37 = 0;
	int64_t _38 = 0;
	int64_t _39 = 0;
	int64_t _40 = 0;
	int64_t _41 = 0;
	_DECL_1DARRAY(_42);
	_DECL_DEALLOC(_42);
	int64_t _43 = 0;
	int64_t _44 = 0;
	int64_t _45 = 0;
	int64_t _46 = 0;
	int64_t _47 = 0;
	int64_t _48 = 0;
	int64_t _49 = 0;
	int64_t _50 = 0;
	int64_t _51 = 0;
	int64_t _52 = 0;
	BYTE _53;
	int64_t _54 = 0;
	int64_t _55 = 0;
	int64_t _56 = 0;
	int64_t _57 = 0;
	//mul %14 = %1, %2 : int
	_14=width*height;
	//assign %4 = %14  : int
	size = _14;
	//const %15 = 00100000b : byte
	_15 = 0b00100000;
	//arraygen %16 = [15; 4] : byte[]
	_DEALLOC(_16);
	_NEW_1DARRAY_BYTE(_16, size, _15);
	_ADD_DEALLOC(_16);
	//assign %5 = %16  : byte[]
	_DEALLOC(newPixels);
	_COPY_1DARRAY_BYTE(newPixels, _16);
	_ADD_DEALLOC(newPixels);
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
	_COPY_1DARRAY_int64_t(v_sobel, _29);
	_ADD_DEALLOC(v_sobel);
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
	_COPY_1DARRAY_int64_t(h_sobel, _42);
	_ADD_DEALLOC(h_sobel);
	//const %43 = 0 : int
	_43 = 0;
	//assign %8 = %43  : int
	x = _43;
	//loop (%5, %8, %9, %10, %11, %12, %13, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57)
	while(true){
		//ifge %8, %1 goto blklab8 : int
		if(x>=width){goto blklab8;}
		//const %44 = 0 : int
		_44 = 0;
		//assign %9 = %44  : int
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
			pos = _46;
			//invoke (%47) = (%0, %1, %2, %8, %9, %6) SobelEdge1:convolution : function(byte[],int,int,int,int,int[])->(int)
			{
				void* pixels_tmp;
				void* v_sobel_tmp;
				_47 = _convolution_(_COPY_1DARRAY_PARAM_BYTE(pixels), true, width, height, x, y, _COPY_1DARRAY_PARAM_int64_t(v_sobel), true);
				_CALLEE_DEALLOC(pixels, "false-false-true" , "convolution");
				_CALLEE_DEALLOC(v_sobel, "false-false-true" , "convolution");
			}
			//assign %11 = %47  : int
			v_g = _47;
			//invoke (%48) = (%0, %1, %2, %8, %9, %7) SobelEdge1:convolution : function(byte[],int,int,int,int,int[])->(int)
			{
				void* pixels_tmp;
				void* h_sobel_tmp;
				_48 = _convolution_(_COPY_1DARRAY_PARAM_BYTE(pixels), true, width, height, x, y, _COPY_1DARRAY_PARAM_int64_t(h_sobel), true);
				_CALLEE_DEALLOC(pixels, "false-false-true" , "convolution");
				_CALLEE_DEALLOC(h_sobel, "false-false-true" , "convolution");
			}
			//assign %12 = %48  : int
			h_g = _48;
			//invoke (%49) = (%11) whiley/lang/Math:abs : function(int)->(int)
			{
				_49 = llabs(v_g);
			}
			//invoke (%50) = (%12) whiley/lang/Math:abs : function(int)->(int)
			{
				_50 = llabs(h_g);
			}
			//add %51 = %49, %50 : int
			_51=_49+_50;
			//assign %13 = %51  : int
			t_g = _51;
			//const %52 = 64 : int
			_52 = 64;
			//ifgt %13, %52 goto blklab12 : int
			if(t_g>_52){goto blklab12;}
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
	int64_t j = 0;
	int64_t i = 0;
	int64_t pos = 0;
	void* _7;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	void* _10;
	void* _12;
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	void* _15;
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	int64_t _20 = 0;
	BYTE _21;
	BYTE _22;
	void* _23;
	int64_t _25 = 0;
	void* _26;
	int64_t _28 = 0;
	void* _29;
	_DECL_1DARRAY(_31);
	_DECL_DEALLOC(_31);
	int64_t _32 = 0;
	int64_t _33 = 0;
	void* _34;
	void* _36;
	size_t _36_size = 0;
	_DECL_DEALLOC(_36);
	int64_t _37 = 0;
	int64_t _38 = 0;
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
		printf_s(_1DARRAY_PARAM(_14));
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
	j = _17;
	//loop (%4, %5, %6, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38)
	while(true){
		//ifge %4, %2 goto blklab13 : int
		if(j>=height){goto blklab13;}
		//const %18 = 0 : int
		_18 = 0;
		//assign %5 = %18  : int
		i = _18;
		//loop (%5, %6, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33)
		while(true){
			//ifge %5, %1 goto blklab15 : int
			if(i>=width){goto blklab15;}
			//mul %19 = %4, %1 : int
			_19=j*width;
			//add %20 = %19, %5 : int
			_20=_19+i;
			//assign %6 = %20  : int
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
			//fieldload %29 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %30 = %29 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %31 = [32] : int[]
			_DEALLOC(_31);
			_NEW_1DARRAY_int64_t(_31, 1, 0);
			_31[0] = 32; 
			_ADD_DEALLOC(_31);
			//indirectinvoke () = %30 (%31) : method(int[])->()
			{
				printf_s(_1DARRAY_PARAM(_31));
			}
			//const %32 = 1 : int
			_32 = 1;
			//add %33 = %5, %32 : int
			_33=i+_32;
			//assign %5 = %33  : int
			i = _33;
//.blklab16
blklab16:;
		}
//.blklab15
blklab15:;
		//fieldload %34 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %35 = %34 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %36 = [] : void[]
		_DEALLOC(_36);
		_NEW_1DARRAY_int64_t(_36, 0, 0);
		_ADD_DEALLOC(_36);
		//indirectinvoke () = %35 (%36) : method(int[])->()
		{
			println_s(_36, _36_size);
		}
		//const %37 = 1 : int
		_37 = 1;
		//add %38 = %4, %37 : int
		_38=j+_37;
		//assign %4 = %38  : int
		j = _38;
//.blklab14
blklab14:;
	}
//.blklab13
blklab13:;
	//return
	_DEALLOC(pixels);
	_DEALLOC(_9);
	_DEALLOC(_14);
	_DEALLOC(_31);
	_DEALLOC(_36);
	return;
}

int main(int argc, char** args){
	FILE* r;
	int64_t width = 0;
	int64_t height = 0;
	int64_t size = 0;
	_DECL_1DARRAY_BYTE(pixels);
	_DECL_DEALLOC(pixels);
	_DECL_1DARRAY_BYTE(newPixels);
	_DECL_DEALLOC(newPixels);
	void* _7;
	_DECL_DEALLOC(_7);
	_DECL_1DARRAY(_8);
	_DECL_DEALLOC(_8);
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	_DECL_1DARRAY_BYTE(_12);
	_DECL_DEALLOC(_12);
	_DECL_1DARRAY_BYTE(_14);
	_DECL_DEALLOC(_14);
	//const %8 = [105,109,97,103,101,51,50,120,51,50,46,112,98,109] : int[]
	_DEALLOC(_8);
	_NEW_1DARRAY_int64_t(_8, 14, 0);
	_8[0] = 105; _8[1] = 109; _8[2] = 97; _8[3] = 103; _8[4] = 101; _8[5] = 51; _8[6] = 50; _8[7] = 120; _8[8] = 51; _8[9] = 50; _8[10] = 46; _8[11] = 112; _8[12] = 98; _8[13] = 109; 
	_ADD_DEALLOC(_8);
	//invoke (%7) = (%8) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_7 = Reader(_8, _8_size);
	}
	//assign %1 = %7  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	r = _7;
	//const %9 = 32 : int
	_9 = 32;
	//assign %2 = %9  : int
	width = _9;
	//const %10 = 32 : int
	_10 = 32;
	//assign %3 = %10  : int
	height = _10;
	//mul %11 = %2, %3 : int
	_11=width*height;
	//assign %4 = %11  : int
	size = _11;
	//fieldload %13 = %1 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%12) = %13 () : method()->(byte[])
	{
		_12 = readAll(r, &_12_size);
		_ADD_DEALLOC(_12);
	}
	//assign %5 = %12  : byte[]
	_DEALLOC(pixels);
	_COPY_1DARRAY_BYTE(pixels, _12);
	_ADD_DEALLOC(pixels);
	//invoke (%14) = (%5, %2, %3) SobelEdge1:sobelEdgeDetection : function(byte[],int,int)->(byte[])
	{
		void* pixels_tmp;
		_DEALLOC(_14);
		_14 = _sobelEdgeDetection_(_COPY_1DARRAY_PARAM_BYTE(pixels), true, width, height, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_14));
		_CALLEE_DEALLOC(pixels, "false-false-false" , "sobelEdgeDetection");
		_ADD_DEALLOC(_14);
	}
	//assign %6 = %14  : byte[]
	_DEALLOC(newPixels);
	_COPY_1DARRAY_BYTE(newPixels, _14);
	_ADD_DEALLOC(newPixels);
	//invoke () = (%0, %2, %3, %6) SobelEdge1:print_pbm : method(whiley/lang/System:Console,int,int,byte[])->()
	{
		void* newPixels_tmp;
		_print_pbm_(stdout, width, height, _COPY_1DARRAY_PARAM_BYTE(newPixels), true);
		_CALLEE_DEALLOC(newPixels, "false-false-false" , "print_pbm");
	}
	//return
	if(r != NULL){fclose(r); r = NULL;}
	_DEALLOC(pixels);
	_DEALLOC(newPixels);
	_DEALLOC(_8);
	_DEALLOC(_12);
	_DEALLOC(_14);
	exit(0);
}

