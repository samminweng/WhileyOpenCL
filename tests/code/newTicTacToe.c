#include "newTicTacToe.h"
Board* copy_Board(Board* _Board){
	Board* new_Board = malloc(sizeof(Board));
	_1DARRAY_COPY(new_Board->pieces, _Board->pieces);
	new_Board->move = _Board->move;
	return new_Board;
}
Board** copy_array_Board(Board** _Board, long long _Board_size){
	Board** new_Board = malloc(_Board_size*sizeof(Board*));
	for(int i=0;i<_Board_size;i++){
		new_Board[i] = copy_Board(_Board[i]);
	}
	return new_Board;
}
void free_Board(Board* board){
	free(board->pieces);
	free(board);
}
void printf_Board(Board* board){
	printf("{");
	printf(" pieces:");
	_1DARRAY_PRINT(board->pieces);
	printf(" move:");
	printf("%lld", board->move);
	printf("}");
}
Board* EmptyBoard(){
	Board* r;
	_DECL_OWNERSHIP(r);
	long long _1 = 0;
	long long _2 = 0;
	long long _3 = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	_DECL_1DARRAY(_11);
	_DECL_OWNERSHIP(_11);
	Board* _12;
	_DECL_OWNERSHIP(_12);
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
	//const %10 = 0 : int
	_10 = 0;
	//newlist %11 = (%2, %3, %4, %5, %6, %7, %8, %9, %10) : int[]
	_FREE(_11);
	_NEW_ARRAY(_11, 9);
	_11[0] = _2; _11[1] = _3; _11[2] = _4; _11[3] = _5; _11[4] = _6; _11[5] = _7; _11[6] = _8; _11[7] = _9; _11[8] = _10; 
	_ADD_OWNERSHIP(_11);
	//newrecord %12 = (%1, %11) : {int move,int[] pieces}
	_FREE_STRUCT(_12, Board);
	_12 = malloc(sizeof(Board));
	_12->move = _1;
	_1DARRAY_COPY(_12->pieces, _11);
	_ADD_OWNERSHIP(_12);
	//return %12
	_FREE_STRUCT(r, Board);
	_FREE(_11);
	return _12;
	//return
}

long long countOf(_DECL_1DARRAY_PARAM(pieces), _DECL_OWNERSHIP_PARAM(pieces), long long s){
	long long r = 0;
	long long count = 0;
	long long i = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8 = 0;
	long long _9 = 0;
	long long _10 = 0;
	long long _11 = 0;
	long long _12 = 0;
	//const %5 = 0 : int
	_5 = 0;
	//assign %3 = %5  : int
	count = _5;
	//const %6 = 0 : int
	_6 = 0;
	//assign %4 = %6  : int
	i = _6;
	//loop (%3, %4, %7, %8, %9, %10, %11, %12)
	while(true){
		//lengthof %7 = %0 : int[]
		_7 = pieces_size;
		//ifge %4, %7 goto blklab11 : int
		if(i>=_7){goto blklab11;}
		//indexof %8 = %0, %4 : int[]
		_8=pieces[i];
		//ifne %8, %1 goto blklab13 : int
		if(_8!=s){goto blklab13;}
		//const %9 = 1 : int
		_9 = 1;
		//add %10 = %3, %9 : int
		_10=count+_9;
		//assign %3 = %10  : int
		count = _10;
//.blklab13
blklab13:;
		//const %11 = 1 : int
		_11 = 1;
		//add %12 = %4, %11 : int
		_12=i+_11;
		//assign %4 = %12  : int
		i = _12;
//.blklab12
blklab12:;
	}
//.blklab11
blklab11:;
	//return %3
	_FREE(pieces);
	return count;
	//return
}

