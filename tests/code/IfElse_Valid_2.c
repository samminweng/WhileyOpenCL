#include "IfElse_Valid_2.h"
long long f(long long _x){
	long long _1 = 0;
	long long _2 = 0;
	long long _3 = 0;
	long long _4 = 0;
	long long _5 = 0;
	//const %1 = 10 : int
	_1 = 10;
	//ifge %0, %1 goto blklab0 : int
	if(_x>=_1){goto blklab0;}
	//const %2 = 1 : int
	_2 = 1;
	//return %2 : int
	return _2;
	//goto blklab1
	goto blklab1;
//.blklab0
blklab0:;
	//const %3 = 10 : int
	_3 = 10;
	//ifle %0, %3 goto blklab2 : int
	if(_x<=_3){goto blklab2;}
	//const %4 = 2 : int
	_4 = 2;
	//return %4 : int
	return _4;
//.blklab2
blklab2:;
//.blklab1
blklab1:;
	//const %5 = 0 : int
	_5 = 0;
	//return %5 : int
	return _5;
	//return
	;
}
int main(int argc, char** argv){
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
	long long _11 = 0;
	long long _12 = 0;
	long long _13 = 0;
	long long _14 = 0;
	long long _15 = 0;
	long long _16 = 0;
	//assert
	{
		//const %2 = 1 : int
		_2 = 1;
		//invoke %1 = (%2) IfElse_Valid_2:f : function(int) -> int
		_1=f(_2);
		//const %3 = 1 : int
		_3 = 1;
		//ifeq %1, %3 goto blklab3 : int
		if(_1==_3){goto blklab3;}
		//fail
		fprintf(stderr,"fail");
		exit(0);
//.blklab3
blklab3:;
	//assert
	}
	//assert
	{
		//const %5 = 10 : int
		_5 = 10;
		//invoke %4 = (%5) IfElse_Valid_2:f : function(int) -> int
		_4=f(_5);
		//const %6 = 0 : int
		_6 = 0;
		//ifeq %4, %6 goto blklab4 : int
		if(_4==_6){goto blklab4;}
		//fail
		fprintf(stderr,"fail");
		exit(0);
//.blklab4
blklab4:;
	//assert
	}
	//assert
	{
		//const %8 = 11 : int
		_8 = 11;
		//invoke %7 = (%8) IfElse_Valid_2:f : function(int) -> int
		_7=f(_8);
		//const %9 = 2 : int
		_9 = 2;
		//ifeq %7, %9 goto blklab5 : int
		if(_7==_9){goto blklab5;}
		//fail
		fprintf(stderr,"fail");
		exit(0);
//.blklab5
blklab5:;
	//assert
	}
	//assert
	{
		//const %11 = 1212 : int
		_11 = 1212;
		//invoke %10 = (%11) IfElse_Valid_2:f : function(int) -> int
		_10=f(_11);
		//const %12 = 2 : int
		_12 = 2;
		//ifeq %10, %12 goto blklab6 : int
		if(_10==_12){goto blklab6;}
		//fail
		fprintf(stderr,"fail");
		exit(0);
//.blklab6
blklab6:;
	//assert
	}
	//assert
	{
		//const %14 = 1212 : int
		_14 = 1212;
		//neg %15 = %14 : int
		_15= -_14;
		//invoke %13 = (%15) IfElse_Valid_2:f : function(int) -> int
		_13=f(_15);
		//const %16 = 1 : int
		_16 = 1;
		//ifeq %13, %16 goto blklab7 : int
		if(_13==_16){goto blklab7;}
		//fail
		fprintf(stderr,"fail");
		exit(0);
//.blklab7
blklab7:;
	//assert
	}
	//return
	;
}
