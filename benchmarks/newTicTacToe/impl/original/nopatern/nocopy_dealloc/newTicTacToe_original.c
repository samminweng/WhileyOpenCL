#include "newTicTacToe_original.h"
Board* copy_Board(Board* _Board){
	Board* new_Board = malloc(sizeof(Board));
	_COPY_1DARRAY_int64_t(new_Board->pieces, _Board->pieces);
	new_Board->move = _Board->move;
	return new_Board;
}
Board** copy_array_Board(Board** _Board, size_t _Board_size){
	Board** new_Board = malloc(_Board_size*sizeof(Board*));
	for(int i=0;i<_Board_size;i++){
		new_Board[i] = copy_Board(_Board[i]);
	}
	return new_Board;
}
void free_Board(Board* board){
	free(board->pieces);
	board->pieces = NULL;
	free(board);
}
void printf_Board(Board* board){
	printf("{");
	printf(" pieces:");
	_PRINT_1DARRAY_int64_t(board->pieces);
	printf(" move:");
	printf("%"PRId64, board->move);
	printf("}");
}
Board* EmptyBoard(){
	Board* r;
	_DECL_DEALLOC(r);
	int64_t _1 = 0;
	int64_t _2 = 0;
	int64_t _3 = 0;
	int64_t _4 = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	Board* _12;
	_DECL_DEALLOC(_12);
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
	_DEALLOC(_11);
	_NEW_1DARRAY_int64_t(_11, 9, 0);
	_11[0] = _2; _11[1] = _3; _11[2] = _4; _11[3] = _5; _11[4] = _6; _11[5] = _7; _11[6] = _8; _11[7] = _9; _11[8] = _10; 
	_ADD_DEALLOC(_11);
	//newrecord %12 = (%1, %11) : {int move,int[] pieces}
	_DEALLOC_STRUCT(_12, Board);
	_12 = malloc(sizeof(Board));
	_12->move = _1;
	_UPDATE_1DARRAY(_12->pieces, _11);
	_REMOVE_DEALLOC(_11);
	_ADD_DEALLOC(_12);
	//return %12
	_DEALLOC_STRUCT(r, Board);
	_DEALLOC(_11);
	return _12;
	//return
}

int64_t countOf(_DECL_1DARRAY_PARAM(pieces), _DECL_DEALLOC_PARAM(pieces), int64_t s){
	int64_t r = 0;
	int64_t count = 0;
	int64_t i = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	int64_t _9 = 0;
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
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
	_DEALLOC(pieces);
	return count;
	//return
}

