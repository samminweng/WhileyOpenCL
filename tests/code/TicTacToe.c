#include "TicTacToe.h"
void printf_Board(Board _board){
	printf("{");
	printf(" pieces:");
	printf1DArray(_board.pieces, _board.pieces_size);
	printf(" move:");
	printf("%d", _board.move);
	printf("}");
}
Board copy_Board(Board _board){
	Board new_board;
	new_board.pieces_size = _board.pieces_size;		new_board.pieces = copy(_board.pieces, _board.pieces_size);
	new_board.move = _board.move;
	return new_board;
}
void free_Board(Board _Board){
	free(_Board.pieces);
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
	 bool _10_has_ownership = false;
	Board _11;
	 bool _11_has_ownership = false;
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
	_10 = malloc(9*sizeof(long long));
	_10[0] = _1;	_10[1] = _2;	_10[2] = _3;	_10[3] = _4;	_10[4] = _5;	_10[5] = _6;	_10[6] = _7;	_10[7] = _8;	_10[8] = _9;	
	//newrecord %11 = (%0, %10) : {int move,int[] pieces}
	_11.move = _0;
	_11.pieces_size = _10_size;		_11.pieces = copy(_10, _10_size);
	//return %11 : {int move,int[] pieces}
	if(_10_has_ownership){free(_10);}
	return _11;
	//return
}

Board play(Board b, nat pos){
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
	_2 = b.move;
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
	b.pieces[pos] = _7;
	//goto blklab12
	goto blklab12;
//.blklab11
blklab11:;
	//const %8 = 2 : int
	_8 = 2;
	//const %9 = 2 : int
	_9 = 2;
	//update %0.pieces[%1] = %9 : {int move,int[] pieces} -> {int move,int[] pieces}
	b.pieces[pos] = _9;
//.blklab12
blklab12:;
	//fieldload %10 = %0 move : {int move,int[] pieces}
	_10 = b.move;
	//const %11 = 1 : int
	_11 = 1;
	//add %12 = %10, %11 : int
	_12=_10+_11;
	//fieldload %13 = %0 move : {int move,int[] pieces}
	_13 = b.move;
	//const %14 = 1 : int
	_14 = 1;
	//add %15 = %13, %14 : int
	_15=_13+_14;
	//update %0.move = %15 : {int move,int[] pieces} -> {int move,int[] pieces}
	b.move = _15;
	//return %0 : {int move,int[] pieces}
	return b;
	//return
}

long long countOf(Square* pieces, long long pieces_size, Square s){
	long long count = 0;
	long long i = 0;
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
	count = _4;
	//const %7 = 0 : int
	_7 = 0;
	//assign %6 = %7  : int
	_6 = _7;
	//assign %3 = %6  : int
	i = _6;
	//loop (%2, %3, %8, %9, %10, %11, %12, %13)
	while(true){
		//lengthof %8 = %0 : int[]
		_8 = pieces_size;
		//ifge %3, %8 goto blklab13 : int
		if(i>=_8){goto blklab13;}
		//indexof %9 = %0, %3 : int[]
		_9=pieces[i];
		//ifne %9, %1 goto blklab14 : int
		if(_9!=s){goto blklab14;}
		//const %10 = 1 : int
		_10 = 1;
		//add %11 = %2, %10 : int
		_11=count+_10;
		//assign %2 = %11  : int
		count = _11;
//.blklab14
blklab14:;
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %3, %12 : int
		_13=i+_12;
		//assign %3 = %13  : int
		i = _13;
	}
//.blklab13
blklab13:;
	//return %2 : int
	return count;
	//return
}

