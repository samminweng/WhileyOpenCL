#include "newTicTacToe.h"
Board* copy_Board(Board* _Board){
	Board* new_Board = malloc(sizeof(Board));
	_1DARRAY_COPY(new_Board->pieces, _Board->pieces);
	new_Board->move = _Board->move;
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
	printf("%d", board->move);
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

int main(int argc, char** args){
	long long max;
	long long repeat = 0;
	Board* b1;
	_DECL_OWNERSHIP(b1);
	Board* b2;
	_DECL_OWNERSHIP(b2);
	long long i = 0;
	long long p = 0;
	long long _7;
	_DECL_2DARRAY(_8);
	_DECL_OWNERSHIP(_8);
	long long _9 = 0;
	_DECL_1DARRAY(_10);
	_DECL_OWNERSHIP(_10);
	long long _11 = 0;
	Board* _12;
	_DECL_OWNERSHIP(_12);
	Board* _13;
	_DECL_OWNERSHIP(_13);
	long long _14 = 0;
	_DECL_1DARRAY(_15);
	_DECL_OWNERSHIP(_15);
	long long _16 = 0;
	_DECL_1DARRAY(_17);
	_DECL_OWNERSHIP(_17);
	long long _18 = 0;
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	long long _23 = 0;
	long long _24 = 0;
	long long _26 = 0;
	long long _27 = 0;
	long long _28 = 0;
	long long _29 = 0;
	long long _31 = 0;
	long long _32 = 0;
	long long _33 = 0;
	long long _34 = 0;
	_DECL_1DARRAY(_35);
	_DECL_OWNERSHIP(_35);
	long long _36 = 0;
	long long _37 = 0;
	long long _38 = 0;
	long long _39 = 0;
	long long _40 = 0;
	long long _41 = 0;
	long long _42 = 0;
	long long _43 = 0;
	long long _44 = 0;
	_DECL_1DARRAY(_45);
	_DECL_OWNERSHIP(_45);
	long long _46 = 0;
	long long _47 = 0;
	void* _48;
	_DECL_1DARRAY(_50);
	_DECL_OWNERSHIP(_50);
	void* _51;
	//fieldload %8 = %0 args : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	_CONV_ARGS(_8);
	_ADD_OWNERSHIP(_8);
	//const %9 = 0 : int
	_9 = 0;
	//indexof %10 = %8, %9 : int[][]
	_10=_8[_9];
	//invoke (%7) = (%10) whiley/lang/Int:parse : function(whiley/lang/ASCII:string)->(null|int)
	_STR_TO_INT(_7, _10);
	//assign %1 = %7  : null|int
	max = _7;
	//ifis %1, null goto blklab14 : null|int
	if(max == NULL) { goto blklab14;}
	//const %11 = 0 : int
	_11 = 0;
	//assign %2 = %11  : int
	repeat = _11;
	//loop (%2, %3, %4, %5, %6, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47)
	while(true){
		//ifge %2, %1 goto blklab15 : int
		if(repeat>=max){goto blklab15;}
		//invoke (%12) = () newTicTacToe:EmptyBoard : function()->(newTicTacToe:Board)
		_FREE_STRUCT(_12, Board);
		_12 = EmptyBoard();
		_ADD_OWNERSHIP(_12);
		//assign %3 = %12  : null|{int move,int[] pieces}
		_FREE_STRUCT(b1, Board);
		b1 = _12;
		_ADD_OWNERSHIP(b1);
		_REMOVE_OWNERSHIP(_12);
		//invoke (%13) = () newTicTacToe:EmptyBoard : function()->(newTicTacToe:Board)
		_FREE_STRUCT(_13, Board);
		_13 = EmptyBoard();
		_ADD_OWNERSHIP(_13);
		//assign %4 = %13  : null|{int move,int[] pieces}
		_FREE_STRUCT(b2, Board);
		b2 = _13;
		_ADD_OWNERSHIP(b2);
		_REMOVE_OWNERSHIP(_13);
		//const %14 = 0 : int
		_14 = 0;
		//assign %5 = %14  : int
		i = _14;
		//loop (%3, %4, %5, %6, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32)
		while(true){
			//const %15 = [0,1,2,3,4,5,6,7,8] : int[]
			_FREE(_15);
			_NEW_ARRAY(_15, 9);
			_15[0] = 0; _15[1] = 1; _15[2] = 2; _15[3] = 3; _15[4] = 4; _15[5] = 5; _15[6] = 6; _15[7] = 7; _15[8] = 8; 
			_ADD_OWNERSHIP(_15);
			//lengthof %16 = %15 : int[]
			_16 = _15_size;
			//ifge %5, %16 goto blklab17 : int
			if(i>=_16){goto blklab17;}
			//const %17 = [0,1,2,3,4,5,6,7,8] : int[]
			_FREE(_17);
			_NEW_ARRAY(_17, 9);
			_17[0] = 0; _17[1] = 1; _17[2] = 2; _17[3] = 3; _17[4] = 4; _17[5] = 5; _17[6] = 6; _17[7] = 7; _17[8] = 8; 
			_ADD_OWNERSHIP(_17);
			//indexof %18 = %17, %5 : int[]
			_18=_17[i];
			//assign %6 = %18  : int
			p = _18;
			//const %19 = 0 : int
			_19 = 0;
			//iflt %6, %19 goto blklab21 : int
			if(p<_19){goto blklab21;}
			//const %20 = 9 : int
			_20 = 9;
			//ifle %6, %20 goto blklab19 : int
			if(p<=_20){goto blklab19;}
//.blklab21
blklab21:;
			//goto blklab17
			goto blklab17;
			//goto blklab20
			goto blklab20;
//.blklab19
blklab19:;
			//ifis %3, null goto blklab22 : null|{int move,int[] pieces}
			if(b1 == NULL) { goto blklab22;}
			//const %21 = 1 : int
			_21 = 1;
			//update %3.pieces[%6] = %21 : {int move,int[] pieces} -> {int move,int[] pieces}
			b1->pieces[p] = _21;
			//fieldload %22 = %3 move : {int move,int[] pieces}
			_22 = b1->move;
			//const %23 = 1 : int
			_23 = 1;
			//add %24 = %22, %23 : int
			_24=_22+_23;
			//update %3.move = %24 : {int move,int[] pieces} -> {int move,int[] pieces}
			b1->move = _24;
			//assign %4 = %3  : {int move,int[] pieces}
			_FREE_STRUCT(b2, Board);
			b2 = b1;
			_ADD_OWNERSHIP(b2);
			_REMOVE_OWNERSHIP(b1);
			//const %25 = null : null
			//assign %3 = %25  : null
			_FREE_STRUCT(b1, Board);
			b1 = NULL;
			_REMOVE_OWNERSHIP(b1);
			//goto blklab23
			goto blklab23;
//.blklab22
blklab22:;
			//ifis %4, null goto blklab24 : null|{int move,int[] pieces}
			if(b2 == NULL) { goto blklab24;}
			//const %26 = 2 : int
			_26 = 2;
			//update %4.pieces[%6] = %26 : {int move,int[] pieces} -> {int move,int[] pieces}
			b2->pieces[p] = _26;
			//fieldload %27 = %4 move : {int move,int[] pieces}
			_27 = b2->move;
			//const %28 = 1 : int
			_28 = 1;
			//add %29 = %27, %28 : int
			_29=_27+_28;
			//update %4.move = %29 : {int move,int[] pieces} -> {int move,int[] pieces}
			b2->move = _29;
			//assign %3 = %4  : {int move,int[] pieces}
			_FREE_STRUCT(b1, Board);
			b1 = b2;
			_ADD_OWNERSHIP(b1);
			_REMOVE_OWNERSHIP(b2);
			//const %30 = null : null
			//assign %4 = %30  : null
			_FREE_STRUCT(b2, Board);
			b2 = NULL;
			_REMOVE_OWNERSHIP(b2);
//.blklab24
blklab24:;
//.blklab23
blklab23:;
//.blklab20
blklab20:;
			//const %31 = 1 : int
			_31 = 1;
			//add %32 = %5, %31 : int
			_32=i+_31;
			//assign %5 = %32  : int
			i = _32;
//.blklab18
blklab18:;
		}
//.blklab17
blklab17:;
		//assert
		{
			//ifis %3, null goto blklab25 : null|{int move,int[] pieces}
			if(b1 == NULL) { goto blklab25;}
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab25
blklab25:;
		//assert
		}
		//assert
		{
			//ifis %4, null goto blklab27 : null|{int move,int[] pieces}
			if(b2 == NULL) { goto blklab27;}
			//fieldload %33 = %4 move : {int move,int[] pieces}
			_33 = b2->move;
			//const %34 = 9 : int
			_34 = 9;
			//ifeq %33, %34 goto blklab26 : int
			if(_33==_34){goto blklab26;}
//.blklab27
blklab27:;
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab26
blklab26:;
		//assert
		}
		//assert
		{
			//ifis %4, null goto blklab29 : null|{int move,int[] pieces}
			if(b2 == NULL) { goto blklab29;}
			//fieldload %35 = %4 pieces : {int move,int[] pieces}
			_FREE(_35);
			_1DARRAY_UPDATE(_35, b2->pieces);
			//const %36 = 1 : int
			_36 = 1;
			//const %37 = 2 : int
			_37 = 2;
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
			//newlist %45 = (%36, %37, %38, %39, %40, %41, %42, %43, %44) : int[]
			_FREE(_45);
			_NEW_ARRAY(_45, 9);
			_45[0] = _36; _45[1] = _37; _45[2] = _38; _45[3] = _39; _45[4] = _40; _45[5] = _41; _45[6] = _42; _45[7] = _43; _45[8] = _44; 
			_ADD_OWNERSHIP(_45);
			//ifeq %35, %45 goto blklab28 : int[]
			_IFEQ_ARRAY(_35, _45, blklab28);
//.blklab29
blklab29:;
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab28
blklab28:;
		//assert
		}
		//const %46 = 1 : int
		_46 = 1;
		//add %47 = %2, %46 : int
		_47=repeat+_46;
		//assign %2 = %47  : int
		repeat = _47;
//.blklab16
blklab16:;
	}
//.blklab15
blklab15:;
	//fieldload %48 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %49 = %48 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %50 = [80,97,115,115,32,110,101,119,84,105,99,84,97,99,84,111,101,32,116,101,115,116,32,99,97,115,101,32,119,105,116,104,32,105,110,112,117,116,32,61,32] : int[]
	_FREE(_50);
	_NEW_ARRAY(_50, 41);
	_50[0] = 80; _50[1] = 97; _50[2] = 115; _50[3] = 115; _50[4] = 32; _50[5] = 110; _50[6] = 101; _50[7] = 119; _50[8] = 84; _50[9] = 105; _50[10] = 99; _50[11] = 84; _50[12] = 97; _50[13] = 99; _50[14] = 84; _50[15] = 111; _50[16] = 101; _50[17] = 32; _50[18] = 116; _50[19] = 101; _50[20] = 115; _50[21] = 116; _50[22] = 32; _50[23] = 99; _50[24] = 97; _50[25] = 115; _50[26] = 101; _50[27] = 32; _50[28] = 119; _50[29] = 105; _50[30] = 116; _50[31] = 104; _50[32] = 32; _50[33] = 105; _50[34] = 110; _50[35] = 112; _50[36] = 117; _50[37] = 116; _50[38] = 32; _50[39] = 61; _50[40] = 32; 
	_ADD_OWNERSHIP(_50);
	//indirectinvoke () = %49 (%50) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_50));
	//fieldload %51 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %52 = %51 println : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//indirectinvoke () = %52 (%1) : method(any)->()
	printf("%d\n", max);
//.blklab14
blklab14:;
	//return
	_FREE_STRUCT(b1, Board);
	_FREE_STRUCT(b2, Board);
	_FREE2DArray(_8);
	_FREE(_10);
	_FREE_STRUCT(_12, Board);
	_FREE_STRUCT(_13, Board);
	_FREE(_15);
	_FREE(_17);
	_FREE(_35);
	_FREE(_45);
	_FREE(_50);
	exit(0);
}

