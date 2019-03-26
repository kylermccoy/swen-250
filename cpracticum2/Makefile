# Makefile for linked list 

linked_strings: linked_strings.o main.o 
	gcc -g -o linked_strings linked_strings.o main.o 

linked_strings.o: linked_strings.h linked_strings.c
	gcc -g -c linked_strings.c

main.o: linked_strings.h main.c
	gcc -g -c main.c

clean:
	rm -f *.o link_strings
