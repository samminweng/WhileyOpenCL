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
	new_board.pieces_size = _board.pieces_size;
	new_board.pieces = copy(_board.pieces, _board.pieces_size);
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
	bool _10_has_ownership = true;
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
	_10 = malloc(9*sizeof(long long));
	_10[0] = _1;	_10[1] = _2;	_10[2] = _3;	_10[3] = _4;	_10[4] = _5;	_10[5] = _6;	_10[6] = _7;	_10[7] = _8;	_10[8] = _9;	
	//newrecord %11 = (%0, %10) : {int move,int[] pieces}
	_11.move = _0;
	_11.pieces_size = _10_size;
	_11.pieces = _10;
	//return %11 : {int move,int[] pieces}
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
	union UNION max;
	long long repeat = 0;
	Board b;
	long long i = 0;
	long long p = 0;
	union UNION _6;
	union UNION _7;
	long long** _8 = NULL;
	long long _8_size = 0;
	long long _8_size_size = 0;
	bool _8_has_ownership = true;
	long long _9 = 0;
	long long* _10 = NULL;
	long long _10_size = 0;
	bool _10_has_ownership = true;
	long long _11 = 0;
	long long _12 = 0;
	Board _13;
	Board _14;
	long long _15 = 0;
	long long _16 = 0;
	long long* _17 = NULL;
	long long _17_size = 0;
	bool _17_has_ownership = true;
	long long _18 = 0;
	long long _19 = 0;
	long long* _20 = NULL;
	long long _20_size = 0;
	bool _20_has_ownership = true;
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	long long* _24 = NULL;
	long long _24_size = 0;
	bool _24_has_ownership = true;
	long long _25 = 0;
	long long _26 = 0;
	long long _27 = 0;
	long long _28 = 0;
	long long* _31 = NULL;
	long long _31_size = 0;
	bool _31_has_ownership = true;
	Board _32;
	long long _33 = 0;
	long long _34 = 0;
	long long _35 = 0;
	long long _36 = 0;
	long long* _37 = NULL;
	long long _37_size = 0;
	bool _37_has_ownership = true;
	long long _38 = 0;
	long long _39 = 0;
	long long _40 = 0;
	long long _41 = 0;
	long long _42 = 0;
	long long _43 = 0;
	long long _44 = 0;
	long long _45 = 0;
	long long _46 = 0;
	long long* _47 = NULL;
	long long _47_size = 0;
	bool _47_has_ownership = true;
	long long _48 = 0;
	long long _49 = 0;
	long long* _52 = NULL;
	long long _52_size = 0;
	bool _52_has_ownership = true;
	//fieldload %8 = %0 args : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	_8 = convertArgsToIntArray(argc, args);
	_8_size = argc - 1;
	//const %9 = 0 : int
	_9 = 0;
	//indexof %10 = %8, %9 : int[][]
	_10=_8[_9];
	//invoke %7 = (%10) whiley/lang/Int:parse : function(whiley/lang/ASCII:string) -> null|int
	_7 = parseInteger(_10);
	//assign %6 = %7  : null|int
	_6 = _7;
	//assign %1 = %6  : null|int
	max = _6;
	//ifis %1, null goto blklab15 : null|int
	if(max.null == NULL) { goto blklab15;}
	//const %12 = 0 : int
	_12 = 0;
	//assign %11 = %12  : int
	_11 = _12;
	//assign %2 = %11  : int
	repeat = _11;
	//loop (%2, %3, %4, %5, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49)
	while(true){
		//ifge %2, %1 goto blklab16 : int
		if(repeat>=max.integer){goto blklab16;}
		//invoke %14 = () TicTacToe:EmptyBoard : function() -> TicTacToe:Board
		_14 = EmptyBoard();
		//assign %13 = %14  : {int move,int[] pieces}
		_13 = _14;
		//assign %3 = %13  : {int move,int[] pieces}
		b = _13;
		//const %16 = 0 : int
		_16 = 0;
		//assign %15 = %16  : int
		_15 = _16;
		//assign %4 = %15  : int
		i = _15;
		//loop (%3, %4, %5, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34)
		while(true){
			//const %17 = [0,1,2,3,4,5,6,7,8] : int[]
			_17_size = 9;
			_17=(long long*)malloc(9*sizeof(long long));
			_17[0] = 0; _17[1] = 1; _17[2] = 2; _17[3] = 3; _17[4] = 4; _17[5] = 5; _17[6] = 6; _17[7] = 7; _17[8] = 8; 
			//lengthof %18 = %17 : int[]
			_18 = _17_size;
			//ifge %4, %18 goto blklab17 : int
			if(i>=_18){goto blklab17;}
			//const %20 = [0,1,2,3,4,5,6,7,8] : int[]
			_20_size = 9;
			_20=(long long*)malloc(9*sizeof(long long));
			_20[0] = 0; _20[1] = 1; _20[2] = 2; _20[3] = 3; _20[4] = 4; _20[5] = 5; _20[6] = 6; _20[7] = 7; _20[8] = 8; 
			//indexof %21 = %20, %4 : int[]
			_21=_20[i];
			//assign %19 = %21  : int
			_19 = _21;
			//assign %5 = %19  : int
			p = _19;
			//const %22 = 0 : int
			_22 = 0;
			//iflt %5, %22 goto blklab20 : int
			if(p<_22){goto blklab20;}
			//const %23 = 9 : int
			_23 = 9;
			//ifgt %5, %23 goto blklab21 : int
			if(p>_23){goto blklab21;}
			//fieldload %24 = %3 pieces : {int move,int[] pieces}
			_24_size = b.pieces_size;
			_24 = b.pieces;
			//indexof %25 = %24, %5 : int[]
			_25=_24[p];
			//const %26 = 0 : int
			_26 = 0;
			//ifne %25, %26 goto blklab22 : int
			if(_25!=_26){goto blklab22;}
			//fieldload %27 = %3 move : {int move,int[] pieces}
			_27 = b.move;
			//const %28 = 9 : int
			_28 = 9;
			//ifne %27, %28 goto blklab18 : int
			if(_27!=_28){goto blklab18;}
//.blklab22
blklab22:;
//.blklab21
blklab21:;
//.blklab20
blklab20:;
			//fieldload %29 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
			//fieldload %30 = %29 println_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
			//const %31 = [73,78,86,65,76,73,68,32,77,79,86,69,33] : int[]
			_31_size = 13;
			_31=(long long*)malloc(13*sizeof(long long));
			_31[0] = 73; _31[1] = 78; _31[2] = 86; _31[3] = 65; _31[4] = 76; _31[5] = 73; _31[6] = 68; _31[7] = 32; _31[8] = 77; _31[9] = 79; _31[10] = 86; _31[11] = 69; _31[12] = 33; 
			//indirectinvoke %30 (%31) : method(int[]) -> void
			println_s(_31, _31_size);
			//goto blklab17
			goto blklab17;
			//goto blklab19
			goto blklab19;
//.blklab18
blklab18:;
			//invoke %32 = (%3, %5) TicTacToe:play : function(TicTacToe:Board,TicTacToe:nat) -> TicTacToe:Board
			_32 = play(b, p);
			//assign %3 = %32  : {int move,int[] pieces}
			b = _32;
//.blklab19
blklab19:;
			//const %33 = 1 : int
			_33 = 1;
			//add %34 = %4, %33 : int
			_34=i+_33;
			//assign %4 = %34  : int
			i = _34;
		}
//.blklab17
blklab17:;
		//assert
		{
			//fieldload %35 = %3 move : {int move,int[] pieces}
			_35 = b.move;
			//const %36 = 9 : int
			_36 = 9;
			//ifeq %35, %36 goto blklab23 : int
			if(_35==_36){goto blklab23;}
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab23
blklab23:;
		//assert
		}
		//assert
		{
			//fieldload %37 = %3 pieces : {int move,int[] pieces}
			_37_size = b.pieces_size;
			_37 = b.pieces;
			//const %38 = 1 : int
			_38 = 1;
			//const %39 = 2 : int
			_39 = 2;
			//const %40 = 1 : int
			_40 = 1;
			//const %41 = 2 : int
			_41 = 2;
			//const %42 = 1 : int
			_42 = 1;
			//const %43 = 2 : int
			_43 = 2;
			//const %44 = 1 : int
			_44 = 1;
			//const %45 = 2 : int
			_45 = 2;
			//const %46 = 1 : int
			_46 = 1;
			//newlist %47 = (%38, %39, %40, %41, %42, %43, %44, %45, %46) : int[]
			_47_size = 9;
			_47 = malloc(9*sizeof(long long));
			_47[0] = _38;	_47[1] = _39;	_47[2] = _40;	_47[3] = _41;	_47[4] = _42;	_47[5] = _43;	_47[6] = _44;	_47[7] = _45;	_47[8] = _46;	
			//ifeq %37, %47 goto blklab24 : int[]
			if(isArrayEqual(_37, _37_size,_47, _47_size)==1){goto blklab24;}
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab24
blklab24:;
		//assert
		}
		//const %48 = 1 : int
		_48 = 1;
		//add %49 = %2, %48 : int
		_49=repeat+_48;
		//assign %2 = %49  : int
		repeat = _49;
	}
//.blklab16
blklab16:;
	//fieldload %50 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	//fieldload %51 = %50 print_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
	//const %52 = [80,97,115,115,32,84,105,99,84,97,99,84,111,101,32,116,101,115,116,32,99,97,115,101] : int[]
	_52_size = 24;
	_52=(long long*)malloc(24*sizeof(long long));
	_52[0] = 80; _52[1] = 97; _52[2] = 115; _52[3] = 115; _52[4] = 32; _52[5] = 84; _52[6] = 105; _52[7] = 99; _52[8] = 84; _52[9] = 97; _52[10] = 99; _52[11] = 84; _52[12] = 111; _52[13] = 101; _52[14] = 32; _52[15] = 116; _52[16] = 101; _52[17] = 115; _52[18] = 116; _52[19] = 32; _52[20] = 99; _52[21] = 97; _52[22] = 115; _52[23] = 101; 
	//indirectinvoke %51 (%52) : method(int[]) -> void
	printf_s(_52, _52_size);
//.blklab15
blklab15:;
	//return
	exit(0);
}

