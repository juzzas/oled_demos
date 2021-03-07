CC=zcc
AS=zcc
TARGET=+rc2014
SUBTYPE=basic
VERBOSITY=-vn


PRAGMA_FILE=zpragma.inc

C_OPT_FLAGS=-SO3 --max-allocs-per-node200000

CFLAGS=$(TARGET) $(VERBOSITY) -c $(C_OPT_FLAGS) -compiler sdcc -clib=sdcc_iy -pragma-include:$(PRAGMA_FILE)
LDFLAGS=$(TARGET) $(VERBOSITY) -clib=sdcc_iy -pragma-include:$(PRAGMA_FILE)
ASFLAGS=$(TARGET) $(VERBOSITY) -c


EXEC=oled
EXEC_OUTPUT=oled


OBJECTS = asm_oled_cmd.o asm_oled_data.o asm_oled_reset.o asm_oled_clear.o oled_init.o oled_clear.o pixel_test.o main.o 

%.o: %.c $(PRAGMA_FILE)
	$(CC) $(CFLAGS) -o $@ $<

%.o: %.asm
	$(AS) $(ASFLAGS) -o $@ $<

all : $(EXEC)

$(EXEC) : $(OBJECTS)
	 $(CC) $(LDFLAGS) --list -m -subtype=$(SUBTYPE) $(OBJECTS) $(COMMON) -lm -o $(EXEC_OUTPUT) -create-app

.PHONY: clean
clean:
	rm -f *.o *.bin *.tap *.map *.lis zcc_opt.def *~ /tmp/tmpXX* *.ihx
