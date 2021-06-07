/* SeaShell.c */

#include <time.h>
#include <stdio.h>

extern int  myAnswer(void);

int testHarness( void ) {
	int resultCode = 0;

    printf( "The answer to everything is %d\n\n", myAnswer()  );
    
	return resultCode;
} /* end testHarness()    -    - */

void reportTime(void) {
    time_t timeStructure;
    time( &timeStructure );
	char *s = ctime( &timeStructure );
	puts( s );
}  /* end reportTime()    -    - */

int main(void ) {
	int exitCode = -99;
    reportTime();

	exitCode = testHarness( );

    reportTime();
	return exitCode;
} /* end main()    -    - */
