SRCS = alu.v
SRCS += eab.v
SRCS += regfile.v
SRCS += marmux.v
SRCS += pcl.v
SRCS += irl.v
SRCS += nzpl.v
SRCS += shf.v
SRCS += memory.v
SRCS += datapath.v
SRCS += control.v
SRCS += lc3.v
SRCS += lc3_tb.v

all: computer

testasm:
	lc3as test.asm
	python ./vformat.py test.obj

test: computer
	vvp lc3.vvp

view: test
	gtkwave dump.vcd &>/dev/null &

computer:
	iverilog -g2005 -Wall -o lc3.vvp $(SRCS)

clean:
	rm -f lc3.vvp
	rm -f dump.vcd

.PHONY: clean