int main(int argc, char** args){
	int64_t* n;
	_DECL_DEALLOC(n);
	int64_t max = 0;
	int64_t repeat = 0;
	Board* b1;
	_DECL_DEALLOC(b1);
	Board* b2;
	_DECL_DEALLOC(b2);
	int64_t i = 0;
	int64_t p = 0;
	int64_t* _8;
	_DECL_DEALLOC(_8);
	_DECL_2DARRAY(_9);
	_DECL_DEALLOC(_9);
	int64_t _10 = 0;
	_DECL_1DARRAY(_11);
	_DECL_DEALLOC(_11);
	int64_t _12 = 0;
	Board* _13;
	_DECL_DEALLOC(_13);
	Board* _14;
	_DECL_DEALLOC(_14);
	int64_t _15 = 0;
	_DECL_1DARRAY(_16);
	_DECL_DEALLOC(_16);
	int64_t _17 = 0;
	_DECL_1DARRAY(_18);
	_DECL_DEALLOC(_18);
	int64_t _19 = 0;
	int64_t _20 = 0;
	int64_t _21 = 0;
	int64_t _22 = 0;
	int64_t _23 = 0;
	int64_t _24 = 0;
	int64_t _25 = 0;
	void* _26;
	int64_t _27 = 0;
	int64_t _28 = 0;
	int64_t _29 = 0;
	int64_t _30 = 0;
	void* _31;
	int64_t _32 = 0;
	int64_t _33 = 0;
	int64_t _34 = 0;
	int64_t _35 = 0;
	void* _36;
	_DECL_1DARRAY(_38);
	_DECL_DEALLOC(_38);
	//fieldload %9 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_DEALLOC_2DARRAY_int64_t(_9);
	_CONV_ARGS(_9);
	_ADD_DEALLOC(_9);
	//const %10 = 0 : int
	_10 = 0;
	//indexof %11 = %9, %10 : int[][]
	_11=_9[_10];
	_11_size = _9_size_size;
	_REMOVE_DEALLOC(_11);
	//invoke (%8) = (%11) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	{
		_STR_TO_INT(_8, _11);
		_ADD_DEALLOC(_8);
		_REMOVE_DEALLOC(_11);
	}
	//assign %1 = %8  : null|int
	_DEALLOC(n);
	n = _8;
	_TRANSFER_DEALLOC(n, _8);
	//ifis %1, null goto blklab14 : null|int
	if(n == NULL) { goto blklab14;}
	//assign %2 = %1  : int
	max = *n;
	//const %12 = 0 : int
	_12 = 0;
	//assign %3 = %12  : int
	repeat = _12;
	//loop (%3, %4, %5, %6, %7, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35)
	while(true){
		//ifge %3, %2 goto blklab15 : int
		if(repeat>=max){goto blklab15;}
		//invoke (%13) = () newTicTacToe_original:EmptyBoard : function()->(newTicTacToe_original:Board)
		{
			_DEALLOC_STRUCT(_13, Board);
			_13 = EmptyBoard();
			_ADD_DEALLOC(_13);
		}
		//assign %4 = %13  : null|{int move,int[] pieces}
		_DEALLOC_STRUCT(b1, Board);
		b1 = _13;
		_TRANSFER_DEALLOC(b1, _13);
		//invoke (%14) = () newTicTacToe_original:EmptyBoard : function()->(newTicTacToe_original:Board)
		{
			_DEALLOC_STRUCT(_14, Board);
			_14 = EmptyBoard();
			_ADD_DEALLOC(_14);
		}
		//assign %5 = %14  : null|{int move,int[] pieces}
		_DEALLOC_STRUCT(b2, Board);
		b2 = _14;
		_TRANSFER_DEALLOC(b2, _14);
		//const %15 = 0 : int
		_15 = 0;
		//assign %6 = %15  : int
		i = _15;
		//loop (%4, %5, %6, %7, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33)
		while(true){
			//const %16 = [0,1,2,3,4,5,6,7,8] : int[]
			_DEALLOC(_16);
			_NEW_1DARRAY_int64_t(_16, 9, 0);
			_16[0] = 0; _16[1] = 1; _16[2] = 2; _16[3] = 3; _16[4] = 4; _16[5] = 5; _16[6] = 6; _16[7] = 7; _16[8] = 8; 
			_ADD_DEALLOC(_16);
			//lengthof %17 = %16 : int[]
			_17 = _16_size;
			//ifge %6, %17 goto blklab17 : int
			if(i>=_17){goto blklab17;}
			//const %18 = [0,1,2,3,4,5,6,7,8] : int[]
			_DEALLOC(_18);
			_NEW_1DARRAY_int64_t(_18, 9, 0);
			_18[0] = 0; _18[1] = 1; _18[2] = 2; _18[3] = 3; _18[4] = 4; _18[5] = 5; _18[6] = 6; _18[7] = 7; _18[8] = 8; 
			_ADD_DEALLOC(_18);
			//indexof %19 = %18, %6 : int[]
			_19=_18[i];
			//assign %7 = %19  : int
			p = _19;
			//const %20 = 0 : int
			_20 = 0;
			//iflt %7, %20 goto blklab21 : int
			if(p<_20){goto blklab21;}
			//const %21 = 9 : int
			_21 = 9;
			//ifle %7, %21 goto blklab19 : int
			if(p<=_21){goto blklab19;}
//.blklab21
blklab21:;
			//goto blklab17
			goto blklab17;
			//goto blklab20
			goto blklab20;
//.blklab19
blklab19:;
			//ifis %4, null goto blklab22 : null|{int move,int[] pieces}
			if(b1 == NULL) { goto blklab22;}
			//const %22 = 1 : int
			_22 = 1;
			//update %4.pieces[%7] = %22 : {int move,int[] pieces} -> {int move,int[] pieces}
			b1->pieces[p] = _22;
			//fieldload %23 = %4 move : {int move,int[] pieces}
			_23 = b1->move;
			//const %24 = 1 : int
			_24 = 1;
			//add %25 = %23, %24 : int
			_25=_23+_24;
			//update %4.move = %25 : {int move,int[] pieces} -> {int move,int[] pieces}
			b1->move = _25;
			//assign %5 = %4  : {int move,int[] pieces}
			_DEALLOC_STRUCT(b2, Board);
			b2 = copy_Board(b1);
			_ADD_DEALLOC(b2);
			//const %26 = null : null
			_26 = NULL;
			//assign %4 = %26  : null
			_DEALLOC_STRUCT(b1, Board);
			b1 = NULL;
			_REMOVE_DEALLOC(b1);
			//goto blklab23
			goto blklab23;
//.blklab22
blklab22:;
			//ifis %5, null goto blklab24 : null|{int move,int[] pieces}
			if(b2 == NULL) { goto blklab24;}
			//const %27 = 2 : int
			_27 = 2;
			//update %5.pieces[%7] = %27 : {int move,int[] pieces} -> {int move,int[] pieces}
			b2->pieces[p] = _27;
			//fieldload %28 = %5 move : {int move,int[] pieces}
			_28 = b2->move;
			//const %29 = 1 : int
			_29 = 1;
			//add %30 = %28, %29 : int
			_30=_28+_29;
			//update %5.move = %30 : {int move,int[] pieces} -> {int move,int[] pieces}
			b2->move = _30;
			//assign %4 = %5  : {int move,int[] pieces}
			_DEALLOC_STRUCT(b1, Board);
			b1 = b2;
			_TRANSFER_DEALLOC(b1, b2);
			//const %31 = null : null
			_31 = NULL;
			//assign %5 = %31  : null
			_DEALLOC_STRUCT(b2, Board);
			b2 = NULL;
			_REMOVE_DEALLOC(b2);
//.blklab24
blklab24:;
//.blklab23
blklab23:;
//.blklab20
blklab20:;
			//const %32 = 1 : int
			_32 = 1;
			//add %33 = %6, %32 : int
			_33=i+_32;
			//assign %6 = %33  : int
			i = _33;
//.blklab18
blklab18:;
		}
//.blklab17
blklab17:;
		//const %34 = 1 : int
		_34 = 1;
		//add %35 = %3, %34 : int
		_35=repeat+_34;
		//assign %3 = %35  : int
		repeat = _35;
//.blklab16
blklab16:;
	}
