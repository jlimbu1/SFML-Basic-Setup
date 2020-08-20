CC = g++
EXE = UpperCut.exe
CFLAGS= -std=c++11 -Wall -L./lib -I./include
LINKER_FLAGS = -luser32 -lshell32 -lkernel32 -lsfml-graphics -lsfml-window -lsfml-system
OBJS = main.o

SRC_DIR = ./src
SRC_FILES := $(wildcard $(SRC_DIR)/*.cpp)

.DEFAULT_GOAL := all

all: $(EXE)

$(EXE): $(OBJS)
	$(CC) $(CFLAGS) $^ -o $(EXE) $(LINKER_FLAGS)

%.o: $(SRC_DIR)/%.cpp $(SRC_DIR)/%.h
	$(CC) $(CFLAGS) -c $< $(LINKER_FLAGS)

main.o: $(SRC_DIR)/main.cpp
	$(CC) $(CFLAGS) -c $< $(LINKER_FLAGS)

.PHONY : clean
clean:
	del /Q /S *.o $(EXE)