#include "SobelEdge_original.h"
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
	_UPDATE_1DARRAY(newPixels, _16);
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
	_UPDATE_1DARRAY(v_sobel, _29);
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
	_UPDATE_1DARRAY(h_sobel, _42);
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
			//invoke (%47) = (%0, %1, %2, %8, %9, %6) SobelEdge_original:convolution : function(byte[],int,int,int,int,int[])->(int)
			{
				_47 = convolution(_1DARRAY_PARAM(pixels), width, height, x, y, _1DARRAY_PARAM(v_sobel));
			}
			//assign %11 = %47  : int
			v_g = _47;
			//invoke (%48) = (%0, %1, %2, %8, %9, %7) SobelEdge_original:convolution : function(byte[],int,int,int,int,int[])->(int)
			{
				_48 = convolution(_1DARRAY_PARAM(pixels), width, height, x, y, _1DARRAY_PARAM(h_sobel));
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

int main(int argc, char** args){
	int64_t* n;
	int64_t max = 0;
	int64_t width = 0;
	int64_t height = 0;
	_DECL_1DARRAY_BYTE(pixels);
	_DECL_1DARRAY_BYTE(newPixels);
	FILE* w;
	int64_t* _8;
	_DECL_2DARRAY(_9);
	int64_t _10 = 0;
	_DECL_1DARRAY(_11);
	BYTE _12;
	int64_t _13 = 0;
	_DECL_1DARRAY_BYTE(_14);
	BYTE _15;
	int64_t _16 = 0;
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	_DECL_1DARRAY_BYTE(_20);
	void* _21;
	_DECL_1DARRAY(_22);
	int64_t _23 = 0;
	//fieldload %9 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_9);
	//const %10 = 0 : int
	_10 = 0;
	//indexof %11 = %9, %10 : int[][]
	_11=_9[_10];
	_11_size = _9_size_size;
	//invoke (%8) = (%11) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_8, _11);
	}
	//assign %1 = %8  : null|int
	n = _8;
	//ifis %1, null goto blklab9 : null|int
	if(n == NULL) { goto blklab9;}
	//assign %2 = %1  : int
	max = *n;
	//assign %3 = %2  : int
	width = max;
	//assign %4 = %2  : int
	height = max;
	//const %12 = 00100000b : byte
	_12 = 0b00100000;
	//mul %13 = %3, %4 : int
	_13=width*height;
	//arraygen %14 = [12; 13] : byte[]
	_NEW_1DARRAY_BYTE(_14, _13, _12);
	//assign %5 = %14  : byte[]
	_UPDATE_1DARRAY(pixels, _14);
	//const %15 = 01100010b : byte
	_15 = 0b01100010;
	//const %16 = 4 : int
	_16 = 4;
	//mul %17 = %16, %3 : int
	_17=_16*width;
	//const %18 = 3 : int
	_18 = 3;
	//add %19 = %17, %18 : int
	_19=_17+_18;
	//update %5[%19] = %15 : byte[] -> byte[]
	pixels[_19] = _15;
	//invoke (%20) = (%5, %3, %4) SobelEdge_original:sobelEdgeDetection : function(byte[],int,int)->(byte[])
	{
		_20 = sobelEdgeDetection(_1DARRAY_PARAM(pixels), width, height, _1DARRAYSIZE_PARAM_CALLBYREFERENCE(_20));
	}
	//assign %6 = %20  : byte[]
	_UPDATE_1DARRAY(newPixels, _20);
	//const %22 = [111,117,116,112,117,116,46,116,120,116] : int[]
	_NEW_1DARRAY_int64_t(_22, 10, 0);
	_22[0] = 111; _22[1] = 117; _22[2] = 116; _22[3] = 112; _22[4] = 117; _22[5] = 116; _22[6] = 46; _22[7] = 116; _22[8] = 120; _22[9] = 116; 
	//invoke (%21) = (%22) whiley/io/File:Writer : method(whiley/lang/ASCII:string)->(whiley/io/File:Writer)
	{
		_21 = Writer(_22, _22_size);
	}
	//assign %7 = %21  : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	w = _21;
	//fieldload %24 = %7 write : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke (%23) = %24 (%6) : method(byte[])->(int)
	{
		writeAll(w, newPixels, newPixels_size);
	}
	//fieldload %25 = %7 close : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke () = %25 () : method()->()
	{
		fclose(w);
		w = NULL;
	}
//.blklab9
blklab9:;
	//return
	exit(0);
}

