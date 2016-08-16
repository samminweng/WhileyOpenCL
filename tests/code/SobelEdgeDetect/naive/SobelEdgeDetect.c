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
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	long long _25 = 0;
	long long _26 = 0;
	long long _27 = 0;
	_DECL_1DARRAY(_28);
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
	_DECL_1DARRAY(_41);
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
	_DECL_1DARRAY(_54);
	long long _55 = 0;
	long long _56 = 0;
	long long _57 = 0;
	long long _58 = 0;
	long long _59 = 0;
	long long _60 = 0;
	long long _61 = 0;
	long long _62 = 0;
	long long _63 = 0;
	long long _64 = 0;
	void* _65;
	_DECL_1DARRAY(_67);
	void* _68;
	void* _70;
	_DECL_1DARRAY(_72);
	void* _73;
	void* _75;
	_DECL_1DARRAY(_77);
	void* _78;
	long long _80 = 0;
	long long _81 = 0;
	long long _82 = 0;
	long long _83 = 0;
	long long _84 = 0;
	long long _85 = 0;
	long long _86 = 0;
	long long _87 = 0;
	long long _88 = 0;
	long long _89 = 0;
	long long _90 = 0;
	long long _91 = 0;
	long long _92 = 0;
	long long _93 = 0;
	long long _94 = 0;
	long long _95 = 0;
	long long _96 = 0;
	long long _97 = 0;
	long long _98 = 0;
	long long _99 = 0;
	//const %14 = 8 : int
	_14 = 8;
	//assign %1 = %14  : int
	width = _14;
	//const %15 = 8 : int
	_15 = 8;
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
	//const %20 = 27 : int
	_20 = 27;
	//update %4[%20] = %19 : int[] -> int[]
	pixels[_20] = _19;
	//const %21 = 0 : int
	_21 = 0;
	//const %22 = 28 : int
	_22 = 28;
	//update %4[%22] = %21 : int[] -> int[]
	pixels[_22] = _21;
	//const %23 = 0 : int
	_23 = 0;
	//const %24 = 35 : int
	_24 = 35;
	//update %4[%24] = %23 : int[] -> int[]
	pixels[_24] = _23;
	//const %25 = 0 : int
	_25 = 0;
	//const %26 = 36 : int
	_26 = 36;
	//update %4[%26] = %25 : int[] -> int[]
	pixels[_26] = _25;
	//const %27 = 255 : int
	_27 = 255;
	//arraygen %28 = [27; 3] : int[]
	_NEW_1DARRAY(_28, size, _27);
	//assign %5 = %28  : int[]
	_COPY_1DARRAY(newPixels, _28);
	//const %29 = 1 : int
	_29 = 1;
	//neg %30 = %29 : int
	_30= -_29;
	//const %31 = 2 : int
	_31 = 2;
	//neg %32 = %31 : int
	_32= -_31;
	//const %33 = 1 : int
	_33 = 1;
	//neg %34 = %33 : int
	_34= -_33;
	//const %35 = 0 : int
	_35 = 0;
	//const %36 = 0 : int
	_36 = 0;
	//const %37 = 0 : int
	_37 = 0;
	//const %38 = 1 : int
	_38 = 1;
	//const %39 = 2 : int
	_39 = 2;
	//const %40 = 1 : int
	_40 = 1;
	//newlist %41 = (%30, %32, %34, %35, %36, %37, %38, %39, %40) : int[]
	_NEW_1DARRAY(_41, 9, 0);
	_41[0] = _30; _41[1] = _32; _41[2] = _34; _41[3] = _35; _41[4] = _36; _41[5] = _37; _41[6] = _38; _41[7] = _39; _41[8] = _40; 
	//assign %6 = %41  : int[]
	_COPY_1DARRAY(v_sobel, _41);
	//const %42 = 1 : int
	_42 = 1;
	//const %43 = 2 : int
	_43 = 2;
	//const %44 = 1 : int
	_44 = 1;
	//const %45 = 0 : int
	_45 = 0;
	//const %46 = 0 : int
	_46 = 0;
	//const %47 = 0 : int
	_47 = 0;
	//const %48 = 1 : int
	_48 = 1;
	//neg %49 = %48 : int
	_49= -_48;
	//const %50 = 2 : int
	_50 = 2;
	//neg %51 = %50 : int
	_51= -_50;
	//const %52 = 1 : int
	_52 = 1;
	//neg %53 = %52 : int
	_53= -_52;
	//newlist %54 = (%42, %43, %44, %45, %46, %47, %49, %51, %53) : int[]
	_NEW_1DARRAY(_54, 9, 0);
	_54[0] = _42; _54[1] = _43; _54[2] = _44; _54[3] = _45; _54[4] = _46; _54[5] = _47; _54[6] = _49; _54[7] = _51; _54[8] = _53; 
	//assign %7 = %54  : int[]
	_COPY_1DARRAY(h_sobel, _54);
	//const %55 = 0 : int
	_55 = 0;
	//assign %8 = %55  : int
	x = _55;
	//loop (%5, %8, %9, %10, %11, %12, %13, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67, %68, %69, %70, %71, %72, %73, %74, %75, %76, %77, %78, %79, %80, %81, %82, %83, %84)
	while(true){
		//ifge %8, %1 goto blklab7 : int
		if(x>=width){goto blklab7;}
		//const %56 = 0 : int
		_56 = 0;
		//assign %9 = %56  : int
		y = _56;
		//loop (%5, %9, %10, %11, %12, %13, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67, %68, %69, %70, %71, %72, %73, %74, %75, %76, %77, %78, %79, %80, %81, %82)
		while(true){
			//ifge %9, %2 goto blklab9 : int
			if(y>=height){goto blklab9;}
			//mul %57 = %8, %1 : int
			_57=x*width;
			//add %58 = %57, %9 : int
			_58=_57+y;
			//assign %10 = %58  : int
			pos = _58;
			//invoke (%59) = (%4, %1, %2, %8, %9, %6) SobelEdgeDetect:convolution : function(int[],int,int,int,int,int[])->(int)
			_59 = convolution(_COPY_1DARRAY_PARAM(pixels), width, height, x, y, _COPY_1DARRAY_PARAM(v_sobel));
			//assign %11 = %59  : int
			v_g = _59;
			//invoke (%60) = (%4, %1, %2, %8, %9, %7) SobelEdgeDetect:convolution : function(int[],int,int,int,int,int[])->(int)
			_60 = convolution(_COPY_1DARRAY_PARAM(pixels), width, height, x, y, _COPY_1DARRAY_PARAM(h_sobel));
			//assign %12 = %60  : int
			h_g = _60;
			//add %61 = %11, %12 : int
			_61=v_g+h_g;
			//assign %13 = %61  : int
			t_g = _61;
			//const %62 = 250 : int
			_62 = 250;
			//ifle %13, %62 goto blklab11 : int
			if(t_g<=_62){goto blklab11;}
			//const %63 = 255 : int
			_63 = 255;
			//update %5[%10] = %63 : int[] -> int[]
			newPixels[pos] = _63;
			//goto blklab12
			goto blklab12;
//.blklab11
blklab11:;
			//const %64 = 0 : int
			_64 = 0;
			//update %5[%10] = %64 : int[] -> int[]
			newPixels[pos] = _64;
//.blklab12
blklab12:;
			//fieldload %65 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %66 = %65 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %67 = [65,116,32,120,32,61,32] : int[]
			_NEW_1DARRAY(_67, 7, 0);
			_67[0] = 65; _67[1] = 116; _67[2] = 32; _67[3] = 120; _67[4] = 32; _67[5] = 61; _67[6] = 32; 
			//indirectinvoke () = %66 (%67) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_67));
			//fieldload %68 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %69 = %68 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indirectinvoke () = %69 (%8) : method(any)->()
			printf("%lld", x);
			//fieldload %70 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %71 = %70 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %72 = [32,121,32,61,32] : int[]
			_NEW_1DARRAY(_72, 5, 0);
			_72[0] = 32; _72[1] = 121; _72[2] = 32; _72[3] = 61; _72[4] = 32; 
			//indirectinvoke () = %71 (%72) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_72));
			//fieldload %73 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %74 = %73 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indirectinvoke () = %74 (%9) : method(any)->()
			printf("%lld", y);
			//fieldload %75 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %76 = %75 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %77 = [32,110,101,119,80,105,120,101,108,115,91,112,111,115,93,32,61,32] : int[]
			_NEW_1DARRAY(_77, 18, 0);
			_77[0] = 32; _77[1] = 110; _77[2] = 101; _77[3] = 119; _77[4] = 80; _77[5] = 105; _77[6] = 120; _77[7] = 101; _77[8] = 108; _77[9] = 115; _77[10] = 91; _77[11] = 112; _77[12] = 111; _77[13] = 115; _77[14] = 93; _77[15] = 32; _77[16] = 61; _77[17] = 32; 
			//indirectinvoke () = %76 (%77) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_77));
			//fieldload %78 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %79 = %78 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indexof %80 = %5, %10 : int[]
			_80=newPixels[pos];
			//indirectinvoke () = %79 (%80) : method(any)->()
			printf("%lld\n", _80);
			//const %81 = 1 : int
			_81 = 1;
			//add %82 = %9, %81 : int
			_82=y+_81;
			//assign %9 = %82  : int
			y = _82;
//.blklab10
blklab10:;
		}
//.blklab9
blklab9:;
		//const %83 = 1 : int
		_83 = 1;
		//add %84 = %8, %83 : int
		_84=x+_83;
		//assign %8 = %84  : int
		x = _84;
//.blklab8
blklab8:;
	}
