// This file stores built-in functions in wyrt modules.
#include "WyRT.h"

int64_t* Int_toString(int64_t item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(r);

	int64_t value = item;
	size_t i=0;
	// Calculate the length of item
	do{
		// Increment the size
		r_size++;
	}while((value = value/10)>0);

	// Create an integer array
	r = malloc(r_size*sizeof(int64_t));
	i=r_size;
	// Convert an integer to 'r' integer array
	do{
		i--;
		// Get remain
		r[i] = item%10+'0';
	}while((item = item/10)>0);

	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(r);
	return r;
}

int64_t* Array_Append(_DECL_1DARRAY_PARAM(lhs), _DECL_1DARRAY_PARAM(rhs), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE){
	_DECL_1DARRAY(_2);
	_DECL_DEALLOC(_2);
	_DECL_1DARRAY(rs);
	_DECL_DEALLOC(rs);
	int64_t i = 0;
	int64_t _5 = 0;
	int64_t _6 = 0;
	int64_t _7 = 0;
	int64_t _8 = 0;
	_DECL_1DARRAY(_9);
	_DECL_DEALLOC(_9);
	int64_t _10 = 0;
	int64_t _11 = 0;
	int64_t _12 = 0;
	int64_t _13 = 0;
	int64_t _14 = 0;
	int64_t _15 = 0;
	int64_t _16 = 0;
	int64_t _17 = 0;
	int64_t _18 = 0;
	int64_t _19 = 0;
	int64_t _20 = 0;
	//const %5 = 0 : int
	_5 = 0;
	//lengthof %6 = %0 : int[]
	_6 = lhs_size;
	//lengthof %7 = %1 : int[]
	_7 = rhs_size;
	//add %8 = %6, %7 : int
	_8=_6+_7;
	//arraygen %9 = [5; 8] : int[]
	_DEALLOC(_9);
	_NEW_1DARRAY_int64_t(_9, _8, _5);
	_9_dealloc=true;
	//assign %3 = %9  : int[]
	_TRANSFER_DEALLOC(rs, _9, 1);
	//lengthof %10 = %0 : int[]
	_10 = lhs_size;
	//assign %4 = %10  : int
	i = _10;
	//loop (%3, %4, %11, %12, %13, %14)
	while(true){
		//const %11 = 0 : int
		_11 = 0;
		//ifle %4, %11 goto blklab0 : int
		if(i<=_11){goto blklab0;}
		//const %12 = 1 : int
		_12 = 1;
		//sub %13 = %4, %12 : int
		_13=i-_12;
		//assign %4 = %13  : int
		i = _13;
		//indexof %14 = %0, %4 : int[]
		_14=lhs[i];
		//update %3[%4] = %14 : int[] -> int[]
		rs[i] = _14;
		//.blklab1
		blklab1:;
	}
	//.blklab0
	blklab0:;
	//loop (%3, %4, %15, %16, %17, %18, %19, %20)
	while(true){
		//lengthof %15 = %1 : int[]
		_15 = rhs_size;
		//ifge %4, %15 goto blklab2 : int
		if(i>=_15){goto blklab2;}
		//indexof %16 = %1, %4 : int[]
		_16=rhs[i];
		//lengthof %17 = %0 : int[]
		_17 = lhs_size;
		//add %18 = %4, %17 : int
		_18=i+_17;
		//update %3[%18] = %16 : int[] -> int[]
		rs[_18] = _16;
		//const %19 = 1 : int
		_19 = 1;
		//add %20 = %4, %19 : int
		_20=i+_19;
		//assign %4 = %20  : int
		i = _20;
		//.blklab3
		blklab3:;
	}
	//.blklab2
	blklab2:;
	//return %3
	_DEALLOC(_2);
	_DEALLOC(_9);
	_UPDATE_1DARRAYSZIE_PARAM_CALLBYREFERENCE(rs);
	return rs;
	//return
}

// Write an BYTE array to a file
void writeAll(FILE *file, BYTE* arr, size_t arr_size){
	// Write out the file
	fwrite(arr, sizeof(BYTE), arr_size, file);
}

// Read the file name (ASCII code) and output a file pointer
FILE* Writer(int64_t* arr, size_t arr_size){
	// Chars array
	char* tmp = malloc(MAX_LINE_LENGTH*sizeof(char));
	// Convert an array of ASCII code to an string
	size_t i=0;
	// Iterate through all the chars
	while(i < arr_size){
		tmp[i] = (char) arr[i];
		i = i + 1;
	}

	tmp[i] = '\0';

	// Declare the filename with given array size
	char* filename = malloc(arr_size+1*sizeof(char));
	// Copy 'tmp' string to filename;
	strncpy(filename, tmp, arr_size+1);

	// 'w': Create a file pointer
	FILE *fp = fopen(filename, "w");
	if(fp == NULL){
		fputs("fail to open the file name at 'Writer' function in Util.c\n", stderr);
		exit(-2);
	}

	// Free the file name and tmp arrays
	free(filename);
	free(tmp);
	return fp;
}

