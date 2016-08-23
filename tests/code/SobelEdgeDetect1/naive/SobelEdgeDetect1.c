#include "SobelEdgeDetect1.h"
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
	_COPY_1DARRAY(newPixels, _16);
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
	_COPY_1DARRAY(v_sobel, _29);
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
	_COPY_1DARRAY(h_sobel, _42);
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
			//invoke (%47) = (%0, %1, %2, %8, %9, %6) SobelEdgeDetect1:convolution : function(int[],int,int,int,int,int[])->(int)
			_47 = convolution(_COPY_1DARRAY_PARAM(pixels), width, height, x, y, _COPY_1DARRAY_PARAM(v_sobel));
			//assign %11 = %47  : int
			v_g = _47;
			//invoke (%48) = (%0, %1, %2, %8, %9, %7) SobelEdgeDetect1:convolution : function(int[],int,int,int,int,int[])->(int)
			_48 = convolution(_COPY_1DARRAY_PARAM(pixels), width, height, x, y, _COPY_1DARRAY_PARAM(h_sobel));
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
	void* _13;
	_DECL_1DARRAY(_15);
	void* _16;
	_DECL_1DARRAY(_18);
	void* _19;
	_DECL_1DARRAY(_21);
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	long long _25 = 0;
	void* _26;
	void* _28;
	long long _28_size = 0;
	//const %7 = 0 : int
	_7 = 0;
	//assign %4 = %7  : int
	y = _7;
	//loop (%4, %5, %6, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28)
	while(true){
		//ifge %4, %3 goto blklab10 : int
		if(y>=height){goto blklab10;}
		//const %8 = 0 : int
		_8 = 0;
		//assign %5 = %8  : int
		x = _8;
		//loop (%5, %6, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23)
		while(true){
			//ifge %5, %2 goto blklab12 : int
			if(x>=width){goto blklab12;}
			//mul %9 = %4, %2 : int
			_9=y*width;
			//add %10 = %9, %5 : int
			_10=_9+x;
			//assign %6 = %10  : int
			pos = _10;
			//indexof %11 = %1, %6 : int[]
			_11=pixels[pos];
			//const %12 = 255 : int
			_12 = 255;
			//ifne %11, %12 goto blklab14 : int
			if(_11!=_12){goto blklab14;}
			//fieldload %13 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %14 = %13 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %15 = [119] : int[]
			_NEW_1DARRAY(_15, 1, 0);
			_15[0] = 119; 
			//indirectinvoke () = %14 (%15) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_15));
			//goto blklab15
			goto blklab15;
//.blklab14
blklab14:;
			//fieldload %16 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %17 = %16 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %18 = [98] : int[]
			_NEW_1DARRAY(_18, 1, 0);
			_18[0] = 98; 
			//indirectinvoke () = %17 (%18) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_18));
//.blklab15
blklab15:;
			//fieldload %19 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %20 = %19 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %21 = [32] : int[]
			_NEW_1DARRAY(_21, 1, 0);
			_21[0] = 32; 
			//indirectinvoke () = %20 (%21) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_21));
			//const %22 = 1 : int
			_22 = 1;
			//add %23 = %5, %22 : int
			_23=x+_22;
			//assign %5 = %23  : int
			x = _23;
//.blklab13
blklab13:;
		}
//.blklab12
blklab12:;
		//const %24 = 1 : int
		_24 = 1;
		//add %25 = %4, %24 : int
		_25=y+_24;
		//assign %4 = %25  : int
		y = _25;
		//fieldload %26 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %27 = %26 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %28 = [] : void[]
		_NEW_1DARRAY(_28, 0, 0);
		//indirectinvoke () = %27 (%28) : method(int[])->()
		println_s(_28, _28_size);
//.blklab11
blklab11:;
	}
//.blklab10
blklab10:;
	//return
	return;
}

