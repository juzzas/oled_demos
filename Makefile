CC=zcc
AS=zcc
TARGET=+rc2014
SUBTYPE=basic
VERBOSITY=-vn


PRAGMA_FILE=zpragma.inc

C_OPT_FLAGS=-SO3 --max-allocs-per-node200000

CFLAGS=$(TARGET) $(VERBOSITY) -c $(C_OPT_FLAGS) -compiler sdcc -clib=sdcc_iy -pragma-include:$(PRAGMA_FILE) -Iliboled/c/include/sdcc
LDFLAGS=$(TARGET) $(VERBOSITY) -clib=sdcc_iy -pragma-include:$(PRAGMA_FILE) 
ASFLAGS=$(TARGET) $(VERBOSITY)



EXEC=oled
EXEC_FONT_DEMO=font_demo
LIB_OLED=liboled


OBJECTS = main.o 
FONT_DEMO_OBJECTS = font.o

%.o: %.c $(PRAGMA_FILE)
	$(CC) $(CFLAGS) --list -o $@ $<

%.o: %.asm
	$(AS) $(ASFLAGS) --list -c -o $@ $<

all: $(EXEC) $(EXEC_FONT_DEMO)

$(LIB_OLED): liboled/liboled_sdcc_iy.lst
	$(AS) $(ASFLAGS) -v -x --list -o $@ @liboled/liboled_sdcc_iy.lst

$(EXEC): $(OBJECTS) $(LIB_OLED)
	$(CC) $(LDFLAGS) --list -m -subtype=$(SUBTYPE) $(OBJECTS) -lliboled -lm -o $@ -create-app

$(EXEC_FONT_DEMO): $(FONT_DEMO_OBJECTS) $(LIB_OLED)
	$(CC) $(LDFLAGS) --list -m -subtype=$(SUBTYPE) $(FONT_DEMO_OBJECTS) -lliboled -lm -o $@ -create-app

.PHONY: clean
clean:
	rm -f *.o *.bin *.tap *.map *.lib *.lis zcc_opt.def *~ /tmp/tmpXX* *.ihx
