#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char** argv){
    int min = atoi(argv[1]);
    int max = atoi(argv[2]);

    /** 
     * To create a more random seed, you could use the clock time AND the 
     * PID (process ID) of the code running in linux
    */
    srand(time(NULL));

    printf("%d\n", (rand() % max) + min);

    return 0;
}