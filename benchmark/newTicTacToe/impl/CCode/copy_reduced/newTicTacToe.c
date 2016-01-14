#include "newTicTacToe.h"
Board* copy_Board_PTR(Board* _Board){
	Board* new_Board = malloc(sizeof(Board));
	_1DARRAY_COPY(new_Board->pieces, _Board->pieces);
	new_Board->move = _Board->move;
	return new_Board;
}
void free_Board(Board _board){
	free(_board.pieces);
}
void free_Board_PTR(Board* board){
	free_Board(*board);
	free(board);
}
void printf_Board_PTR(Board* _board){
	printf("{");
	printf(" pieces:");
	_1DARRAY_PRINT(_board->pieces);
	printf(" move:");
	printf("%d", _board->move);
	printf("}");
}
Board* EmptyBoard(){
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
	_DECL_1DARRAY(_10);
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
	_NEW_ARRAY(_10, 9);
	_10[0] = _1; _10[1] = _2; _10[2] = _3; _10[3] = _4; _10[4] = _5; _10[5] = _6; _10[6] = _7; _10[7] = _8; _10[8] = _9; 
	//newrecord %11 = (%0, %10) : {int move,int[] pieces}
	_11.move = _0;
	_1DARRAY_COPY(_11.pieces, _10);
	//return %11 : null|{int move,int[] pieces}
	return copy_Board_PTR(&_11);
	//return
}

long long countOf(_DECL_1DARRAY_PARAM(pieces), long long s){
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
		//ifge %3, %8 goto blklab9 : int
		if(i>=_8){goto blklab9;}
		//indexof %9 = %0, %3 : int[]
		_9=pieces[i];
		//ifne %9, %1 goto blklab10 : int
		if(_9!=s){goto blklab10;}
		//const %10 = 1 : int
		_10 = 1;
		//add %11 = %2, %10 : int
		_11=count+_10;
		//assign %2 = %11  : int
		count = _11;
//.blklab10
blklab10:;
		//const %12 = 1 : int
		_12 = 1;
		//add %13 = %3, %12 : int
		_13=i+_12;
		//assign %3 = %13  : int
		i = _13;
	}
//.blklab9
blklab9:;
	//return %2 : int
	return count;
	//return
}

