#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
typedef uint8_t BYTE;
int main(int argc, char *argv[]){
    if(argc<=1) {
       printf("Argument is needed\n");
       exit(1);
    }
    int n = atoi(argv[1]);
    printf("n = %d\n", n);
    int m = 16384;
    int size = n*m;
    clock_t begin = clock();
    BYTE* a = malloc(size*sizeof(BYTE));
    clock_t end = clock();
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    printf("Running Time of malloc: %f second\n", time_spent);
    if (a == NULL){
        printf("Insufficient Memory\n");
        exit(1);
    }
    begin = clock();
    // Initialise array 'a' one-by-one, which is fast
    int i;
    for(i=0;i<size;i++){
        a[i] = 0;
    }
    end = clock();
    time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    printf("Running Time of one-by-one update: %f second\n", time_spent);
    begin = clock();
    // Initialize array 'a' a jump of 'n'
    int x;
    for(x=0;x < n;x++){
        int p = x;
        int y;
        for(y=0;y<m;y++){
            a[p] = 7;
            p = p + n;
        }
    }
    end = clock();
    time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    printf("Running Time of jump update: %f second\n", time_spent);
    printf("a[0]=%d\n",a[0]);
    begin = clock();
    free(a);
    end = clock();
    time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    printf("Running Time of free array: %f second\n", time_spent);
    return 0;
}
