
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "linked_strings.h"
	


int main(){
	pHead = NULL;
	printf("Printing an empty list\n");
	print_list();

	printf("\nPushing Holmes. Should be: Holmes\n");
	push("Holmes");
	print_list();

	printf("\nPushing Sherlock. Should be: Sherlock Holmes\n");
	push("Sherlock");
	print_list();

	printf("\nPopping Sherlock. Should be: Holmes\n");
	char* sh = pop();
	free(sh);
	print_list();

	printf("\nPushing Arthur and Conan. Should be Arthur Conan Holmes\n");
	push("Conan");
	push("Arthur");
	print_list();

	printf("\nReverse list.  Should be Holmes Conan Arthur\n");
	reverse_list();
	print_list();

	printf("\nClearing. Should be empty.\n");
	clear();
	print_list();

	printf("\nPushing Five, Four, Three, Two, One.  Should see One Two Three Four Five\n");
	push("Five"); push("Four"); push("Three"); push("Two"); push("One");
	print_list();
	printf("\nNow reversing list\n");
	reverse_list();
	print_list();
	printf("\nClearing list again\n");
	clear();
	print_list();
	return 0;	
}
