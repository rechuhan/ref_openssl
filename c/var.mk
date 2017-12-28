
CC=gcc

MAKE=make

export OPENSSL_MAIN_HOME = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

OPENSSL_HOME=$(OPENSSL_MAIN_HOME)/openssl/build
OPENSSL_SRC_HOME=$(OPENSSL_MAIN_HOME)/openssl/openssl-1.0.2n

SLIB_FLAG=-Wl,--whole-archive $(OPENSSL_HOME)/lib/libssl.a $(OPENSSL_HOME)/lib/libcrypto.a -Wl,--no-whole-archive

INC_FLAG=-g -I $(OPENSSL_HOME)/include/openssl -I $(OPENSSL_HOME)/include -I $(VCS_HOME)/include -I $(OPENSSL_SRC_HOME)/include -I $(OPENSSL_SRC_HOME)/crypto/include -I $(OPENSSL_SRC_HOME)/crypto/bn -I $(OPENSSL_SRC_HOME)/crypto/mode -I $(OPENSSL_SRC_HOME)

LIB_OBJ=$(OPENSSL_MAIN_HOME)/lib/libssldpi.so

