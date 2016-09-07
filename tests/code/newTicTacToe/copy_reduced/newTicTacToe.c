#include "newTicTacToe.h"
Board* copy_Board(Board* _Board){
	Board* new_Board = malloc(sizeof(Board));
	_COPY_1DARRAY(new_Board->pieces, _Board->pieces, T_INT);
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
	board->pieces = NULL;
	free(board);
}
void printf_Board(Board* board){
	printf("{");
	printf(" pieces:");
	_PRINT_1DARRAY(board->pieces, T_INT);
	printf(" move:");
	printf("%lld", board->move);
	printf("}");
}
Board* EmptyBoard(){
	Board* r;
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
	Board* _12;
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
	_NEW_1DARRAY(_11, 9, 0, T_INT);
	_11[0] = _2; _11[1] = _3; _11[2] = _4; _11[3] = _5; _11[4] = _6; _11[5] = _7; _11[6] = _8; _11[7] = _9; _11[8] = _10; 
	//newrecord %12 = (%1, %11) : {int move,int[] pieces}
	_12 = malloc(sizeof(Board));
	_12->move = _1;
	_UPDATE_1DARRAY(_12->pieces, _11);
	//return %12
	return _12;
	//return
}

long long countOf(_DECL_1DARRAY_PARAM(pieces), long long s){
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
	return count;
	//return
}

