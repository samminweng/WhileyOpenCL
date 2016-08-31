#include "SobelEdge_original.h"
long long convolution(_DECL_1DARRAY_PARAM(pixels), long long width, long long height, long long xCenter, long long yCenter, _DECL_1DARRAY_PARAM(filter)){
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
	long long _39 = 0;
	long long _40 = 0;
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
	//loop (%7, %10, %11, %12, %13, %14, %15, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40)
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
		_20 = llabs(_23);
		//assign %11 = %20  : int
		y = _20;
		//const %24 = 0 : int
		_24 = 0;
		//assign %12 = %24  : int
		filterX = _24;
		//loop (%7, %12, %13, %14, %15, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38)
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
			_25 = llabs(_28);
			//assign %13 = %25  : int
			x = _25;
			//mul %29 = %11, %1 : int
			_29=y*width;
			//add %30 = %29, %13 : int
			_30=_29+x;
			//indexof %31 = %0, %30 : int[]
			_31=pixels[_30];
			//assign %14 = %31  : int
			pixel = _31;
			//mul %32 = %10, %8 : int
			_32=filterY*filterSize;
			//add %33 = %32, %12 : int
			_33=_32+filterX;
			//indexof %34 = %5, %33 : int[]
			_34=filter[_33];
			//assign %15 = %34  : int
			filterVal = _34;
			//mul %35 = %14, %15 : int
			_35=pixel*filterVal;
			//add %36 = %7, %35 : int
			_36=sum+_35;
			//assign %7 = %36  : int
			sum = _36;
			//const %37 = 1 : int
			_37 = 1;
			//add %38 = %12, %37 : int
			_38=filterX+_37;
			//assign %12 = %38  : int
			filterX = _38;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//const %39 = 1 : int
		_39 = 1;
		//add %40 = %10, %39 : int
		_40=filterY+_39;
		//assign %10 = %40  : int
		filterY = _40;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %7
	return sum;
	//return
}

long long* sobelEdgeDetection(_DECL_1DARRAY_PARAM(pixels), long long width, long long height){
	_DECL_1DARRAY(_3);
	long long size = 0;
	_DECL_1DARRAY(newPixels);
	_DECL_1DARRAY(v_sobel);
	_DECL_1DARRAY(h_sobel);
	long long x = 0;
	long long y = 0;
	long long pos = 0;
	long long v_g = 0;
	long long h_g = 0;
	long long t_g = 0;
	long long _14 = 0;
	long long _15 = 0;
	_DECL_1DARRAY(_16);
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
	_DECL_1DARRAY(_29);
	long long _30 = 0;
	long long _31 = 0;
	long long _32 = 0;
	long long _33 = 0;
	long long _34 = 0;
	long long _35 = 0;
	long long _36 = 0;
	long long _37 = 0;
	long long _38 = 0;
	long long _39 = 0;
	long long _40 = 0;
	long long _41 = 0;
	_DECL_1DARRAY(_42);
	long long _43 = 0;
	long long _44 = 0;
	long long _45 = 0;
	long long _46 = 0;
	long long _47 = 0;
	long long _48 = 0;
	long long _49 = 0;
	long long _50 = 0;
	long long _51 = 0;
	long long _52 = 0;
	long long _53 = 0;
	long long _54 = 0;
	long long _55 = 0;
	long long _56 = 0;
	long long _57 = 0;
	long long _58 = 0;
	//mul %14 = %1, %2 : int
	_14=width*height;
	//assign %4 = %14  : int
	size = _14;
	//const %15 = 255 : int
	_15 = 255;
	//arraygen %16 = [15; 4] : int[]
	_NEW_1DARRAY(_16, size, _15);
	//assign %5 = %16  : int[]
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
	_NEW_1DARRAY(_29, 9, 0);
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
	_NEW_1DARRAY(_42, 9, 0);
	_42[0] = _30; _42[1] = _31; _42[2] = _32; _42[3] = _33; _42[4] = _34; _42[5] = _35; _42[6] = _37; _42[7] = _39; _42[8] = _41; 
	//assign %7 = %42  : int[]
	_UPDATE_1DARRAY(h_sobel, _42);
	//const %43 = 0 : int
	_43 = 0;
	//assign %8 = %43  : int
	x = _43;
	//loop (%5, %8, %9, %10, %11, %12, %13, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58)
	while(true){
		//ifge %8, %1 goto blklab4 : int
		if(x>=width){goto blklab4;}
		//const %44 = 0 : int
		_44 = 0;
		//assign %9 = %44  : int
		y = _44;
		//loop (%5, %9, %10, %11, %12, %13, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56)
		while(true){
			//ifge %9, %2 goto blklab6 : int
			if(y>=height){goto blklab6;}
			//mul %45 = %9, %1 : int
			_45=y*width;
			//add %46 = %45, %8 : int
			_46=_45+x;
			//assign %10 = %46  : int
			pos = _46;
			//invoke (%47) = (%0, %1, %2, %8, %9, %6) SobelEdge_original:convolution : function(int[],int,int,int,int,int[])->(int)
			{
				_47 = convolution(_1DARRAY_PARAM(pixels), width, height, x, y, _1DARRAY_PARAM(v_sobel));
			}
			//assign %11 = %47  : int
			v_g = _47;
			//invoke (%48) = (%0, %1, %2, %8, %9, %7) SobelEdge_original:convolution : function(int[],int,int,int,int,int[])->(int)
			{
				_48 = convolution(_1DARRAY_PARAM(pixels), width, height, x, y, _1DARRAY_PARAM(h_sobel));
			}
			//assign %12 = %48  : int
			h_g = _48;
			//invoke (%49) = (%11) whiley/lang/Math:abs : function(int)->(int)
			_49 = llabs(v_g);
			//invoke (%50) = (%12) whiley/lang/Math:abs : function(int)->(int)
			_50 = llabs(h_g);
			//add %51 = %49, %50 : int
			_51=_49+_50;
			//assign %13 = %51  : int
			t_g = _51;
			//const %52 = 128 : int
			_52 = 128;
			//ifle %13, %52 goto blklab8 : int
			if(t_g<=_52){goto blklab8;}
			//const %53 = 255 : int
			_53 = 255;
			//update %5[%10] = %53 : int[] -> int[]
			newPixels[pos] = _53;
			//goto blklab9
			goto blklab9;
//.blklab8
blklab8:;
			//const %54 = 0 : int
			_54 = 0;
			//update %5[%10] = %54 : int[] -> int[]
			newPixels[pos] = _54;
//.blklab9
blklab9:;
			//const %55 = 1 : int
			_55 = 1;
			//add %56 = %9, %55 : int
			_56=y+_55;
			//assign %9 = %56  : int
			y = _56;
//.blklab7
blklab7:;
		}
//.blklab6
blklab6:;
		//const %57 = 1 : int
		_57 = 1;
		//add %58 = %8, %57 : int
		_58=x+_57;
		//assign %8 = %58  : int
		x = _58;
//.blklab5
blklab5:;
	}
//.blklab4
blklab4:;
	//return %5
	return newPixels;
	//return
}

