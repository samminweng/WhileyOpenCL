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
	//invoke (%39) = (%7) whiley/lang/Math:abs : function(int)->(int)
	_39 = llabs(sum);
	//return %39
	return _39;
	//return
}

int main(int argc, char** args){
	long long width = 0;
	long long height = 0;
	long long size = 0;
	_DECL_1DARRAY(pixels);
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
	long long _16 = 0;
	long long _17 = 0;
	_DECL_1DARRAY(_18);
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	_DECL_1DARRAY(_22);
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
	_DECL_1DARRAY(_35);
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
	_DECL_1DARRAY(_48);
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
	void* _59;
	_DECL_1DARRAY(_61);
	void* _62;
	void* _64;
	_DECL_1DARRAY(_66);
	void* _67;
	long long _69 = 0;
	long long _70 = 0;
	long long _71 = 0;
	long long _72 = 0;
	long long _73 = 0;
	//const %14 = 5 : int
	_14 = 5;
	//assign %1 = %14  : int
	width = _14;
	//const %15 = 5 : int
	_15 = 5;
	//assign %2 = %15  : int
	height = _15;
	//mul %16 = %1, %2 : int
	_16=width*height;
	//assign %3 = %16  : int
	size = _16;
	//const %17 = 255 : int
	_17 = 255;
	//arraygen %18 = [17; 3] : int[]
	_NEW_1DARRAY(_18, size, _17);
	//assign %4 = %18  : int[]
	_COPY_1DARRAY(pixels, _18);
	//const %19 = 0 : int
	_19 = 0;
	//const %20 = 5 : int
	_20 = 5;
	//update %4[%20] = %19 : int[] -> int[]
	pixels[_20] = _19;
	//const %21 = 255 : int
	_21 = 255;
	//arraygen %22 = [21; 3] : int[]
	_NEW_1DARRAY(_22, size, _21);
	//assign %5 = %22  : int[]
	_COPY_1DARRAY(newPixels, _22);
	//const %23 = 1 : int
	_23 = 1;
	//neg %24 = %23 : int
	_24= -_23;
	//const %25 = 2 : int
	_25 = 2;
	//neg %26 = %25 : int
	_26= -_25;
	//const %27 = 1 : int
	_27 = 1;
	//neg %28 = %27 : int
	_28= -_27;
	//const %29 = 0 : int
	_29 = 0;
	//const %30 = 0 : int
	_30 = 0;
	//const %31 = 0 : int
	_31 = 0;
	//const %32 = 1 : int
	_32 = 1;
	//const %33 = 2 : int
	_33 = 2;
	//const %34 = 1 : int
	_34 = 1;
	//newlist %35 = (%24, %26, %28, %29, %30, %31, %32, %33, %34) : int[]
	_NEW_1DARRAY(_35, 9, 0);
	_35[0] = _24; _35[1] = _26; _35[2] = _28; _35[3] = _29; _35[4] = _30; _35[5] = _31; _35[6] = _32; _35[7] = _33; _35[8] = _34; 
	//assign %6 = %35  : int[]
	_COPY_1DARRAY(v_sobel, _35);
	//const %36 = 1 : int
	_36 = 1;
	//const %37 = 2 : int
	_37 = 2;
	//const %38 = 1 : int
	_38 = 1;
	//const %39 = 0 : int
	_39 = 0;
	//const %40 = 0 : int
	_40 = 0;
	//const %41 = 0 : int
	_41 = 0;
	//const %42 = 1 : int
	_42 = 1;
	//neg %43 = %42 : int
	_43= -_42;
	//const %44 = 2 : int
	_44 = 2;
	//neg %45 = %44 : int
	_45= -_44;
	//const %46 = 1 : int
	_46 = 1;
	//neg %47 = %46 : int
	_47= -_46;
	//newlist %48 = (%36, %37, %38, %39, %40, %41, %43, %45, %47) : int[]
	_NEW_1DARRAY(_48, 9, 0);
	_48[0] = _36; _48[1] = _37; _48[2] = _38; _48[3] = _39; _48[4] = _40; _48[5] = _41; _48[6] = _43; _48[7] = _45; _48[8] = _47; 
	//assign %7 = %48  : int[]
	_COPY_1DARRAY(h_sobel, _48);
	//const %49 = 0 : int
	_49 = 0;
	//assign %8 = %49  : int
	x = _49;
	//loop (%5, %8, %9, %10, %11, %12, %13, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67, %68, %69, %70, %71, %72, %73)
	while(true){
		//ifge %8, %1 goto blklab7 : int
		if(x>=width){goto blklab7;}
		//const %50 = 0 : int
		_50 = 0;
		//assign %9 = %50  : int
		y = _50;
		//loop (%5, %9, %10, %11, %12, %13, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67, %68, %69, %70, %71)
		while(true){
			//ifge %9, %2 goto blklab9 : int
			if(y>=height){goto blklab9;}
			//mul %51 = %8, %1 : int
			_51=x*width;
			//add %52 = %51, %9 : int
			_52=_51+y;
			//assign %10 = %52  : int
			pos = _52;
			//invoke (%53) = (%4, %1, %2, %8, %9, %6) SobelEdgeDetect:convolution : function(int[],int,int,int,int,int[])->(int)
			_53 = convolution(_COPY_1DARRAY_PARAM(pixels), width, height, x, y, _COPY_1DARRAY_PARAM(v_sobel));
			//assign %11 = %53  : int
			v_g = _53;
			//invoke (%54) = (%4, %1, %2, %8, %9, %7) SobelEdgeDetect:convolution : function(int[],int,int,int,int,int[])->(int)
			_54 = convolution(_COPY_1DARRAY_PARAM(pixels), width, height, x, y, _COPY_1DARRAY_PARAM(h_sobel));
			//assign %12 = %54  : int
			h_g = _54;
			//add %55 = %11, %12 : int
			_55=v_g+h_g;
			//assign %13 = %55  : int
			t_g = _55;
			//const %56 = 250 : int
			_56 = 250;
			//ifle %13, %56 goto blklab11 : int
			if(t_g<=_56){goto blklab11;}
			//const %57 = 0 : int
			_57 = 0;
			//update %5[%10] = %57 : int[] -> int[]
			newPixels[pos] = _57;
			//goto blklab12
			goto blklab12;
//.blklab11
blklab11:;
			//const %58 = 255 : int
			_58 = 255;
			//update %5[%10] = %58 : int[] -> int[]
			newPixels[pos] = _58;
//.blklab12
blklab12:;
			//fieldload %59 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %60 = %59 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %61 = [65,116,32,112,111,115,32,61,32] : int[]
			_NEW_1DARRAY(_61, 9, 0);
			_61[0] = 65; _61[1] = 116; _61[2] = 32; _61[3] = 112; _61[4] = 111; _61[5] = 115; _61[6] = 32; _61[7] = 61; _61[8] = 32; 
			//indirectinvoke () = %60 (%61) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_61));
			//fieldload %62 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %63 = %62 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indirectinvoke () = %63 (%10) : method(any)->()
			printf("%lld", pos);
			//fieldload %64 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %65 = %64 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %66 = [44,32,110,101,119,80,105,120,101,108,115,91,112,111,115,93,32,61,32] : int[]
			_NEW_1DARRAY(_66, 19, 0);
			_66[0] = 44; _66[1] = 32; _66[2] = 110; _66[3] = 101; _66[4] = 119; _66[5] = 80; _66[6] = 105; _66[7] = 120; _66[8] = 101; _66[9] = 108; _66[10] = 115; _66[11] = 91; _66[12] = 112; _66[13] = 111; _66[14] = 115; _66[15] = 93; _66[16] = 32; _66[17] = 61; _66[18] = 32; 
			//indirectinvoke () = %65 (%66) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_66));
			//fieldload %67 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %68 = %67 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indexof %69 = %5, %10 : int[]
			_69=newPixels[pos];
			//indirectinvoke () = %68 (%69) : method(any)->()
			printf("%lld\n", _69);
			//const %70 = 1 : int
			_70 = 1;
			//add %71 = %9, %70 : int
			_71=y+_70;
			//assign %9 = %71  : int
			y = _71;
//.blklab10
blklab10:;
		}
//.blklab9
blklab9:;
		//const %72 = 1 : int
		_72 = 1;
		//add %73 = %8, %72 : int
		_73=x+_72;
		//assign %8 = %73  : int
		x = _73;
//.blklab8
blklab8:;
	}
//.blklab7
blklab7:;
	//return
	exit(0);
}

