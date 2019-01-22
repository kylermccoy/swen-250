#include <stdlib.h>
#include <stdio.h>

int main(){
	int fahren = 0;
	int cel = 0;
	
	printf( "Fahrenheit - Celsius\n" );

	while( fahren <= 300 ){
		cel = ((5/9) * ((fahren) - 32));
		printf("\t%d\t%d\n", fahren, cel);
		fahren = fahren + 20;
	}
	return 0;
}
		
