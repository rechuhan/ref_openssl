export MAKEFILE_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
CRYPTO_REF_C=$(MAKEFILE_DIR)/../../c
CRYPTO_REF_SV=$(MAKEFILE_DIR)/../../sv
CRYPTO_REF_WORK_DIR=$(CRYPTO_REF_SV)/test/work
MAKE=make
TESTNAME?=all
LENGTH?=128
ARGM?=AES_ECB
all: compile_c compile run clean

compile_c:
	@$(MAKE) -C $(CRYPTO_REF_C) clean;\
	$(MAKE) -C $(CRYPTO_REF_C) DEBUG=1;

compile:
	@mkdir -p $(CRYPTO_REF_WORK_DIR);\
	cd $(CRYPTO_REF_WORK_DIR);\
	vlogan -sverilog +define+$(ARGM) +incdir+$(CRYPTO_REF_SV)/test $(CRYPTO_REF_SV)/test/../crypto_dpi_pkg.sv $(CRYPTO_REF_SV)/test/crypto_dpi_test.sv -full64 -notice;\
	vcs crypto_dpi_test -full64 -notice;\
	cd $(CRYPTO_REF_SV)/test

run:
	cd $(CRYPTO_REF_WORK_DIR);\
	./simv +$(TESTNAME) +LENGTH=$(LENGTH) -sv_lib $(CRYPTO_REF_C)/lib/libssldpi +vcs+lic+wait;\
	cd $(CRYPTO_REF_SV)/test

.PHONY : clean

clean:
	rm -rf $(CRYPTO_REF_WORK_DIR)

