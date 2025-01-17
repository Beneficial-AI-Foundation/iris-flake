##
# Project Title
#
# @file
# @version 0.1
all: src/example
.PHONY: all

src/example: src/example.c
	gcc -Wno-attributes -o $@ $<

clean:
	rm -f src/example
.PHONY: clean
# end