int main(int argc, char** args){
	long long width = 0;
	long long height = 0;
	long long size = 0;
	_DECL_1DARRAY(pixels);
	_DECL_1DARRAY(newPixels);
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	_DECL_1DARRAY(_10);
	long long _11 = 0;
	long long _12 = 0;
	_DECL_1DARRAY(_13);
	void* _14;
	_DECL_1DARRAY(_16);
	void* _17;
	_DECL_1DARRAY(_19);
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
	long long _41 = 0;
	long long _42 = 0;
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
	//const %6 = 8 : int
	_6 = 8;
	//assign %1 = %6  : int
	width = _6;
	//const %7 = 8 : int
	_7 = 8;
	//assign %2 = %7  : int
	height = _7;
	//mul %8 = %1, %2 : int
	_8=width*height;
	//assign %3 = %8  : int
	size = _8;
	//const %9 = 255 : int
	_9 = 255;
	//arraygen %10 = [9; 3] : int[]
	_NEW_1DARRAY(_10, size, _9);
	//assign %4 = %10  : int[]
	_COPY_1DARRAY(pixels, _10);
	//const %11 = 0 : int
	_11 = 0;
	//const %12 = 0 : int
	_12 = 0;
	//update %4[%12] = %11 : int[] -> int[]
	pixels[_12] = _11;
	//invoke (%13) = (%4, %1, %2) SobelEdgeDetect1:sobelEdgeDetection : function(int[],int,int)->(int[])
	_UPDATE_1DARRAY_SIZE(_13, pixels);
	_13 = sobelEdgeDetection(_COPY_1DARRAY_PARAM(pixels), width, height);
	//assign %5 = %13  : int[]
	_COPY_1DARRAY(newPixels, _13);
	//fieldload %14 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %15 = %14 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %16 = [73,110,112,117,116,32,73,109,97,103,101,58] : int[]
	_NEW_1DARRAY(_16, 12, 0);
	_16[0] = 73; _16[1] = 110; _16[2] = 112; _16[3] = 117; _16[4] = 116; _16[5] = 32; _16[6] = 73; _16[7] = 109; _16[8] = 97; _16[9] = 103; _16[10] = 101; _16[11] = 58; 
	//indirectinvoke () = %15 (%16) : method(int[])->()
	println_s(_16, _16_size);
	//invoke () = (%0, %4, %1, %2) SobelEdgeDetect1:printImage : method(whiley/lang/System:Console,int[],int,int)->()
printImage(stdout, _COPY_1DARRAY_PARAM(pixels), width, height);
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %19 = [83,111,98,101,108,32,69,100,103,101,32,68,101,116,101,99,116,105,111,110,58] : int[]
	_NEW_1DARRAY(_19, 21, 0);
	_19[0] = 83; _19[1] = 111; _19[2] = 98; _19[3] = 101; _19[4] = 108; _19[5] = 32; _19[6] = 69; _19[7] = 100; _19[8] = 103; _19[9] = 101; _19[10] = 32; _19[11] = 68; _19[12] = 101; _19[13] = 116; _19[14] = 101; _19[15] = 99; _19[16] = 116; _19[17] = 105; _19[18] = 111; _19[19] = 110; _19[20] = 58; 
	//indirectinvoke () = %18 (%19) : method(int[])->()
	println_s(_19, _19_size);
	//invoke () = (%0, %5, %1, %2) SobelEdgeDetect1:printImage : method(whiley/lang/System:Console,int[],int,int)->()
printImage(stdout, _COPY_1DARRAY_PARAM(newPixels), width, height);
	//assert
	{
		//const %20 = 0 : int
		_20 = 0;
		//indexof %21 = %5, %20 : int[]
		_21=newPixels[_20];
		//const %22 = 0 : int
		_22 = 0;
		//ifeq %21, %22 goto blklab16 : int
		if(_21==_22){goto blklab16;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab16
blklab16:;
	//assert
	}
	//assert
	{
		//const %23 = 1 : int
		_23 = 1;
		//indexof %24 = %5, %23 : int[]
		_24=newPixels[_23];
		//const %25 = 255 : int
		_25 = 255;
		//ifeq %24, %25 goto blklab17 : int
		if(_24==_25){goto blklab17;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab17
blklab17:;
	//assert
	}
	//assert
	{
		//indexof %26 = %5, %1 : int[]
		_26=newPixels[width];
		//const %27 = 255 : int
		_27 = 255;
		//ifeq %26, %27 goto blklab18 : int
		if(_26==_27){goto blklab18;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab18
blklab18:;
	//assert
	}
	//assert
	{
		//const %28 = 1 : int
		_28 = 1;
		//add %29 = %1, %28 : int
		_29=width+_28;
		//indexof %30 = %5, %29 : int[]
		_30=newPixels[_29];
		//const %31 = 255 : int
		_31 = 255;
		//ifeq %30, %31 goto blklab19 : int
		if(_30==_31){goto blklab19;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab19
blklab19:;
	//assert
	}
	//assert
	{
		//const %32 = 7 : int
		_32 = 7;
		//mul %33 = %32, %1 : int
		_33=_32*width;
		//indexof %34 = %5, %33 : int[]
		_34=newPixels[_33];
		//const %35 = 255 : int
		_35 = 255;
		//ifeq %34, %35 goto blklab20 : int
		if(_34==_35){goto blklab20;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab20
blklab20:;
	//assert
	}
	//assert
	{
		//const %36 = 7 : int
		_36 = 7;
		//mul %37 = %36, %1 : int
		_37=_36*width;
		//const %38 = 1 : int
		_38 = 1;
		//add %39 = %37, %38 : int
		_39=_37+_38;
		//indexof %40 = %5, %39 : int[]
		_40=newPixels[_39];
		//const %41 = 255 : int
		_41 = 255;
		//ifeq %40, %41 goto blklab21 : int
		if(_40==_41){goto blklab21;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab21
blklab21:;
	//assert
	}
	//assert
	{
		//const %42 = 7 : int
		_42 = 7;
		//indexof %43 = %5, %42 : int[]
		_43=newPixels[_42];
		//const %44 = 255 : int
		_44 = 255;
		//ifeq %43, %44 goto blklab22 : int
		if(_43==_44){goto blklab22;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab22
blklab22:;
	//assert
	}
	//assert
	{
		//const %45 = 7 : int
		_45 = 7;
		//add %46 = %1, %45 : int
		_46=width+_45;
		//indexof %47 = %5, %46 : int[]
		_47=newPixels[_46];
		//const %48 = 255 : int
		_48 = 255;
		//ifeq %47, %48 goto blklab23 : int
		if(_47==_48){goto blklab23;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab23
blklab23:;
	//assert
	}
	//assert
	{
		//const %49 = 7 : int
		_49 = 7;
		//mul %50 = %49, %1 : int
		_50=_49*width;
		//const %51 = 7 : int
		_51 = 7;
		//add %52 = %50, %51 : int
		_52=_50+_51;
		//indexof %53 = %5, %52 : int[]
		_53=newPixels[_52];
		//const %54 = 255 : int
		_54 = 255;
		//ifeq %53, %54 goto blklab24 : int
		if(_53==_54){goto blklab24;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab24
blklab24:;
	//assert
	}
	//return
	exit(0);
}

