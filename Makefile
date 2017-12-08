CC=icpc
CFLAGS=-I. -O3 -g -std=c++11 -fopenmp -xhost  -Wall -Wextra -Wno-unused-parameter -Wwrite-strings -Wunused -Werror=declaration-after-statement -Werror=vla -Wstrict-prototypes -Wmissing-prototypes #-qopt-report=5
DEPS=oskar_grid_wproj.hpp oskar.hpp Makefile

OBJ=main.o oskar.o
LIBS=-lm


.PHONEY: all

all : main

main : $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)


%.o : %.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)


run : main
	./$< ../../data/oskar_grid_wproj_f_INPUT.dat ../../data/oskar_grid_wproj_f_OUTPUT_float.dat  
run1 : main
	./$< ../../data/oskar_grid_wproj_f_INPUT_EL30-EL56.dat ../../data/oskar_grid_wproj_f_OUTPUT_EL30-EL56.dat 
run2 : main
	./$< ../../data/oskar_grid_wproj_f_INPUT_EL56-EL82.dat ../../data/oskar_grid_wproj_f_OUTPUT_EL56-EL82.dat 
run3 : main
	./$< ../../data/oskar_grid_wproj_f_INPUT_EL82-EL70.dat ../../data/oskar_grid_wproj_f_OUTPUT_EL82-EL70.dat 

clean:
	rm -f main.o oskar.o main
