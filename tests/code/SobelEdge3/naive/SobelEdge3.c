#include "SobelEdge3.h"
Image* copy_Image(Image* _Image){
	Image* new_Image = malloc(sizeof(Image));
	_COPY_1DARRAY_BYTE(new_Image->pixels, _Image->pixels);
	new_Image->width = _Image->width;
	new_Image->height = _Image->height;
	return new_Image;
}
Image** copy_array_Image(Image** _Image, size_t _Image_size){
	Image** new_Image = malloc(_Image_size*sizeof(Image*));
	for(int i=0;i<_Image_size;i++){
		new_Image[i] = copy_Image(_Image[i]);
	}
	return new_Image;
}
void free_Image(Image* image){
	free(image->pixels);
	image->pixels = NULL;
	free(image);
}
void printf_Image(Image* image){
	printf("{");
	printf(" pixels:");
	_PRINT_1DARRAY_BYTE(image->pixels);
	printf(" width:");
	printf("%"PRId64, image->width);
	printf(" height:");
	printf("%"PRId64, image->height);
	printf("}");
}
Image* image(int64_t width, int64_t height, BYTE* pixels, size_t pixels_size){
	Image* _3;
	Image* _4;
	//newrecord %4 = (%1, %2, %0) : {int height,byte[] pixels,int width}
	_4 = malloc(sizeof(Image));
	_4->height = height;
	_COPY_1DARRAY_BYTE(_4->pixels, pixels);
	_4->width = width;
	//return %4
	return _4;
	//return
}

int64_t convolution(Image* A, int64_t xCenter, int64_t yCenter, _DECL_1DARRAY_PARAM(filter)){
	int64_t _4 = 0;
	_DECL_1DARRAY_BYTE(pixels);
	int64_t width = 0;
	int64_t height = 0;
	int64_t sum = 0;
	int64_t filterSize = 0;
	int64_t filterHalf = 0;
	int64_t filterY = 0;
	int64_t y = 0;
	int64_t filterX = 0;
	int64_t x = 0;
	int64_t pixel = 0;
	int64_t filterVal = 0;
	_DECL_1DARRAY_BYTE(_17);
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
	int64_t _32 = 0;
	int64_t _33 = 0;
	int64_t _34 = 0;
	int64_t _35 = 0;
	BYTE _36;
	int64_t _37 = 0;
	int64_t _38 = 0;
	int64_t _39 = 0;
	int64_t _40 = 0;
	int64_t _41 = 0;
	int64_t _42 = 0;
	int64_t _43 = 0;
	int64_t _44 = 0;
	int64_t _45 = 0;
	//fieldload %17 = %0 pixels : {int height,byte[] pixels,int width}
	_UPDATE_1DARRAY(_17, A->pixels);
	//assign %5 = %17  : byte[]
	_COPY_1DARRAY_BYTE(pixels, _17);
	//fieldload %18 = %0 width : {int height,byte[] pixels,int width}
	_18 = A->width;
	//assign %6 = %18  : int
	width = _18;
	//fieldload %19 = %0 height : {int height,byte[] pixels,int width}
	_19 = A->height;
	//assign %7 = %19  : int
	height = _19;
	//const %20 = 0 : int
	_20 = 0;
	//assign %8 = %20  : int
	sum = _20;
	//const %21 = 3 : int
	_21 = 3;
	//assign %9 = %21  : int
	filterSize = _21;
	//const %22 = 1 : int
	_22 = 1;
	//assign %10 = %22  : int
	filterHalf = _22;
	//const %23 = 0 : int
	_23 = 0;
	//assign %11 = %23  : int
	filterY = _23;
	//loop (%8, %11, %12, %13, %14, %15, %16, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45)
	while(true){
		//ifge %11, %9 goto blklab0 : int
		if(filterY>=filterSize){goto blklab0;}
		//add %25 = %2, %11 : int
		_25=yCenter+filterY;
		//sub %26 = %25, %10 : int
		_26=_25-filterHalf;
		//rem %27 = %26, %7 : int
		_27=_26%height;
		//invoke (%24) = (%27) whiley/lang/Math:abs : function(int)->(int)
		{
			_24 = llabs(_27);
		}
		//assign %12 = %24  : int
		y = _24;
		//const %28 = 0 : int
		_28 = 0;
		//assign %13 = %28  : int
		filterX = _28;
		//loop (%8, %13, %14, %15, %16, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43)
		while(true){
			//ifge %13, %9 goto blklab2 : int
			if(filterX>=filterSize){goto blklab2;}
			//add %30 = %1, %13 : int
			_30=xCenter+filterX;
			//sub %31 = %30, %10 : int
			_31=_30-filterHalf;
			//rem %32 = %31, %6 : int
			_32=_31%width;
			//invoke (%29) = (%32) whiley/lang/Math:abs : function(int)->(int)
			{
				_29 = llabs(_32);
			}
			//assign %14 = %29  : int
			x = _29;
			//mul %34 = %12, %6 : int
			_34=y*width;
			//add %35 = %34, %14 : int
			_35=_34+x;
			//indexof %36 = %5, %35 : byte[]
			_36=pixels[_35];
			//invoke (%33) = (%36) whiley/lang/Byte:toUnsignedInt : function(byte)->(whiley/lang/Int:uint)
			{
				_33 = (unsigned int)_36;
			}
			//assign %15 = %33  : int
			pixel = _33;
			//mul %37 = %11, %9 : int
			_37=filterY*filterSize;
			//add %38 = %37, %13 : int
			_38=_37+filterX;
			//indexof %39 = %3, %38 : int[]
			_39=filter[_38];
			//assign %16 = %39  : int
			filterVal = _39;
			//mul %40 = %15, %16 : int
			_40=pixel*filterVal;
			//add %41 = %8, %40 : int
			_41=sum+_40;
			//assign %8 = %41  : int
			sum = _41;
			//const %42 = 1 : int
			_42 = 1;
			//add %43 = %13, %42 : int
			_43=filterX+_42;
			//assign %13 = %43  : int
			filterX = _43;
//.blklab3
blklab3:;
		}
//.blklab2
blklab2:;
		//const %44 = 1 : int
		_44 = 1;
		//add %45 = %11, %44 : int
		_45=filterY+_44;
		//assign %11 = %45  : int
		filterY = _45;
//.blklab1
blklab1:;
	}
//.blklab0
blklab0:;
	//return %8
	return sum;
	//return
}

