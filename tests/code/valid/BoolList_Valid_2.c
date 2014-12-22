#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#define false 0
#define true 1
int* clone(int *arr, int size){
	int *ptr;
	int i;
	//Clone all the values from board array due to immutable Whiley value
	ptr = (int*)malloc(size*sizeof(int));
	//Copy data from 'board' array to 'nboard' array
	for(i=0;i<size;i++){
		ptr[i]=arr[i];
	}
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
	str[len+1]='\0';
	return str;
}
int* play(int* _0, int size){
	int* _1;
	int* _2;
	int _14;
	int _3;
	int _17;
	int _5;
	int _6;
	int _7;
	int _8;
	int _20;
	int _11;
	_2 = clone(_0, size);
	_1 = clone(_2, size);
	_3 = 0;
	_5 = size;
	for(_6=_3;_6<_5;_6++){
		_7=_6;
		_8=isAlive(_7 ,_0 , size);
		_11 = true;
		if(_8==_11){goto blklab4;}
		goto blklab2;
blklab4:
		_14 = true;
		//assert blklab12
		_20 = 0;
		if(_7>=_20){goto blklab11;}
		perror("fail ""index out of bounds (negative)""");
blklab11:
		_20 = size;
		if(_7<_20){goto blklab12;}
		perror("fail ""index out of bounds (not less than length)""");
blklab12:
		_1[_7] = _14;
		goto blklab3;
blklab2:
		_17 = false;
		//assert blklab14
		_20 = 0;
		if(_7>=_20){goto blklab13;}
		perror("fail ""index out of bounds (negative)""");
blklab13:
		_20 = size;
		if(_7<_20){goto blklab14;}
		perror("fail ""index out of bounds (not less than length)""");
blklab14:
		_1[_7] = _17;
blklab3:
		;//nop
	}
blklab1:
	return _1;
}
int isAlive(int _0, int* _1, int size){
	int _24;
	int _13;
	int _12;
	int _23;
	int _14;
	int _17;
	int _19;
	int _18;
	int _3;
	int _5;
	int _6;
	int _8;
	int _20;
	int _11;
	int _22;
	int _21;
	_3 = 0;
	if(_0<=_3){goto blklab5;}
	_5 = 1;
	_6=_0+_5;
	_8 = size;
	if(_6>=_8){goto blklab5;}
	_11 = 1;
	_12=_0-_11;
	//assert blklab16
	_23 = 0;
	if(_12>=_23){goto blklab15;}
	perror("fail ""index out of bounds (negative)""");
blklab15:
	_24 = size;
	if(_12<_24){goto blklab16;}
	perror("fail ""index out of bounds (not less than length)""");
blklab16:
	_13=_1[_12];
	_14 = true;
	if(_13==_14){goto blklab7;}
	goto blklab5;
blklab7:
	_17 = 1;
	_18=_0+_17;
	//assert blklab18
	_23 = 0;
	if(_18>=_23){goto blklab17;}
	perror("fail ""index out of bounds (negative)""");
blklab17:
	_24 = size;
	if(_18<_24){goto blklab18;}
	perror("fail ""index out of bounds (not less than length)""");
blklab18:
	_19=_1[_18];
	_20 = true;
	if(_19==_20){goto blklab8;}
	goto blklab5;
blklab8:
	_21 = true;
	return _21;
blklab5:
	_22 = false;
	return _22;
}
void main(int argc, char** argv){
	int _13;
	int _12;
	int* _17;
	int* _18;
	char str[1024];
	int* _1;
	int _2;
	int _3;
	int size;
	int _4;
	int _5;
	int _6;
	int _7;
	int _8;
	int* _9;
	int _11;
	int _10;
	_2 = true;
	_3 = true;
	_4 = true;
	_5 = true;
	_6 = true;
	_7 = true;
	_8 = true;
	size=7;
	_9=(int*)malloc(size*sizeof(int));
	_9[0]=_2;
	_9[1]=_3;
	_9[2]=_4;
	_9[3]=_5;
	_9[4]=_6;
	_9[5]=_7;
	_9[6]=_8;
	_1 = clone(_9, size);
	_10 = 0;
	_11 = 5;
	for(_12=_10;_12<_11;_12++){
		_13=_12;
		_17 = clone(_1, size);
		printf("%s\n",toString(_17, size, str));
		_18=play(_1 , size);
		_1 = clone(_18, size);
		;//nop
	}
blklab10:
	return;
}
