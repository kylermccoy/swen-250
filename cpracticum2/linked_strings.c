
/* slinked - linked list functions
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>			// NOTE that we need to include the standard C string functions
#include "linked_strings.h"

/************************************************************
  push - add new node at beginning of list
 *	(1) allocate a new node of type struct node
 *	(2) allocate the space for the new string (name)
 *	(3) COPY the string passed as name to the string allocated in stuct node
 *	(4) the new node becomes the first node on the stack (head)
 ************************************************************/
void push(char *name) {

	/* YOUR CODE HERE */
	
}

/************************************************************
  pop - delete node at beginning of non-empty list and return its data
 *	(1) allocate the space needed in struct to be returned for the name being poped
 *	(2) COPY the name in node to the string in the struct being returned
 *	(3) point the head to be the next item on the stack
 *	(4) free() the memory used for the node
 ************************************************************/
char* pop() {

	/* YOUR CODE HERE */


	return NULL; //Just to allow compile; needs to be fixed
}

/************************************************************
  printList - print linked list space-separated as:

List: a b c

 ************************************************************/
void print_list() {
	printf("List:\n");

	/* YOUR CODE HERE */


}

/************************************************************
  clear - empties out the entire list
  (1) iterate over the list, calling pop
  (2) free() the string as well
 ***********************************************************/
void clear(){

	/* YOUR CODE HERE */


}


/************************************************************
  reverse - takes the incoming list (pHead is the head of the linked list),
   and REVERSE the order of the list.  No new memory should be allocate.
   Just reverse the list!  
  (1) Loop through the incoming list
  (2) change the pointers so that the navigation is reversed
  (3) update the pointer to the head of the REVERSED list
  e.g.
  Original list: (head)->a->b->c->d->NULL
  Reversed list: (head)->d->c->b->a->NULL
 ***********************************************************/
void reverse_list()
{
  node* current = pHead; //pHead declared in linked_strings.h
  node* next = NULL; 
  node* prev = NULL;
  /* YOUR CODE HERE */

 
}

