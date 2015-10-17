#include "TicTacToe.h"
void printf_Board(Board s){
	printf("{");
	printf(" pieces:");
	printf_array(s.pieces, s.pieces_size);
	printf(" move:");
	printf("%d", s.move);
	printf("}");
}
Board EmptyBoard(){
	long long _0 = 0;
	long long _1 = 0;
	long long _2 = 0;
	long long _3 = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long* _10 = NULL;
	long long _10_size = 0;
	Board _11;
	//const %0 = 0 : int
	_0 = 0;
	//const %1 = 0 : int
	_1 = 0;
	//const %2 = 0 : int
	_2 = 0;
	//const %3 = 0 : int
	_3 = 0;
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 0 : int
	_5 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//const %7 = 0 : int
	_7 = 0;
	//const %8 = 0 : int
	_8 = 0;
	//const %9 = 0 : int
	_9 = 0;
	//newlist %10 = (%1, %2, %3, %4, %5, %6, %7, %8, %9) : int[]
	_10_size = 9;
	_10 = (long long*)malloc(_10_size*sizeof(long long));
	_10[0] = _1;	_10[1] = _2;	_10[2] = _3;	_10[3] = _4;	_10[4] = _5;	_10[5] = _6;	_10[6] = _7;	_10[7] = _8;	_10[8] = _9;
	//newrecord %11 = (%0, %10) : {int move,int[] pieces}
	_11.move = _0;
	_11.pieces = _10;
	_11.pieces_size = _10_size;

	//return %11 : {int move,int[] pieces}
	return _11;
	//return
	
}
Board play(Board _b, nat _pos){
	long long _2 = 0;
	long long _3 = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	//fieldload %2 = %0 move : {int move,int[] pieces}
	_2 = _b.move;
	//const %3 = 2 : int
	_3 = 2;
	//rem %4 = %2, %3 : int
	_4=_2%_3;
	//const %5 = 0 : int
	_5 = 0;
	//ifne %4, %5 goto blklab11 : int
	if(_4!=_5){goto blklab11;}
	//const %6 = 1 : int
	_6 = 1;
	//const %7 = 1 : int
	_7 = 1;
	//update %0.pieces[%1] = %7 : {int move,int[] pieces} -> {int move,int[] pieces}
	_b.pieces[_pos] = _7;
	//goto blklab12
	goto blklab12;
//.blklab11
blklab11:;
	//const %8 = 2 : int
	_8 = 2;
	//const %9 = 2 : int
	_9 = 2;
	//update %0.pieces[%1] = %9 : {int move,int[] pieces} -> {int move,int[] pieces}
	_b.pieces[_pos] = _9;
//.blklab12
blklab12:;
	//fieldload %10 = %0 move : {int move,int[] pieces}
	_10 = _b.move;
	//const %11 = 1 : int
	_11 = 1;
	//add %12 = %10, %11 : int
	_12=_10+_11;
	//fieldload %13 = %0 move : {int move,int[] pieces}
	_13 = _b.move;
	//const %14 = 1 : int
	_14 = 1;
	//add %15 = %13, %14 : int
	_15=_13+_14;
	//update %0.move = %15 : {int move,int[] pieces} -> {int move,int[] pieces}
	_b.move = _15;
	//return %0 : {int move,int[] pieces}
	return _b;
	//return
	
}
long long countOf(Square* _pieces, long long _pieces_size, Square _s){
	long long _count = 0;
	long long _i = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	//const %5 = 0 : int
	_5 = 0;
	//assign %4 = %5  : int
	_4 = _5;
	//assign %2 = %4  : int
	_count = _4;
	//const %7 = 0 : int
	_7 = 0;
	//assign %6 = %7  : int
	_6 = _7;
	//assign %3 = %6  : int
	_i = _6;
	//lengthof %8 = %0 : int[]
	_8 = _pieces_size;
	//ifge %3, %8 goto blklab13 : int
	while(_i<_8){
		//indexof %9 = %0, %3 : int[]
		_9=_pieces[_i];
		//ifne %9, %1 goto blklab14 : int
		if(_9!=_s){goto blklab14;}
		//const %10 = 1 : int
		_10 = 1;
		//add %11 = %2, %10 : int
		_11=_count+_10;
		//assign %2 = %11  : int
		_count = _11;
//.blklab14
blklab14:;
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %3, %12 : int
		_13=_i+_12;
		//assign %3 = %13  : int
		_i = _13;
	}
//.blklab13
blklab13:;
	//return %2 : int
	return _count;
	//return
	
}
int main(int argc, char** args){
	Board _b;
	long long _i = 0;
	long long _p = 0;
	Board _4;
	Board _5;
	long long _6 = 0;
	long long _7 = 0;
	long long* _8 = NULL;
	long long _8_size = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long* _11 = NULL;
	long long _11_size = 0;
	long long _12 = 0;
	long long* _15 = NULL;
	long long _15_size = 0;
	long long* _20 = NULL;
	long long _20_size = 0;
	long long _23 = 0;
	long long _24 = 0;
	long long* _25 = NULL;
	long long _25_size = 0;
	long long _26 = 0;
	long long _27 = 0;
	long long _28 = 0;
	long long _29 = 0;
	long long* _32 = NULL;
	long long _32_size = 0;
	Board _33;
	long long _34 = 0;
	long long _35 = 0;
	long long _36 = 0;
	long long _37 = 0;
	long long* _38 = NULL;
	long long _38_size = 0;
	long long _39 = 0;
	long long _40 = 0;
	long long _41 = 0;
	long long _42 = 0;
	long long _43 = 0;
	long long _44 = 0;
	long long _45 = 0;
	long long _46 = 0;
	long long _47 = 0;
	long long* _48 = NULL;
	long long _48_size = 0;
	//invoke %5 = () TicTacToe:EmptyBoard : function() -> TicTacToe:Board
	_5 = EmptyBoard();
	//assign %4 = %5  : {int move,int[] pieces}
	_4 = _5;
	//assign %1 = %4  : {int move,int[] pieces}
	_b = _4;
	//const %7 = 0 : int
	_7 = 0;
	//assign %6 = %7  : int
	_6 = _7;
	//assign %2 = %6  : int
	_i = _6;
	//const %8 = [0,1,2,3,4,5,6,7,8] : int[]
	long long _8_value[] = {0, 1, 2, 3, 4, 5, 6, 7, 8};
	_8 = _8_value;
	_8_size = 9;
	//lengthof %9 = %8 : int[]
	_9 = _8_size;
	//ifge %2, %9 goto blklab15 : int
	while(_i<_9){
		//const %11 = [0,1,2,3,4,5,6,7,8] : int[]
		long long _11_value[] = {0, 1, 2, 3, 4, 5, 6, 7, 8};
		_11 = _11_value;
		_11_size = 9;
		//indexof %12 = %11, %2 : int[]
		_12=_11[_i];
		//assign %10 = %12  : int
		_10 = _12;
		//assign %3 = %10  : int
		_p = _10;
		//fieldload %13 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
		//fieldload %14 = %13 print_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
		//const %15 = [66,79,65,82,68,58,32] : int[]
		long long _15_value[] = {66, 79, 65, 82, 68, 58, 32};
		_15 = _15_value;
		_15_size = 7;
		//indirectinvoke %14 (%15) : method(int[]) -> void
		printf_s(_15, _15_size);
		//fieldload %16 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
		//fieldload %17 = %16 println : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
		//indirectinvoke %17 (%1) : method(any) -> void
		printf_Board(_b);
		//fieldload %18 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
		//fieldload %19 = %18 print_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
		//const %20 = [77,79,86,69,58,32] : int[]
		long long _20_value[] = {77, 79, 86, 69, 58, 32};
		_20 = _20_value;
		_20_size = 6;
		//indirectinvoke %19 (%20) : method(int[]) -> void
		printf_s(_20, _20_size);
		//fieldload %21 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
		//fieldload %22 = %21 println : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
		//indirectinvoke %22 (%3) : method(any) -> void
		printf("%d\n", _p);
		//const %23 = 0 : int
		_23 = 0;
		//iflt %3, %23 goto blklab18 : int
		if(_p<_23){goto blklab18;}
		//const %24 = 9 : int
		_24 = 9;
		//ifgt %3, %24 goto blklab19 : int
		if(_p>_24){goto blklab19;}
		//fieldload %25 = %1 pieces : {int move,int[] pieces}
		_25 = _b.pieces;
		_25_size = _b.pieces_size;
		//indexof %26 = %25, %3 : int[]
		_26=_25[_p];
		//const %27 = 0 : int
		_27 = 0;
		//ifne %26, %27 goto blklab20 : int
		if(_26!=_27){goto blklab20;}
		//fieldload %28 = %1 move : {int move,int[] pieces}
		_28 = _b.move;
		//const %29 = 9 : int
		_29 = 9;
		//ifne %28, %29 goto blklab16 : int
		if(_28!=_29){goto blklab16;}
//.blklab20
blklab20:;
//.blklab19
blklab19:;
//.blklab18
blklab18:;
		//fieldload %30 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
		//fieldload %31 = %30 println_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
		//const %32 = [73,78,86,65,76,73,68,32,77,79,86,69,33] : int[]
		long long _32_value[] = {73, 78, 86, 65, 76, 73, 68, 32, 77, 79, 86, 69, 33};
		_32 = _32_value;
		_32_size = 13;
		//indirectinvoke %31 (%32) : method(int[]) -> void
		println_s(_32, _32_size);
		//goto blklab15
		goto blklab15;
		//goto blklab17
		goto blklab17;
//.blklab16
blklab16:;
		//invoke %33 = (%1, %3) TicTacToe:play : function(TicTacToe:Board,TicTacToe:nat) -> TicTacToe:Board
		_33 = play(_b ,_p);
		//assign %1 = %33  : {int move,int[] pieces}
		_b = _33;
//.blklab17
blklab17:;
		//const %34 = 1 : int
		_34 = 1;
		//add %35 = %2, %34 : int
		_35=_i+_34;
		//assign %2 = %35  : int
		_i = _35;
	}
//.blklab15
blklab15:;
	//assert
	{
		//fieldload %36 = %1 move : {int move,int[] pieces}
		_36 = _b.move;
		//const %37 = 9 : int
		_37 = 9;
		//ifeq %36, %37 goto blklab21 : int
		if(_36==_37){goto blklab21;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab21
blklab21:;
	//assert
	}
	//assert
	{
		//fieldload %38 = %1 pieces : {int move,int[] pieces}
		_38 = _b.pieces;
		_38_size = _b.pieces_size;
		//const %39 = 1 : int
		_39 = 1;
		//const %40 = 2 : int
		_40 = 2;
		//const %41 = 1 : int
		_41 = 1;
		//const %42 = 2 : int
		_42 = 2;
		//const %43 = 1 : int
		_43 = 1;
		//const %44 = 2 : int
		_44 = 2;
		//const %45 = 1 : int
		_45 = 1;
		//const %46 = 2 : int
		_46 = 2;
		//const %47 = 1 : int
		_47 = 1;
		//newlist %48 = (%39, %40, %41, %42, %43, %44, %45, %46, %47) : int[]
		_48_size = 9;
		_48 = (long long*)malloc(_48_size*sizeof(long long));
		_48[0] = _39;		_48[1] = _40;		_48[2] = _41;		_48[3] = _42;		_48[4] = _43;		_48[5] = _44;		_48[6] = _45;		_48[7] = _46;		_48[8] = _47;
		//ifeq %38, %48 goto blklab22 : int[]
		if(isArrayEqual(_38, _38_size,_48, _48_size)==1){goto blklab22;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab22
blklab22:;
	//assert
	}
	//return
	exit(0);
}
