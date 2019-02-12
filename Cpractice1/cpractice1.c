// C (no pointers) Practice Practicum
// SWEN-250
// Larry Kiser February 9, 2016
// Larry Kiser update Sept 21, 2017 cleanup and work on OpenBSD

#include <stdlib.h>
#include <stdio.h>
#include "cpractice1.h"
#include "unit_tests.h"


// Returns the index position of the first letter found starting at mystring[ start_index ].
// 1. If mystring[ start_index ] is a letter it returns the value of start_index.
// 2. If mystring[ start_index ] is a space then it moves to the next position
//    until it either sees the end of the string or it sees a letter.
//    If no letter is found it returns a -1 to indicate no letter found.
// 3. If mystring[ start_index ] is an end of string then return -1.
// You are NOT allowed to use any library functions to do this.
// You can assume that the string only contains letters and spaces.
// Hint: Use this assumption to simplify your code!
// You may not use functions like isalpha or strlen or toupper.
int skip_spaces( char mystring[], int start_index )
{
	while(mystring[start_index] != '\0') {	
		if((mystring[start_index]>='a'&&mystring[start_index]<='z') || (mystring[start_index]>='A'&&mystring[start_index]<='Z')) {
			return start_index ;
		}else{
			start_index++ ;
		}
	}
	return -1 ;	
}
// Returns the index position of the first letter of the next word starting at mystring[ start_index ].
// 1. If mystring[ start_index ] is a letter it searches for the first space.
//    If it finds a space it skips spaces searching for a letter.
//    If a letter is found it returns this letter's index position since this is the beginning of the next word.
//    If no letter is found it returns a -1.
// 2. If mystring[ start_index ] is a space it searches until it either sees
//    the end of the string or it sees a letter.
//    If no letter is found it returns a -1.
// 3. If mystring[ start_index ] is an end of string return a -1.
// You are NOT allowed to use any library functions to do this.
// You can assume that the string only contains letters and spaces.
// HINT: Use skip_spaces to simplify this function.
// You may not use functions like isalpha or strlen or toupper.
int find_next_word( char mystring[], int start_index )
{
	if (mystring[start_index] == '\0') {
		return -1 ;
	}
	if((mystring[start_index]>='a'&&mystring[start_index]<='z') || (mystring[start_index]>='A'&&mystring[start_index]<='Z')) {
		while(mystring[start_index] != '\0') {
			if((mystring[start_index]>='a'&&mystring[start_index]<='z') || (mystring[start_index]>='A'&&mystring[start_index]<='Z')) {
	                        start_index++ ;
        	        }else{
                	        return skip_spaces(mystring, start_index) ;
                	}
		}
	}
	else{
		return skip_spaces(mystring, start_index) ;
	}
	return -1 ;
}

// If mystring[ index ] is a lower case letter this function replaces
// that letter in the array with the corresponding upper case letter.
// 1. If mystring[ index ] is an upper case letter, a space, or an end of string it makes no change.
//    This function returns 0 when it makes no change.
// 2. This function returns a 1 only when it changes a lower case letter to an upper case letter.
// You are NOT allowed to use any library functions to do this.
// HINTS: upper case letters are decimal 65 through decimal 90.
// lower case letters are decimal 97 through decimal 122.
// You may not use functions like isalpha or strlen or toupper.
int change_to_upper( char mystring[], int index )
{
	if( (mystring[index] >= 'A' && mystring[index] <= 'Z') || (mystring[index] == ' ') || (mystring[index] == '\0') ) {
		return 0 ;
	}
	else{
		mystring[index]= (char)((int)(mystring[index]) - 32) ;
		return 1 ;
	}
	return -1 ; 
}

// This function finds the first letter of every word in mystring[]
// and makes sure that is is a capital letter.
// If it is a lower case letter it converts it to upper case (just the first letter in the word).
// It returns a count of the number of letters it actually converted to upper case.
// If mystring[] is an empty string it returns 0.
// Hint: First skip leading spaces. Then loop while on a word, capitialize the word,
//       and then find the next word.
// You may not use functions like isalpha or strlen or toupper.
int capitalize_all_words( char mystring[] )
{
    return -1 ;
}

// This function is implemented incorrectly. You need to correct it.
// This function is supposed to return 0 if the two integers passed to
// this function are equal. If first is larger than second then return 1.
// If first is less than second then return -1.
// Be sure to eliminate all warnings that for this code!
int fix_bad_code( int first, int second )
{
	if ( first = second )
		return 0 ;
	else if ( first > second )
		return 0 ;
	else if ( second < first )
		return -1 ;
}

// Run the unit tests only
int main( int argc, char *argv[] ) {

    return test() ;
}