Image* sobelEdgeDetection(Image* input){
	Image* _1;
	_DECL_1DARRAY_BYTE(pixels);
	int64_t width = 0;
	int64_t height = 0;
	_DECL_1DARRAY_BYTE(newPixels);
	_DECL_1DARRAY(v_sobel);
	_DECL_1DARRAY(h_sobel);
	int64_t x = 0;
	int64_t y = 0;
	int64_t pos = 0;
	int64_t v_g = 0;
	int64_t h_g = 0;
	int64_t t_g = 0;
	_DECL_1DARRAY_BYTE(_14);
	int64_t _15 = 0;
	int64_t _16 = 0;
	BYTE _17;
	int64_t _18 = 0;
	_DECL_1DARRAY_BYTE(_19);
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
	_DECL_1DARRAY(_32);
	int64_t _33 = 0;
	int64_t _34 = 0;
	int64_t _35 = 0;
	int64_t _36 = 0;
	int64_t _37 = 0;
	int64_t _38 = 0;
	int64_t _39 = 0;
	int64_t _40 = 0;
	int64_t _41 = 0;
	int64_t _42 = 0;
	int64_t _43 = 0;
	int64_t _44 = 0;
	_DECL_1DARRAY(_45);
	int64_t _46 = 0;
	int64_t _47 = 0;
	int64_t _48 = 0;
	int64_t _49 = 0;
	BYTE _50;
	BYTE _51;
	BYTE _52;
	BYTE _53;
	int64_t _54 = 0;
	int64_t _55 = 0;
	int64_t _56 = 0;
	int64_t _57 = 0;
	int64_t _58 = 0;
	int64_t _59 = 0;
	BYTE _60;
	BYTE _61;
	int64_t _62 = 0;
	int64_t _63 = 0;
	int64_t _64 = 0;
	int64_t _65 = 0;
	Image* _66;
	//fieldload %14 = %0 pixels : {int height,byte[] pixels,int width}
	_UPDATE_1DARRAY(_14, input->pixels);
	//assign %2 = %14  : byte[]
	_COPY_1DARRAY_BYTE(pixels, _14);
	//fieldload %15 = %0 width : {int height,byte[] pixels,int width}
	_15 = input->width;
	//assign %3 = %15  : int
	width = _15;
	//fieldload %16 = %0 height : {int height,byte[] pixels,int width}
	_16 = input->height;
	//assign %4 = %16  : int
	height = _16;
	//const %17 = 00100000b : byte
	_17 = 0b00100000;
	//mul %18 = %3, %4 : int
	_18=width*height;
	//arraygen %19 = [17; 18] : byte[]
	_NEW_1DARRAY_BYTE(_19, _18, _17);
	//assign %5 = %19  : byte[]
	_COPY_1DARRAY_BYTE(newPixels, _19);
	//const %20 = 1 : int
	_20 = 1;
	//neg %21 = %20 : int
	_21= -_20;
	//const %22 = 0 : int
	_22 = 0;
	//const %23 = 1 : int
	_23 = 1;
	//const %24 = 2 : int
	_24 = 2;
	//neg %25 = %24 : int
	_25= -_24;
	//const %26 = 0 : int
	_26 = 0;
	//const %27 = 2 : int
	_27 = 2;
	//const %28 = 1 : int
	_28 = 1;
	//neg %29 = %28 : int
	_29= -_28;
	//const %30 = 0 : int
	_30 = 0;
	//const %31 = 1 : int
	_31 = 1;
	//newlist %32 = (%21, %22, %23, %25, %26, %27, %29, %30, %31) : int[]
	_NEW_1DARRAY_int64_t(_32, 9, 0);
	_32[0] = _21; _32[1] = _22; _32[2] = _23; _32[3] = _25; _32[4] = _26; _32[5] = _27; _32[6] = _29; _32[7] = _30; _32[8] = _31; 
	//assign %6 = %32  : int[]
	_COPY_1DARRAY_int64_t(v_sobel, _32);
	//const %33 = 1 : int
	_33 = 1;
	//const %34 = 2 : int
	_34 = 2;
	//const %35 = 1 : int
	_35 = 1;
	//const %36 = 0 : int
	_36 = 0;
	//const %37 = 0 : int
	_37 = 0;
	//const %38 = 0 : int
	_38 = 0;
	//const %39 = 1 : int
	_39 = 1;
	//neg %40 = %39 : int
	_40= -_39;
	//const %41 = 2 : int
	_41 = 2;
	//neg %42 = %41 : int
	_42= -_41;
	//const %43 = 1 : int
	_43 = 1;
	//neg %44 = %43 : int
	_44= -_43;
	//newlist %45 = (%33, %34, %35, %36, %37, %38, %40, %42, %44) : int[]
	_NEW_1DARRAY_int64_t(_45, 9, 0);
	_45[0] = _33; _45[1] = _34; _45[2] = _35; _45[3] = _36; _45[4] = _37; _45[5] = _38; _45[6] = _40; _45[7] = _42; _45[8] = _44; 
	//assign %7 = %45  : int[]
	_COPY_1DARRAY_int64_t(h_sobel, _45);
	//const %46 = 0 : int
	_46 = 0;
	//assign %8 = %46  : int
	x = _46;
	//loop (%5, %8, %9, %10, %11, %12, %13, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63, %64, %65)
	while(true){
		//ifge %8, %3 goto blklab4 : int
		if(x>=width){goto blklab4;}
		//const %47 = 0 : int
		_47 = 0;
		//assign %9 = %47  : int
		y = _47;
		//loop (%5, %9, %10, %11, %12, %13, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61, %62, %63)
		while(true){
			//ifge %9, %4 goto blklab6 : int
			if(y>=height){goto blklab6;}
			//mul %48 = %9, %3 : int
			_48=y*width;
			//add %49 = %48, %8 : int
			_49=_48+x;
			//assign %10 = %49  : int
			pos = _49;
			//indexof %50 = %2, %10 : byte[]
			_50=pixels[pos];
			//const %51 = 00001010b : byte
			_51 = 0b00001010;
			//ifeq %50, %51 goto blklab8 : byte
			if(_50==_51){goto blklab8;}
			//indexof %52 = %2, %10 : byte[]
			_52=pixels[pos];
			//const %53 = 00000000b : byte
			_53 = 0b00000000;
			//ifeq %52, %53 goto blklab8 : byte
			if(_52==_53){goto blklab8;}
			//invoke (%54) = (%0, %8, %9, %6) SobelEdge3:convolution : function(SobelEdge3:Image,int,int,int[])->(int)
			{
				void* input_tmp;
				void* v_sobel_tmp;
				_54 = convolution(_COPY_STRUCT_PARAM(input, Image), x, y, _COPY_1DARRAY_PARAM_int64_t(v_sobel));
			}
			//assign %11 = %54  : int
			v_g = _54;
			//invoke (%55) = (%0, %8, %9, %7) SobelEdge3:convolution : function(SobelEdge3:Image,int,int,int[])->(int)
			{
				void* input_tmp;
				void* h_sobel_tmp;
				_55 = convolution(_COPY_STRUCT_PARAM(input, Image), x, y, _COPY_1DARRAY_PARAM_int64_t(h_sobel));
			}
			//assign %12 = %55  : int
			h_g = _55;
			//invoke (%56) = (%11) whiley/lang/Math:abs : function(int)->(int)
			{
				_56 = llabs(v_g);
			}
			//invoke (%57) = (%12) whiley/lang/Math:abs : function(int)->(int)
			{
				_57 = llabs(h_g);
			}
			//add %58 = %56, %57 : int
			_58=_56+_57;
			//assign %13 = %58  : int
			t_g = _58;
			//const %59 = 128 : int
			_59 = 128;
			//ifgt %13, %59 goto blklab10 : int
			if(t_g>_59){goto blklab10;}
			//const %60 = 01100010b : byte
			_60 = 0b01100010;
			//update %5[%10] = %60 : byte[] -> byte[]
			newPixels[pos] = _60;
//.blklab10
blklab10:;
			//goto blklab9
			goto blklab9;
//.blklab8
blklab8:;
			//indexof %61 = %2, %10 : byte[]
			_61=pixels[pos];
			//update %5[%10] = %61 : byte[] -> byte[]
			newPixels[pos] = _61;
//.blklab9
blklab9:;
			//const %62 = 1 : int
			_62 = 1;
			//add %63 = %9, %62 : int
			_63=y+_62;
			//assign %9 = %63  : int
			y = _63;
//.blklab7
blklab7:;
		}
//.blklab6
blklab6:;
		//const %64 = 1 : int
		_64 = 1;
		//add %65 = %8, %64 : int
		_65=x+_64;
		//assign %8 = %65  : int
		x = _65;
//.blklab5
blklab5:;
	}
//.blklab4
blklab4:;
	//invoke (%66) = (%3, %4, %5) SobelEdge3:image : function(int,int,byte[])->(SobelEdge3:Image)
	{
		void* newPixels_tmp;
		_66 = image(width, height, _COPY_1DARRAY_PARAM_BYTE(newPixels));
	}
	//return %66
	return _66;
	//return
}