//.blklab7
blklab7:;
	//assert
	{
		//const %85 = 18 : int
		_85 = 18;
		//indexof %86 = %5, %85 : int[]
		_86=newPixels[_85];
		//const %87 = 255 : int
		_87 = 255;
		//ifeq %86, %87 goto blklab13 : int
		if(_86==_87){goto blklab13;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab13
blklab13:;
	//assert
	}
	//assert
	{
		//const %88 = 36 : int
		_88 = 36;
		//indexof %89 = %5, %88 : int[]
		_89=newPixels[_88];
		//const %90 = 255 : int
		_90 = 255;
		//ifeq %89, %90 goto blklab14 : int
		if(_89==_90){goto blklab14;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab14
blklab14:;
	//assert
	}
	//assert
	{
		//const %91 = 45 : int
		_91 = 45;
		//indexof %92 = %5, %91 : int[]
		_92=newPixels[_91];
		//const %93 = 255 : int
		_93 = 255;
		//ifeq %92, %93 goto blklab15 : int
		if(_92==_93){goto blklab15;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab15
blklab15:;
	//assert
	}
	//assert
	{
		//const %94 = 0 : int
		_94 = 0;
		//indexof %95 = %5, %94 : int[]
		_95=newPixels[_94];
		//const %96 = 0 : int
		_96 = 0;
		//ifeq %95, %96 goto blklab16 : int
		if(_95==_96){goto blklab16;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab16
blklab16:;
	//assert
	}
	//assert
	{
		//const %97 = 63 : int
		_97 = 63;
		//indexof %98 = %5, %97 : int[]
		_98=newPixels[_97];
		//const %99 = 0 : int
		_99 = 0;
		//ifeq %98, %99 goto blklab17 : int
		if(_98==_99){goto blklab17;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab17
blklab17:;
	//assert
	}
	//return
	exit(0);
}

