#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
// Structure
typedef int64_t nat;
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

BYTE* decompress(BYTE* data, size_t data_size, size_t* _size){
	BYTE* output = NULL;
	size_t output_size=0;
	nat pos = 0;
	BYTE* tmp = NULL;
	size_t tmp_size = 0;
	while ((pos+1) < data_size){
		BYTE header = data[pos];
		BYTE item = data[pos+1];
        pos = pos + 2;
		if (header == 0){
			BYTE* tmp = append(output, output_size, item, &tmp_size);
			// Free output array because it is not over-written by tmp
			if(output != NULL){
				free(output);
			}
			output = tmp;
			output_size = tmp_size;
		}else{
			int offset = (int)header;
            int len = (int)item;
            int start = output_size - offset;
            int i = start;
            while (i < (start+len)){
				// Get byte from output array
                item = output[i];
                //sys.out.println(item)
                tmp = append(output, output_size, item, &tmp_size);
				if(output != NULL){
					free(output);// Free output array
				}
				output = tmp;
				output_size = tmp_size;
                i = i + 1;
			}
		}
	}
	*_size = output_size;
	return output;
}

// Decompress the LZ77-compressed file
int main(int argc, char** args){
	// Check if file path is passed as argument
	if(argc != 2){
		printf("Input file path is required\n");
		exit(-1);
	}

	// Open a file
	FILE *fp = NULL;
	int i = 0;
	//fp = fopen("../../Outputfiles/medium1x.dat", "r");
	fp = fopen(args[1], "r");
	if(!fp){
		printf("File does not exit\n");
		exit(-1);
	}
	size_t data_size = 0;
	BYTE* data = readFile(fp, &data_size);
	fclose(fp);
	printf("Data: %zu bytes\n", data_size);

	// Decompress compressed data array
	size_t decompress_data_size;
	BYTE* decompress_data = decompress(data, data_size, &decompress_data_size);
	i=0;
	while(i<decompress_data_size){
		char c = decompress_data[i];
		printf("%c", c);
		i++;
	}
	printf("\nDecompress Data: %zu bytes\n", decompress_data_size);
	free(data);
	free(decompress_data);
    return 0;
}
