#ifndef __REF_EVP_H__
#define __REF_EVP_H__

#include <string.h>
#include <evp.h>
#include <svdpi.h>

void ref_evp_cipher(svOpenArrayHandle out, const svOpenArrayHandle in, const svOpenArrayHandle key, int enc);

#endif

