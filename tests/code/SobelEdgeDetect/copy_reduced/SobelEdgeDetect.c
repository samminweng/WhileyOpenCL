#include "SobelEdgeDetect.h"
long long wrap(long long pos, long long size){
	long long _2 = 0;
	long long _3 = 0;
	long long _4 = 0;
	long long _5 = 0;
	//const %3 = 0 : int
	_3 = 0;
	//ifge %0, %3 goto blklab0 : int
	if(pos>=_3){goto blklab0;}
	//add %4 = %1, %0 : int
	_4=size+pos;
	//assign %0 = %4  : int
	pos = _4;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//iflt %0, %1 goto blklab2 : int
	if(pos<size){goto blklab2;}
	//sub %5 = %0, %1 : int
	_5=pos-size;
	//assign %0 = %5  : int
	pos = _5;
//.blklab2
blklab2:;
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
	return sum;
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
	_DECL_1DARRAY(_25);
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
	_DECL_1DARRAY(_38);
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
	_DECL_1DARRAY(_51);
	long long _52 = 0;
	long long _53 = 0;
	void* _54;
	_DECL_1DARRAY(_56);
	void* _57;
	void* _59;
	_DECL_1DARRAY(_61);
	void* _62;
	long long _64 = 0;
	long long _65 = 0;
	long long _66 = 0;
	long long _67 = 0;
	long long _68 = 0;
	long long _69 = 0;
	long long _70 = 0;
	long long _71 = 0;
	long long _72 = 0;
	long long _73 = 0;
	void* _74;
	_DECL_1DARRAY(_76);
	void* _77;
	long long _79 = 0;
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
	long long _100 = 0;
	long long _101 = 0;
	long long _102 = 0;
	long long _103 = 0;
	long long _104 = 0;
	long long _105 = 0;
	long long _106 = 0;
	long long _107 = 0;
	long long _108 = 0;
	long long _109 = 0;
	long long _110 = 0;
	long long _111 = 0;
	long long _112 = 0;
	long long _113 = 0;
	long long _114 = 0;
	long long _115 = 0;
	long long _116 = 0;
	long long _117 = 0;
	long long _118 = 0;
	long long _119 = 0;
	long long _120 = 0;
	long long _121 = 0;
	long long _122 = 0;
	long long _123 = 0;
	long long _124 = 0;
	long long _125 = 0;
	long long _126 = 0;
	long long _127 = 0;
	long long _128 = 0;
	long long _129 = 0;
	long long _130 = 0;
	long long _131 = 0;
	long long _132 = 0;
	long long _133 = 0;
	long long _134 = 0;
	long long _135 = 0;
	long long _136 = 0;
	long long _137 = 0;
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
	_UPDATE_1DARRAY(pixels, _18);
	//const %19 = 0 : int
	_19 = 0;
	//const %20 = 4 : int
	_20 = 4;
	//mul %21 = %20, %1 : int
	_21=_20*width;
	//const %22 = 4 : int
	_22 = 4;
	//add %23 = %21, %22 : int
	_23=_21+_22;
	//update %4[%23] = %19 : int[] -> int[]
	pixels[_23] = _19;
	//const %24 = 255 : int
	_24 = 255;
	//arraygen %25 = [24; 3] : int[]
	_NEW_1DARRAY(_25, size, _24);
	//assign %5 = %25  : int[]
	_UPDATE_1DARRAY(newPixels, _25);
	//const %26 = 1 : int
	_26 = 1;
	//neg %27 = %26 : int
	_27= -_26;
	//const %28 = 0 : int
	_28 = 0;
	//const %29 = 1 : int
	_29 = 1;
	//const %30 = 2 : int
	_30 = 2;
	//neg %31 = %30 : int
	_31= -_30;
	//const %32 = 0 : int
	_32 = 0;
	//const %33 = 2 : int
	_33 = 2;
	//const %34 = 1 : int
	_34 = 1;
	//neg %35 = %34 : int
	_35= -_34;
	//const %36 = 0 : int
	_36 = 0;
	//const %37 = 1 : int
	_37 = 1;
	//newlist %38 = (%27, %28, %29, %31, %32, %33, %35, %36, %37) : int[]
	_NEW_1DARRAY(_38, 9, 0);
	_38[0] = _27; _38[1] = _28; _38[2] = _29; _38[3] = _31; _38[4] = _32; _38[5] = _33; _38[6] = _35; _38[7] = _36; _38[8] = _37; 
	//assign %6 = %38  : int[]
	_UPDATE_1DARRAY(v_sobel, _38);
	//const %39 = 1 : int
	_39 = 1;
	//const %40 = 2 : int
	_40 = 2;
	//const %41 = 1 : int
	_41 = 1;
	//const %42 = 0 : int
	_42 = 0;
	//const %43 = 0 : int
	_43 = 0;
	//const %44 = 0 : int
	_44 = 0;
	//const %45 = 1 : int
	_45 = 1;
	//neg %46 = %45 : int
	_46= -_45;
	//const %47 = 2 : int
	_47 = 2;
	//neg %48 = %47 : int
	_48= -_47;
	//const %49 = 1 : int
	_49 = 1;
	//neg %50 = %49 : int
	_50= -_49;
	//newlist %51 = (%39, %40, %41, %42, %43, %44, %46, %48, %50) : int[]
	_NEW_1DARRAY(_51, 9, 0);
	_51[0] = _39; _51[1] = _40; _51[2] = _41; _51[3] = _42; _51[4] = _43; _51[5] = _44; _51[6] = _46; _51[7] = _48; _51[8] = _50; 
	//assign %7 = %51  : int[]
	_UPDATE_1DARRAY(h_sobel, _51);
	//const %52 = 0 : int
	_52 = 0;
	//assign %8 = %52  : int
	x = _52;
	//loop (%5, %8, %9, %10, %11, %12, %13, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67, %68, %69, %70, %71, %72, %73, %74, %75, %76, %77, %78, %79, %80, %81, %82, %83)
	while(true){
		//ifge %8, %1 goto blklab7 : int
		if(x>=width){goto blklab7;}
		//const %53 = 0 : int
		_53 = 0;
		//assign %9 = %53  : int
		y = _53;
		//loop (%5, %9, %10, %11, %12, %13, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67, %68, %69, %70, %71, %72, %73, %74, %75, %76, %77, %78, %79, %80, %81)
		while(true){
			//ifge %9, %2 goto blklab9 : int
			if(y>=height){goto blklab9;}
			//fieldload %54 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %55 = %54 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %56 = [65,116,32,120,32,61,32] : int[]
			_NEW_1DARRAY(_56, 7, 0);
			_56[0] = 65; _56[1] = 116; _56[2] = 32; _56[3] = 120; _56[4] = 32; _56[5] = 61; _56[6] = 32; 
			//indirectinvoke () = %55 (%56) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_56));
			//fieldload %57 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %58 = %57 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indirectinvoke () = %58 (%8) : method(any)->()
			printf("%lld", x);
			//fieldload %59 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %60 = %59 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %61 = [32,121,32,61,32] : int[]
			_NEW_1DARRAY(_61, 5, 0);
			_61[0] = 32; _61[1] = 121; _61[2] = 32; _61[3] = 61; _61[4] = 32; 
			//indirectinvoke () = %60 (%61) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_61));
			//fieldload %62 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %63 = %62 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indirectinvoke () = %63 (%9) : method(any)->()
			printf("%lld", y);
			//mul %64 = %9, %1 : int
			_64=y*width;
			//add %65 = %64, %8 : int
			_65=_64+x;
			//assign %10 = %65  : int
			pos = _65;
			//invoke (%66) = (%4, %1, %2, %8, %9, %6) SobelEdgeDetect:convolution : function(int[],int,int,int,int,int[])->(int)
			_66 = convolution(_1DARRAY_PARAM(pixels), width, height, x, y, _1DARRAY_PARAM(v_sobel));
			//assign %11 = %66  : int
			v_g = _66;
			//invoke (%67) = (%4, %1, %2, %8, %9, %7) SobelEdgeDetect:convolution : function(int[],int,int,int,int,int[])->(int)
			_67 = convolution(_1DARRAY_PARAM(pixels), width, height, x, y, _1DARRAY_PARAM(h_sobel));
			//assign %12 = %67  : int
			h_g = _67;
			//invoke (%68) = (%11) whiley/lang/Math:abs : function(int)->(int)
			_68 = llabs(v_g);
			//invoke (%69) = (%12) whiley/lang/Math:abs : function(int)->(int)
			_69 = llabs(h_g);
			//add %70 = %68, %69 : int
			_70=_68+_69;
			//assign %13 = %70  : int
			t_g = _70;
			//const %71 = 128 : int
			_71 = 128;
			//ifle %13, %71 goto blklab11 : int
			if(t_g<=_71){goto blklab11;}
			//const %72 = 255 : int
			_72 = 255;
			//update %5[%10] = %72 : int[] -> int[]
			newPixels[pos] = _72;
			//goto blklab12
			goto blklab12;
//.blklab11
blklab11:;
			//const %73 = 0 : int
			_73 = 0;
			//update %5[%10] = %73 : int[] -> int[]
			newPixels[pos] = _73;
//.blklab12
blklab12:;
			//fieldload %74 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %75 = %74 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %76 = [32,110,101,119,80,105,120,101,108,115,91,112,111,115,93,32,61,32] : int[]
			_NEW_1DARRAY(_76, 18, 0);
			_76[0] = 32; _76[1] = 110; _76[2] = 101; _76[3] = 119; _76[4] = 80; _76[5] = 105; _76[6] = 120; _76[7] = 101; _76[8] = 108; _76[9] = 115; _76[10] = 91; _76[11] = 112; _76[12] = 111; _76[13] = 115; _76[14] = 93; _76[15] = 32; _76[16] = 61; _76[17] = 32; 
			//indirectinvoke () = %75 (%76) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_76));
			//fieldload %77 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %78 = %77 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indexof %79 = %5, %10 : int[]
			_79=newPixels[pos];
			//indirectinvoke () = %78 (%79) : method(any)->()
			printf("%lld\n", _79);
			//const %80 = 1 : int
			_80 = 1;
			//add %81 = %9, %80 : int
			_81=y+_80;
			//assign %9 = %81  : int
			y = _81;
//.blklab10
blklab10:;
		}
//.blklab9
blklab9:;
		//const %82 = 1 : int
		_82 = 1;
		//add %83 = %8, %82 : int
		_83=x+_82;
		//assign %8 = %83  : int
		x = _83;
//.blklab8
blklab8:;
	}
//.blklab7
blklab7:;
	//assert
	{
		//const %84 = 4 : int
		_84 = 4;
		//mul %85 = %84, %1 : int
		_85=_84*width;
		//const %86 = 4 : int
		_86 = 4;
		//add %87 = %85, %86 : int
		_87=_85+_86;
		//indexof %88 = %5, %87 : int[]
		_88=newPixels[_87];
		//const %89 = 0 : int
		_89 = 0;
		//ifeq %88, %89 goto blklab13 : int
		if(_88==_89){goto blklab13;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab13
blklab13:;
	//assert
	}
	//assert
	{
		//const %90 = 3 : int
		_90 = 3;
		//mul %91 = %90, %1 : int
		_91=_90*width;
		//const %92 = 3 : int
		_92 = 3;
		//add %93 = %91, %92 : int
		_93=_91+_92;
		//indexof %94 = %5, %93 : int[]
		_94=newPixels[_93];
		//const %95 = 255 : int
		_95 = 255;
		//ifeq %94, %95 goto blklab14 : int
		if(_94==_95){goto blklab14;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab14
blklab14:;
	//assert
	}
	//assert
	{
		//const %96 = 3 : int
		_96 = 3;
		//mul %97 = %96, %1 : int
		_97=_96*width;
		//const %98 = 4 : int
		_98 = 4;
		//add %99 = %97, %98 : int
		_99=_97+_98;
		//indexof %100 = %5, %99 : int[]
		_100=newPixels[_99];
		//const %101 = 255 : int
		_101 = 255;
		//ifeq %100, %101 goto blklab15 : int
		if(_100==_101){goto blklab15;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab15
blklab15:;
	//assert
	}
	//assert
	{
		//const %102 = 3 : int
		_102 = 3;
		//mul %103 = %102, %1 : int
		_103=_102*width;
		//const %104 = 5 : int
		_104 = 5;
		//add %105 = %103, %104 : int
		_105=_103+_104;
		//indexof %106 = %5, %105 : int[]
		_106=newPixels[_105];
		//const %107 = 255 : int
		_107 = 255;
		//ifeq %106, %107 goto blklab16 : int
		if(_106==_107){goto blklab16;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab16
blklab16:;
	//assert
	}
	//assert
	{
		//const %108 = 4 : int
		_108 = 4;
		//mul %109 = %108, %1 : int
		_109=_108*width;
		//const %110 = 3 : int
		_110 = 3;
		//add %111 = %109, %110 : int
		_111=_109+_110;
		//indexof %112 = %5, %111 : int[]
		_112=newPixels[_111];
		//const %113 = 255 : int
		_113 = 255;
		//ifeq %112, %113 goto blklab17 : int
		if(_112==_113){goto blklab17;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab17
blklab17:;
	//assert
	}
	//assert
	{
		//const %114 = 4 : int
		_114 = 4;
		//mul %115 = %114, %1 : int
		_115=_114*width;
		//const %116 = 5 : int
		_116 = 5;
		//add %117 = %115, %116 : int
		_117=_115+_116;
		//indexof %118 = %5, %117 : int[]
		_118=newPixels[_117];
		//const %119 = 255 : int
		_119 = 255;
		//ifeq %118, %119 goto blklab18 : int
		if(_118==_119){goto blklab18;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab18
blklab18:;
	//assert
	}
	//assert
	{
		//const %120 = 5 : int
		_120 = 5;
		//mul %121 = %120, %1 : int
		_121=_120*width;
		//const %122 = 3 : int
		_122 = 3;
		//add %123 = %121, %122 : int
		_123=_121+_122;
		//indexof %124 = %5, %123 : int[]
		_124=newPixels[_123];
		//const %125 = 255 : int
		_125 = 255;
		//ifeq %124, %125 goto blklab19 : int
		if(_124==_125){goto blklab19;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab19
blklab19:;
	//assert
	}
	//assert
	{
		//const %126 = 5 : int
		_126 = 5;
		//mul %127 = %126, %1 : int
		_127=_126*width;
		//const %128 = 4 : int
		_128 = 4;
		//add %129 = %127, %128 : int
		_129=_127+_128;
		//indexof %130 = %5, %129 : int[]
		_130=newPixels[_129];
		//const %131 = 255 : int
		_131 = 255;
		//ifeq %130, %131 goto blklab20 : int
		if(_130==_131){goto blklab20;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab20
blklab20:;
	//assert
	}
	//assert
	{
		//const %132 = 5 : int
		_132 = 5;
		//mul %133 = %132, %1 : int
		_133=_132*width;
		//const %134 = 5 : int
		_134 = 5;
		//add %135 = %133, %134 : int
		_135=_133+_134;
		//indexof %136 = %5, %135 : int[]
		_136=newPixels[_135];
		//const %137 = 255 : int
		_137 = 255;
		//ifeq %136, %137 goto blklab21 : int
		if(_136==_137){goto blklab21;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab21
blklab21:;
	//assert
	}
	//return
	exit(0);
}

