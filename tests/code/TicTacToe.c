#include "TicTacToe.h"
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
	 _11;
	//newlist %3 = () : [void]
	_3_size = 0;
	_3 = malloc(_3_size);
	//assign %2 = %3  : [void]
	_2 = _3;
	_2_size = _3_size;
	//assign %0 = %2  : [int]
	_pieces = _2;
	_pieces_size = _2_size;
	//const %4 = 0 : int
	_4 = 0;
	//const %5 = 9 : int
	_5 = 9;
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
		_pieces = _9;
		_pieces_size = _9_size;
	}
//.blklab7
blklab7:;
	//const %10 = 0 : int
	_10 = 0;
	//newrecord %11 = (%10, %0) : {int move,[int] pieces}
	_11.pieces = _10;
	_11.move = _pieces;

	//return %11 : {int move,[int] pieces}
	return _11;
	//return
	;
}
long long countOf(Square* _pieces, long long _pieces_size, Square _s){
	Square _s;
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
		//ifne %11, %1 goto blklab9 : int
		if(_11!=_s){goto blklab9;}
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %2, %12 : int
		_13=_count+_12;
		//assign %2 = %13  : int
		_count = _13;
//.blklab9
blklab9:;
	}
//.blklab8
blklab8:;
	//return %2 : int
	return _count;
	//return
	;
}
int main(int argc, char** argv){
	Board _b;
	 _2;
	 _3;
	//invoke %3 = () TicTacToe:EmptyBoard : function() -> TicTacToe:Board
	_3=EmptyBoard();
	//assign %2 = %3  : {int move,[int] pieces}

	//assign %1 = %2  : {int move,[int] pieces}

	//return
	;
}
