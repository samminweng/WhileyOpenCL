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
Image* image(int64_t width, int64_t height, BYTE* pixels, size_t pixels_size, _DECL_DEALLOC_PARAM(pixels)){
	Image* _3;
	_DECL_DEALLOC(_3);
	Image* _4;
	_DECL_DEALLOC(_4);
	//newrecord %4 = (%1, %2, %0) : {int height,byte[] pixels,int width}
	_DEALLOC_STRUCT(_4, Image);
	_4 = malloc(sizeof(Image));
	_4->height = height;
	_UPDATE_1DARRAY(_4->pixels, pixels);
	_4->width = width;
	_REMOVE_DEALLOC(pixels);
	_ADD_DEALLOC(_4);
	//return %4
	_DEALLOC(pixels);
	_DEALLOC_STRUCT(_3, Image);
	return _4;
	//return
}

int64_t convolution(Image* A, _DECL_DEALLOC_PARAM(A), int64_t xCenter, int64_t yCenter, _DECL_1DARRAY_PARAM(filter), _DECL_DEALLOC_PARAM(filter)){
	int64_t _4 = 0;
	_DECL_1DARRAY_BYTE(pixels);
	_DECL_DEALLOC(pixels);
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
	_DECL_DEALLOC(_17);
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
	_DEALLOC(_17);
	_UPDATE_1DARRAY(_17, A->pixels);
	_REMOVE_DEALLOC(_17);
	//assign %5 = %17  : byte[]
	_DEALLOC(pixels);
	_UPDATE_1DARRAY(pixels, _17);
	_TRANSFER_DEALLOC(pixels, _17);
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
	_DEALLOC_STRUCT(A, Image);
	_DEALLOC(filter);
	_DEALLOC(pixels);
	_DEALLOC(_17);
	return sum;
	//return
}

Image* sobelEdgeDetection(Image* input, _DECL_DEALLOC_PARAM(input)){
	Image* _1;
	_DECL_DEALLOC(_1);
	_DECL_1DARRAY_BYTE(pixels);
	_DECL_DEALLOC(pixels);
	int64_t width = 0;
	int64_t height = 0;
	_DECL_1DARRAY_BYTE(newPixels);
	_DECL_DEALLOC(newPixels);
	_DECL_1DARRAY(v_sobel);
	_DECL_DEALLOC(v_sobel);
	_DECL_1DARRAY(h_sobel);
	_DECL_DEALLOC(h_sobel);
	int64_t x = 0;
	int64_t y = 0;
	int64_t pos = 0;
	int64_t v_g = 0;
	int64_t h_g = 0;
	int64_t t_g = 0;
	_DECL_1DARRAY_BYTE(_14);
	_DECL_DEALLOC(_14);
	int64_t _15 = 0;
	int64_t _16 = 0;
	BYTE _17;
	int64_t _18 = 0;
	_DECL_1DARRAY_BYTE(_19);
	_DECL_DEALLOC(_19);
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
	_DECL_DEALLOC(_32);
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
	_DECL_DEALLOC(_45);
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
	_DECL_DEALLOC(_66);
	//fieldload %14 = %0 pixels : {int height,byte[] pixels,int width}
	_DEALLOC(_14);
	_UPDATE_1DARRAY(_14, input->pixels);
	_REMOVE_DEALLOC(_14);
	//assign %2 = %14  : byte[]
	_DEALLOC(pixels);
	_UPDATE_1DARRAY(pixels, _14);
	_TRANSFER_DEALLOC(pixels, _14);
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
	_DEALLOC(_19);
	_NEW_1DARRAY_BYTE(_19, _18, _17);
	_ADD_DEALLOC(_19);
	//assign %5 = %19  : byte[]
	_DEALLOC(newPixels);
	_UPDATE_1DARRAY(newPixels, _19);
	_TRANSFER_DEALLOC(newPixels, _19);
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
	_DEALLOC(_32);
	_NEW_1DARRAY_int64_t(_32, 9, 0);
	_32[0] = _21; _32[1] = _22; _32[2] = _23; _32[3] = _25; _32[4] = _26; _32[5] = _27; _32[6] = _29; _32[7] = _30; _32[8] = _31; 
	_ADD_DEALLOC(_32);
	//assign %6 = %32  : int[]
	_DEALLOC(v_sobel);
	_UPDATE_1DARRAY(v_sobel, _32);
	_TRANSFER_DEALLOC(v_sobel, _32);
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
	_DEALLOC(_45);
	_NEW_1DARRAY_int64_t(_45, 9, 0);
	_45[0] = _33; _45[1] = _34; _45[2] = _35; _45[3] = _36; _45[4] = _37; _45[5] = _38; _45[6] = _40; _45[7] = _42; _45[8] = _44; 
	_ADD_DEALLOC(_45);
	//assign %7 = %45  : int[]
	_DEALLOC(h_sobel);
	_UPDATE_1DARRAY(h_sobel, _45);
	_TRANSFER_DEALLOC(h_sobel, _45);
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
				_54 = convolution(_STRUCT_PARAM(input), false, x, y, _1DARRAY_PARAM(v_sobel), false);
				_RETAIN_DEALLOC(input, "false-false-true" , "convolution");
				_RETAIN_DEALLOC(v_sobel, "false-false-true" , "convolution");
			}
			//assign %11 = %54  : int
			v_g = _54;
			//invoke (%55) = (%0, %8, %9, %7) SobelEdge3:convolution : function(SobelEdge3:Image,int,int,int[])->(int)
			{
				_55 = convolution(_STRUCT_PARAM(input), false, x, y, _1DARRAY_PARAM(h_sobel), false);
				_RETAIN_DEALLOC(input, "false-false-true" , "convolution");
				_RETAIN_DEALLOC(h_sobel, "false-false-true" , "convolution");
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
		_DEALLOC_STRUCT(_66, Image);
		_66 = image(width, height, _1DARRAY_PARAM(newPixels), false);
		_RESET_DEALLOC(newPixels, "false-true-false" , "image");
		_ADD_DEALLOC(_66);
	}
	//return %66
	_DEALLOC_STRUCT(input, Image);
	_DEALLOC_STRUCT(_1, Image);
	_DEALLOC(pixels);
	_DEALLOC(newPixels);
	_DEALLOC(v_sobel);
	_DEALLOC(h_sobel);
	_DEALLOC(_14);
	_DEALLOC(_19);
	_DEALLOC(_32);
	_DEALLOC(_45);
	return _66;
	//return
}

