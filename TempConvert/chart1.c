#include <stdlib.h>
#include <stdio.h>

int main(){
	int fahren = 0;
	int cel;
	
	printf( "Fahrenheit - Celsius\n" );

	while( fahren <= 300 ){
		cel = (5.0/9.0)* (fahren-32);
		printf("\t%d\t", fahren);
		printf("%d\n", cel);
		fahren = fahren + 20;
	}
	return 0;
}
		
