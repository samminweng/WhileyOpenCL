#include "TicTacToe10000000.h"
Board EmptyBoard(){
	long long* _pieces = NULL;
	long long _pieces_size = 0;
	long long _i = 0;
	long long* _2 = NULL;
	long long _2_size = 0;
	void* _3 = NULL;
	long long _3_size = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long* _6 = NULL;
	long long _6_size = 0;
	long long _7 = 0;
	long long* _8 = NULL;
	long long _8_size = 0;
	long long* _9 = NULL;
	long long _9_size = 0;
	long long _10 = 0;
	Board _11;
	//newlist %3 = () : [void]
	_3_size = 0;
	_3 = malloc(_3_size);
	//assign %2 = %3  : [void]
	_2 = (long long*)_3;
	_2_size = _3_size;
	//assign %0 = %2  : [int]
	_pieces = (long long*)_2;
	_pieces_size = _2_size;
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 10000000 : int
	_5 = 10000000;
	//range %6 = %4, %5 : [int]
	//forall %1 in %6 (%0, %7, %8, %9) : [int]
	for(_i=_4; _i<_5; _i++){
		//const %7 = 0 : int
		_7 = 0;
		//newlist %8 = (%7) : [int]
		_8_size = 1;
		_8 = (long long*)malloc(_8_size*sizeof(long long));
		_8[0] = _7;
		//append %9 = %0, %8 : [int]
		_9_size = _pieces_size+_8_size;
		_9=append(_pieces, &_pieces_size, _8, &_8_size, &_9_size);
		free(_8);
		//assign %0 = %9  : [int]
		_pieces = (long long*)_9;
		_pieces_size = _9_size;
	}
//.blklab7
blklab7:;
	//const %10 = 0 : int
	_10 = 0;
	//newrecord %11 = (%10, %0) : {int move,[int] pieces}
	_11.pieces = _pieces;
	_11.move = _10;

	//return %11 : {int move,[int] pieces}
	return _11;
	//return
	;
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
	//fieldload %2 = %0 move : {int move,[int] pieces}
	_2 = _b.move;
	//const %3 = 2 : int
	_3 = 2;
	//rem %4 = %2, %3 : int
	_4=_2%_3;
	//const %5 = 0 : int
	_5 = 0;
	//ifne %4, %5 goto blklab12 : int
	if(_4!=_5){goto blklab12;}
	//const %6 = 1 : int
	_6 = 1;
	//const %7 = 1 : int
	_7 = 1;
	//update %0.pieces[%1] = %7 : {int move,[int] pieces} -> {int move,[int] pieces}
	_b.pieces[_pos] = _7;
	//goto blklab13
	goto blklab13;
//.blklab12
blklab12:;
	//const %8 = 2 : int
	_8 = 2;
	//const %9 = 2 : int
	_9 = 2;
	//update %0.pieces[%1] = %9 : {int move,[int] pieces} -> {int move,[int] pieces}
	_b.pieces[_pos] = _9;
//.blklab13
blklab13:;
	//fieldload %10 = %0 move : {int move,[int] pieces}
	_10 = _b.move;
	//const %11 = 1 : int
	_11 = 1;
	//add %12 = %10, %11 : int
	_12=_10+_11;
	//fieldload %13 = %0 move : {int move,[int] pieces}
	_13 = _b.move;
	//const %14 = 1 : int
	_14 = 1;
	//add %15 = %13, %14 : int
	_15=_13+_14;
	//update %0.move = %15 : {int move,[int] pieces} -> {int move,[int] pieces}
	_b.move = _15;
	//return %0 : {int move,[int] pieces}
	return _b;
	//return
	;
}
long long countOf(Square* _pieces, long long _pieces_size, Square _s){
	long long _count = 0;
	long long _size = 0;
	long long _i = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long* _10 = NULL;
	long long _10_size = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	//const %6 = 0 : int
	_6 = 0;
	//assign %5 = %6  : int
	_5 = _6;
	//assign %2 = %5  : int
	_count = _5;
	//lengthof %8 = %0 : [int]
	_8 = _pieces_size;
	//assign %7 = %8  : int
	_7 = _8;
	//assign %3 = %7  : int
	_size = _7;
	//const %9 = 0 : int
	_9 = 0;
	//range %10 = %9, %3 : [int]
	//forall %4 in %10 (%2, %11, %12, %13) : [int]
	for(_i=_9; _i<_size; _i++){
		//indexof %11 = %0, %4 : [int]
		_11=_pieces[_i];
		//ifne %11, %1 goto blklab15 : int
		if(_11!=_s){goto blklab15;}
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %2, %12 : int
		_13=_count+_12;
		//assign %2 = %13  : int
		_count = _13;
//.blklab15
blklab15:;
	}
//.blklab14
blklab14:;
	//return %2 : int
	return _count;
	//return
	;
}
int main(int argc, char** argv){
	Board _b;
	long long _p = 0;
	Board _3;
	Board _4;
	long long _5 = 0;
	long long _6 = 0;
	long long* _7 = NULL;
	long long _7_size = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long* _10 = NULL;
	long long _10_size = 0;
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long* _17 = NULL;
	long long _17_size = 0;
	Board _18;
	//invoke %4 = () TicTacToe10000000:EmptyBoard : function() -> TicTacToe10000000:Board
	_4=EmptyBoard();
	//assign %3 = %4  : {int move,[int] pieces}
	_3 = _4;
	//assign %1 = %3  : {int move,[int] pieces}
	_b = _3;
	//const %5 = 0 : int
	_5 = 0;
	//const %6 = 10000000 : int
	_6 = 10000000;
	//range %7 = %5, %6 : [int]
	//forall %2 in %7 (%1, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18) : [int]
	for(_p=_5; _p<_6; _p++){
		//const %8 = 0 : int
		_8 = 0;
		//iflt %2, %8 goto blklab19 : int
		if(_p<_8){goto blklab19;}
		//const %9 = 10000000 : int
		_9 = 10000000;
		//ifgt %2, %9 goto blklab20 : int
		if(_p>_9){goto blklab20;}
		//fieldload %10 = %1 pieces : {int move,[int] pieces}
		_10 = _b.pieces;
		//indexof %11 = %10, %2 : [int]
		_11=_10[_p];
		//const %12 = 0 : int
		_12 = 0;
		//ifne %11, %12 goto blklab21 : int
		if(_11!=_12){goto blklab21;}
		//fieldload %13 = %1 move : {int move,[int] pieces}
		_13 = _b.move;
		//const %14 = 10000000 : int
		_14 = 10000000;
		//ifne %13, %14 goto blklab17 : int
		if(_13!=_14){goto blklab17;}
//.blklab21
blklab21:;
//.blklab20
blklab20:;
//.blklab19
blklab19:;
		//fieldload %15 = %0 out : {[[int]] args,{method(any) -> void print,method([int]) -> void print_s,method(any) -> void println,method([int]) -> void println_s} out}
		//fieldload %16 = %15 println : {method(any) -> void print,method([int]) -> void print_s,method(any) -> void println,method([int]) -> void println_s}
		//const %17 = [73,78,86,65,76,73,68,32,77,79,86,69,33] : [int+]
		//indirectinvoke %16 (%17) : method(any) -> void
		indirect_printf_array(_17, _17_size);

		//goto blklab18
		goto blklab18;
//.blklab17
blklab17:;
		//invoke %18 = (%1, %2) TicTacToe10000000:play : function(TicTacToe10000000:Board,TicTacToe10000000:nat) -> TicTacToe10000000:Board
		_18=play(_b ,_p);
		//assign %1 = %18  : {int move,[int] pieces}
		_b = _18;
//.blklab18
blklab18:;
	}
//.blklab16
blklab16:;
	//fieldload %19 = %0 out : {[[int]] args,{method(any) -> void print,method([int]) -> void print_s,method(any) -> void println,method([int]) -> void println_s} out}
	//fieldload %20 = %19 println : {method(any) -> void print,method([int]) -> void print_s,method(any) -> void println,method([int]) -> void println_s}
	//indirectinvoke %20 (%1) : method(any) -> void
	indrect_printf_string("pieces	");
	indirect_printf_array_withoutlength(_b.pieces);
	indrect_printf_string("move	");
	indirect_printf(_b.move);

	//return
	;
}