int main(int argc, char** args){
	Board b;
	 bool b_has_ownership = false;
	long long i = 0;
	long long p = 0;
	Board _4;
	 bool _4_has_ownership = false;
	Board _5;
	 bool _5_has_ownership = false;
	long long _6 = 0;
	long long _7 = 0;
	long long* _8 = NULL;
	long long _8_size = 0;
	 bool _8_has_ownership = false;
	long long _9 = 0;
	long long _10 = 0;
	long long* _11 = NULL;
	long long _11_size = 0;
	 bool _11_has_ownership = false;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long* _15 = NULL;
	long long _15_size = 0;
	 bool _15_has_ownership = false;
	long long _16 = 0;
	long long _17 = 0;
	long long _18 = 0;
	long long _19 = 0;
	Board _20;
	 bool _20_has_ownership = false;
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	long long* _25 = NULL;
	long long _25_size = 0;
	 bool _25_has_ownership = false;
	long long _26 = 0;
	long long _27 = 0;
	long long _28 = 0;
	long long _29 = 0;
	long long _30 = 0;
	long long _31 = 0;
	long long _32 = 0;
	long long _33 = 0;
	long long _34 = 0;
	long long* _35 = NULL;
	long long _35_size = 0;
	 bool _35_has_ownership = false;
	long long* _38 = NULL;
	long long _38_size = 0;
	 bool _38_has_ownership = false;
	//invoke %5 = () TicTacToe:EmptyBoard : function() -> TicTacToe:Board
	_5 = EmptyBoard();
	//assign %4 = %5  : {int move,int[] pieces}
	if(_4_has_ownership){free_Board(_4);}

	_4 = copy_Board(_5);
	_4_has_ownership = true;
	//assign %1 = %4  : {int move,int[] pieces}
	if(b_has_ownership){free_Board(b);}

	b = copy_Board(_4);
	b_has_ownership = true;
	//const %7 = 0 : int
	_7 = 0;
	//assign %6 = %7  : int
	_6 = _7;
	//assign %2 = %6  : int
	i = _6;
	//loop (%1, %2, %3, %8, %9, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22)
	while(true){
		//const %8 = [0,1,2,3,4,5,6,7,8] : int[]
		_8_size = 9;
		_8=(long long*)malloc(9*sizeof(long long));
		_8[0] = 0; _8[1] = 1; _8[2] = 2; _8[3] = 3; _8[4] = 4; _8[5] = 5; _8[6] = 6; _8[7] = 7; _8[8] = 8; 
		//lengthof %9 = %8 : int[]
		_9 = _8_size;
		//ifge %2, %9 goto blklab15 : int
		if(i>=_9){goto blklab15;}
		//const %11 = [0,1,2,3,4,5,6,7,8] : int[]
		_11_size = 9;
		_11=(long long*)malloc(9*sizeof(long long));
		_11[0] = 0; _11[1] = 1; _11[2] = 2; _11[3] = 3; _11[4] = 4; _11[5] = 5; _11[6] = 6; _11[7] = 7; _11[8] = 8; 
		//indexof %12 = %11, %2 : int[]
		_12=_11[i];
		//assign %10 = %12  : int
		_10 = _12;
		//assign %3 = %10  : int
		p = _10;
		//const %13 = 0 : int
		_13 = 0;
		//iflt %3, %13 goto blklab18 : int
		if(p<_13){goto blklab18;}
		//const %14 = 9 : int
		_14 = 9;
		//ifgt %3, %14 goto blklab19 : int
		if(p>_14){goto blklab19;}
		//fieldload %15 = %1 pieces : {int move,int[] pieces}
		_15_size = b.pieces_size;			_15 = copy(b.pieces, b.pieces_size);
		//indexof %16 = %15, %3 : int[]
		_16=_15[p];
		//const %17 = 0 : int
		_17 = 0;
		//ifne %16, %17 goto blklab20 : int
		if(_16!=_17){goto blklab20;}
		//fieldload %18 = %1 move : {int move,int[] pieces}
		_18 = b.move;
		//const %19 = 9 : int
		_19 = 9;
		//ifne %18, %19 goto blklab16 : int
		if(_18!=_19){goto blklab16;}
//.blklab20
blklab20:;
//.blklab19
blklab19:;
//.blklab18
blklab18:;
		//goto blklab15
		goto blklab15;
		//goto blklab17
		goto blklab17;
//.blklab16
blklab16:;
		//invoke %20 = (%1, %3) TicTacToe:play : function(TicTacToe:Board,TicTacToe:nat) -> TicTacToe:Board
		_20 = play(b, p);
		//assign %1 = %20  : {int move,int[] pieces}
		if(b_has_ownership){free_Board(b);}

		b = copy_Board(_20);
		b_has_ownership = true;
//.blklab17
blklab17:;
		//const %21 = 1 : int
		_21 = 1;
		//add %22 = %2, %21 : int
		_22=i+_21;
		//assign %2 = %22  : int
		i = _22;
	}
//.blklab15
blklab15:;
	//assert
	{
		//fieldload %23 = %1 move : {int move,int[] pieces}
		_23 = b.move;
		//const %24 = 9 : int
		_24 = 9;
		//ifeq %23, %24 goto blklab21 : int
		if(_23==_24){goto blklab21;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab21
blklab21:;
	//assert
	}
	//assert
	{
		//fieldload %25 = %1 pieces : {int move,int[] pieces}
		_25_size = b.pieces_size;			_25 = copy(b.pieces, b.pieces_size);
		//const %26 = 1 : int
		_26 = 1;
		//const %27 = 2 : int
		_27 = 2;
		//const %28 = 1 : int
		_28 = 1;
		//const %29 = 2 : int
		_29 = 2;
		//const %30 = 1 : int
		_30 = 1;
		//const %31 = 2 : int
		_31 = 2;
		//const %32 = 1 : int
		_32 = 1;
		//const %33 = 2 : int
		_33 = 2;
		//const %34 = 1 : int
		_34 = 1;
		//newlist %35 = (%26, %27, %28, %29, %30, %31, %32, %33, %34) : int[]
		_35_size = 9;
		_35 = malloc(9*sizeof(long long));
		_35[0] = _26;	_35[1] = _27;	_35[2] = _28;	_35[3] = _29;	_35[4] = _30;	_35[5] = _31;	_35[6] = _32;	_35[7] = _33;	_35[8] = _34;	
		//ifeq %25, %35 goto blklab22 : int[]
		if(isArrayEqual(_25, _25_size,_35, _35_size)==1){goto blklab22;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab22
blklab22:;
	//assert
	}
	//fieldload %36 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	//fieldload %37 = %36 print_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
	//const %38 = [80,97,115,115,32,84,105,99,84,97,99,84,111,101,32,116,101,115,116,32,99,97,115,101] : int[]
	_38_size = 24;
	_38=(long long*)malloc(24*sizeof(long long));
	_38[0] = 80; _38[1] = 97; _38[2] = 115; _38[3] = 115; _38[4] = 32; _38[5] = 84; _38[6] = 105; _38[7] = 99; _38[8] = 84; _38[9] = 97; _38[10] = 99; _38[11] = 84; _38[12] = 111; _38[13] = 101; _38[14] = 32; _38[15] = 116; _38[16] = 101; _38[17] = 115; _38[18] = 116; _38[19] = 32; _38[20] = 99; _38[21] = 97; _38[22] = 115; _38[23] = 101; 
	//indirectinvoke %37 (%38) : method(int[]) -> void
	printf_s(_38, _38_size);
	//return
	if(_35_has_ownership){free(_35);}
	if(_4_has_ownership){free_Board(_4);}
	exit(0);
}

