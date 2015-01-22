#include "While_Valid_1.h"
long long* clone(long long *arr, long long size){
	long long *ptr;
	long long i;
	//Clone all the values from board array due to immutable Whiley value
	ptr = (long long*)malloc(size*sizeof(long long));
	//Copy data from 'board' array to 'nboard' array
	for(i=0;i<size;i++){
		ptr[i]=arr[i];
	}
	return ptr;
}
void append(long long* op_1, long long op_1_size, long long* op_2, long long op_2_size, long long* res){
	long long i;
	long long res_i;
	res_i=0;
	for(i=0;i<op_1_size;i++){
		res[res_i]=op_1[i];
		res_i++;
	}
	for(i=0;i<op_2_size;i++){
		res[res_i]=op_2[i];
		res_i++;
	}
}

long long* reverse(long long* _0, long long _0_size){
	long long _50;
	long long _24;
	long long _25;
	long long _26;
	long long _48;
	long long _3_size;
	long long _46;
	long long _33;
	long long _45;
	long long _8;
	long long _10;
	long long* _3;
	long long* _4;
	long long _6;
	long long _1;
	long long _2;
	long long _19;
	long long _16;
	long long _40;
	long long _14;
	long long _42;
	long long _12;
	long long* _44;
	long long _22;
	long long _35;
	long long _44_size;
	long long _36;
	long long _38;
	long long _4_size;
	//assign %44 = %0  : [int]
	_44 = clone(_0, _0_size);
	_44_size = _0_size;
	//const %2 = 0 : int
	_2 = 0;
	//assign %1 = %2  : int
	_1 = _2;
	//assign %4 = %0  : [int]
	_4 = clone(_0, _0_size);
	_4_size = _0_size;
	//assign %3 = %4  : [int]
	_3 = clone(_4, _4_size);
	_3_size = _4_size;
	//assert blklab3
	{
		//const %6 = 0 : int
		_6 = 0;
		//iflt %2, %6 goto blklab4 : int
		if(_2<_6){goto blklab4;}
		//lengthof %8 = %0 : [int]
		_8 = _0_size;
		//lengthof %10 = %0 : [int]
		_10 = _0_size;
		//ifeq %8, %10 goto blklab3 : int
		if(_8==_10){goto blklab3;}
//.blklab4
blklab4:;
		//fail ""loop invariant not satisfied on entry""
		fprintf(stderr,"fail ""loop invariant not satisfied on entry""");
		exit(0);
	}
//.blklab3
blklab3:;
	//loop (%0, %1)
	//assume blklab5
	{
		//const %12 = 0 : int
		_12 = 0;
		//iflt %1, %12 goto blklab6 : int
		if(_1<_12){goto blklab6;}
		//lengthof %14 = %0 : [int]
		_14 = _0_size;
		//lengthof %16 = %3 : [int]
		_16 = _3_size;
		//ifeq %14, %16 goto blklab5 : int
		if(_14==_16){goto blklab5;}
//.blklab6
blklab6:;
		//fail """"
		fprintf(stderr,"fail """"");
		exit(0);
	}
//.blklab5
blklab5:;
	//lengthof %19 = %0 : [int]
	_19 = _0_size;
		//ifge %1, %19 goto blklab2 : int
	while(_1<_19){
		//lengthof %22 = %0 : [int]
		_22 = _0_size;
		//const %24 = 1 : int
		_24 = 1;
		//add %25 = %1, %24 : int
		_25=_1+_24;
		//sub %26 = %22, %25 : int
		_26=_22-_25;
		//assert blklab10
		{
			//const %45 = 0 : int
			_45 = 0;
			//ifge %26, %45 goto blklab9 : int
			if(_26>=_45){goto blklab9;}
			//fail ""index out of bounds (negative)""
			fprintf(stderr,"fail ""index out of bounds (negative)""");
			exit(0);
//.blklab9
blklab9:;
			//lengthof %46 = %3 : [int]
			_46 = _3_size;
			//iflt %26, %46 goto blklab10 : int
			if(_26<_46){goto blklab10;}
			//fail ""index out of bounds (not less than length)""
			fprintf(stderr,"fail ""index out of bounds (not less than length)""");
			exit(0);
		}
//.blklab10
blklab10:;
		//assert blklab12
		{
			//const %45 = 0 : int
			_45 = 0;
			//ifge %26, %45 goto blklab11 : int
			if(_26>=_45){goto blklab11;}
			//fail ""index out of bounds (negative)""
			fprintf(stderr,"fail ""index out of bounds (negative)""");
			exit(0);
//.blklab11
blklab11:;
			//lengthof %46 = %3 : [int]
			_46 = _3_size;
			//iflt %26, %46 goto blklab12 : int
			if(_26<_46){goto blklab12;}
			//fail ""index out of bounds (not less than length)""
			fprintf(stderr,"fail ""index out of bounds (not less than length)""");
			exit(0);
		}
//.blklab12
blklab12:;
		//indexof %33 = %3, %26 : [int]
		_33=_3[_26];
		//assert blklab14
		{
			//const %46 = 0 : int
			_46 = 0;
			//ifge %1, %46 goto blklab13 : int
			if(_1>=_46){goto blklab13;}
			//fail ""index out of bounds (negative)""
			fprintf(stderr,"fail ""index out of bounds (negative)""");
			exit(0);
//.blklab13
blklab13:;
			//lengthof %46 = %0 : [int]
			_46 = _0_size;
			//iflt %1, %46 goto blklab14 : int
			if(_1<_46){goto blklab14;}
			//fail ""index out of bounds (not less than length)""
			fprintf(stderr,"fail ""index out of bounds (not less than length)""");
			exit(0);
		}
//.blklab14
blklab14:;
		//update %0[%1] = %33 : [int] -> [int]
		_0[_1] = _33;
		//const %35 = 1 : int
		_35 = 1;
		//add %36 = %1, %35 : int
		_36=_1+_35;
		//assign %1 = %36  : int
		_1 = _36;
		//assert blklab7
		{
			//const %38 = 0 : int
			_38 = 0;
			//iflt %36, %38 goto blklab8 : int
			if(_36<_38){goto blklab8;}
			//lengthof %40 = %0 : [int]
			_40 = _0_size;
			//lengthof %42 = %3 : [int]
			_42 = _3_size;
			//ifeq %40, %42 goto blklab7 : int
			if(_40==_42){goto blklab7;}
//.blklab8
blklab8:;
			//fail ""loop invariant not restored""
			fprintf(stderr,"fail ""loop invariant not restored""");
			exit(0);
		}
//.blklab7
blklab7:;
		//nop
		;
	//end blklab1
	}