void write_image(FILE* sys, Image* im, _DECL_DEALLOC_PARAM(im)){
	_DECL_1DARRAY_BYTE(pixels);
	_DECL_DEALLOC(pixels);
	FILE* w;
	_DECL_1DARRAY_BYTE(_4);
	_DECL_DEALLOC(_4);
	void* _5;
	_DECL_DEALLOC(_5);
	_DECL_1DARRAY(_6);
	_DECL_DEALLOC(_6);
	int64_t _7 = 0;
	//fieldload %4 = %1 pixels : {int height,byte[] pixels,int width}
	_DEALLOC(_4);
	_UPDATE_1DARRAY(_4, im->pixels);
	_REMOVE_DEALLOC(_4);
	//assign %2 = %4  : byte[]
	_DEALLOC(pixels);
	_UPDATE_1DARRAY(pixels, _4);
	_TRANSFER_DEALLOC(pixels, _4);
	//const %6 = [111,117,116,112,117,116,46,116,120,116] : int[]
	_DEALLOC(_6);
	_NEW_1DARRAY_int64_t(_6, 10, 0);
	_6[0] = 111; _6[1] = 117; _6[2] = 116; _6[3] = 112; _6[4] = 117; _6[5] = 116; _6[6] = 46; _6[7] = 116; _6[8] = 120; _6[9] = 116; 
	_ADD_DEALLOC(_6);
	//invoke (%5) = (%6) whiley/io/File:Writer : method(whiley/lang/ASCII:string)->(whiley/io/File:Writer)
	{
		_5 = Writer(_6, _6_size);
	}
	//assign %3 = %5  : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	w = _5;
	//fieldload %8 = %3 write : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke (%7) = %8 (%2) : method(byte[])->(int)
	{
		writeAll(w, pixels, pixels_size);
	}
	//fieldload %9 = %3 close : {method()->() close,method()->() flush,method(byte[])->(int) write,...}
	//indirectinvoke () = %9 () : method()->()
	{
		fclose(w);
		w = NULL;
	}
	//return
	_DEALLOC_STRUCT(im, Image);
	_DEALLOC(pixels);
	if(w != NULL){fclose(w); w = NULL;}
	_DEALLOC(_4);
	_DEALLOC(_6);
	return;
}

