include ../../var.mk

BLOCK_HOME=$(OPENSSL_MAIN_HOME)/src/aes

INC_FLAG+=-I $(BLOCK_HOME)/include
INC_FLAG+=-I $(OPENSSL_SRC_HOME)/crypto/aes

SOURCE := $(wildcard *.c)

DEPEND := $(SOURCE:.c=.d)

OBJECT := $(SOURCE:.c=.o)

all:$(OBJECT)

%.d:%.c
	@set -e;\
	rm -f $@;\
	$(CC) -MM $(INC_FLAG)  $< > $@.$$$$;\
	perl -n -e 's/(\w+)\.o\:/$$1\.o $@\:/;print $$_;' $@.$$$$ >| $@;\
	perl -e 'print "\t $(CC) $(INC_FLAG)  -fPIC -c \$$\< -o \$$\*\.o\n"' >> $@;\
	rm -f $@.$$$$;

sinclude $(SOURCE:.c=.d)

.PHONY: debug clean

debug :
	@echo $(SOURCE);
	echo $(DEPEND);

clean:
	@rm -f *.so *.o *.d *.d.*



