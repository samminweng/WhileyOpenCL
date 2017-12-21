#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#define max(a, b) a ^ ((a ^ b) & -(a < b))
#define min(a, b) b ^ ((a ^ b) & -(a < b))
// Structure
typedef int64_t nat;
typedef struct{
	int64_t len;
	int64_t offset;
} Match;
typedef uint8_t BYTE;
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

//
nat match(BYTE* data, size_t data_size, nat offset, nat end){
    nat pos = end;
    nat len = 0;
    while(offset < pos && pos < data_size && data[offset] == data[pos] && len < 255){
        offset = offset + 1;
        pos = pos + 1;
        len = len + 1;
    }
    return len;
}

Match* findLongestMatch(BYTE* data, size_t data_size, nat pos){
    nat bestOffset = 0;
    nat bestLen = 0;
    int start = max(pos - 255, 0);
    //assert start >= 0
    nat offset = start;
    while (offset < pos){
        int len = match(data, data_size, offset, pos);
        if (len > bestLen){
            bestOffset = pos - offset;
            bestLen = len;
        }
        offset = offset + 1;
    }
    Match* ret = (Match*) malloc(sizeof(Match));
    ret->len = bestLen;
    ret->offset = bestOffset;
    // Return a 'Match' object
    return ret;
}

/*BYTE* resize(BYTE* items, size_t items_size, int size, size_t* nitems_size) {
    BYTE* nitems = (BYTE*)malloc(sizeof(BYTE)*size);
    int i =0;
    while(i<size){
        nitems[i] = items[i];
        i = i + 1;
    }
    *nitems_size = size;
    return nitems;
}*/
BYTE* append(BYTE* items, size_t items_size, BYTE item, size_t* _size){
	size_t nitems_size = items_size+1;
    BYTE* nitems = (BYTE*)malloc(sizeof(BYTE)*nitems_size);
    int i =0;
    while(i< items_size){
        nitems[i] = items[i];
        i = i + 1;
    }
    nitems[i] = item;
    *_size = nitems_size;
    return nitems;
}


BYTE* compress(BYTE* data, size_t data_size, size_t* _size){
    nat pos = 0;
    BYTE* output = NULL;
	size_t output_size=0;
	Match* m = NULL;
	BYTE* tmp =NULL;
	size_t tmp_size =0;
    while(pos < data_size){
		if(m != NULL){// Match m is not used afterward
			free(m);
		}
        m = findLongestMatch(data, data_size, pos);
        BYTE offset = (BYTE) m->offset;
		BYTE length = (BYTE) m->len;
		if(offset == 0){
			length = data[pos];
			pos = pos + 1;
		}else{
			pos = pos + m->len;
		}
		tmp = append(output, output_size, offset, &tmp_size);
		if(output!= NULL){// Free output array
			free(output);
		}
		output = tmp;
		output_size = tmp_size;
		tmp = append(output, output_size, length, &tmp_size);
		if(output!= NULL){
			free(output);
		}
		output = tmp;
		output_size = tmp_size;
    }
	if(m!= NULL){// Match m is a local variable
		free(m);
	}
	*_size = output_size;
	return output;
}

int main(int argc, char** args){
	// Use an example string to test LZ77 compression
	//char str[] = "AACAACABCABAAAC";// length = 15
	//size_t nbytes = strlen(str);
	//printf("Length =%zu\n", nbytes);
	// Convert str[] to byte[]
	// printf("Data Array\n");
	//BYTE* data = malloc(sizeof(BYTE)*nbytes);
	//size_t data_size = nbytes;
	//int i =0;
	//while(i<data_size){
	//	data[i] = (BYTE)str[i];
	//	printf("data[%d]=%u\n", i, data[i]);
	//	i++;
	//}
	// Check if file path is passed as argument
	if(argc != 2){
		printf("Input file path is required\n");
		exit(-1);
	}
	// Open a file
	FILE *fp = NULL;
	int i;
	//fp = fopen("../../Inputfiles/medium1x.in", "r");
	fp = fopen(args[1], "r");
	size_t data_size = 0;
	BYTE* data = readFile(fp, &data_size);
	fclose(fp);
	printf("Data: %zu bytes\n", data_size);

	// Compress data array
	size_t compress_data_size;
	BYTE* compress_data = compress(data, data_size, &compress_data_size);
	/*i=0;
	while(i<compress_data_size){
		printf("compress_data[%d]=%u\n", i, compress_data[i]);
		i++;
	}*/
	printf("Compress Data: %zu bytes\n", compress_data_size);

	free(data);
	free(compress_data);
    return 0;
}
