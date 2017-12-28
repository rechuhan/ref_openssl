#ifndef __REF_COMMON_H_
#define __REF_COMMON_H_

#include <bn_lcl.h>
#include <aes.h>
#include <modes_lcl.h>
#include <crypto.h>
#include <bn.h>
#include <ec.h>
#include <obj_mac.h>
#include <ossl_typ.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <stdlib.h>
#include <svdpi.h>

BIGNUM* svOpenArrayHandle2BN(const svOpenArrayHandle sv_open_array_handle);
void print_BN(const BIGNUM * bignum_handle);

#endif
