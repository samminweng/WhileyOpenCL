#include "SobelEdgeDetect.h"
long long wrap(long long pos, long long size){
	long long _2 = 0;
	long long _3 = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	//const %3 = 0 : int
	_3 = 0;
	//iflt %0, %3 goto blklab0 : int
	if(pos<_3){goto blklab0;}
	//iflt %0, %1 goto blklab2 : int
	if(pos<size){goto blklab2;}
	//const %4 = 1 : int
	_4 = 1;
	//sub %5 = %1, %4 : int
	_5=size-_4;
	//sub %6 = %0, %1 : int
	_6=pos-size;
	//sub %7 = %5, %6 : int
	_7=_5-_6;
	//assign %0 = %7  : int
	pos = _7;
//.blklab2
blklab2:;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//const %8 = 1 : int
	_8 = 1;
	//neg %9 = %8 : int
	_9= -_8;
	//sub %10 = %9, %0 : int
	_10=_9-pos;
	//assign %0 = %10  : int
	pos = _10;
//.blklab1
blklab1:;
	//return %0
	return pos;
	//return
}

long long convolution(_DECL_1DARRAY_PARAM(pixels), _DECL_DEALLOC_PARAM(pixels), long long width, long long height, long long xCenter, long long yCenter, _DECL_1DARRAY_PARAM(filter), _DECL_DEALLOC_PARAM(filter)){
	long long _6 = 0;
	long long sum = 0;
	long long filterSize = 0;
	long long filterHalf = 0;
	long long filterY = 0;
	long long y = 0;
	long long filterX = 0;
	long long x = 0;
	long long pixel = 0;
	long long filterVal = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	long long _25 = 0;
	long long _26 = 0;
	long long _27 = 0;
	long long _28 = 0;
	long long _29 = 0;
	long long _30 = 0;
	long long _31 = 0;
	long long _32 = 0;
	long long _33 = 0;
	long long _34 = 0;
	long long _35 = 0;
	long long _36 = 0;
	long long _37 = 0;
	long long _38 = 0;
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
	//loop (%7, %10, %11, %12, %13, %14, %15, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38)
	while(true){
		//ifge %10, %8 goto blklab3 : int
		if(filterY>=filterSize){goto blklab3;}
		//add %21 = %4, %10 : int
		_21=yCenter+filterY;
		//sub %22 = %21, %9 : int
		_22=_21-filterHalf;
		//invoke (%20) = (%22, %2) SobelEdgeDetect:wrap : function(int,int)->(int)
		_20 = wrap(_22, height);
		//assign %11 = %20  : int
		y = _20;
		//const %23 = 0 : int
		_23 = 0;
		//assign %12 = %23  : int
		filterX = _23;
		//loop (%7, %12, %13, %14, %15, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36)
		while(true){
			//ifge %12, %8 goto blklab5 : int
			if(filterX>=filterSize){goto blklab5;}
			//add %25 = %3, %12 : int
			_25=xCenter+filterX;
			//sub %26 = %25, %9 : int
			_26=_25-filterHalf;
			//invoke (%24) = (%26, %1) SobelEdgeDetect:wrap : function(int,int)->(int)
			_24 = wrap(_26, width);
			//assign %13 = %24  : int
			x = _24;
			//mul %27 = %11, %1 : int
			_27=y*width;
			//add %28 = %27, %13 : int
			_28=_27+x;
			//indexof %29 = %0, %28 : int[]
			_29=pixels[_28];
			//assign %14 = %29  : int
			pixel = _29;
			//mul %30 = %10, %8 : int
			_30=filterY*filterSize;
			//add %31 = %30, %12 : int
			_31=_30+filterX;
			//indexof %32 = %5, %31 : int[]
			_32=filter[_31];
			//assign %15 = %32  : int
			filterVal = _32;
			//mul %33 = %14, %15 : int
			_33=pixel*filterVal;
			//add %34 = %7, %33 : int
			_34=sum+_33;
			//assign %7 = %34  : int
			sum = _34;
			//const %35 = 1 : int
			_35 = 1;
			//add %36 = %12, %35 : int
			_36=filterX+_35;
			//assign %12 = %36  : int
			filterX = _36;
//.blklab6
blklab6:;
		}
//.blklab5
blklab5:;
		//const %37 = 1 : int
		_37 = 1;
		//add %38 = %10, %37 : int
		_38=filterY+_37;
		//assign %10 = %38  : int
		filterY = _38;
//.blklab4
blklab4:;
	}
//.blklab3
blklab3:;
	//return %7
	_DEALLOC(pixels);
	_DEALLOC(filter);
	return sum;
	//return
}