int main(int argc, char** args){
	long long max;
	long long repeat = 0;
	Board* b1;
	Board* b2;
	long long i = 0;
	long long p = 0;
	long long _7;
	long long _8;
	_DECL_2DARRAY(_9);
	long long _10 = 0;
	_DECL_1DARRAY(_11);
	long long _12 = 0;
	long long _13 = 0;
	Board* _14;
	Board* _15;
	Board* _16;
	Board* _17;
	long long _18 = 0;
	long long _19 = 0;
	_DECL_1DARRAY(_20);
	long long _21 = 0;
	long long _22 = 0;
	_DECL_1DARRAY(_23);
	long long _24 = 0;
	long long _25 = 0;
	long long _26 = 0;
	long long _27 = 0;
	long long _28 = 0;
	long long _29 = 0;
	long long _30 = 0;
	long long _31 = 0;
	long long _32 = 0;
	long long _33 = 0;
	long long _34 = 0;
	long long _36 = 0;
	long long _37 = 0;
	long long _38 = 0;
	long long _39 = 0;
	long long _40 = 0;
	long long _41 = 0;
	long long _42 = 0;
	long long _43 = 0;
	long long _45 = 0;
	long long _46 = 0;
	long long _47 = 0;
	long long _48 = 0;
	_DECL_1DARRAY(_49);
	long long _50 = 0;
	long long _51 = 0;
	long long _52 = 0;
	long long _53 = 0;
	long long _54 = 0;
	long long _55 = 0;
	long long _56 = 0;
	long long _57 = 0;
	long long _58 = 0;
	_DECL_1DARRAY(_59);
	long long _60 = 0;
	long long _61 = 0;
	void* _62;
	_DECL_1DARRAY(_64);
	void* _65;
	//fieldload %9 = %0 args : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	_CONV_ARGS(_9);
	//const %10 = 0 : int
	_10 = 0;
	//indexof %11 = %9, %10 : int[][]
	_11=_9[_10];
	//invoke %8 = (%11) whiley/lang/Int:parse : function(whiley/lang/ASCII:string) -> null|int
	_STR_TO_INT(_8, _11);
	//assign %7 = %8  : null|int
	_7 = _8;
	//assign %1 = %7  : null|int
	max = _7;
	//ifis %1, null goto blklab11 : null|int
	if(max == NULL) { goto blklab11;}
	//const %13 = 0 : int
	_13 = 0;
	//assign %12 = %13  : int
	_12 = _13;
	//assign %2 = %12  : int
	repeat = _12;
	//loop (%2, %3, %4, %5, %6, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57, %58, %59, %60, %61)
	while(true){
		//ifge %2, %1 goto blklab12 : int
		if(repeat>=max){goto blklab12;}
		//invoke %15 = () newTicTacToe:EmptyBoard : function() -> newTicTacToe:Board
		_15 = EmptyBoard();
		//assign %14 = %15  : null|{int move,int[] pieces}
		_14 = _15;
		//assign %3 = %14  : null|{int move,int[] pieces}
		b1 = _14;
		//invoke %17 = () newTicTacToe:EmptyBoard : function() -> newTicTacToe:Board
		_17 = EmptyBoard();
		//assign %16 = %17  : null|{int move,int[] pieces}
		_16 = _17;
		//assign %4 = %16  : null|{int move,int[] pieces}
		b2 = _16;
		//const %19 = 0 : int
		_19 = 0;
		//assign %18 = %19  : int
		_18 = _19;
		//assign %5 = %18  : int
		i = _18;
		//loop (%3, %4, %5, %6, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46)
		while(true){
			//const %20 = [0,1,2,3,4,5,6,7,8] : int[]
			_NEW_ARRAY(_20, 9);
			_20[0] = 0; _20[1] = 1; _20[2] = 2; _20[3] = 3; _20[4] = 4; _20[5] = 5; _20[6] = 6; _20[7] = 7; _20[8] = 8; 
			//lengthof %21 = %20 : int[]
			_21 = _20_size;
			//ifge %5, %21 goto blklab13 : int
			if(i>=_21){goto blklab13;}
			//const %23 = [0,1,2,3,4,5,6,7,8] : int[]
			_NEW_ARRAY(_23, 9);
			_23[0] = 0; _23[1] = 1; _23[2] = 2; _23[3] = 3; _23[4] = 4; _23[5] = 5; _23[6] = 6; _23[7] = 7; _23[8] = 8; 
			//indexof %24 = %23, %5 : int[]
			_24=_23[i];
			//assign %22 = %24  : int
			_22 = _24;
			//assign %6 = %22  : int
			p = _22;
			//const %25 = 0 : int
			_25 = 0;
			//iflt %6, %25 goto blklab16 : int
			if(p<_25){goto blklab16;}
			//const %26 = 9 : int
			_26 = 9;
			//ifle %6, %26 goto blklab14 : int
			if(p<=_26){goto blklab14;}
//.blklab16
blklab16:;
			//goto blklab13
			goto blklab13;
			//goto blklab15
			goto blklab15;
//.blklab14
blklab14:;
			//ifis %3, null goto blklab17 : null|{int move,int[] pieces}
			if(b1 == NULL) { goto blklab17;}
			//const %27 = 1 : int
			_27 = 1;
			//const %28 = 1 : int
			_28 = 1;
			//update %3.pieces[%6] = %28 : {int move,int[] pieces} -> {int move,int[] pieces}
			b1->pieces[p] = _28;
			//fieldload %29 = %3 move : {int move,int[] pieces}
			_29 = b1->move;
			//const %30 = 1 : int
			_30 = 1;
			//add %31 = %29, %30 : int
			_31=_29+_30;
			//fieldload %32 = %3 move : {int move,int[] pieces}
			_32 = b1->move;
			//const %33 = 1 : int
			_33 = 1;
			//add %34 = %32, %33 : int
			_34=_32+_33;
			//update %3.move = %34 : {int move,int[] pieces} -> {int move,int[] pieces}
			b1->move = _34;
			//assign %4 = %3  : {int move,int[] pieces}
			b2 = b1;
			//const %35 = null : null
			//assign %3 = %35  : null
			b1 = NULL;
			//goto blklab18
			goto blklab18;
//.blklab17
blklab17:;
			//ifis %4, null goto blklab19 : null|{int move,int[] pieces}
			if(b2 == NULL) { goto blklab19;}
			//const %36 = 2 : int
			_36 = 2;
			//const %37 = 2 : int
			_37 = 2;
			//update %4.pieces[%6] = %37 : {int move,int[] pieces} -> {int move,int[] pieces}
			b2->pieces[p] = _37;
			//fieldload %38 = %4 move : {int move,int[] pieces}
			_38 = b2->move;
			//const %39 = 1 : int
			_39 = 1;
			//add %40 = %38, %39 : int
			_40=_38+_39;
			//fieldload %41 = %4 move : {int move,int[] pieces}
			_41 = b2->move;
			//const %42 = 1 : int
			_42 = 1;
			//add %43 = %41, %42 : int
			_43=_41+_42;
			//update %4.move = %43 : {int move,int[] pieces} -> {int move,int[] pieces}
			b2->move = _43;
			//assign %3 = %4  : {int move,int[] pieces}
			b1 = b2;
			//const %44 = null : null
			//assign %4 = %44  : null
			b2 = NULL;
//.blklab19
blklab19:;
//.blklab18
blklab18:;
//.blklab15
blklab15:;
			//const %45 = 1 : int
			_45 = 1;
			//add %46 = %5, %45 : int
			_46=i+_45;
			//assign %5 = %46  : int
			i = _46;
		}
//.blklab13
blklab13:;
		//assert
		{
			//ifis %3, null goto blklab20 : null|{int move,int[] pieces}
			if(b1 == NULL) { goto blklab20;}
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab20
blklab20:;
		//assert
		}
		//assert
		{
			//ifis %4, null goto blklab22 : null|{int move,int[] pieces}
			if(b2 == NULL) { goto blklab22;}
			//fieldload %47 = %4 move : {int move,int[] pieces}
			_47 = b2->move;
			//const %48 = 9 : int
			_48 = 9;
			//ifeq %47, %48 goto blklab21 : int
			if(_47==_48){goto blklab21;}
//.blklab22
blklab22:;
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab21
blklab21:;
		//assert
		}
		//assert
		{
			//ifis %4, null goto blklab24 : null|{int move,int[] pieces}
			if(b2 == NULL) { goto blklab24;}
			//fieldload %49 = %4 pieces : {int move,int[] pieces}
			_1DARRAY_UPDATE(_49, b2->pieces);
			//const %50 = 1 : int
			_50 = 1;
			//const %51 = 2 : int
			_51 = 2;
			//const %52 = 1 : int
			_52 = 1;
			//const %53 = 2 : int
			_53 = 2;
			//const %54 = 1 : int
			_54 = 1;
			//const %55 = 2 : int
			_55 = 2;
			//const %56 = 1 : int
			_56 = 1;
			//const %57 = 2 : int
			_57 = 2;
			//const %58 = 1 : int
			_58 = 1;
			//newlist %59 = (%50, %51, %52, %53, %54, %55, %56, %57, %58) : int[]
			_NEW_ARRAY(_59, 9);
			_59[0] = _50; _59[1] = _51; _59[2] = _52; _59[3] = _53; _59[4] = _54; _59[5] = _55; _59[6] = _56; _59[7] = _57; _59[8] = _58; 
			//ifeq %49, %59 goto blklab23 : int[]
			_IFEQ_ARRAY(_49, _59, blklab23);
//.blklab24
blklab24:;
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab23
blklab23:;
		//assert
		}
		//const %60 = 1 : int
		_60 = 1;
		//add %61 = %2, %60 : int
		_61=repeat+_60;
		//assign %2 = %61  : int
		repeat = _61;
	}
//.blklab12
blklab12:;
	//fieldload %62 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	//fieldload %63 = %62 print_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
	//const %64 = [80,97,115,115,32,110,101,119,84,105,99,84,97,99,84,111,101,32,116,101,115,116,32,99,97,115,101,32,119,105,116,104,32,105,110,112,117,116,32,61,32] : int[]
	_NEW_ARRAY(_64, 41);
	_64[0] = 80; _64[1] = 97; _64[2] = 115; _64[3] = 115; _64[4] = 32; _64[5] = 110; _64[6] = 101; _64[7] = 119; _64[8] = 84; _64[9] = 105; _64[10] = 99; _64[11] = 84; _64[12] = 97; _64[13] = 99; _64[14] = 84; _64[15] = 111; _64[16] = 101; _64[17] = 32; _64[18] = 116; _64[19] = 101; _64[20] = 115; _64[21] = 116; _64[22] = 32; _64[23] = 99; _64[24] = 97; _64[25] = 115; _64[26] = 101; _64[27] = 32; _64[28] = 119; _64[29] = 105; _64[30] = 116; _64[31] = 104; _64[32] = 32; _64[33] = 105; _64[34] = 110; _64[35] = 112; _64[36] = 117; _64[37] = 116; _64[38] = 32; _64[39] = 61; _64[40] = 32; 
	//indirectinvoke %63 (%64) : method(int[]) -> void
	printf_s(_1DARRAY_PARAM(_64));
	//fieldload %65 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
	//fieldload %66 = %65 println : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
	//indirectinvoke %66 (%1) : method(any) -> void
	printf("%d\n", max);
//.blklab11
blklab11:;
	//return
	exit(0);
}