// Read the file name (ASCII code) and output a file pointer
FILE* Reader(int64_t* arr, size_t arr_size){
	// Chars array
	char tmp[1024];
	//char* tmp = malloc(MAX_LINE_LENGTH*sizeof(char));
	// Convert an array of ASCII code to an string
	size_t i=0;
	// Iterate through all the chars
	while(i < arr_size){
		tmp[i] = (char) arr[i];
		i = i + 1;
	}

	tmp[i] = '\0';

	// Declare the filename with given array size
	char* filename = malloc(arr_size+1*sizeof(char));
	// Copy 'tmp' string to filename;
	strncpy(filename, tmp, arr_size+1);

	// Open a file pointer
	FILE *fp = fopen(filename, "r");
	if(fp == NULL){
		fputs("fail to open the file name at 'Reader' function in Util.c\n", stderr);
		exit(-2);
	}

	// Free the file name and tmp arrays
	free(filename);
	//free(tmp);
	return fp;
}

/*
 * Convert an array of BYTE to an integer array
 */
int64_t* fromBytes(BYTE* input, size_t size){
	// Create an array of integer
	int64_t* arr = (int64_t*)malloc(size*sizeof(int64_t));
	if(arr == NULL){
		fputs("fail to allocate the memory at fromBytes function in Util.c\n", stderr);
		exit(-2);
	}
	for(size_t i=0;i<size;i++){
		BYTE b = input[i];
		// Convert 'char' to ASCII code (integer)
		arr[i] = b;
	}
	return arr;
}
// Check if file is a pbm
bool isPBMFile(FILE *file){
	char* line = malloc(MAX_LINE_LENGTH*sizeof(char));
	bool isPBMFormat = false;
	// Get the first line, which should be 'P1\n'
	if(fgets(line, MAX_LINE_LENGTH, file)!= NULL){
		// Get line length
		size_t len=strlen(line);
		if(len==3){
			// Check if line is P1
			if(line[0]=='P' && line[1]=='1' && line[2]=='\n'){
				isPBMFormat=true; // The file is a PBM
			}
		}
	}
	// Free the line
	free(line);
	// The file is not a PBM
	return isPBMFormat;
}
// Read an image as an array of bytes
BYTE* readPBM(FILE *file, size_t* _size){
	char* line = malloc(MAX_LINE_LENGTH*sizeof(char));
	size_t length = MAX_LINE_LENGTH;
	int width = 0;
	int height = 0;
	// Read 'width' and 'height' from a file
	//while(getline(&line, &length, file) != -1){
	while(fgets(line, length, file) != NULL){
		// Check if the line is a comment
		if(line[0]!='#' && line[0]!='P'){
			// Read the height and width
			sscanf(line, "%d %d\n", &width, &height);
			break;
		}
	}
	// Free 'line' as it is not used anymore
	free(line);

	size_t size = width * height;

	// Allocated byte array. Note the last char (EOF)
	BYTE* arr = (BYTE*)malloc(size*sizeof(BYTE));
	if(arr == NULL){
		fputs("fail to allocate the array at 'readPBM' function in Util.c\n", stderr);
		exit(-2);
	}

	// Read a file line-by-line and pyt each byte to the array
	size_t arr_ind = 0;

	char c;
	// Read one byte
	while((c = getc(file)) != EOF){
		BYTE b;
		if(c != ' ' && c != '\n'){
			b = (BYTE)c;
			if(b == '1'){
				// b is an edge, represent by black color
				arr[arr_ind] = (BYTE)0;
			}else if(b == '0'){
				// b is an space, (by white color)
				arr[arr_ind] = (BYTE)255;
			}else{
				arr[arr_ind] = (BYTE)b;
			}
			arr_ind++;
		}
	}

	*_size = size;

	return arr;
}


// Read a file from the beginning to end
BYTE* readFile(FILE *file, size_t* _size){
	// Set the file position to the beginning of the file
	rewind(file);

	// Calculate the output size
	size_t size = 0;
	while(fgetc(file) != EOF){
		//printf("%c", c);
		size = size + 1;
	}
	// Set the file position to the beginning of the file
	rewind(file);

	// Allocated byte array. Note the last char (EOF)
	BYTE* arr = (BYTE*)malloc(size*sizeof(BYTE));
	if(arr == NULL){
		fputs("fail to allocate the array at 'readAll' function in Util.c\n", stderr);
		exit(-2);
	}

	// Read the file to 'arr' array.
	//'fread' return the number of items read, i.e. size * sizeof(char)
	size_t result = fread(arr, sizeof(char), size, file);
	if(result != size*sizeof(char)){
		fputs("fail to read a file at 'readAll' function in Util.c\n", stderr);
		exit(-2);
	}

	// Update the size of 'arr' array
	*_size = size;
	return arr;
}

// Read all lines of a file and output a BYTE array
BYTE* readAll(FILE *file, size_t* _size){
	// Check if file is a pbm
	bool ispbm=isPBMFile(file);

	if(ispbm){
		return readPBM(file, _size);
	}else{
		// Do the normal reading
		return readFile(file, _size);
	}
}