int main(int argc, char** args){
	long long width = 0;
	long long height = 0;
	long long size = 0;
	_DECL_1DARRAY(pixels);
	_DECL_DEALLOC(pixels);
	_DECL_1DARRAY(newPixels);
	_DECL_DEALLOC(newPixels);
	_DECL_1DARRAY(sobel);
	_DECL_DEALLOC(sobel);
	long long x = 0;
	long long y = 0;
	long long pos = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	_DECL_1DARRAY(_14);
	_DECL_DEALLOC(_14);
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	_DECL_1DARRAY(_18);
	_DECL_DEALLOC(_18);
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	long long _25 = 0;
	long long _26 = 0;
	long long _27 = 0;
	long long _28 = 0;
	long long _29 = 0;
	long long _30 = 0;
	_DECL_1DARRAY(_31);
	_DECL_DEALLOC(_31);
	long long _32 = 0;
	long long _33 = 0;
	long long _34 = 0;
	long long _35 = 0;
	long long _36 = 0;
	void* _37;
	_DECL_1DARRAY(_39);
	_DECL_DEALLOC(_39);
	void* _40;
	void* _42;
	_DECL_1DARRAY(_44);
	_DECL_DEALLOC(_44);
	void* _45;
	long long _47 = 0;
	long long _48 = 0;
	long long _49 = 0;
	long long _50 = 0;
	long long _51 = 0;
	//const %10 = 5 : int
	_10 = 5;
	//assign %1 = %10  : int
	width = _10;
	//const %11 = 5 : int
	_11 = 5;
	//assign %2 = %11  : int
	height = _11;
	//mul %12 = %1, %2 : int
	_12=width*height;
	//assign %3 = %12  : int
	size = _12;
	//const %13 = 0 : int
	_13 = 0;
	//arraygen %14 = [13; 3] : int[]
	_DEALLOC(_14);
	_NEW_1DARRAY(_14, size, _13);
	_ADD_DEALLOC(_14);
	//assign %4 = %14  : int[]
	_DEALLOC(pixels);
	_UPDATE_1DARRAY(pixels, _14);
	_TRANSFER_DEALLOC(pixels, _14);
	//const %15 = 256 : int
	_15 = 256;
	//const %16 = 5 : int
	_16 = 5;
	//update %4[%16] = %15 : int[] -> int[]
	pixels[_16] = _15;
	//const %17 = 0 : int
	_17 = 0;
	//arraygen %18 = [17; 3] : int[]
	_DEALLOC(_18);
	_NEW_1DARRAY(_18, size, _17);
	_ADD_DEALLOC(_18);
	//assign %5 = %18  : int[]
	_DEALLOC(newPixels);
	_UPDATE_1DARRAY(newPixels, _18);
	_TRANSFER_DEALLOC(newPixels, _18);
	//const %19 = 1 : int
	_19 = 1;
	//neg %20 = %19 : int
	_20= -_19;
	//const %21 = 2 : int
	_21 = 2;
	//neg %22 = %21 : int
	_22= -_21;
	//const %23 = 1 : int
	_23 = 1;
	//neg %24 = %23 : int
	_24= -_23;
	//const %25 = 0 : int
	_25 = 0;
	//const %26 = 0 : int
	_26 = 0;
	//const %27 = 0 : int
	_27 = 0;
	//const %28 = 1 : int
	_28 = 1;
	//const %29 = 2 : int
	_29 = 2;
	//const %30 = 1 : int
	_30 = 1;
	//newlist %31 = (%20, %22, %24, %25, %26, %27, %28, %29, %30) : int[]
	_DEALLOC(_31);
	_NEW_1DARRAY(_31, 9, 0);
	_31[0] = _20; _31[1] = _22; _31[2] = _24; _31[3] = _25; _31[4] = _26; _31[5] = _27; _31[6] = _28; _31[7] = _29; _31[8] = _30; 
	_ADD_DEALLOC(_31);
	//assign %6 = %31  : int[]
	_DEALLOC(sobel);
	_UPDATE_1DARRAY(sobel, _31);
	_TRANSFER_DEALLOC(sobel, _31);
	//const %32 = 0 : int
	_32 = 0;
	//assign %7 = %32  : int
	x = _32;
	//loop (%5, %7, %8, %9, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51)
	while(true){
		//ifge %7, %1 goto blklab7 : int
		if(x>=width){goto blklab7;}
		//const %33 = 0 : int
		_33 = 0;
		//assign %8 = %33  : int
		y = _33;
		//loop (%5, %8, %9, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49)
		while(true){
			//ifge %8, %2 goto blklab9 : int
			if(y>=height){goto blklab9;}
			//mul %34 = %7, %1 : int
			_34=x*width;
			//add %35 = %34, %8 : int
			_35=_34+y;
			//assign %9 = %35  : int
			pos = _35;
			//invoke (%36) = (%4, %1, %2, %7, %8, %6) SobelEdgeDetect:convolution : function(int[],int,int,int,int,int[])->(int)
			_36 = convolution(_1DARRAY_PARAM(pixels), !pixels_dealloc, width, height, x, y, _1DARRAY_PARAM(sobel), !sobel_dealloc);
			//update %5[%9] = %36 : int[] -> int[]
			newPixels[pos] = _36;
			//fieldload %37 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %38 = %37 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %39 = [65,116,32,112,111,115,32,61,32] : int[]
			_DEALLOC(_39);
			_NEW_1DARRAY(_39, 9, 0);
			_39[0] = 65; _39[1] = 116; _39[2] = 32; _39[3] = 112; _39[4] = 111; _39[5] = 115; _39[6] = 32; _39[7] = 61; _39[8] = 32; 
			_ADD_DEALLOC(_39);
			//indirectinvoke () = %38 (%39) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_39));
			//fieldload %40 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %41 = %40 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indirectinvoke () = %41 (%9) : method(any)->()
			printf("%lld", pos);
			//fieldload %42 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %43 = %42 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %44 = [44,32,110,101,119,80,105,120,101,108,115,91,112,111,115,93,32,61,32] : int[]
			_DEALLOC(_44);
			_NEW_1DARRAY(_44, 19, 0);
			_44[0] = 44; _44[1] = 32; _44[2] = 110; _44[3] = 101; _44[4] = 119; _44[5] = 80; _44[6] = 105; _44[7] = 120; _44[8] = 101; _44[9] = 108; _44[10] = 115; _44[11] = 91; _44[12] = 112; _44[13] = 111; _44[14] = 115; _44[15] = 93; _44[16] = 32; _44[17] = 61; _44[18] = 32; 
			_ADD_DEALLOC(_44);
			//indirectinvoke () = %43 (%44) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_44));
			//fieldload %45 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %46 = %45 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indexof %47 = %5, %9 : int[]
			_47=newPixels[pos];
			//indirectinvoke () = %46 (%47) : method(any)->()
			printf("%lld\n", _47);
			//const %48 = 1 : int
			_48 = 1;
			//add %49 = %8, %48 : int
			_49=y+_48;
			//assign %8 = %49  : int
			y = _49;
//.blklab10
blklab10:;
		}
//.blklab9
blklab9:;
		//const %50 = 1 : int
		_50 = 1;
		//add %51 = %7, %50 : int
		_51=x+_50;
		//assign %7 = %51  : int
		x = _51;
//.blklab8
blklab8:;
	}
//.blklab7
blklab7:;
	//return
	_DEALLOC(pixels);
	_DEALLOC(newPixels);
	_DEALLOC(sobel);
	_DEALLOC(_14);
	_DEALLOC(_18);
	_DEALLOC(_31);
	_DEALLOC(_39);
	_DEALLOC(_44);
	exit(0);
}

