CPPC = g++
CFLAGS = -std=c++20 -Wall -Werror
WORKINGDIR := $(shell basename `pwd`)
BUILD=build
LIB=lib
SRC=src
TESTS=tests
NUM_TESTS=10000

.PHONY: all clean build lib

check: main_testing
	./main_testing $(NUM_TESTS)

$(BUILD)/lsm.o: $(SRC)/lsm.cpp build
	$(CPPC) $(CFLAGS) -c $< -o $@

$(BUILD)/memtable.o: $(SRC)/memtable.cpp build
	$(CPPC) $(CFLAGS) -c $< -o $@

$(BUILD)/sstable.o: $(SRC)/sstable.cpp build
	$(CPPC) $(CFLAGS) -c $< -o $@

$(BUILD)/write_ahead_log.o: $(SRC)/write_ahead_log.cpp build
	$(CPPC) $(CFLAGS) -c $< -o $@

$(LIB)/lsmlib.a: $(BUILD)/lsm.o $(BUILD)/memtable.o $(BUILD)/sstable.o $(BUILD)/write_ahead_log.o lib
	ar rcs $@ $(BUILD)/*.o

# Create a static library for the implementation.
create_lib: $(LIB)/lsmlib.a

main_testing: $(TESTS)/main_testing.cpp $(LIB)/lsmlib.a
	$(CPPC) $^ -o $@

lib:
	mkdir -p $(LIB)

build:
	mkdir -p $(BUILD)

clean:
	rm -rf $(BUILD)/ $(LIB) main_testing