int main(int argc, char** args){
	int64_t width = 0;
	int64_t height = 0;
	int64_t size = 0;
	FILE* file;
	_DECL_1DARRAY_BYTE(pixels);
	_DECL_DEALLOC(pixels);
	Image* input;
	_DECL_DEALLOC(input);
	Image* output;
	_DECL_DEALLOC(output);
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	void* _11;
	_DECL_DEALLOC(_11);
	_DECL_1DARRAY(_12);
	_DECL_DEALLOC(_12);
	_DECL_1DARRAY_BYTE(_13);
	_DECL_DEALLOC(_13);
	Image* _15;
	_DECL_DEALLOC(_15);
	Image* _16;
	_DECL_DEALLOC(_16);
	void* _17;
	_DECL_1DARRAY(_19);
	_DECL_DEALLOC(_19);
	_DECL_1DARRAY_BYTE(_20);
	_DECL_DEALLOC(_20);
	int64_t _21 = 0;
	_DECL_1DARRAY_BYTE(_22);
	_DECL_DEALLOC(_22);
	int64_t _23 = 0;
	//const %8 = 33 : int
	_8 = 33;
	//assign %1 = %8  : int
	width = _8;
	//const %9 = 16 : int
	_9 = 16;
	//assign %2 = %9  : int
	height = _9;
	//mul %10 = %1, %2 : int
	_10=width*height;
	//assign %3 = %10  : int
	size = _10;
	//const %12 = [105,109,97,103,101,46,105,110] : int[]
	_DEALLOC(_12);
	_NEW_1DARRAY_int64_t(_12, 8, 0);
	_12[0] = 105; _12[1] = 109; _12[2] = 97; _12[3] = 103; _12[4] = 101; _12[5] = 46; _12[6] = 105; _12[7] = 110; 
	_ADD_DEALLOC(_12);
	//invoke (%11) = (%12) whiley/io/File:Reader : method(whiley/lang/ASCII:string)->(whiley/io/File:Reader)
	{
		_11 = Reader(_12, _12_size);
	}
	//assign %4 = %11  : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	file = _11;
	//fieldload %14 = %4 readAll : {method()->(int) available,method()->() close,method()->(bool) hasMore,method(int)->(byte[]) read,method()->(byte[]) readAll}
	//indirectinvoke (%13) = %14 () : method()->(byte[])
	{
		_13 = readAll(file, &_13_size);
		_ADD_DEALLOC(_13);
	}
	//assign %5 = %13  : byte[]
	_DEALLOC(pixels);
	_UPDATE_1DARRAY(pixels, _13);
	_TRANSFER_DEALLOC(pixels, _13);
	//invoke (%15) = (%1, %2, %5) SobelEdge3:image : function(int,int,byte[])->(SobelEdge3:Image)
	{
		_DEALLOC_STRUCT(_15, Image);
		_15 = image(width, height, _1DARRAY_PARAM(pixels), false);
		_RESET_DEALLOC(pixels, "false-true-false" , "image");
		_ADD_DEALLOC(_15);
	}
	//assign %6 = %15  : {int height,byte[] pixels,int width}
	_DEALLOC_STRUCT(input, Image);
	input = _15;
	_TRANSFER_DEALLOC(input, _15);
	//invoke (%16) = (%6) SobelEdge3:sobelEdgeDetection : function(SobelEdge3:Image)->(SobelEdge3:Image)
	{
		_DEALLOC_STRUCT(_16, Image);
		_16 = sobelEdgeDetection(_STRUCT_PARAM(input), false);
		_RETAIN_DEALLOC(input, "false-false-false" , "sobelEdgeDetection");
		_ADD_DEALLOC(_16);
	}
	//assign %7 = %16  : {int height,byte[] pixels,int width}
	_DEALLOC_STRUCT(output, Image);
	output = _16;
	_TRANSFER_DEALLOC(output, _16);
	//fieldload %17 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %18 = %17 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %19 = [79,117,116,112,117,116,32,73,109,97,103,101,58] : int[]
	_DEALLOC(_19);
	_NEW_1DARRAY_int64_t(_19, 13, 0);
	_19[0] = 79; _19[1] = 117; _19[2] = 116; _19[3] = 112; _19[4] = 117; _19[5] = 116; _19[6] = 32; _19[7] = 73; _19[8] = 109; _19[9] = 97; _19[10] = 103; _19[11] = 101; _19[12] = 58; 
	_ADD_DEALLOC(_19);
	//indirectinvoke () = %18 (%19) : method(int[])->()
	{
		println_s(_19, _19_size);
	}
	//invoke () = (%0, %7) SobelEdge3:write_image : method(whiley/lang/System:Console,SobelEdge3:Image)->()
	{
		write_image(stdout, _STRUCT_PARAM(output), false);
		_RETAIN_DEALLOC(output, "false-false-false" , "write_image");
	}
	//assert
	{
		//fieldload %20 = %7 pixels : {int height,byte[] pixels,int width}
		_DEALLOC(_20);
		_UPDATE_1DARRAY(_20, output->pixels);
		_REMOVE_DEALLOC(_20);
		//lengthof %21 = %20 : byte[]
		_21 = _20_size;
		//fieldload %22 = %6 pixels : {int height,byte[] pixels,int width}
		_DEALLOC(_22);
		_UPDATE_1DARRAY(_22, input->pixels);
		_REMOVE_DEALLOC(_22);
		//lengthof %23 = %22 : byte[]
		_23 = _22_size;
		//ifeq %21, %23 goto blklab11 : int
		if(_21==_23){goto blklab11;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab11
blklab11:;
	//assert
	}
	//return
	if(file != NULL){fclose(file); file = NULL;}
	_DEALLOC(pixels);
	_DEALLOC_STRUCT(input, Image);
	_DEALLOC_STRUCT(output, Image);
	_DEALLOC(_12);
	_DEALLOC(_13);
	_DEALLOC_STRUCT(_15, Image);
	_DEALLOC_STRUCT(_16, Image);
	_DEALLOC(_19);
	_DEALLOC(_20);
	_DEALLOC(_22);
	exit(0);
}

