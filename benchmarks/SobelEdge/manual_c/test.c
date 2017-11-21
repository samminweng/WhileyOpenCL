#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
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
    BYTE* a = malloc(size*sizeof(BYTE));
    if (a == NULL){
        printf("Insufficient Memory\n");
        exit(1);
    }
    // Initialise array 'a'
    int i;
    for(i=0;i<size;i++){
        a[i] = 0;
    }

    int x;
    for(x=0;x < n;x++){
        int p = x;
        int y;
        for(y=0;y<m;y++){
            a[p] = 7;
            p = p + n;
        }
    }
    printf("a[0]=%d\n",a[0]);
    free(a);
    return 0;
}