void printImage(FILE* sys, _DECL_1DARRAY_PARAM(pixels), long long width, long long height){
	long long y = 0;
	long long x = 0;
	long long pos = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	void* _15;
	_DECL_1DARRAY(_17);
	void* _18;
	_DECL_1DARRAY(_20);
	void* _21;
	_DECL_1DARRAY(_23);
	long long _24 = 0;
	long long _25 = 0;
	long long _26 = 0;
	long long _27 = 0;
	void* _28;
	void* _30;
	long long _30_size = 0;
	//const %7 = 0 : int
	_7 = 0;
	//assign %4 = %7  : int
	y = _7;
	//loop (%4, %5, %6, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30)
	while(true){
		//const %8 = 8 : int
		_8 = 8;
		//ifge %4, %8 goto blklab10 : int
		if(y>=_8){goto blklab10;}
		//const %9 = 0 : int
		_9 = 0;
		//assign %5 = %9  : int
		x = _9;
		//loop (%5, %6, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25)
		while(true){
			//const %10 = 8 : int
			_10 = 8;
			//ifge %5, %10 goto blklab12 : int
			if(x>=_10){goto blklab12;}
			//mul %11 = %4, %2 : int
			_11=y*width;
			//add %12 = %11, %5 : int
			_12=_11+x;
			//assign %6 = %12  : int
			pos = _12;
			//indexof %13 = %1, %6 : int[]
			_13=pixels[pos];
			//const %14 = 255 : int
			_14 = 255;
			//ifne %13, %14 goto blklab14 : int
			if(_13!=_14){goto blklab14;}
			//fieldload %15 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %16 = %15 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %17 = [119] : int[]
			_NEW_1DARRAY(_17, 1, 0);
			_17[0] = 119; 
			//indirectinvoke () = %16 (%17) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_17));
			//goto blklab15
			goto blklab15;
//.blklab14
blklab14:;
			//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %19 = %18 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %20 = [98] : int[]
			_NEW_1DARRAY(_20, 1, 0);
			_20[0] = 98; 
			//indirectinvoke () = %19 (%20) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_20));
//.blklab15
blklab15:;
			//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %22 = %21 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %23 = [32] : int[]
			_NEW_1DARRAY(_23, 1, 0);
			_23[0] = 32; 
			//indirectinvoke () = %22 (%23) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_23));
			//const %24 = 1 : int
			_24 = 1;
			//add %25 = %5, %24 : int
			_25=x+_24;
			//assign %5 = %25  : int
			x = _25;
//.blklab13
blklab13:;
		}
//.blklab12
blklab12:;
		//const %26 = 1 : int
		_26 = 1;
		//add %27 = %4, %26 : int
		_27=y+_26;
		//assign %4 = %27  : int
		y = _27;
		//fieldload %28 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %29 = %28 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %30 = [] : void[]
		_NEW_1DARRAY(_30, 0, 0);
		//indirectinvoke () = %29 (%30) : method(int[])->()
		println_s(_30, _30_size);
//.blklab11
blklab11:;
	}
//.blklab10
blklab10:;
	//return
	return;
}

