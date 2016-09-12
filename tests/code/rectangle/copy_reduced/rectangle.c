#include "rectangle.h"
Point* copy_Point(Point* _Point){
	Point* new_Point = malloc(sizeof(Point));
	new_Point->x = _Point->x;
	new_Point->y = _Point->y;
	return new_Point;
}
Point** copy_array_Point(Point** _Point, long long _Point_size){
	Point** new_Point = malloc(_Point_size*sizeof(Point*));
	for(int i=0;i<_Point_size;i++){
		new_Point[i] = copy_Point(_Point[i]);
	}
	return new_Point;
}
void free_Point(Point* point){
	free(point);
}
void printf_Point(Point* point){
	printf("{");
	printf(" x:");
	printf("%lld", point->x);
	printf(" y:");
	printf("%lld", point->y);
	printf("}");
}
Rectangle* copy_Rectangle(Rectangle* _Rectangle){
	Rectangle* new_Rectangle = malloc(sizeof(Rectangle));
	_COPY_STRUCT(new_Rectangle->p1, _Rectangle->p1, Point);
	_COPY_STRUCT(new_Rectangle->p2, _Rectangle->p2, Point);
	return new_Rectangle;
}
Rectangle** copy_array_Rectangle(Rectangle** _Rectangle, long long _Rectangle_size){
	Rectangle** new_Rectangle = malloc(_Rectangle_size*sizeof(Rectangle*));
	for(int i=0;i<_Rectangle_size;i++){
		new_Rectangle[i] = copy_Rectangle(_Rectangle[i]);
	}
	return new_Rectangle;
}
void free_Rectangle(Rectangle* rectangle){
	free_Point(rectangle->p1);
	rectangle->p1 = NULL;
	free_Point(rectangle->p2);
	rectangle->p2 = NULL;
	free(rectangle);
}
void printf_Rectangle(Rectangle* rectangle){
	printf("{");
	printf(" p1:");
	printf_Point(rectangle->p1);
	printf(" p2:");
	printf_Point(rectangle->p2);
	printf("}");
}
Rectangle* updateRec(Rectangle* rec, Point* p){
	Rectangle* r;
	//update %0.p2 = %1 : {{int x,int y} p1,{int x,int y} p2} -> {{int x,int y} p1,{int x,int y} p2}
	rec->p2 = p;
	//return %0
	return rec;
	//return
}

