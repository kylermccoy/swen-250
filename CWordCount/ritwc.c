#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>

#define FALSE (0)
#define TRUE  (1)

int main() {
	int tot_chars = 0 ;	/* total characters */
	int tot_lines = 0 ;	/* total lines */
	int tot_words = 0 ;	/* total words */
		
	int isWord = 0 ;
	int ch ;
	for ( ch=getchar() ; ch != EOF ; ch=getchar() ) {
		tot_chars++ ;
		if (ch == '\n') {
			tot_lines++ ;
		}		
		if (ch != ' ' && ch != '\n') {
			isWord = 1 ;
		}
		if (isspace(ch) && isWord == 1) {
			tot_words++ ;
			isWord = 0;
		}
	}
	
	printf("\t%d\t%d\t%d\n", tot_lines, tot_words, tot_chars) ;
	
	return 0;
}