int main(int argc, char** args){
	long long* n;
	long long max = 0;
	long long width = 0;
	long long height = 0;
	long long size = 0;
	_DECL_1DARRAY(pixels);
	_DECL_1DARRAY(newPixels);
	long long* _8;
	_DECL_2DARRAY(_9);
	long long _10 = 0;
	_DECL_1DARRAY(_11);
	long long _12 = 0;
	long long _13 = 0;
	_DECL_1DARRAY(_14);
	long long _15 = 0;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	_DECL_1DARRAY(_20);
	void* _21;
	_DECL_1DARRAY(_23);
	void* _24;
	_DECL_1DARRAY(_26);
	//fieldload %9 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_9);
	//const %10 = 0 : int
	_10 = 0;
	//indexof %11 = %9, %10 : int[][]
	_11=_9[_10];
	//invoke (%8) = (%11) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_8, _11);
	//assign %1 = %8  : null|int
	n = _8;
	//ifis %1, null goto blklab16 : null|int
	if(n == NULL) { goto blklab16;}
	//assign %2 = %1  : int
	max = *n;
	//assign %3 = %2  : int
	width = max;
	//assign %4 = %2  : int
	height = max;
	//mul %12 = %3, %4 : int
	_12=width*height;
	//assign %5 = %12  : int
	size = _12;
	//const %13 = 255 : int
	_13 = 255;
	//arraygen %14 = [13; 5] : int[]
	_NEW_1DARRAY(_14, size, _13);
	//assign %6 = %14  : int[]
	_UPDATE_1DARRAY(pixels, _14);
	//const %15 = 0 : int
	_15 = 0;
	//const %16 = 4 : int
	_16 = 4;
	//mul %17 = %16, %3 : int
	_17=_16*width;
	//const %18 = 3 : int
	_18 = 3;
	//add %19 = %17, %18 : int
	_19=_17+_18;
	//update %6[%19] = %15 : int[] -> int[]
	pixels[_19] = _15;
	//invoke (%20) = (%6, %3, %4) SobelEdge_original:sobelEdgeDetection : function(int[],int,int)->(int[])
	{
		_UPDATE_1DARRAY_SIZE(_20, pixels);
		_20 = sobelEdgeDetection(_1DARRAY_PARAM(pixels), width, height);
	}
	//assign %7 = %20  : int[]
	_UPDATE_1DARRAY(newPixels, _20);
	//fieldload %21 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %22 = %21 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %23 = [73,110,112,117,116,32,73,109,97,103,101,58] : int[]
	_NEW_1DARRAY(_23, 12, 0);
	_23[0] = 73; _23[1] = 110; _23[2] = 112; _23[3] = 117; _23[4] = 116; _23[5] = 32; _23[6] = 73; _23[7] = 109; _23[8] = 97; _23[9] = 103; _23[10] = 101; _23[11] = 58; 
	//indirectinvoke () = %22 (%23) : method(int[])->()
	println_s(_23, _23_size);
	//invoke () = (%0, %6, %3, %4) SobelEdge_original:printImage : method(whiley/lang/System:Console,int[],int,int)->()
	{
		printImage(stdout, _1DARRAY_PARAM(pixels), width, height);
	}
	//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %25 = %24 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %26 = [83,111,98,101,108,32,69,100,103,101,32,68,101,116,101,99,116,105,111,110,58] : int[]
	_NEW_1DARRAY(_26, 21, 0);
	_26[0] = 83; _26[1] = 111; _26[2] = 98; _26[3] = 101; _26[4] = 108; _26[5] = 32; _26[6] = 69; _26[7] = 100; _26[8] = 103; _26[9] = 101; _26[10] = 32; _26[11] = 68; _26[12] = 101; _26[13] = 116; _26[14] = 101; _26[15] = 99; _26[16] = 116; _26[17] = 105; _26[18] = 111; _26[19] = 110; _26[20] = 58; 
	//indirectinvoke () = %25 (%26) : method(int[])->()
	println_s(_26, _26_size);
	//invoke () = (%0, %7, %3, %4) SobelEdge_original:printImage : method(whiley/lang/System:Console,int[],int,int)->()
	{
		printImage(stdout, _1DARRAY_PARAM(newPixels), width, height);
	}
//.blklab16
blklab16:;
	//return
	exit(0);
}

