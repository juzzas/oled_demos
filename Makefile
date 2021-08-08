#
# Copyright (c) 2021 Justin Skists.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.


ZCC=zcc
AS=zcc
#TARGET=+rc2014 -subtype=hbios
TARGET=+embedded -startup=0
VERBOSITY=-v
PRAGMA_FILE=zpragma.inc

C_OPT_FLAGS=-SO2 --max-allocs-per-node100000
CFLAGS=$(C_OPT_FLAGS) --list -m -compiler sdcc -clib=sdcc_iy -pragma-include:$(PRAGMA_FILE) -Iliboled/c/include/sdcc

LIB_OLED=liboled

DEMO_OBJECTS = demo.o
FONT_DEMO_OBJECTS = font.o
FONTXY_DEMO_OBJECTS = fontxy.o

.PHONY: clean all $(LIB_OLED)

all: oled_demo font_demo fontxy_demo clock_demo

$(LIB_OLED): liboled/liboled_sdcc_iy.lst
	$(ZCC) $(TARGET) $(VERBOSITY) -x --list -o $@ @liboled/liboled_sdcc_iy.lst

oled_demo: $(LIB_OLED) oled_demo.c
	$(ZCC) $(TARGET) $(VERBOSITY) $(CFLAGS) oled_demo.c -l$(LIB_OLED) -lm -o $@ -create-app

font_demo: $(LIB_OLED) font_demo.c
	$(ZCC) $(TARGET) $(VERBOSITY) $(CFLAGS) font_demo.c -l$(LIB_OLED) -lm -o $@ -create-app

fontxy_demo: $(LIB_OLED) fontxy_demo.c
	$(ZCC) $(TARGET) $(VERBOSITY) $(CFLAGS) fontxy_demo.c -l$(LIB_OLED) -lm -o $@ -create-app

clock_demo: $(LIB_OLED) clock_demo.c
	$(ZCC) $(TARGET) $(VERBOSITY) $(CFLAGS) clock_demo.c -l$(LIB_OLED) -lm -o $@ -create-app

oled_unittest: $(LIB_OLED)
	$(ZCC) $(TARGET) $(VERBOSITY) $(CFLAGS) @liboled/test/unittest_z80.lst -l$(LIB_OLED) -lm -o $@ -create-app

oled_hello: $(LIB_OLED) oled_hello.asm
	$(ZCC) $(TARGET) $(VERBOSITY) $(CFLAGS) oled_hello.asm -l$(LIB_OLED) -lm -o $@ -create-app

twinkle_demo: $(LIB_OLED) twinkle_demo.c
	$(ZCC) $(TARGET) $(VERBOSITY) $(CFLAGS) twinkle_demo.c -l$(LIB_OLED) -lm -o $@ -create-app

clean:
	rm -f *.o *.bin *.tap *.map *.lib *.lis zcc_opt.def *~ /tmp/tmpXX* *.ihx

