CC = g++

CFLAGS = -Wall -Wextra -pedantic -Werror -Wno-write-strings
CFLAGS_LESSER = -Wall -Werror -Wno-write-strings
CVERSION = -std=c++17

GUI_OBJS = gui/src/main.c assembler/assembler.cpp assembler/opcodes.cpp assembler/symbols.cpp file/file.cpp gui/src/errorGui.c converter/converter.cpp simulator/babySim.cpp
GUI_FLAGS=$(DEBUG) $(OPT) $(WARN) -pthread -pipe
GTKLIB=`pkg-config --cflags --libs gtk+-3.0`

all: assembler simulator gui

assembler: assembler/main.cpp assembler/assembler.cpp assembler/opcodes.cpp assembler/symbols.cpp file/file.cpp error/error.cpp converter/converter.cpp
	$(CC) $(CVERSION) $(CFLAGS_LESSER) -o assembler.o assembler/main.cpp assembler/assembler.cpp assembler/opcodes.cpp assembler/symbols.cpp file/file.cpp error/error.cpp converter/converter.cpp

simulator: simulator/main.cpp simulator/babySim.cpp file/file.cpp error/error.cpp converter/converter.cpp
	$(CC) $(CVERSION) $(CFLAGS_LESSER) -o simulator.o simulator/main.cpp simulator/babySim.cpp file/file.cpp error/error.cpp converter/converter.cpp

gui: $(GUI_OBJS)
	$(CC) $(GUI_FLAGS) -rdynamic -g -o gui.o $(GUI_OBJS) $(GTKLIB)

clean: 
	-rm $(objects) *.o

 