int main(int argc, char** args){
	Point* p1;
	Point* p2;
	Rectangle* rec;
	Point* p3;
	long long _5 = 0;
	long long _6 = 0;
	Point* _7;
	long long _8 = 0;
	long long _9 = 0;
	Point* _10;
	Rectangle* _11;
	long long _12 = 0;
	long long _13 = 0;
	Point* _14;
	Rectangle* _15;
	Point* _16;
	long long _17 = 0;
	long long _18 = 0;
	Point* _19;
	long long _20 = 0;
	long long _21 = 0;
	void* _22;
	_DECL_1DARRAY(_24);
	void* _25;
	_DECL_1DARRAY(_27);
	void* _28;
	Point* _30;
	long long _31 = 0;
	void* _32;
	_DECL_1DARRAY(_34);
	void* _35;
	Point* _37;
	long long _38 = 0;
	void* _39;
	_DECL_1DARRAY(_41);
	//const %5 = 0 : int
	_5 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//newrecord %7 = (%5, %6) : {int x,int y}
	_7 = malloc(sizeof(Point));
	_7->x = _5;
	_7->y = _6;
	//assign %1 = %7  : {int x,int y}
	p1 = _7;
	//const %8 = 3 : int
	_8 = 3;
	//const %9 = 4 : int
	_9 = 4;
	//newrecord %10 = (%8, %9) : {int x,int y}
	_10 = malloc(sizeof(Point));
	_10->x = _8;
	_10->y = _9;
	//assign %2 = %10  : {int x,int y}
	p2 = _10;
	//newrecord %11 = (%1, %2) : {{int x,int y} p1,{int x,int y} p2}
	_11 = malloc(sizeof(Rectangle));
	_11->p1 = p1;
	_11->p2 = p2;
	//assign %3 = %11  : {{int x,int y} p1,{int x,int y} p2}
	rec = _11;
	//const %12 = 6 : int
	_12 = 6;
	//const %13 = 8 : int
	_13 = 8;
	//newrecord %14 = (%12, %13) : {int x,int y}
	_14 = malloc(sizeof(Point));
	_14->x = _12;
	_14->y = _13;
	//assign %4 = %14  : {int x,int y}
	p3 = _14;
	//invoke (%15) = (%3, %4) rectangle:updateRec : function(rectangle:Rectangle,rectangle:Point)->(rectangle:Rectangle)
	{
		_15 = updateRec(_STRUCT_PARAM(rec), _STRUCT_PARAM(p3));
	}
	//assign %3 = %15  : {{int x,int y} p1,{int x,int y} p2}
	rec = _15;
	//assert
	{
		//fieldload %16 = %3 p2 : {{int x,int y} p1,{int x,int y} p2}
		_16 = rec->p2;
		//fieldload %17 = %16 x : {int x,int y}
		_17 = _16->x;
		//const %18 = 6 : int
		_18 = 6;
		//ifeq %17, %18 goto blklab0 : int
		if(_17==_18){goto blklab0;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab0
blklab0:;
	//assert
	}
	//assert
	{
		//fieldload %19 = %3 p2 : {{int x,int y} p1,{int x,int y} p2}
		_19 = rec->p2;
		//fieldload %20 = %19 y : {int x,int y}
		_20 = _19->y;
		//const %21 = 8 : int
		_21 = 8;
		//ifeq %20, %21 goto blklab1 : int
		if(_20==_21){goto blklab1;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab1
blklab1:;
	//assert
	}
	//fieldload %22 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %23 = %22 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %24 = [112,50,32,112,111,105,110,116,32,111,102,32,114,101,99,116,97,110,103,108,101] : int[]
	_NEW_1DARRAY_LONGLONG(_24, 21, 0);
	_24[0] = 112; _24[1] = 50; _24[2] = 32; _24[3] = 112; _24[4] = 111; _24[5] = 105; _24[6] = 110; _24[7] = 116; _24[8] = 32; _24[9] = 111; _24[10] = 102; _24[11] = 32; _24[12] = 114; _24[13] = 101; _24[14] = 99; _24[15] = 116; _24[16] = 97; _24[17] = 110; _24[18] = 103; _24[19] = 108; _24[20] = 101; 
	//indirectinvoke () = %23 (%24) : method(int[])->()
	println_s(_24, _24_size);
	//fieldload %25 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %26 = %25 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %27 = [112,50,46,120,32,105,115,32] : int[]
	_NEW_1DARRAY_LONGLONG(_27, 8, 0);
	_27[0] = 112; _27[1] = 50; _27[2] = 46; _27[3] = 120; _27[4] = 32; _27[5] = 105; _27[6] = 115; _27[7] = 32; 
	//indirectinvoke () = %26 (%27) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_27));
	//fieldload %28 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %29 = %28 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %30 = %3 p2 : {{int x,int y} p1,{int x,int y} p2}
	_30 = rec->p2;
	//fieldload %31 = %30 x : {int x,int y}
	_31 = _30->x;
	//indirectinvoke () = %29 (%31) : method(any)->()
	printf("%lld\n", _31);
	//fieldload %32 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %33 = %32 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %34 = [112,50,46,121,32,105,115,32] : int[]
	_NEW_1DARRAY_LONGLONG(_34, 8, 0);
	_34[0] = 112; _34[1] = 50; _34[2] = 46; _34[3] = 121; _34[4] = 32; _34[5] = 105; _34[6] = 115; _34[7] = 32; 
	//indirectinvoke () = %33 (%34) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_34));
	//fieldload %35 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %36 = %35 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//fieldload %37 = %3 p2 : {{int x,int y} p1,{int x,int y} p2}
	_37 = rec->p2;
	//fieldload %38 = %37 y : {int x,int y}
	_38 = _37->y;
	//indirectinvoke () = %36 (%38) : method(any)->()
	printf("%lld\n", _38);
	//fieldload %39 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %40 = %39 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %41 = [80,97,115,115,32,117,112,100,97,116,101,32,114,101,116,97,110,103,108,101,32,116,101,115,116,32,99,97,115,101] : int[]
	_NEW_1DARRAY_LONGLONG(_41, 30, 0);
	_41[0] = 80; _41[1] = 97; _41[2] = 115; _41[3] = 115; _41[4] = 32; _41[5] = 117; _41[6] = 112; _41[7] = 100; _41[8] = 97; _41[9] = 116; _41[10] = 101; _41[11] = 32; _41[12] = 114; _41[13] = 101; _41[14] = 116; _41[15] = 97; _41[16] = 110; _41[17] = 103; _41[18] = 108; _41[19] = 101; _41[20] = 32; _41[21] = 116; _41[22] = 101; _41[23] = 115; _41[24] = 116; _41[25] = 32; _41[26] = 99; _41[27] = 97; _41[28] = 115; _41[29] = 101; 
	//indirectinvoke () = %40 (%41) : method(int[])->()
	println_s(_41, _41_size);
	//return
	exit(0);
}

