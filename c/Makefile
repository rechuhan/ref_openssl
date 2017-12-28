
include var.mk

SUB_DIR := $(wildcard src/*)

SUB_SRC := $(wildcard src/*/*.c)

SUB_DEP := $(wildcard src/*/*.d)

SUB_OBJ := $(SUB_SRC:.c=.o)

SUB_MAKE := $(wildcard src/aes/Makefile)

all:clean_obj $(LIB_OBJ)

clean_obj:
	@rm -f $(LIB_OBJ)

$(LIB_OBJ):
	@for dir in $(SUB_DIR); do $(MAKE) -C $$dir ;done;
	$(CC) -shared -fPIC -o $@ $(SUB_OBJ) $(SLIB_FLAG);

.PHONY : debug test clean print

debug:
	@echo $(SUB_OBJ);\
	echo $(SUB_MAKE);

clean:
	@rm -rf $(SUB_DEP);\
	rm -rf $(LIB_OBJ);\
	for dir in $(SUB_DIR); do $(MAKE) clean -C $$dir ;done;

test:$(SUB_MAKE)
	@for dir in $(SUB_DIR); do $(MAKE) test -C $$dir ;done;

print:
	echo $(OPENSSL_MAIN_HOME)

