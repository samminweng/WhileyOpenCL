#include "Util.h"

// Append a string to another string, and return the result string
// This function refers to whiley.lang.Array.append(int[] lhs, int[] rhs) -> int[]
// No changes to lhs and rhs arrays
int64_t* Array_Append(_DECL_1DARRAY_PARAM(lhs), _DECL_1DARRAY_PARAM(rhs), _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
// Convert an integer to a string (an array of integers)
int64_t* Int_toString(int64_t item, _DECL_1DARRAYSIZE_PARAM_CALLBYREFERENCE);
// Create a file pointer for a writer
FILE* Writer(int64_t* arr, size_t arr_size);
// Write byte array to a file
void writeAll(FILE *file, BYTE* arr, size_t arr_size);
// Create file pointer to read a file
FILE* Reader(int64_t* arr, size_t arr_size);
// Convert an array of bytes to an array of int64_t
int64_t* fromBytes(BYTE* arr, size_t arr_size);
// Read the contents of a file as a byte array
BYTE* readAll(FILE *file, size_t* _size);