int main(int argc, char** args){
	long long repeat = 0;
	Board* b1;
	Board* b2;
	long long i = 0;
	long long p = 0;
	long long _6 = 0;
	Board* _7;
	Board* _8;
	long long _9 = 0;
	_DECL_1DARRAY(_10);
	long long _11 = 0;
	_DECL_1DARRAY(_12);
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	void* _16;
	_DECL_1DARRAY(_18);
	long long _19 = 0;
	long long _20 = 0;
	long long _21 = 0;
	long long _22 = 0;
	void* _23;
	void* _24;
	_DECL_1DARRAY(_26);
	long long _27 = 0;
	long long _28 = 0;
	long long _29 = 0;
	long long _30 = 0;
	void* _31;
	long long _32 = 0;
	long long _33 = 0;
	long long _34 = 0;
	long long _35 = 0;
	_DECL_1DARRAY(_36);
	long long _37 = 0;
	long long _38 = 0;
	long long _39 = 0;
	long long _40 = 0;
	long long _41 = 0;
	long long _42 = 0;
	long long _43 = 0;
	long long _44 = 0;
	long long _45 = 0;
	_DECL_1DARRAY(_46);
	void* _47;
	_DECL_1DARRAY(_49);
	//const %6 = 0 : int
	_6 = 0;
	//assign %1 = %6  : int
	repeat = _6;
	//invoke (%7) = () newTicTacToe:EmptyBoard : function()->(newTicTacToe:Board)
	{
		_7 = EmptyBoard();
	}
	//assign %2 = %7  : null|{int move,int[] pieces}
	b1 = _7;
	//invoke (%8) = () newTicTacToe:EmptyBoard : function()->(newTicTacToe:Board)
	{
		_8 = EmptyBoard();
	}
	//assign %3 = %8  : null|{int move,int[] pieces}
	b2 = _8;
	//const %9 = 0 : int
	_9 = 0;
	//assign %4 = %9  : int
	i = _9;
	//loop (%2, %3, %4, %5, %10, %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31, %32, %33)
	while(true){
		//const %10 = [0,1,2,3,4,5,6,7,8] : int[]
		_NEW_1DARRAY(_10, 9, 0, T_INT);
		_10[0] = 0; _10[1] = 1; _10[2] = 2; _10[3] = 3; _10[4] = 4; _10[5] = 5; _10[6] = 6; _10[7] = 7; _10[8] = 8; 
		//lengthof %11 = %10 : int[]
		_11 = _10_size;
		//ifge %4, %11 goto blklab14 : int
		if(i>=_11){goto blklab14;}
		//const %12 = [0,1,2,3,4,5,6,7,8] : int[]
		_NEW_1DARRAY(_12, 9, 0, T_INT);
		_12[0] = 0; _12[1] = 1; _12[2] = 2; _12[3] = 3; _12[4] = 4; _12[5] = 5; _12[6] = 6; _12[7] = 7; _12[8] = 8; 
		//indexof %13 = %12, %4 : int[]
		_13=_12[i];
		//assign %5 = %13  : int
		p = _13;
		//const %14 = 0 : int
		_14 = 0;
		//iflt %5, %14 goto blklab18 : int
		if(p<_14){goto blklab18;}
		//const %15 = 9 : int
		_15 = 9;
		//ifle %5, %15 goto blklab16 : int
		if(p<=_15){goto blklab16;}
//.blklab18
blklab18:;
		//goto blklab14
		goto blklab14;
		//goto blklab17
		goto blklab17;
//.blklab16
blklab16:;
		//ifis %2, null goto blklab19 : null|{int move,int[] pieces}
		if(b1 == NULL) { goto blklab19;}
		//fieldload %16 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %17 = %16 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %18 = [112,108,97,121,32,49,39,115,32,116,117,114,110,32,40,67,73,82,67,76,69,41] : int[]
		_NEW_1DARRAY(_18, 22, 0, T_INT);
		_18[0] = 112; _18[1] = 108; _18[2] = 97; _18[3] = 121; _18[4] = 32; _18[5] = 49; _18[6] = 39; _18[7] = 115; _18[8] = 32; _18[9] = 116; _18[10] = 117; _18[11] = 114; _18[12] = 110; _18[13] = 32; _18[14] = 40; _18[15] = 67; _18[16] = 73; _18[17] = 82; _18[18] = 67; _18[19] = 76; _18[20] = 69; _18[21] = 41; 
		//indirectinvoke () = %17 (%18) : method(int[])->()
		println_s(_18, _18_size);
		//const %19 = 1 : int
		_19 = 1;
		//update %2.pieces[%5] = %19 : {int move,int[] pieces} -> {int move,int[] pieces}
		b1->pieces[p] = _19;
		//fieldload %20 = %2 move : {int move,int[] pieces}
		_20 = b1->move;
		//const %21 = 1 : int
		_21 = 1;
		//add %22 = %20, %21 : int
		_22=_20+_21;
		//update %2.move = %22 : {int move,int[] pieces} -> {int move,int[] pieces}
		b1->move = _22;
		//assign %3 = %2  : {int move,int[] pieces}
		b2 = copy_Board(b1);
		//const %23 = null : null
		_23 = NULL;
		//assign %2 = %23  : null
		b1 = NULL;
		//goto blklab20
		goto blklab20;
//.blklab19
blklab19:;
		//ifis %3, null goto blklab21 : null|{int move,int[] pieces}
		if(b2 == NULL) { goto blklab21;}
		//fieldload %24 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
		//fieldload %25 = %24 println_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
		//const %26 = [80,108,97,121,32,50,39,115,32,116,117,114,110,32,40,67,82,79,83,83,41] : int[]
		_NEW_1DARRAY(_26, 21, 0, T_INT);
		_26[0] = 80; _26[1] = 108; _26[2] = 97; _26[3] = 121; _26[4] = 32; _26[5] = 50; _26[6] = 39; _26[7] = 115; _26[8] = 32; _26[9] = 116; _26[10] = 117; _26[11] = 114; _26[12] = 110; _26[13] = 32; _26[14] = 40; _26[15] = 67; _26[16] = 82; _26[17] = 79; _26[18] = 83; _26[19] = 83; _26[20] = 41; 
		//indirectinvoke () = %25 (%26) : method(int[])->()
		println_s(_26, _26_size);
		//const %27 = 2 : int
		_27 = 2;
		//update %3.pieces[%5] = %27 : {int move,int[] pieces} -> {int move,int[] pieces}
		b2->pieces[p] = _27;
		//fieldload %28 = %3 move : {int move,int[] pieces}
		_28 = b2->move;
		//const %29 = 1 : int
		_29 = 1;
		//add %30 = %28, %29 : int
		_30=_28+_29;
		//update %3.move = %30 : {int move,int[] pieces} -> {int move,int[] pieces}
		b2->move = _30;
		//assign %2 = %3  : {int move,int[] pieces}
		b1 = b2;
		//const %31 = null : null
		_31 = NULL;
		//assign %3 = %31  : null
		b2 = NULL;
//.blklab21
blklab21:;
//.blklab20
blklab20:;
//.blklab17
blklab17:;
		//const %32 = 1 : int
		_32 = 1;
		//add %33 = %4, %32 : int
		_33=i+_32;
		//assign %4 = %33  : int
		i = _33;
//.blklab15
blklab15:;
	}
//.blklab14
blklab14:;
	//assert
	{
		//ifis %2, null goto blklab22 : null|{int move,int[] pieces}
		if(b1 == NULL) { goto blklab22;}
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab22
blklab22:;
	//assert
	}
	//assert
	{
		//ifis %3, null goto blklab24 : null|{int move,int[] pieces}
		if(b2 == NULL) { goto blklab24;}
		//fieldload %34 = %3 move : {int move,int[] pieces}
		_34 = b2->move;
		//const %35 = 9 : int
		_35 = 9;
		//ifeq %34, %35 goto blklab23 : int
		if(_34==_35){goto blklab23;}
//.blklab24
blklab24:;
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab23
blklab23:;
	//assert
	}
	//assert
	{
		//ifis %3, null goto blklab26 : null|{int move,int[] pieces}
		if(b2 == NULL) { goto blklab26;}
		//fieldload %36 = %3 pieces : {int move,int[] pieces}
		_UPDATE_1DARRAY(_36, b2->pieces);
		//const %37 = 1 : int
		_37 = 1;
		//const %38 = 2 : int
		_38 = 2;
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
		//newlist %46 = (%37, %38, %39, %40, %41, %42, %43, %44, %45) : int[]
		_NEW_1DARRAY(_46, 9, 0, T_INT);
		_46[0] = _37; _46[1] = _38; _46[2] = _39; _46[3] = _40; _46[4] = _41; _46[5] = _42; _46[6] = _43; _46[7] = _44; _46[8] = _45; 
		//ifeq %36, %46 goto blklab25 : int[]
		_IFEQ_ARRAY(_36, _46, blklab25);
//.blklab26
blklab26:;
		//fail
		fprintf(stderr,"fail");
		exit(-1);
//.blklab25
blklab25:;
	//assert
	}
	//fieldload %47 = %0 out : {int[][] args,{method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s} out}
	//fieldload %48 = %47 print_s : {method(any)->() print,method(int[])->() print_s,method(any)->() println,method(int[])->() println_s}
	//const %49 = [80,97,115,115,32,110,101,119,32,84,105,99,84,97,99,84,111,101,32,116,101,115,116,32,99,97,115,101] : int[]
	_NEW_1DARRAY(_49, 28, 0, T_INT);
	_49[0] = 80; _49[1] = 97; _49[2] = 115; _49[3] = 115; _49[4] = 32; _49[5] = 110; _49[6] = 101; _49[7] = 119; _49[8] = 32; _49[9] = 84; _49[10] = 105; _49[11] = 99; _49[12] = 84; _49[13] = 97; _49[14] = 99; _49[15] = 84; _49[16] = 111; _49[17] = 101; _49[18] = 32; _49[19] = 116; _49[20] = 101; _49[21] = 115; _49[22] = 116; _49[23] = 32; _49[24] = 99; _49[25] = 97; _49[26] = 115; _49[27] = 101; 
	//indirectinvoke () = %48 (%49) : method(int[])->()
	printf_s(_1DARRAY_PARAM(_49));
	//return
	exit(0);
}

