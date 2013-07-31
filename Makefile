SRCS = alu.v
SRCS += eab.v
SRCS += regfile.v
SRCS += marmux.v
SRCS += pcl.v
SRCS += irl.v
SRCS += nzpl.v
SRCS += shf.v

all: computer

test: computer
	vvp lc3.vvp

view: test
	gtkwave lc3.vcd &>/dev/null

computer:
	iverilog -g2005 -Wall -o lc3.vvp $(SRCS)

clean:
	rm -f lc3.vvp
	rm -f lc3.vvp

.PHONY: clean
