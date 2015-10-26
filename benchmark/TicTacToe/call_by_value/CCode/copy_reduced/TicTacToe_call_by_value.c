#include "TicTacToe_call_by_value.h"
void printf_Board(Board s){
	printf("{");
	printf(" pieces:");
	printf_array(s.pieces, s.pieces_size);
	printf(" move:");
	printf("%d", s.move);
	printf("}");
}
Board clone_Board(Board b){
	Board new_b;
	new_b.pieces = clone(b.pieces, b.pieces_size);
	new_b.pieces_size = b.pieces_size;
	new_b.move = b.move;
	return new_b; 
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
	_11.pieces_size = _10_size;
	_11.pieces = _10;
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
	long long _max;
	long long _repeat = 0;
	Board _b;
	long long _i = 0;
	long long _p = 0;
	long long _6;
	long long _7;
	long long** _8 = NULL;
	long long _8_size = 0;
	long long _9 = 0;
	long long* _10 = NULL;
	long long _10_size = 0;
	long long _11 = 0;
	long long _12 = 0;
	Board _13;
	Board _14;
	long long _15 = 0;
	long long _16 = 0;
	long long* _17 = NULL;
	long long _17_size = 0;
	long long _18 = 0;
	long long _19 = 0;
	long long* _20 = NULL;
	long long _20_size = 0;
	long long _21 = 0;
	long long* _24 = NULL;
	long long _24_size = 0;
	long long* _29 = NULL;
	long long _29_size = 0;
	long long _32 = 0;
	long long _33 = 0;
	long long* _34 = NULL;
	long long _34_size = 0;
	long long _35 = 0;
	long long _36 = 0;
	long long _37 = 0;
	long long _38 = 0;
	long long* _41 = NULL;
	long long _41_size = 0;
	Board _42;
	long long _43 = 0;
	long long _44 = 0;
	long long _45 = 0;
	long long _46 = 0;
	long long* _47 = NULL;
	long long _47_size = 0;
	long long _48 = 0;
	long long _49 = 0;
	long long _50 = 0;
	long long _51 = 0;
	long long _52 = 0;
	long long _53 = 0;
	long long _54 = 0;
	long long _55 = 0;
	long long _56 = 0;
	long long* _57 = NULL;
	long long _57_size = 0;
	long long _58 = 0;
	long long _59 = 0;
	long long* _62 = NULL;
	long long _62_size = 0;
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
	_max = _6;
	//ifis %1, null goto blklab15 : null|int
	if(_max == NULL) { goto blklab15;}
	//const %12 = 0 : int
	_12 = 0;
	//assign %11 = %12  : int
	_11 = _12;
	//assign %2 = %11  : int
	_repeat = _11;
	//ifge %2, %1 goto blklab16 : int
	while(_repeat<_max){
		//invoke %14 = () TicTacToe_call_by_value:EmptyBoard : function() -> TicTacToe_call_by_value:Board
		_14 = EmptyBoard();
		//assign %13 = %14  : {int move,int[] pieces}
		_13 = _14;
		//assign %3 = %13  : {int move,int[] pieces}
		_b = _13;
		//const %16 = 0 : int
		_16 = 0;
		//assign %15 = %16  : int
		_15 = _16;
		//assign %4 = %15  : int
		_i = _15;
		//const %17 = [0,1,2,3,4,5,6,7,8] : int[]
		long long _17_value[] = {0, 1, 2, 3, 4, 5, 6, 7, 8};
		_17 = _17_value;
		_17_size = 9;
		//lengthof %18 = %17 : int[]
		_18 = _17_size;
		//ifge %4, %18 goto blklab17 : int
		while(_i<_18){
			//const %20 = [0,1,2,3,4,5,6,7,8] : int[]
			long long _20_value[] = {0, 1, 2, 3, 4, 5, 6, 7, 8};
			_20 = _20_value;
			_20_size = 9;
			//indexof %21 = %20, %4 : int[]
			_21=_20[_i];
			//assign %19 = %21  : int
			_19 = _21;
			//assign %5 = %19  : int
			_p = _19;
			//fieldload %22 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
			//fieldload %23 = %22 print_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
			//const %24 = [66,79,65,82,68,58,32] : int[]
			long long _24_value[] = {66, 79, 65, 82, 68, 58, 32};
			_24 = _24_value;
			_24_size = 7;
			//indirectinvoke %23 (%24) : method(int[]) -> void
			printf_s(_24, _24_size);
			//fieldload %25 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
			//fieldload %26 = %25 println : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
			//indirectinvoke %26 (%3) : method(any) -> void
			printf_Board(_b);
			//fieldload %27 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
			//fieldload %28 = %27 print_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
			//const %29 = [77,79,86,69,58,32] : int[]
			long long _29_value[] = {77, 79, 86, 69, 58, 32};
			_29 = _29_value;
			_29_size = 6;
			//indirectinvoke %28 (%29) : method(int[]) -> void
			printf_s(_29, _29_size);
			//fieldload %30 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
			//fieldload %31 = %30 println : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
			//indirectinvoke %31 (%5) : method(any) -> void
			printf("%d\n", _p);
			//const %32 = 0 : int
			_32 = 0;
			//iflt %5, %32 goto blklab20 : int
			if(_p<_32){goto blklab20;}
			//const %33 = 9 : int
			_33 = 9;
			//ifgt %5, %33 goto blklab21 : int
			if(_p>_33){goto blklab21;}
			//fieldload %34 = %3 pieces : {int move,int[] pieces}
			_34_size = _b.pieces_size;
			_34 = clone(_b.pieces, _b.pieces_size);
			//indexof %35 = %34, %5 : int[]
			_35=_34[_p];
			//const %36 = 0 : int
			_36 = 0;
			//ifne %35, %36 goto blklab22 : int
			if(_35!=_36){goto blklab22;}
			//fieldload %37 = %3 move : {int move,int[] pieces}
			_37 = _b.move;
			//const %38 = 9 : int
			_38 = 9;
			//ifne %37, %38 goto blklab18 : int
			if(_37!=_38){goto blklab18;}
//.blklab22
blklab22:;
//.blklab21
blklab21:;
//.blklab20
blklab20:;
			//fieldload %39 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
			//fieldload %40 = %39 println_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
			//const %41 = [73,78,86,65,76,73,68,32,77,79,86,69,33] : int[]
			long long _41_value[] = {73, 78, 86, 65, 76, 73, 68, 32, 77, 79, 86, 69, 33};
			_41 = _41_value;
			_41_size = 13;
			//indirectinvoke %40 (%41) : method(int[]) -> void
			println_s(_41, _41_size);
			//goto blklab17
			goto blklab17;
			//goto blklab19
			goto blklab19;
//.blklab18
blklab18:;
			//invoke %42 = (%3, %5) TicTacToe_call_by_value:play : function(TicTacToe_call_by_value:Board,TicTacToe_call_by_value:nat) -> TicTacToe_call_by_value:Board
			_42 = play(clone_Board(_b), _p);
			//assign %3 = %42  : {int move,int[] pieces}
			_b = _42;
//.blklab19
blklab19:;
			//const %43 = 1 : int
			_43 = 1;
			//add %44 = %4, %43 : int
			_44=_i+_43;
			//assign %4 = %44  : int
			_i = _44;
		}
//.blklab17
blklab17:;
		//assert
		{
			//fieldload %45 = %3 move : {int move,int[] pieces}
			_45 = _b.move;
			//const %46 = 9 : int
			_46 = 9;
			//ifeq %45, %46 goto blklab23 : int
			if(_45==_46){goto blklab23;}
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab23
blklab23:;
		//assert
		}
		//assert
		{
			//fieldload %47 = %3 pieces : {int move,int[] pieces}
			_47_size = _b.pieces_size;
			_47 = clone(_b.pieces, _b.pieces_size);
			//const %48 = 1 : int
			_48 = 1;
			//const %49 = 2 : int
			_49 = 2;
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
			//newlist %57 = (%48, %49, %50, %51, %52, %53, %54, %55, %56) : int[]
			_57_size = 9;
			_57 = (long long*)malloc(_57_size*sizeof(long long));
			_57[0] = _48;			_57[1] = _49;			_57[2] = _50;			_57[3] = _51;			_57[4] = _52;			_57[5] = _53;			_57[6] = _54;			_57[7] = _55;			_57[8] = _56;
			//ifeq %47, %57 goto blklab24 : int[]
			if(isArrayEqual(_47, _47_size,_57, _57_size)==1){goto blklab24;}
			//fail
			fprintf(stderr,"fail");
			exit(-1);
//.blklab24
blklab24:;
		//assert
		}
		//const %58 = 1 : int
		_58 = 1;
		//add %59 = %2, %58 : int
		_59=_repeat+_58;
		//assign %2 = %59  : int
		_repeat = _59;
		//fieldload %60 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
		//fieldload %61 = %60 print_s : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
		//const %62 = [82,69,80,69,65,84,58,32] : int[]
		long long _62_value[] = {82, 69, 80, 69, 65, 84, 58, 32};
		_62 = _62_value;
		_62_size = 8;
		//indirectinvoke %61 (%62) : method(int[]) -> void
		printf_s(_62, _62_size);
		//fieldload %63 = %0 out : {int[][] args,{method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s} out}
		//fieldload %64 = %63 println : {method(any) -> void print,method(int[]) -> void print_s,method(any) -> void println,method(int[]) -> void println_s}
		//indirectinvoke %64 (%2) : method(any) -> void
		printf("%d\n", _repeat);
	}
//.blklab16
blklab16:;
//.blklab15
blklab15:;
	//return
	exit(0);
}
