/*
 * Driver program for the activity.
 * 	1. Declares local variables for the character, integer, and
 * 	   double precision values returned by read_data.
 * 	2. Calls read_data with pointers to the variables so that
 * 	   the values read can be returned.
 * 	3. On return, prints the character, integer, and double
 * 	   precision number using the following format string for
 * 	   printf:
 * 	   	"Character %c Integer %d Floating point %.4f\n"
 * 	   Note: you must also, of course, provide the values to
 * 	   be printed.
 *      4. Return a 0 to the operating system.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "read_data.h"

int main() {
	/* your declarations and statements REPLACE this comment */

	char character ;
	int integer ;
	double f_point ;

	char *cp = &character ;
	int *ip = &integer ;
	double *dp = &f_point ;

	read_data( cp, ip, dp ) ;

	printf("Character %c Integer %d Floating point %.4f\n", character, integer, f_point) 
;
	
	return 0 ;
}
