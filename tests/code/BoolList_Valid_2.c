#include "BoolList_Valid_2.h"
long long* play(long long* _board, long long _board_size){
		long long* _nboard = NULL;
		long long _nboard_size = 0;
		long long _i = 0;
		long long* _3 = NULL;
		long long _3_size = 0;
		long long _4 = 0;
		long long _5 = 0;
		long long _6 = 0;
		long long _7;
		long long _8;
		long long _9;
		long long _10;
		long long _11;
		long long _12;
		long long _13 = 0;
		long long _14 = 0;
	//assign %3 = %0  : [bool]
	_3 = (long long*)_board;
	_3_size = _board_size;
	//assign %1 = %3  : [bool]
	_nboard = (long long*)_3;
	_nboard_size = _3_size;
	//const %5 = 0 : int
	_5 = 0;
	//assign %4 = %5  : int
	_4 = _5;
	//assign %2 = %4  : int
	_i = _4;
		//lengthof %6 = %0 : [bool]
		_6 = _board_size;
			//ifge %2, %6 goto blklab0 : int
		while(_i<_6){

			//invoke %7 = (%2, %0) BoolList_Valid_2:isAlive : function(int,[bool]) -> bool
			_7=isAlive(_i ,clone(_board, _board_size), _board_size);
			//const %8 = true : bool
			_8 = true;
			//ifeq %7, %8 goto blklab3 : bool
			if(_7==_8){goto blklab3;}
			//goto blklab1
			goto blklab1;
//.blklab3
blklab3:;
			//const %9 = true : bool
			_9 = true;
			//const %10 = true : bool
			_10 = true;
			//update %1[%2] = %10 : [bool] -> [bool]
			_nboard[_i] = _10;
			//goto blklab2
			goto blklab2;
//.blklab1
blklab1:;
			//const %11 = false : bool
			_11 = false;
			//const %12 = false : bool
			_12 = false;
			//update %1[%2] = %12 : [bool] -> [bool]
			_nboard[_i] = _12;
//.blklab2
blklab2:;
			//const %13 = 1 : int
			_13 = 1;
			//add %14 = %2, %13 : int
			_14=_i+_13;
			//assign %2 = %14  : int
			_i = _14;
		}
//.blklab0
blklab0:;
		//return %1 : [bool]
		return _nboard;
		//return
		;
}
long long isAlive(long long _i, long long* _board, long long _board_size){
	long long _2 = 0;
	long long _3 = 0;
	long long _4 = 0;
	long long _5 = 0;
	long long _6 = 0;
	long long _7 = 0;
	long long _8;
	long long _9;
	long long _10 = 0;
	long long _11 = 0;
	long long _12;
	long long _13;
	long long _14;
	long long _15;
	//const %2 = 0 : int
	_2 = 0;
	//ifle %0, %2 goto blklab4 : int
	if(_i<=_2){goto blklab4;}
	//const %3 = 1 : int
	_3 = 1;
	//add %4 = %0, %3 : int
	_4=_i+_3;
	//lengthof %5 = %1 : [bool]
	_5 = _board_size;
	//ifge %4, %5 goto blklab4 : int
	if(_4>=_5){goto blklab4;}
	//const %6 = 1 : int
	_6 = 1;
	//sub %7 = %0, %6 : int
	_7=_i-_6;
	//indexof %8 = %1, %7 : [bool]
	_8=_board[_7];
	//const %9 = true : bool
	_9 = true;
	//ifeq %8, %9 goto blklab6 : bool
	if(_8==_9){goto blklab6;}
	//goto blklab4
	goto blklab4;
//.blklab6
blklab6:;
	//const %10 = 1 : int
	_10 = 1;
	//add %11 = %0, %10 : int
	_11=_i+_10;
	//indexof %12 = %1, %11 : [bool]
	_12=_board[_11];
	//const %13 = true : bool
	_13 = true;
	//ifeq %12, %13 goto blklab7 : bool
	if(_12==_13){goto blklab7;}
	//goto blklab4
	goto blklab4;
//.blklab7
blklab7:;
	//const %14 = true : bool
	_14 = true;
	//return %14 : bool
	return _14;
	//goto blklab5
	goto blklab5;
//.blklab4
blklab4:;
	//const %15 = false : bool
	_15 = false;
	//return %15 : bool
	return _15;
//.blklab5
blklab5:;
	//return
	;
}
int main(int argc, char** argv){
	long long* _xs = NULL;
	long long _xs_size = 0;
	long long* _2 = NULL;
	long long _2_size = 0;
	long long _3;
	long long _4;
	long long _5;
	long long _6;
	long long _7;
	long long _8;
	long long _9;
	long long* _10 = NULL;
	long long _10_size = 0;
	long long _11;
	long long _12;
	long long _13;
	long long _14;
	long long _15;
	long long _16;
	long long _17;
	long long* _18 = NULL;
	long long _18_size = 0;
	long long* _19 = NULL;
	long long _19_size = 0;
	long long _20;
	long long _21;
	long long _22;
	long long _23;
	long long _24;
	long long _25;
	long long _26;
	long long* _27 = NULL;
	long long _27_size = 0;
	long long* _28 = NULL;
	long long _28_size = 0;
	long long _29;
	long long _30;
	long long _31;
	long long _32;
	long long _33;
	long long _34;
	long long _35;
	long long* _36 = NULL;
	long long _36_size = 0;
	long long* _37 = NULL;
	long long _37_size = 0;
	long long _38;
	long long _39;
	long long _40;
	long long _41;
	long long _42;
	long long _43;
	long long _44;
	long long* _45 = NULL;
	long long _45_size = 0;
	long long* _46 = NULL;
	long long _46_size = 0;
	long long _47;
	long long _48;
	long long _49;
	long long _50;
	long long _51;
	long long _52;
	long long _53;
	long long* _54 = NULL;
	long long _54_size = 0;
	//const %3 = true : bool
	_3 = true;
	//const %4 = true : bool
	_4 = true;
	//const %5 = true : bool
	_5 = true;
	//const %6 = true : bool
	_6 = true;
	//const %7 = true : bool
	_7 = true;
	//const %8 = true : bool
	_8 = true;
	//const %9 = true : bool
	_9 = true;
	//newlist %10 = (%3, %4, %5, %6, %7, %8, %9) : [bool]
	_10_size = 7;
	_10 = (long long*)malloc(_10_size*sizeof(long long));
	_10[0] = _3;	_10[1] = _4;	_10[2] = _5;	_10[3] = _6;	_10[4] = _7;	_10[5] = _8;	_10[6] = _9;
	//assign %2 = %10  : [bool]
	_2 = (long long*)_10;
	_2_size = _10_size;
	//assign %1 = %2  : [bool]
	_xs = (long long*)_2;
	_xs_size = _2_size;
	//assume 
	{
		//const %11 = true : bool
		_11 = true;
		//const %12 = true : bool
		_12 = true;
		//const %13 = true : bool
		_13 = true;
		//const %14 = true : bool
		_14 = true;
		//const %15 = true : bool
		_15 = true;
		//const %16 = true : bool
		_16 = true;
		//const %17 = true : bool
		_17 = true;
		//newlist %18 = (%11, %12, %13, %14, %15, %16, %17) : [bool]
		_18_size = 7;
		_18 = (long long*)malloc(_18_size*sizeof(long long));
		_18[0] = _11;		_18[1] = _12;		_18[2] = _13;		_18[3] = _14;		_18[4] = _15;		_18[5] = _16;		_18[6] = _17;
		//ifeq %1, %18 goto blklab8 : [bool]
		if(isArrayEqual(_xs, _xs_size,_18, _18_size)==1){goto blklab8;}
		//fail
		fprintf(stderr,"fail");
		exit(0);
//.blklab8
blklab8:;
	//assume 
	}
	//invoke %19 = (%1) BoolList_Valid_2:play : function([bool]) -> [bool]
	_19_size=_xs_size;
	_19=play(clone(_xs, _xs_size), _xs_size);
	//assign %1 = %19  : [bool]
	_xs = (long long*)_19;
	_xs_size = _19_size;
	//assume 
	{
		//const %20 = false : bool
		_20 = false;
		//const %21 = true : bool
		_21 = true;
		//const %22 = true : bool
		_22 = true;
		//const %23 = true : bool
		_23 = true;
		//const %24 = true : bool
		_24 = true;
		//const %25 = true : bool
		_25 = true;
		//const %26 = false : bool
		_26 = false;
		//newlist %27 = (%20, %21, %22, %23, %24, %25, %26) : [bool]
		_27_size = 7;
		_27 = (long long*)malloc(_27_size*sizeof(long long));
		_27[0] = _20;		_27[1] = _21;		_27[2] = _22;		_27[3] = _23;		_27[4] = _24;		_27[5] = _25;		_27[6] = _26;
		//ifeq %1, %27 goto blklab9 : [bool]
		if(isArrayEqual(_xs, _xs_size,_27, _27_size)==1){goto blklab9;}
		//fail
		fprintf(stderr,"fail");
		exit(0);
//.blklab9
blklab9:;
	//assume 
	}
	//invoke %28 = (%1) BoolList_Valid_2:play : function([bool]) -> [bool]
	_28_size=_xs_size;
	_28=play(clone(_xs, _xs_size), _xs_size);
	//assign %1 = %28  : [bool]
	_xs = (long long*)_28;
	_xs_size = _28_size;
	//assume 
	{
		//const %29 = false : bool
		_29 = false;
		//const %30 = false : bool
		_30 = false;
		//const %31 = true : bool
		_31 = true;
		//const %32 = true : bool
		_32 = true;
		//const %33 = true : bool
		_33 = true;
		//const %34 = false : bool
		_34 = false;
		//const %35 = false : bool
		_35 = false;
		//newlist %36 = (%29, %30, %31, %32, %33, %34, %35) : [bool]
		_36_size = 7;
		_36 = (long long*)malloc(_36_size*sizeof(long long));
		_36[0] = _29;		_36[1] = _30;		_36[2] = _31;		_36[3] = _32;		_36[4] = _33;		_36[5] = _34;		_36[6] = _35;
		//ifeq %1, %36 goto blklab10 : [bool]
		if(isArrayEqual(_xs, _xs_size,_36, _36_size)==1){goto blklab10;}
		//fail
		fprintf(stderr,"fail");
		exit(0);
//.blklab10
blklab10:;
	//assume 
	}
	//invoke %37 = (%1) BoolList_Valid_2:play : function([bool]) -> [bool]
	_37_size=_xs_size;
	_37=play(clone(_xs, _xs_size), _xs_size);
	//assign %1 = %37  : [bool]
	_xs = (long long*)_37;
	_xs_size = _37_size;
	//assume 
	{
		//const %38 = false : bool
		_38 = false;
		//const %39 = false : bool
		_39 = false;
		//const %40 = false : bool
		_40 = false;
		//const %41 = true : bool
		_41 = true;
		//const %42 = false : bool
		_42 = false;
		//const %43 = false : bool
		_43 = false;
		//const %44 = false : bool
		_44 = false;
		//newlist %45 = (%38, %39, %40, %41, %42, %43, %44) : [bool]
		_45_size = 7;
		_45 = (long long*)malloc(_45_size*sizeof(long long));
		_45[0] = _38;		_45[1] = _39;		_45[2] = _40;		_45[3] = _41;		_45[4] = _42;		_45[5] = _43;		_45[6] = _44;
		//ifeq %1, %45 goto blklab11 : [bool]
		if(isArrayEqual(_xs, _xs_size,_45, _45_size)==1){goto blklab11;}
		//fail
		fprintf(stderr,"fail");
		exit(0);
//.blklab11
blklab11:;
	//assume 
	}
	//invoke %46 = (%1) BoolList_Valid_2:play : function([bool]) -> [bool]
	_46_size=_xs_size;
	_46=play(clone(_xs, _xs_size), _xs_size);
	//assign %1 = %46  : [bool]
	_xs = (long long*)_46;
	_xs_size = _46_size;
	//assume 
	{
		//const %47 = false : bool
		_47 = false;
		//const %48 = false : bool
		_48 = false;
		//const %49 = false : bool
		_49 = false;
		//const %50 = false : bool
		_50 = false;
		//const %51 = false : bool
		_51 = false;
		//const %52 = false : bool
		_52 = false;
		//const %53 = false : bool
		_53 = false;
		//newlist %54 = (%47, %48, %49, %50, %51, %52, %53) : [bool]
		_54_size = 7;
		_54 = (long long*)malloc(_54_size*sizeof(long long));
		_54[0] = _47;		_54[1] = _48;		_54[2] = _49;		_54[3] = _50;		_54[4] = _51;		_54[5] = _52;		_54[6] = _53;
		//ifeq %1, %54 goto blklab12 : [bool]
		if(isArrayEqual(_xs, _xs_size,_54, _54_size)==1){goto blklab12;}
		//fail
		fprintf(stderr,"fail");
		exit(0);
//.blklab12
blklab12:;
	//assume 
	}
	//return
	;
}
