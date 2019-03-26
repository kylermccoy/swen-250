
/* linked list functions for dynamic strings
*/


typedef struct node {
	char* name;
	struct node *pNext;
}node;

node *pHead; //Globally accessible to lists

/************************************************************
 push - add new node at beginning of list
 ************************************************************/
void push(char *name);

/************************************************************
 pop - delete node at beginning of non-empty list and return its data
 ************************************************************/
char* pop();

/************************************************************
 reverse_list - reverse the order of the list and update the head pointer
 ************************************************************/
void reverse_list();

/************************************************************
 printList - print linked list as:
 ************************************************************/
void print_list();

/***********************************************************
 clear - pop all nodes from the list
**********************************************************/
void clear();