int main(int argc, char** args){
	int64_t width = 0;
	int64_t height = 0;
	int64_t size = 0;
	FILE* file;
	_DECL_1DARRAY_BYTE(pixels);
	Image* input;
	Image* output;
	FILE* w;
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	void* _12;
	_DECL_1DARRAY(_13);
	_DECL_1DARRAY_BYTE(_14);
	Image* _16;
	Image* _17;
	void* _18;
	_DECL_1DARRAY(_20);
	void* _21;
	_DECL_1DARRAY(_22);
	int64_t _23 = 0;
	_DECL_1DARRAY_BYTE(_25);
	_DECL_1DARRAY_BYTE(_27);
	int64_t _28 = 0;
	_DECL_1DARRAY_BYTE(_29);
	int64_t _30 = 0;
	//const %9 = 33 : int
	_9 = 33;
	//assign %1 = %9  : int
	width = _9;
	//const %10 = 16 : int
	_10 = 16;
	//assign %2 = %10  : int
	height = _10;
	//mul %11 = %1, %2 : int
	_11=width*height;
	//assign %3 = %11  : int
	size = _11;
	//const %13 = [105,109,97,103,101,46,105,110] : int[]
	_NEW_1DARRAY_int64_t(_13, 8, 0);
	_13[0] = 105; _13[1] = 109; _13[2] = 97; _13[3] = 103; _13[4] = 101; _13[5] = 46; _13[6] = 105; _13[7] = 110; 
	//invoke (%12) = (%13) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_12 = Reader(_13, _13_size);
	}
	//assign %4 = %12  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	file = _12;
	//fieldload %15 = %4 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%14) = %15 () : method()->(byte[])
	{
		_14 = readAll(file, &_14_size);
	}
	//assign %5 = %14  : byte[]
	_COPY_1DARRAY_BYTE(pixels, _14);
	//invoke (%16) = (%1, %2, %5) SobelEdge3:image : function(int,int,byte[])->(SobelEdge3:Image)
	{
		void* pixels_tmp;
		_16 = image(width, height, _COPY_1DARRAY_PARAM_BYTE(pixels));
	}
	//assign %6 = %16  : {int height,byte[] pixels,int width}
	input = copy_Image(_16);
	//invoke (%17) = (%6) SobelEdge3:sobelEdgeDetection : function(SobelEdge3:Image)->(SobelEdge3:Image)
	{
		void* input_tmp;
		_17 = sobelEdgeDetection(_COPY_STRUCT_PARAM(input, Image));
	}
	//assign %7 = %17  : {int height,byte[] pixels,int width}
	output = copy_Image(_17);
	//fieldload %18 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %19 = %18 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %20 = [79,117,116,112,117,116,32,73,109,97,103,101,58] : int[]
	_NEW_1DARRAY_int64_t(_20, 13, 0);
	_20[0] = 79; _20[1] = 117; _20[2] = 116; _20[3] = 112; _20[4] = 117; _20[5] = 116; _20[6] = 32; _20[7] = 73; _20[8] = 109; _20[9] = 97; _20[10] = 103; _20[11] = 101; _20[12] = 58; 
	//indirectinvoke () = %19 (%20) : method(int[])->()
	{
		println_s(_20, _20_size);
	}
	//const %22 = [111,117,116,112,117,116,46,116,120,116] : int[]
	_NEW_1DARRAY_int64_t(_22, 10, 0);
	_22[0] = 111; _22[1] = 117; _22[2] = 116; _22[3] = 112; _22[4] = 117; _22[5] = 116; _22[6] = 46; _22[7] = 116; _22[8] = 120; _22[9] = 116; 
	//invoke (%21) = (%22) whiley/io/File:Writer : method(whiley/lang/ASCII:string)->(whiley/io/File:Writer)
	{
		_21 = Writer(_22, _22_size);
	}
	//assign %8 = %21  : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	w = _21;
	//fieldload %24 = %8 write : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//fieldload %25 = %7 pixels : {int height,byte[] pixels,int width}
	_UPDATE_1DARRAY(_25, output->pixels);
	//indirectinvoke (%23) = %24 (%25) : method(byte[])->(int)
	{
		writeAll(w, _25, _25_size);
	}
	//fieldload %26 = %8 close : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke () = %26 () : method()->()
	{
		fclose(w);
		w = NULL;
	}
	//assert
	{
		//fieldload %27 = %7 pixels : {int height,byte[] pixels,int width}
		_UPDATE_1DARRAY(_27, output->pixels);
		//lengthof %28 = %27 : byte[]
		_28 = _27_size;
		//fieldload %29 = %6 pixels : {int height,byte[] pixels,int width}
		_UPDATE_1DARRAY(_29, input->pixels);
		//lengthof %30 = %29 : byte[]
		_30 = _29_size;
		//ifeq %28, %30 goto blklab11 : int
		if(_28==_30){goto blklab11;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab11
blklab11:;
	//assert
	}
	//return
	exit(0);
}

