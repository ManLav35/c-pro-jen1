ABC.exe: main.o fact1.o
	gcc -o ABC.exe main.o fact1.o

main.o: main.c
	gcc -c main.c

fact1.o: fact1.c
	gcc -c fact1.c

