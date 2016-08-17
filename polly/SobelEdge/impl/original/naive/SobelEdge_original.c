#include "SobelEdge_original.h"
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
		//invoke (%20) = (%22, %2) SobelEdge_original:wrap : function(int,int)->(int)
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
			//invoke (%24) = (%26, %1) SobelEdge_original:wrap : function(int,int)->(int)
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
	long long* n;
	long long max = 0;
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
	long long* _16;
	_DECL_2DARRAY(_17);
	long long _18 = 0;
	_DECL_1DARRAY(_19);
	long long _20 = 0;
	long long _21 = 0;
	_DECL_1DARRAY(_22);
	long long _23 = 0;
	long long _24 = 0;
	long long _25 = 0;
	_DECL_1DARRAY(_26);
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
	_DECL_1DARRAY(_39);
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
	_DECL_1DARRAY(_52);
	long long _53 = 0;
	long long _54 = 0;
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
	long long _65 = 0;
	long long _66 = 0;
	long long _67 = 0;
	long long _68 = 0;
	void* _69;
	_DECL_1DARRAY(_71);
	void* _72;
	_DECL_1DARRAY(_74);
	void* _75;
	long long _77 = 0;
	long long _78 = 0;
	void* _79;
	_DECL_1DARRAY(_81);
	void* _82;
	_DECL_1DARRAY(_84);
	void* _85;
	long long _87 = 0;
	void* _88;
	_DECL_1DARRAY(_90);
	void* _91;
	long long _93 = 0;
	long long _94 = 0;
	void* _95;
	_DECL_1DARRAY(_97);
	void* _98;
	long long _100 = 0;
	long long _101 = 0;
	void* _102;
	_DECL_1DARRAY(_104);
	void* _105;
	long long _107 = 0;
	long long _108 = 0;
	long long _109 = 0;
	//fieldload %17 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_17);
	//const %18 = 0 : int
	_18 = 0;
	//indexof %19 = %17, %18 : int[][]
	_19=_17[_18];
	//invoke (%16) = (%19) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_16, _19);
	//assign %1 = %16  : null|int
	_NEW_INTEGER_POINTER(n, _16);
	//ifis %1, null goto blklab7 : null|int
	if(n == NULL) { goto blklab7;}
	//assign %2 = %1  : int
	max = *n;
	//assign %3 = %1  : int
	width = *n;
	//assign %4 = %1  : int
	height = *n;
	//mul %20 = %3, %4 : int
	_20=width*height;
	//assign %5 = %20  : int
	size = _20;
	//const %21 = 255 : int
	_21 = 255;
	//arraygen %22 = [21; 5] : int[]
	_NEW_1DARRAY(_22, size, _21);
	//assign %6 = %22  : int[]
	_COPY_1DARRAY(pixels, _22);
	//const %23 = 0 : int
	_23 = 0;
	//const %24 = 0 : int
	_24 = 0;
	//update %6[%24] = %23 : int[] -> int[]
	pixels[_24] = _23;
	//const %25 = 255 : int
	_25 = 255;
	//arraygen %26 = [25; 5] : int[]
	_NEW_1DARRAY(_26, size, _25);
	//assign %7 = %26  : int[]
	_COPY_1DARRAY(newPixels, _26);
	//const %27 = 1 : int
	_27 = 1;
	//neg %28 = %27 : int
	_28= -_27;
	//const %29 = 0 : int
	_29 = 0;
	//const %30 = 1 : int
	_30 = 1;
	//const %31 = 2 : int
	_31 = 2;
	//neg %32 = %31 : int
	_32= -_31;
	//const %33 = 0 : int
	_33 = 0;
	//const %34 = 2 : int
	_34 = 2;
	//const %35 = 1 : int
	_35 = 1;
	//neg %36 = %35 : int
	_36= -_35;
	//const %37 = 0 : int
	_37 = 0;
	//const %38 = 1 : int
	_38 = 1;
	//newlist %39 = (%28, %29, %30, %32, %33, %34, %36, %37, %38) : int[]
	_NEW_1DARRAY(_39, 9, 0);
	_39[0] = _28; _39[1] = _29; _39[2] = _30; _39[3] = _32; _39[4] = _33; _39[5] = _34; _39[6] = _36; _39[7] = _37; _39[8] = _38; 
	//assign %8 = %39  : int[]
	_COPY_1DARRAY(v_sobel, _39);
	//const %40 = 1 : int
	_40 = 1;
	//const %41 = 2 : int
	_41 = 2;
	//const %42 = 1 : int
	_42 = 1;
	//const %43 = 0 : int
	_43 = 0;
	//const %44 = 0 : int
	_44 = 0;
	//const %45 = 0 : int
	_45 = 0;
	//const %46 = 1 : int
	_46 = 1;
	//neg %47 = %46 : int
	_47= -_46;
	//const %48 = 2 : int
	_48 = 2;
	//neg %49 = %48 : int
	_49= -_48;
	//const %50 = 1 : int
	_50 = 1;
	//neg %51 = %50 : int
	_51= -_50;
	//newlist %52 = (%40, %41, %42, %43, %44, %45, %47, %49, %51) : int[]
	_NEW_1DARRAY(_52, 9, 0);
	_52[0] = _40; _52[1] = _41; _52[2] = _42; _52[3] = _43; _52[4] = _44; _52[5] = _45; _52[6] = _47; _52[7] = _49; _52[8] = _51; 
	//assign %9 = %52  : int[]
	_COPY_1DARRAY(h_sobel, _52);
	//const %53 = 0 : int
	_53 = 0;
	//assign %10 = %53  : int
	x = _53;
	//loop (%7, %10, %11, %12, %13, %14, %15, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66, %67, %68)
	while(true){
		//ifge %10, %3 goto blklab8 : int
		if(x>=width){goto blklab8;}
		//const %54 = 0 : int
		_54 = 0;
		//assign %11 = %54  : int
		y = _54;
		//loop (%7, %11, %12, %13, %14, %15, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65, %66)
		while(true){
			//ifge %11, %4 goto blklab10 : int
			if(y>=height){goto blklab10;}
			//mul %55 = %11, %3 : int
			_55=y*width;
			//add %56 = %55, %10 : int
			_56=_55+x;
			//assign %12 = %56  : int
			pos = _56;
			//invoke (%57) = (%6, %3, %4, %10, %11, %8) SobelEdge_original:convolution : function(int[],int,int,int,int,int[])->(int)
			_57 = convolution(_COPY_1DARRAY_PARAM(pixels), width, height, x, y, _COPY_1DARRAY_PARAM(v_sobel));
			//assign %13 = %57  : int
			v_g = _57;
			//invoke (%58) = (%6, %3, %4, %10, %11, %9) SobelEdge_original:convolution : function(int[],int,int,int,int,int[])->(int)
			_58 = convolution(_COPY_1DARRAY_PARAM(pixels), width, height, x, y, _COPY_1DARRAY_PARAM(h_sobel));
			//assign %14 = %58  : int
			h_g = _58;
			//invoke (%59) = (%13) whiley/lang/Math:abs : function(int)->(int)
			_59 = llabs(v_g);
			//invoke (%60) = (%14) whiley/lang/Math:abs : function(int)->(int)
			_60 = llabs(h_g);
			//add %61 = %59, %60 : int
			_61=_59+_60;
			//assign %15 = %61  : int
			t_g = _61;
			//const %62 = 128 : int
			_62 = 128;
			//ifle %15, %62 goto blklab12 : int
			if(t_g<=_62){goto blklab12;}
			//const %63 = 255 : int
			_63 = 255;
			//update %7[%12] = %63 : int[] -> int[]
			newPixels[pos] = _63;
			//goto blklab13
			goto blklab13;
//.blklab12
blklab12:;
			//const %64 = 0 : int
			_64 = 0;
			//update %7[%12] = %64 : int[] -> int[]
			newPixels[pos] = _64;
//.blklab13
blklab13:;
			//const %65 = 1 : int
			_65 = 1;
			//add %66 = %11, %65 : int
			_66=y+_65;
			//assign %11 = %66  : int
			y = _66;
//.blklab11
blklab11:;
		}
//.blklab10
blklab10:;
		//const %67 = 1 : int
		_67 = 1;
		//add %68 = %10, %67 : int
		_68=x+_67;
		//assign %10 = %68  : int
		x = _68;
//.blklab9
blklab9:;
	}
