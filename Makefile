# Makefile for a Qt-based C++ project

# Qt configuration
QMAKE = /bin/qmake

# Target naem
TARGET = icp24

# Source files
SRC_PATH = src
INC_PATH = include

SOURCES = $(SRC_PATH)/*.cpp
HEADERS = $(INC_PATH)/*.h
PROJ    = $(TARGET).pro
OBJECTS = $(SOURCES:.cpp=.o) # mby useless idk

BUILD_DIR = build

# Default target
build: clean
	mkdir $(BUILD_DIR)
	cp $(SOURCES) $(HEADERS) $(PROJ) $(BUILD_DIR)/

all: build
	cd build && $(QMAKE) $(PROJ) && $(MAKE) && cp $(TARGET) ../

run: all
	./$(TARGET)

clean: 
	rm -rf $(BUILD_DIR)/
	rm -rf $(TARGET)

.PHONY: run clean
