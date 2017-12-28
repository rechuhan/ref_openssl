#ifndef __REF_AES_H_
#define __REF_AES_H_

//#include <bn_lcl.h>
//#include <aes.h>
//#include <modes_lcl.h>
//#include <crypto.h>
//#include <bn.h>
//#include <ec.h>
//#include <obj_mac.h>
//#include <ossl_typ.h>
//#include <stdio.h>
//#include <string.h>
//#include <assert.h>
//#include <stdlib.h>

#include <aes.h>
#include <aes_locl.h>
#include <svdpi.h>

void aes_ecb_crypto_buf(const svOpenArrayHandle in_buf, svOpenArrayHandle out_buf, const int bits, const svOpenArrayHandle key_buf, const int mode);

#endif
