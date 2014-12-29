#include "BoolList_Valid_2.h"
int getSize(int *arr){
int size=0;
while(arr[size] != NULL){
size++;
}
return size;
}
int* clone(int *arr, int size){
int *ptr;
int i;
//Clone all the values from board array due to immutable Whiley value
ptr = (int*)malloc((size+1)*sizeof(int));
//Copy data from 'board' array to 'nboard' array
for(i=0;i<size;i++){
ptr[i]=arr[i];
}
//Ending
ptr[i]=NULL;
return ptr;
}
char* toString(int arr[], int size, char *str){
int i;
int len;
i=0;
strcpy(str, "[");
for(i=0;i<size;i++){
if(arr[i]==true){
strcat(str, "true");
}else{
strcat(str, "false");
}
if(i<size-1){
strcat(str, ", ");
}
}
strcat(str, "]");
//Add the ending
len = strlen(str);
str[len+1]=NULL;
return str;
}
int* play(int* _0, int _0_size){
	int _20;
	int _7;
	int _8;
	int _11;
	int _3;
	int _5;
	int _17;
	int _6;
	int _14;
	int* _1;
	int* _2;
	//assign %2 = %0  : [bool]
	_2 = clone(_0, getSize(_0));
	//assign %1 = %2  : [bool]
	_1 = clone(_2, getSize(_2));
	//const %3 = 0 : int
	_3 = 0;
	//lengthof %5 = %0 : [bool]
	_5 = getSize(_0);
	//forall %7 in %6 (%1) : [int]
	for(_6=_3;_6<_5;_6++){
		//forall %7 in %6 (%1) : [int]
		_7=_6;
		//invoke %8 = (%7, %0) BoolList_Valid_2:isAlive : function(int,[bool]) => bool
		_8=isAlive(_7 ,_0 , getSize(_0));
		//const %11 = true : bool
		_11 = true;
		//ifeq %8, %11 goto blklab4 : bool
		if(_8==_11){goto blklab4;}
		//goto blklab2
		goto blklab2;
		//.blklab4
blklab4:
		//const %14 = true : bool
		_14 = true;
			//assert blklab12
			{
			//const %20 = 0 : int
			_20 = 0;
			//ifge %7, %20 goto blklab11 : int
			if(_7>=_20){goto blklab11;}
			//fail ""index out of bounds (negative)""
			perror("fail ""index out of bounds (negative)""");
			//.blklab11
blklab11:
			//lengthof %20 = %1 : [bool]
			_20 = getSize(_1);
			//iflt %7, %20 goto blklab12 : int
			if(_7<_20){goto blklab12;}
			//fail ""index out of bounds (not less than length)""
			perror("fail ""index out of bounds (not less than length)""");
			//.blklab12
			}
			//.blklab12
blklab12:
			//update %1[%7] = %14 : [bool] -> [bool]
			_1[_7] = _14;
			//goto blklab3
			goto blklab3;
			//.blklab2
blklab2:
			//const %17 = false : bool
			_17 = false;
				//assert blklab14
				{
				//const %20 = 0 : int
				_20 = 0;
				//ifge %7, %20 goto blklab13 : int
				if(_7>=_20){goto blklab13;}
				//fail ""index out of bounds (negative)""
				perror("fail ""index out of bounds (negative)""");
				//.blklab13
blklab13:
				//lengthof %20 = %1 : [bool]
				_20 = getSize(_1);
				//iflt %7, %20 goto blklab14 : int
				if(_7<_20){goto blklab14;}
				//fail ""index out of bounds (not less than length)""
				perror("fail ""index out of bounds (not less than length)""");
				//.blklab14
				}
				//.blklab14
blklab14:
				//update %1[%7] = %17 : [bool] -> [bool]
				_1[_7] = _17;
				//.blklab3
blklab3:
				//nop
				;
			//end blklab0
			}
			//.blklab1
blklab1:
			//return %1 : [bool]
			return _1;
}
int isAlive(int _0, int* _1, int _1_size){
	int _22;
	int _21;
	int _20;
	int _8;
	int _11;
	int _18;
	int _3;
	int _19;
	int _5;
	int _17;
	int _6;
	int _14;
	int _23;
	int _24;
	int _12;
	int _13;
	//const %3 = 0 : int
	_3 = 0;
	//ifle %0, %3 goto blklab5 : int
	if(_0<=_3){goto blklab5;}
	//const %5 = 1 : int
	_5 = 1;
	//add %6 = %0, %5 : int
	_6=_0+_5;
	//lengthof %8 = %1 : [bool]
	_8 = getSize(_1);
	//ifge %6, %8 goto blklab5 : int
	if(_6>=_8){goto blklab5;}
	//const %11 = 1 : int
	_11 = 1;
	//sub %12 = %0, %11 : int
	_12=_0-_11;
		//assert blklab16
		{
		//const %23 = 0 : int
		_23 = 0;
		//ifge %12, %23 goto blklab15 : int
		if(_12>=_23){goto blklab15;}
		//fail ""index out of bounds (negative)""
		perror("fail ""index out of bounds (negative)""");
		//.blklab15
blklab15:
		//lengthof %24 = %1 : [bool]
		_24 = getSize(_1);
		//iflt %12, %24 goto blklab16 : int
		if(_12<_24){goto blklab16;}
		//fail ""index out of bounds (not less than length)""
		perror("fail ""index out of bounds (not less than length)""");
		//.blklab16
		}
		//.blklab16
blklab16:
		//indexof %13 = %1, %12 : [bool]
		_13=_1[_12];
		//const %14 = true : bool
		_14 = true;
		//ifeq %13, %14 goto blklab7 : bool
		if(_13==_14){goto blklab7;}
		//goto blklab5
		goto blklab5;
		//.blklab7
blklab7:
		//const %17 = 1 : int
		_17 = 1;
		//add %18 = %0, %17 : int
		_18=_0+_17;
			//assert blklab18
			{
			//const %23 = 0 : int
			_23 = 0;
			//ifge %18, %23 goto blklab17 : int
			if(_18>=_23){goto blklab17;}
			//fail ""index out of bounds (negative)""
			perror("fail ""index out of bounds (negative)""");
			//.blklab17
blklab17:
			//lengthof %24 = %1 : [bool]
			_24 = getSize(_1);
			//iflt %18, %24 goto blklab18 : int
			if(_18<_24){goto blklab18;}
			//fail ""index out of bounds (not less than length)""
			perror("fail ""index out of bounds (not less than length)""");
			//.blklab18
			}
			//.blklab18
blklab18:
			//indexof %19 = %1, %18 : [bool]
			_19=_1[_18];
			//const %20 = true : bool
			_20 = true;
			//ifeq %19, %20 goto blklab8 : bool
			if(_19==_20){goto blklab8;}
			//goto blklab5
			goto blklab5;
			//.blklab8
blklab8:
			//const %21 = true : bool
			_21 = true;
			//return %21 : bool
			return _21;
			//.blklab5
blklab5:
			//const %22 = false : bool
			_22 = false;
			//return %22 : bool
			return _22;
}
void main(int argc, char** argv){
	int* _18;
	int* _17;
	int _12;
	int _13;
	char str[1024];
	int _7;
	int _8;
	int* _9;
	int _11;
	int _10;
	int _3;
	int _4;
	int _5;
	int _6;
	int* _1;
	int _2;
	//const %2 = true : bool
	_2 = true;
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
	//newlist %9 = (%2, %3, %4, %5, %6, %7, %8) : [bool]
	_9=(int*)malloc(8*sizeof(int));
	//newlist %9 = (%2, %3, %4, %5, %6, %7, %8) : [bool]
	_9[0]=_2;
	//newlist %9 = (%2, %3, %4, %5, %6, %7, %8) : [bool]
	_9[1]=_3;
	//newlist %9 = (%2, %3, %4, %5, %6, %7, %8) : [bool]
	_9[2]=_4;
	//newlist %9 = (%2, %3, %4, %5, %6, %7, %8) : [bool]
	_9[3]=_5;
	//newlist %9 = (%2, %3, %4, %5, %6, %7, %8) : [bool]
	_9[4]=_6;
	//newlist %9 = (%2, %3, %4, %5, %6, %7, %8) : [bool]
	_9[5]=_7;
	//newlist %9 = (%2, %3, %4, %5, %6, %7, %8) : [bool]
	_9[6]=_8;
	//newlist %9 = (%2, %3, %4, %5, %6, %7, %8) : [bool]
	_9[7]=NULL;
	//assign %1 = %9  : [bool]
	_1 = clone(_9, getSize(_9));
	//const %10 = 0 : int
	_10 = 0;
	//const %11 = 5 : int
	_11 = 5;
	//forall %13 in %12 (%1) : [int]
	for(_12=_10;_12<_11;_12++){
		//forall %13 in %12 (%1) : [int]
		_13=_12;
		//fieldload %15 = %0 out : {[string] args,{method(any) => void print,method(any) => void println} out}
		//fieldload %16 = %15 println : {method(any) => void print,method(any) => void println}
		//assign %17 = %1  : [bool]
		_17 = clone(_1, getSize(_1));
		//indirectinvoke %16 (%17) : method(any) => void
		printf("%s\n",toString(_17, getSize(_17), str));
		//invoke %18 = (%1) BoolList_Valid_2:play : function([bool]) => [bool]
		_18=play(_1 , getSize(_1));
		//assign %1 = %18  : [bool]
		_1 = clone(_18, getSize(_18));
		//nop
		;
	//end blklab9
	}
	//.blklab10
blklab10:
	//return
	return;
}
