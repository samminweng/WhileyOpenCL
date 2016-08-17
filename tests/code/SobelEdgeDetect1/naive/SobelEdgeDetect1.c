#include "SobelEdgeDetect1.h"
long long wrap(long long pos, long long size){
	long long _2 = 0;
	long long _3 = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	//const %3 = 0 : int
	_3 = 0;
	//ifge %0, %3 goto blklab0 : int
	if(pos>=_3){goto blklab0;}
	//const %4 = 0 : int
	_4 = 0;
	//sub %5 = %4, %0 : int
	_5=_4-pos;
	//assign %0 = %5  : int
	pos = _5;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//iflt %0, %1 goto blklab2 : int
	if(pos<size){goto blklab2;}
	//sub %6 = %0, %1 : int
	_6=pos-size;
	//assign %0 = %6  : int
	pos = _6;
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
		//invoke (%20) = (%22, %2) SobelEdgeDetect1:wrap : function(int,int)->(int)
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
			//invoke (%24) = (%26, %1) SobelEdgeDetect1:wrap : function(int,int)->(int)
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
	void* _51;
	_DECL_1DARRAY(_53);
	void* _54;
	void* _56;
	_DECL_1DARRAY(_58);
	void* _59;
	long long _61 = 0;
	long long _62 = 0;
	long long _63 = 0;
	long long _64 = 0;
	long long _65 = 0;
	long long _66 = 0;
	long long _67 = 0;
	long long _68 = 0;
	long long _69 = 0;
	long long _70 = 0;
	void* _71;
	_DECL_1DARRAY(_73);
	void* _74;
	long long _76 = 0;
	long long _77 = 0;
	long long _78 = 0;
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
	//const %20 = 0 : int
	_20 = 0;
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
	//const %25 = 0 : int
	_25 = 0;
	//const %26 = 1 : int
	_26 = 1;
	//const %27 = 2 : int
	_27 = 2;
	//neg %28 = %27 : int
	_28= -_27;
	//const %29 = 0 : int
	_29 = 0;
	//const %30 = 2 : int
	_30 = 2;
	//const %31 = 1 : int
	_31 = 1;
	//neg %32 = %31 : int
	_32= -_31;
	//const %33 = 0 : int
	_33 = 0;
	//const %34 = 1 : int
	_34 = 1;
	//newlist %35 = (%24, %25, %26, %28, %29, %30, %32, %33, %34) : int[]
	_NEW_1DARRAY(_35, 9, 0);
	_35[0] = _24; _35[1] = _25; _35[2] = _26; _35[3] = _28; _35[4] = _29; _35[5] = _30; _35[6] = _32; _35[7] = _33; _35[8] = _34; 
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
	//loop (%5, %8, %9, %10, %11, %12, %13, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67, %68, %69, %70, %71, %72, %73, %74, %75, %76, %77, %78, %79, %80)
	while(true){
		//ifge %8, %1 goto blklab7 : int
		if(x>=width){goto blklab7;}
		//const %50 = 0 : int
		_50 = 0;
		//assign %9 = %50  : int
		y = _50;
		//loop (%5, %9, %10, %11, %12, %13, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67, %68, %69, %70, %71, %72, %73, %74, %75, %76, %77, %78)
		while(true){
			//ifge %9, %2 goto blklab9 : int
			if(y>=height){goto blklab9;}
			//fieldload %51 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %52 = %51 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %53 = [65,116,32,120,32,61,32] : int[]
			_NEW_1DARRAY(_53, 7, 0);
			_53[0] = 65; _53[1] = 116; _53[2] = 32; _53[3] = 120; _53[4] = 32; _53[5] = 61; _53[6] = 32; 
			//indirectinvoke () = %52 (%53) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_53));
			//fieldload %54 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %55 = %54 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indirectinvoke () = %55 (%8) : method(any)->()
			printf("%lld", x);
			//fieldload %56 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %57 = %56 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %58 = [32,121,32,61,32] : int[]
			_NEW_1DARRAY(_58, 5, 0);
			_58[0] = 32; _58[1] = 121; _58[2] = 32; _58[3] = 61; _58[4] = 32; 
			//indirectinvoke () = %57 (%58) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_58));
			//fieldload %59 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %60 = %59 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indirectinvoke () = %60 (%9) : method(any)->()
			printf("%lld", y);
			//mul %61 = %9, %1 : int
			_61=y*width;
			//add %62 = %61, %8 : int
			_62=_61+x;
			//assign %10 = %62  : int
			pos = _62;
			//invoke (%63) = (%4, %1, %2, %8, %9, %6) SobelEdgeDetect1:convolution : function(int[],int,int,int,int,int[])->(int)
			_63 = convolution(_COPY_1DARRAY_PARAM(pixels), width, height, x, y, _COPY_1DARRAY_PARAM(v_sobel));
			//assign %11 = %63  : int
			v_g = _63;
			//invoke (%64) = (%4, %1, %2, %8, %9, %7) SobelEdgeDetect1:convolution : function(int[],int,int,int,int,int[])->(int)
			_64 = convolution(_COPY_1DARRAY_PARAM(pixels), width, height, x, y, _COPY_1DARRAY_PARAM(h_sobel));
			//assign %12 = %64  : int
			h_g = _64;
			//invoke (%65) = (%11) whiley/lang/Math:abs : function(int)->(int)
			_65 = llabs(v_g);
			//invoke (%66) = (%12) whiley/lang/Math:abs : function(int)->(int)
			_66 = llabs(h_g);
			//add %67 = %65, %66 : int
			_67=_65+_66;
			//assign %13 = %67  : int
			t_g = _67;
			//const %68 = 128 : int
			_68 = 128;
			//ifle %13, %68 goto blklab11 : int
			if(t_g<=_68){goto blklab11;}
			//const %69 = 255 : int
			_69 = 255;
			//update %5[%10] = %69 : int[] -> int[]
			newPixels[pos] = _69;
			//goto blklab12
			goto blklab12;
//.blklab11
blklab11:;
			//const %70 = 0 : int
			_70 = 0;
			//update %5[%10] = %70 : int[] -> int[]
			newPixels[pos] = _70;
//.blklab12
blklab12:;
			//fieldload %71 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %72 = %71 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//const %73 = [32,110,101,119,80,105,120,101,108,115,91,112,111,115,93,32,61,32] : int[]
			_NEW_1DARRAY(_73, 18, 0);
			_73[0] = 32; _73[1] = 110; _73[2] = 101; _73[3] = 119; _73[4] = 80; _73[5] = 105; _73[6] = 120; _73[7] = 101; _73[8] = 108; _73[9] = 115; _73[10] = 91; _73[11] = 112; _73[12] = 111; _73[13] = 115; _73[14] = 93; _73[15] = 32; _73[16] = 61; _73[17] = 32; 
			//indirectinvoke () = %72 (%73) : method(int[])->()
			printf_s(_1DARRAY_PARAM(_73));
			//fieldload %74 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
			//fieldload %75 = %74 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
			//indexof %76 = %5, %10 : int[]
			_76=newPixels[pos];
			//indirectinvoke () = %75 (%76) : method(any)->()
			printf("%lld\n", _76);
			//const %77 = 1 : int
			_77 = 1;
			//add %78 = %9, %77 : int
			_78=y+_77;
			//assign %9 = %78  : int
			y = _78;
//.blklab10
blklab10:;
		}
//.blklab9
blklab9:;
		//const %79 = 1 : int
		_79 = 1;
		//add %80 = %8, %79 : int
		_80=x+_79;
		//assign %8 = %80  : int
		x = _80;
//.blklab8
blklab8:;
	}
//.blklab7
blklab7:;
	//assert
	{
		//const %81 = 0 : int
		_81 = 0;
		//indexof %82 = %5, %81 : int[]
		_82=newPixels[_81];
		//const %83 = 0 : int
		_83 = 0;
		//ifeq %82, %83 goto blklab13 : int
		if(_82==_83){goto blklab13;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab13
blklab13:;
	//assert
	}
	//assert
	{
		//const %84 = 1 : int
		_84 = 1;
		//indexof %85 = %5, %84 : int[]
		_85=newPixels[_84];
		//const %86 = 255 : int
		_86 = 255;
		//ifeq %85, %86 goto blklab14 : int
		if(_85==_86){goto blklab14;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab14
blklab14:;
	//assert
	}
	//assert
	{
		//indexof %87 = %5, %1 : int[]
		_87=newPixels[width];
		//const %88 = 255 : int
		_88 = 255;
		//ifeq %87, %88 goto blklab15 : int
		if(_87==_88){goto blklab15;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab15
blklab15:;
	//assert
	}
	//assert
	{
		//const %89 = 1 : int
		_89 = 1;
		//add %90 = %1, %89 : int
		_90=width+_89;
		//indexof %91 = %5, %90 : int[]
		_91=newPixels[_90];
		//const %92 = 255 : int
		_92 = 255;
		//ifeq %91, %92 goto blklab16 : int
		if(_91==_92){goto blklab16;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab16
blklab16:;
	//assert
	}
	//assert
	{
		//const %93 = 7 : int
		_93 = 7;
		//mul %94 = %93, %1 : int
		_94=_93*width;
		//indexof %95 = %5, %94 : int[]
		_95=newPixels[_94];
		//const %96 = 255 : int
		_96 = 255;
		//ifeq %95, %96 goto blklab17 : int
		if(_95==_96){goto blklab17;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab17
blklab17:;
	//assert
	}
	//assert
	{
		//const %97 = 7 : int
		_97 = 7;
		//mul %98 = %97, %1 : int
		_98=_97*width;
		//const %99 = 1 : int
		_99 = 1;
		//add %100 = %98, %99 : int
		_100=_98+_99;
		//indexof %101 = %5, %100 : int[]
		_101=newPixels[_100];
		//const %102 = 255 : int
		_102 = 255;
		//ifeq %101, %102 goto blklab18 : int
		if(_101==_102){goto blklab18;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab18
blklab18:;
	//assert
	}
	//assert
	{
		//const %103 = 7 : int
		_103 = 7;
		//indexof %104 = %5, %103 : int[]
		_104=newPixels[_103];
		//const %105 = 255 : int
		_105 = 255;
		//ifeq %104, %105 goto blklab19 : int
		if(_104==_105){goto blklab19;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab19
blklab19:;
	//assert
	}
	//assert
	{
		//const %106 = 7 : int
		_106 = 7;
		//add %107 = %1, %106 : int
		_107=width+_106;
		//indexof %108 = %5, %107 : int[]
		_108=newPixels[_107];
		//const %109 = 255 : int
		_109 = 255;
		//ifeq %108, %109 goto blklab20 : int
		if(_108==_109){goto blklab20;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab20
blklab20:;
	//assert
	}
	//assert
	{
		//const %110 = 7 : int
		_110 = 7;
		//mul %111 = %110, %1 : int
		_111=_110*width;
		//const %112 = 7 : int
		_112 = 7;
		//add %113 = %111, %112 : int
		_113=_111+_112;
		//indexof %114 = %5, %113 : int[]
		_114=newPixels[_113];
		//const %115 = 255 : int
		_115 = 255;
		//ifeq %114, %115 goto blklab21 : int
		if(_114==_115){goto blklab21;}
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

