// unit_tests student additions
// Larry L. Kiser Oct. 22, 2015

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <unistd.h>

#include "analysis.h"
#include "unit_tests_analysis.h"
#include "unit_tests.h"

//////////////////////////////////////////////////////////////////////////
// Begin unit tests //////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

// do the unit tests
// returns the number of failed tests.
int test_student()
{
	int passcount = 0 ;
	int failcount = 0 ;
	struct linked_list list1 ;		// list list pointers for one list
	
	// Initialize local stack data
	memset( &list1, 0, sizeof( list1 ) ) ;		// set all pointers to NULL (zero)
	
	printf( "\n========= student generated tests on MLK excerpt ===============================\n" ) ;
	int result = read_file( &list1, "MLK_dream_excerpt.txt" ) ;
	assert( result == 113,
		"1 read_file processing MLK_dream_excerpt. Expect word count of 113 returned but got %d.", result )
		? passcount++ : failcount++ ;

	// Add a test to verify that the word "day" is used three times in the list.
	result = find_word(&list1, "day") ;
	int count = list1.p_current->one_word.word_count ;
	assert( count==3,
		"2 find_word searched for \"day\". Expect word count of 3 but received %d.", count )
		? passcount++ : failcount++ ;

	// Add a test to verify that the word AFTER the word "have" is the word "heat".
	result = find_word(&list1,"have") ;
	struct word_entry test = get_next_word(&list1) ;
	assert( strcmp(test.unique_word, "heat")==0,
		"3 get_next_word searched for the word after \"have\". Expect \"heat\" but received %s.", test.unique_word)
		? passcount++ : failcount++ ;

	// Add a test to verify that the last word in the list is "with"
	test = get_last_word(&list1) ;
	assert( strcmp(test.unique_word, "with")==0 ,
		"4 get_last_word searched for the last word in the list. Expect \"with\" but received %s.", test.unique_word)
		? passcount++ : failcount++ ;
	
	// Add a test to verify that the next to the last word is "will"	
	test = get_prev_word(&list1) ;
	assert( strcmp(test.unique_word, "will")==0 ,
		"5 get_prev_word searched for the second to last word in the list. Expect \"will\" but received %s.", test.unique_word)
		? passcount++ : failcount++ ;

	result = clear_linked_list( &list1 ) ;
	assert( result == 62,
		"6 clear linked list expected to remove 62 entries but got %d.", result )
		? passcount++ : failcount++ ;

	printf( "\nSummary of analysis unit tests:\n%d tests passed\n%d tests failed\n\n", passcount, failcount ) ;
	
	return failcount ;
}
