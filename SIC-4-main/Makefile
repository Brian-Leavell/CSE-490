# Files that are a part of the processor design
DESIGN := $(wildcard design/*.v)
# Files that are a part of each testbench
TESTBENCH := $(wildcard test/*.v)
# Files that will be used for running tests, generated from each TESTBENCH
TESTEXE = $(TESTBENCH:.v=.out)

#Files of .vcd type
SIGNALS = $(wildcard *.vcd)

all: build

build: $(TESTEXE)

%.out: $(DESIGN) %.v
	iverilog -t vvp $^ -o $*.out

# TODO
test: build
	for file in $(TESTEXE); do \
		vvp $$file	; \
	done


wave: test
	for file in $(SIGNALS); do \
		gtkwave $$file & \
	done


make final:
	make test && make wave

submit: clean
	zip cse490_project1.zip $(TESTBENCH) $(DESIGN)

clean:
	rm -f test/*.out test/*.vcd $(SIGNALS)

.PHONY:
	all build test submit clean