//.blklab15
blklab15:;
	//fieldload %36 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %37 = %36 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %38 = [80,97,115,115,32,110,101,119,84,105,99,84,97,99,84,111,101,32,116,101,115,116,32,99,97,115,101] : int[]
	_DEALLOC(_38);
	_NEW_1DARRAY_int64_t(_38, 27, 0);
	_38[0] = 80; _38[1] = 97; _38[2] = 115; _38[3] = 115; _38[4] = 32; _38[5] = 110; _38[6] = 101; _38[7] = 119; _38[8] = 84; _38[9] = 105; _38[10] = 99; _38[11] = 84; _38[12] = 97; _38[13] = 99; _38[14] = 84; _38[15] = 111; _38[16] = 101; _38[17] = 32; _38[18] = 116; _38[19] = 101; _38[20] = 115; _38[21] = 116; _38[22] = 32; _38[23] = 99; _38[24] = 97; _38[25] = 115; _38[26] = 101; 
	_ADD_DEALLOC(_38);
	//indirectinvoke () = %37 (%38) : method(int[])->()
	{
		println_s(_38, _38_size);
	}
//.blklab14
blklab14:;
	//return
	_DEALLOC(n);
	_DEALLOC_STRUCT(b1, Board);
	_DEALLOC_STRUCT(b2, Board);
	_DEALLOC(_8);
	_DEALLOC_2DARRAY_int64_t(_9);
	_DEALLOC(_11);
	_DEALLOC_STRUCT(_13, Board);
	_DEALLOC_STRUCT(_14, Board);
	_DEALLOC(_16);
	_DEALLOC(_18);
	_DEALLOC(_38);
	exit(0);
}