//.blklab8
blklab8:;
	//fieldload %69 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %70 = %69 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %71 = [65,116,32,40,48,44,32,48,41] : int[]
	_NEW_1DARRAY(_71, 9, 0);
	_71[0] = 65; _71[1] = 116; _71[2] = 32; _71[3] = 40; _71[4] = 48; _71[5] = 44; _71[6] = 32; _71[7] = 48; _71[8] = 41; 
	//indirectinvoke () = %70 (%71) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_71));
	//fieldload %72 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %73 = %72 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %74 = [32,110,101,119,80,105,120,101,108,115,91,112,111,115,93,32,61,32] : int[]
	_NEW_1DARRAY(_74, 18, 0);
	_74[0] = 32; _74[1] = 110; _74[2] = 101; _74[3] = 119; _74[4] = 80; _74[5] = 105; _74[6] = 120; _74[7] = 101; _74[8] = 108; _74[9] = 115; _74[10] = 91; _74[11] = 112; _74[12] = 111; _74[13] = 115; _74[14] = 93; _74[15] = 32; _74[16] = 61; _74[17] = 32; 
	//indirectinvoke () = %73 (%74) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_74));
	//fieldload %75 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %76 = %75 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %77 = 0 : int
	_77 = 0;
	//indexof %78 = %7, %77 : int[]
	_78=newPixels[_77];
	//indirectinvoke () = %76 (%78) : method(any)->()
	printf("%lld\n", _78);
	//fieldload %79 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %80 = %79 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %81 = [65,116,32,40,49,44,48,41] : int[]
	_NEW_1DARRAY(_81, 8, 0);
	_81[0] = 65; _81[1] = 116; _81[2] = 32; _81[3] = 40; _81[4] = 49; _81[5] = 44; _81[6] = 48; _81[7] = 41; 
	//indirectinvoke () = %80 (%81) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_81));
	//fieldload %82 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %83 = %82 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %84 = [32,110,101,119,80,105,120,101,108,115,91,112,111,115,93,32,61,32] : int[]
	_NEW_1DARRAY(_84, 18, 0);
	_84[0] = 32; _84[1] = 110; _84[2] = 101; _84[3] = 119; _84[4] = 80; _84[5] = 105; _84[6] = 120; _84[7] = 101; _84[8] = 108; _84[9] = 115; _84[10] = 91; _84[11] = 112; _84[12] = 111; _84[13] = 115; _84[14] = 93; _84[15] = 32; _84[16] = 61; _84[17] = 32; 
	//indirectinvoke () = %83 (%84) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_84));
	//fieldload %85 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %86 = %85 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indexof %87 = %7, %3 : int[]
	_87=newPixels[width];
	//indirectinvoke () = %86 (%87) : method(any)->()
	printf("%lld\n", _87);
	//fieldload %88 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %89 = %88 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %90 = [65,116,32,40] : int[]
	_NEW_1DARRAY(_90, 4, 0);
	_90[0] = 65; _90[1] = 116; _90[2] = 32; _90[3] = 40; 
	//indirectinvoke () = %89 (%90) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_90));
	//fieldload %91 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %92 = %91 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %93 = 1 : int
	_93 = 1;
	//sub %94 = %3, %93 : int
	_94=width-_93;
	//indirectinvoke () = %92 (%94) : method(any)->()
	printf("%lld", _94);
	//fieldload %95 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %96 = %95 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %97 = [44,32] : int[]
	_NEW_1DARRAY(_97, 2, 0);
	_97[0] = 44; _97[1] = 32; 
	//indirectinvoke () = %96 (%97) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_97));
	//fieldload %98 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %99 = %98 print : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %100 = 1 : int
	_100 = 1;
	//sub %101 = %4, %100 : int
	_101=height-_100;
	//indirectinvoke () = %99 (%101) : method(any)->()
	printf("%lld", _101);
	//fieldload %102 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %103 = %102 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %104 = [41,32,110,101,119,80,105,120,101,108,115,91,112,111,115,93,32,61,32] : int[]
	_NEW_1DARRAY(_104, 19, 0);
	_104[0] = 41; _104[1] = 32; _104[2] = 110; _104[3] = 101; _104[4] = 119; _104[5] = 80; _104[6] = 105; _104[7] = 120; _104[8] = 101; _104[9] = 108; _104[10] = 115; _104[11] = 91; _104[12] = 112; _104[13] = 111; _104[14] = 115; _104[15] = 93; _104[16] = 32; _104[17] = 61; _104[18] = 32; 
	//indirectinvoke () = %103 (%104) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_104));
	//fieldload %105 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %106 = %105 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %107 = 1 : int
	_107 = 1;
	//sub %108 = %5, %107 : int
	_108=size-_107;
	//indexof %109 = %7, %108 : int[]
	_109=newPixels[_108];
	//indirectinvoke () = %106 (%109) : method(any)->()
	printf("%lld\n", _109);
//.blklab7
blklab7:;
	//return
	exit(0);
}

