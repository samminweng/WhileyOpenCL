#include "SobelEdge1.h"
int64_t convolution(BYTE* pixels, size_t pixels_size, int64_t width, int64_t height, int64_t xCenter, int64_t yCenter, _DECL_1DARRAY_PARAM(filter)){
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
	int64_t _30 = 0;
	int64_t _31 = 0;
	BYTE _32;
	int64_t _33 = 0;
	int64_t _34 = 0;
	int64_t _35 = 0;
	int64_t _36 = 0;
	int64_t _37 = 0;
	int64_t _38 = 0;
	int64_t _39 = 0;
	int64_t _40 = 0;
	int64_t _41 = 0;
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
	//loop (%7, %10, %11, %12, %13, %14, %15, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41)
	while(true){
		//ifge %10, %8 goto blklab0 : int
		if(filterY>=filterSize){goto blklab0;}
		//add %21 = %4, %10 : int
		_21=yCenter+filterY;
		//sub %22 = %21, %9 : int
		_22=_21-filterHalf;
		//rem %23 = %22, %2 : int
		_23=_22%height;
		//invoke (%20) = (%23) whiley/lang/Math:abs : function(int)->(int)
		{
			_20 = llabs(_23);
		}
		//assign %11 = %20  : int
		y = _20;
		//const %24 = 0 : int
		_24 = 0;
		//assign %12 = %24  : int
		filterX = _24;
		//loop (%7, %12, %13, %14, %15, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39)
		while(true){
			//ifge %12, %8 goto blklab2 : int
			if(filterX>=filterSize){goto blklab2;}
			//add %26 = %3, %12 : int
			_26=xCenter+filterX;
			//sub %27 = %26, %9 : int
			_27=_26-filterHalf;
			//rem %28 = %27, %1 : int
			_28=_27%width;
			//invoke (%25) = (%28) whiley/lang/Math:abs : function(int)->(int)
			{
				_25 = llabs(_28);
			}
			//assign %13 = %25  : int
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
			pixel = _29;
			//mul %33 = %10, %8 : int
			_33=filterY*filterSize;
			//add %34 = %33, %12 : int
			_34=_33+filterX;
			//indexof %35 = %5, %34 : int[]
			_35=filter[_34];
			//assign %15 = %35  : int
			filterVal = _35;
			//mul %36 = %14, %15 : int
			_36=pixel*filterVal;
			//add %37 = %7, %36 : int
			_37=sum+_36;
			//assign %7 = %37  : int
			sum = _37;
			//const %38 = 1 : int
			_38 = 1;
			//add %39 = %12, %38 : int
			_39=filterX+_38;
			//assign %12 = %39  : int
			filterX = _39;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//const %40 = 1 : int
		_40 = 1;
		//add %41 = %10, %40 : int
		_41=filterY+_40;
		//assign %10 = %41  : int
		filterY = _41;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %7
	return sum;
	//return
}

BYTE* sobelEdgeDetection(BYTE* pixels, size_t pixels_size, int64_t width, int64_t height, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY_BYTE(_3);
	int64_t size = 0;
	_DECL_1DARRAY_BYTE(newPixels);
	_DECL_1DARRAY(v_sobel);
	_DECL_1DARRAY(h_sobel);
	int64_t x = 0;
	int64_t y = 0;
	int64_t pos = 0;
	int64_t v_g = 0;
	int64_t h_g = 0;
	int64_t t_g = 0;
	int64_t _14 = 0;
	BYTE _15;
	_DECL_1DARRAY_BYTE(_16);
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
	_NEW_1DARRAY_BYTE(_16, size, _15);
	//assign %5 = %16  : byte[]
	_COPY_1DARRAY_BYTE(newPixels, _16);
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
	_NEW_1DARRAY_int64_t(_29, 9, 0);
	_29[0] = _18; _29[1] = _19; _29[2] = _20; _29[3] = _22; _29[4] = _23; _29[5] = _24; _29[6] = _26; _29[7] = _27; _29[8] = _28; 
	//assign %6 = %29  : int[]
	_COPY_1DARRAY_int64_t(v_sobel, _29);
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
	_NEW_1DARRAY_int64_t(_42, 9, 0);
	_42[0] = _30; _42[1] = _31; _42[2] = _32; _42[3] = _33; _42[4] = _34; _42[5] = _35; _42[6] = _37; _42[7] = _39; _42[8] = _41; 
	//assign %7 = %42  : int[]
	_COPY_1DARRAY_int64_t(h_sobel, _42);
	//const %43 = 0 : int
	_43 = 0;
	//assign %8 = %43  : int
	x = _43;
	//loop (%5, %8, %9, %10, %11, %12, %13, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57)
	while(true){
		//ifge %8, %1 goto blklab4 : int
		if(x>=width){goto blklab4;}
		//const %44 = 0 : int
		_44 = 0;
		//assign %9 = %44  : int
		y = _44;
		//loop (%5, %9, %10, %11, %12, %13, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55)
		while(true){
			//ifge %9, %2 goto blklab6 : int
			if(y>=height){goto blklab6;}
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
				_47 = convolution(_COPY_1DARRAY_PARAM_BYTE(pixels), width, height, x, y, _COPY_1DARRAY_PARAM_int64_t(v_sobel));
			}
			//assign %11 = %47  : int
			v_g = _47;
			//invoke (%48) = (%0, %1, %2, %8, %9, %7) SobelEdge1:convolution : function(byte[],int,int,int,int,int[])->(int)
			{
				void* pixels_tmp;
				void* h_sobel_tmp;
				_48 = convolution(_COPY_1DARRAY_PARAM_BYTE(pixels), width, height, x, y, _COPY_1DARRAY_PARAM_int64_t(h_sobel));
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
			//const %52 = 128 : int
			_52 = 128;
			//ifgt %13, %52 goto blklab8 : int
			if(t_g>_52){goto blklab8;}
			//const %53 = 01100010b : byte
			_53 = 0b01100010;
			//update %5[%10] = %53 : byte[] -> byte[]
			newPixels[pos] = _53;
//.blklab8
blklab8:;
			//const %54 = 1 : int
			_54 = 1;
			//add %55 = %9, %54 : int
			_55=y+_54;
			//assign %9 = %55  : int
			y = _55;
//.blklab7
blklab7:;
		}
//.blklab6
blklab6:;
		//const %56 = 1 : int
		_56 = 1;
		//add %57 = %8, %56 : int
		_57=x+_56;
		//assign %8 = %57  : int
		x = _57;
//.blklab5
blklab5:;
	}
//.blklab4
blklab4:;
	//return %5
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(newPixels);
	return newPixels;
	//return
}

void printImage(FILE* sys, BYTE* pixels, size_t pixels_size, int64_t width, int64_t height){
	int64_t y = 0;
	int64_t x = 0;
	int64_t pos = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	BYTE _11;
	BYTE _12;
	void* _13;
	_DECL_1DARRAY(_15);
	void* _16;
	_DECL_1DARRAY(_18);
	void* _19;
	_DECL_1DARRAY(_21);
	int64_t _22 = 0;
	int64_t _23 = 0;
	int64_t _24 = 0;
	int64_t _25 = 0;
	void* _26;
	void* _28;
	size_t _28_size = 0;
	//const %7 = 0 : int
	_7 = 0;
	//assign %4 = %7  : int
	y = _7;
	//loop (%4, %5, %6, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28)
	while(true){
		//ifge %4, %3 goto blklab9 : int
		if(y>=height){goto blklab9;}
		//const %8 = 0 : int
		_8 = 0;
		//assign %5 = %8  : int
		x = _8;
		//loop (%5, %6, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23)
		while(true){
			//ifge %5, %2 goto blklab11 : int
			if(x>=width){goto blklab11;}
			//mul %9 = %4, %2 : int
			_9=y*width;
			//add %10 = %9, %5 : int
			_10=_9+x;
			//assign %6 = %10  : int
			pos = _10;
			//indexof %11 = %1, %6 : byte[]
			_11=pixels[pos];
			//const %12 = 00100000b : byte
			_12 = 0b00100000;
			//ifne %11, %12 goto blklab13 : byte
			if(_11!=_12){goto blklab13;}
			//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %14 = %13 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %15 = [32] : int[]
			_NEW_1DARRAY_int64_t(_15, 1, 0);
			_15[0] = 32; 
			//indirectinvoke () = %14 (%15) : method(int[])->()
			{
				printf_s(_1DARRAY_PARAM(_15));
			}
			//goto blklab14
			goto blklab14;
//.blklab13
blklab13:;
			//fieldload %16 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %17 = %16 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %18 = [98] : int[]
			_NEW_1DARRAY_int64_t(_18, 1, 0);
			_18[0] = 98; 
			//indirectinvoke () = %17 (%18) : method(int[])->()
			{
				printf_s(_1DARRAY_PARAM(_18));
			}
//.blklab14
blklab14:;
			//fieldload %19 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %20 = %19 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %21 = [32] : int[]
			_NEW_1DARRAY_int64_t(_21, 1, 0);
			_21[0] = 32; 
			//indirectinvoke () = %20 (%21) : method(int[])->()
			{
				printf_s(_1DARRAY_PARAM(_21));
			}
			//const %22 = 1 : int
			_22 = 1;
			//add %23 = %5, %22 : int
			_23=x+_22;
			//assign %5 = %23  : int
			x = _23;
//.blklab12
blklab12:;
		}
//.blklab11
blklab11:;
		//const %24 = 1 : int
		_24 = 1;
		//add %25 = %4, %24 : int
		_25=y+_24;
		//assign %4 = %25  : int
		y = _25;
		//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %27 = %26 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %28 = [] : void[]
		_NEW_1DARRAY_int64_t(_28, 0, 0);
		//indirectinvoke () = %27 (%28) : method(int[])->()
		{
			println_s(_28, _28_size);
		}
//.blklab10
blklab10:;
	}
//.blklab9
blklab9:;
	//return
	return;
}

int main(int argc, char** args){
	int64_t width = 0;
	int64_t height = 0;
	int64_t size = 0;
	_DECL_1DARRAY_BYTE(pixels);
	_DECL_1DARRAY_BYTE(newPixels);
	FILE* w;
	int64_t _7 = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	BYTE _10;
	_DECL_1DARRAY_BYTE(_11);
	BYTE _12;
	int64_t _13 = 0;
	_DECL_1DARRAY_BYTE(_14);
	void* _15;
	_DECL_1DARRAY(_17);
	void* _18;
	_DECL_1DARRAY(_20);
	void* _21;
	_DECL_1DARRAY(_22);
	int64_t _23 = 0;
	int64_t _26 = 0;
	BYTE _27;
	BYTE _28;
	int64_t _29 = 0;
	BYTE _30;
	BYTE _31;
	BYTE _32;
	BYTE _33;
	int64_t _34 = 0;
	int64_t _35 = 0;
	BYTE _36;
	BYTE _37;
	int64_t _38 = 0;
	int64_t _39 = 0;
	BYTE _40;
	BYTE _41;
	int64_t _42 = 0;
	int64_t _43 = 0;
	int64_t _44 = 0;
	int64_t _45 = 0;
	BYTE _46;
	BYTE _47;
	int64_t _48 = 0;
	BYTE _49;
	BYTE _50;
	int64_t _51 = 0;
	int64_t _52 = 0;
	BYTE _53;
	BYTE _54;
	int64_t _55 = 0;
	int64_t _56 = 0;
	int64_t _57 = 0;
	int64_t _58 = 0;
	BYTE _59;
	BYTE _60;
	//const %7 = 8 : int
	_7 = 8;
	//assign %1 = %7  : int
	width = _7;
	//const %8 = 8 : int
	_8 = 8;
	//assign %2 = %8  : int
	height = _8;
	//mul %9 = %1, %2 : int
	_9=width*height;
	//assign %3 = %9  : int
	size = _9;
	//const %10 = 00100000b : byte
	_10 = 0b00100000;
	//arraygen %11 = [10; 3] : byte[]
	_NEW_1DARRAY_BYTE(_11, size, _10);
	//assign %4 = %11  : byte[]
	_COPY_1DARRAY_BYTE(pixels, _11);
	//const %12 = 01100010b : byte
	_12 = 0b01100010;
	//const %13 = 0 : int
	_13 = 0;
	//update %4[%13] = %12 : byte[] -> byte[]
	pixels[_13] = _12;
	//invoke (%14) = (%4, %1, %2) SobelEdge1:sobelEdgeDetection : function(byte[],int,int)->(byte[])
	{
		void* pixels_tmp;
		_14 = sobelEdgeDetection(_COPY_1DARRAY_PARAM_BYTE(pixels), width, height, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_14));
	}
	//assign %5 = %14  : byte[]
	_COPY_1DARRAY_BYTE(newPixels, _14);
	//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %16 = %15 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %17 = [73,110,112,117,116,32,73,109,97,103,101,58] : int[]
	_NEW_1DARRAY_int64_t(_17, 12, 0);
	_17[0] = 73; _17[1] = 110; _17[2] = 112; _17[3] = 117; _17[4] = 116; _17[5] = 32; _17[6] = 73; _17[7] = 109; _17[8] = 97; _17[9] = 103; _17[10] = 101; _17[11] = 58; 
	//indirectinvoke () = %16 (%17) : method(int[])->()
	{
		println_s(_17, _17_size);
	}
	//invoke () = (%0, %4, %1, %2) SobelEdge1:printImage : method(whiley/lang/System:Console,byte[],int,int)->()
	{
		void* pixels_tmp;
		printImage(stdout, _COPY_1DARRAY_PARAM_BYTE(pixels), width, height);
	}
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %20 = [83,111,98,101,108,32,69,100,103,101,32,68,101,116,101,99,116,105,111,110,58] : int[]
	_NEW_1DARRAY_int64_t(_20, 21, 0);
	_20[0] = 83; _20[1] = 111; _20[2] = 98; _20[3] = 101; _20[4] = 108; _20[5] = 32; _20[6] = 69; _20[7] = 100; _20[8] = 103; _20[9] = 101; _20[10] = 32; _20[11] = 68; _20[12] = 101; _20[13] = 116; _20[14] = 101; _20[15] = 99; _20[16] = 116; _20[17] = 105; _20[18] = 111; _20[19] = 110; _20[20] = 58; 
	//indirectinvoke () = %19 (%20) : method(int[])->()
	{
		println_s(_20, _20_size);
	}
	//invoke () = (%0, %5, %1, %2) SobelEdge1:printImage : method(whiley/lang/System:Console,byte[],int,int)->()
	{
		void* newPixels_tmp;
		printImage(stdout, _COPY_1DARRAY_PARAM_BYTE(newPixels), width, height);
	}
	//const %22 = [111,117,116,112,117,116,46,116,120,116] : int[]
	_NEW_1DARRAY_int64_t(_22, 10, 0);
	_22[0] = 111; _22[1] = 117; _22[2] = 116; _22[3] = 112; _22[4] = 117; _22[5] = 116; _22[6] = 46; _22[7] = 116; _22[8] = 120; _22[9] = 116; 
	//invoke (%21) = (%22) whiley/io/File:Writer : method(whiley/lang/ASCII:string)->(whiley/io/File:Writer)
	{
		_21 = Writer(_22, _22_size);
	}
	//assign %6 = %21  : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	w = _21;
	//fieldload %24 = %6 write : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke (%23) = %24 (%5) : method(byte[])->(int)
	{
		writeAll(w, newPixels, newPixels_size);
	}
	//fieldload %25 = %6 close : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke () = %25 () : method()->()
	{
		fclose(w);
		w = NULL;
	}
	//assert
	{
		//const %26 = 0 : int
		_26 = 0;
		//indexof %27 = %5, %26 : byte[]
		_27=newPixels[_26];
		//const %28 = 01100010b : byte
		_28 = 0b01100010;
		//ifeq %27, %28 goto blklab15 : byte
		if(_27==_28){goto blklab15;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab15
blklab15:;
	//assert
	}
	//assert
	{
		//const %29 = 1 : int
		_29 = 1;
		//indexof %30 = %5, %29 : byte[]
		_30=newPixels[_29];
		//const %31 = 00100000b : byte
		_31 = 0b00100000;
		//ifeq %30, %31 goto blklab16 : byte
		if(_30==_31){goto blklab16;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab16
blklab16:;
	//assert
	}
	//assert
	{
		//indexof %32 = %5, %1 : byte[]
		_32=newPixels[width];
		//const %33 = 00100000b : byte
		_33 = 0b00100000;
		//ifeq %32, %33 goto blklab17 : byte
		if(_32==_33){goto blklab17;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab17
blklab17:;
	//assert
	}
	//assert
	{
		//const %34 = 1 : int
		_34 = 1;
		//add %35 = %1, %34 : int
		_35=width+_34;
		//indexof %36 = %5, %35 : byte[]
		_36=newPixels[_35];
		//const %37 = 00100000b : byte
		_37 = 0b00100000;
		//ifeq %36, %37 goto blklab18 : byte
		if(_36==_37){goto blklab18;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab18
blklab18:;
	//assert
	}
	//assert
	{
		//const %38 = 7 : int
		_38 = 7;
		//mul %39 = %38, %1 : int
		_39=_38*width;
		//indexof %40 = %5, %39 : byte[]
		_40=newPixels[_39];
		//const %41 = 00100000b : byte
		_41 = 0b00100000;
		//ifeq %40, %41 goto blklab19 : byte
		if(_40==_41){goto blklab19;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab19
blklab19:;
	//assert
	}
	//assert
	{
		//const %42 = 7 : int
		_42 = 7;
		//mul %43 = %42, %1 : int
		_43=_42*width;
		//const %44 = 1 : int
		_44 = 1;
		//add %45 = %43, %44 : int
		_45=_43+_44;
		//indexof %46 = %5, %45 : byte[]
		_46=newPixels[_45];
		//const %47 = 00100000b : byte
		_47 = 0b00100000;
		//ifeq %46, %47 goto blklab20 : byte
		if(_46==_47){goto blklab20;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab20
blklab20:;
	//assert
	}
	//assert
	{
		//const %48 = 7 : int
		_48 = 7;
		//indexof %49 = %5, %48 : byte[]
		_49=newPixels[_48];
		//const %50 = 00100000b : byte
		_50 = 0b00100000;
		//ifeq %49, %50 goto blklab21 : byte
		if(_49==_50){goto blklab21;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab21
blklab21:;
	//assert
	}
	//assert
	{
		//const %51 = 7 : int
		_51 = 7;
		//add %52 = %1, %51 : int
		_52=width+_51;
		//indexof %53 = %5, %52 : byte[]
		_53=newPixels[_52];
		//const %54 = 00100000b : byte
		_54 = 0b00100000;
		//ifeq %53, %54 goto blklab22 : byte
		if(_53==_54){goto blklab22;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab22
blklab22:;
	//assert
	}
	//assert
	{
		//const %55 = 7 : int
		_55 = 7;
		//mul %56 = %55, %1 : int
		_56=_55*width;
		//const %57 = 7 : int
		_57 = 7;
		//add %58 = %56, %57 : int
		_58=_56+_57;
		//indexof %59 = %5, %58 : byte[]
		_59=newPixels[_58];
		//const %60 = 00100000b : byte
		_60 = 0b00100000;
		//ifeq %59, %60 goto blklab23 : byte
		if(_59==_60){goto blklab23;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab23
blklab23:;
	//assert
	}
	//return
	exit(0);
}