//.blklab2
blklab2:;
	//assert blklab16
	{
		//lengthof %48 = %44 : [int]
		_48 = _44_size;
		//lengthof %50 = %0 : [int]
		_50 = _0_size;
		//ifeq %48, %50 goto blklab15 : int
		if(_48==_50){goto blklab15;}
		//fail ""postcondition not satisfied""
		fprintf(stderr,"fail ""postcondition not satisfied""");
		exit(0);
//.blklab15
blklab15:;
	}
//.blklab16
blklab16:;
	//return %0 : [int]
	return _0;
}
int main(int argc, char** argv){
	long long _13_size;
	long long _8_size;
	char str[1024];
	long long _7;
	long long* _8;
	long long _3;
	long long _4;
	long long _5;
	long long _6;
	long long* _1;
	long long* _2;
	long long _1_size;
	size_t _2_size;
	long long* _13;
	char _12[1024];
	//const %3 = 1 : int
	_3 = 1;
	//const %4 = 2 : int
	_4 = 2;
	//const %5 = 3 : int
	_5 = 3;
	//const %6 = 4 : int
	_6 = 4;
	//const %7 = 5 : int
	_7 = 5;
	//newlist %8 = (%3, %4, %5, %6, %7) : [int]
	_8=(long long*)malloc(5*sizeof(long long));
	//newlist %8 = (%3, %4, %5, %6, %7) : [int]
	_8_size=5;
	//newlist %8 = (%3, %4, %5, %6, %7) : [int]
	_8[0]=_3;
	//newlist %8 = (%3, %4, %5, %6, %7) : [int]
	_8[1]=_4;
	//newlist %8 = (%3, %4, %5, %6, %7) : [int]
	_8[2]=_5;
	//newlist %8 = (%3, %4, %5, %6, %7) : [int]
	_8[3]=_6;
	//newlist %8 = (%3, %4, %5, %6, %7) : [int]
	_8[4]=_7;
	//invoke %2 = (%8) While_Valid_1:reverse : function([int]) => [int]
	_2_size=_8_size;
	_2=reverse(_8 , _8_size);
	//assign %1 = %2  : [int]
	_1 = clone(_2, _2_size);
	_1_size = _2_size;
	//fieldload %10 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
	//fieldload %11 = %10 println : {method(any) => void print,method(any) => void println}
	//assign %13 = %1  : [int]
	_13 = clone(_1, _1_size);
	_13_size = _1_size;
	//convert %13 = %13 any : [int]
	//invoke %12 = (%13) whiley/lang/Any:toString : function(any) => string
	toString(_13 , _13_size, _12);
	//convert %12 = %12 any : string
	//indirectinvoke %11 (%12) : method(any) => void
	printf("%s\n",_12);
	//return
	return -1;
}
char* toString(long long arr[], long long size, char *str){
	long long i;
	i=0;
	strcpy(str, "[");
	for(i=0;i<size;i++){		
		char c[1024];
		sprintf(c, "%d", arr[i]);
		strcat(str, c);		if(i<size-1){
			strcat(str, ", ");
		}
	}
	strcat(str, "]");
	return str;
}
