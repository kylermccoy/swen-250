/*
 * Implementation of the read_data module.
 *
 * See read_data.h for a description of the read_data function's
 * specification.
 *
 * Note that the parameter declarations in this module must be
 * compatible with those in the read_data.h header file.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "read_data.h"

// Reads the three fields from lines such as W$1349$1.414$ into
// local variables using getchar().
// Converts the two numeric fields to numbers using atoi for the
// integer fields and atof for the double.
// Using a correctly defined set of parameters (use pointers) pass
// those values back to the program that called this function.
void read_data( char *cp, int *ip, double *dp ) {
	/* your declarations and statements REPLACE this comment */
	int ch ;
	for ( ch=getchar() ; ch != '$' && ch != EOF ; ch=getchar() ) {
		*cp = ch ;
	}
	int MAX_CHARS = 25 ;
	char int_line[ MAX_CHARS + 1 ] ;
	
}
