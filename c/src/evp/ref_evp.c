#ifndef __REF_EVP_C__
#define __REF_EVP_C__
#include <ref_evp.h>

void ref_evp_cipher(
svOpenArrayHandle out,
const svOpenArrayHandle in,
const svOpenArrayHandle key,
int enc) {
//int i;
unsigned char *in_ptr = (unsigned char*)svGetArrayPtr(in);
int in_len = svSizeOfArray(in);
//for(i=0;i<in_len;i++) printf("in_ptr[%0d]:0x%0x\n",i,*(in_ptr+i));
unsigned char *out_ptr = (unsigned char*)svGetArrayPtr(out);
int out_len;
unsigned char *key_ptr = (unsigned char*)svGetArrayPtr(key);
//int key_len = svSizeOfArray(key);
//for(i=0;i<key_len;i++) printf("key_ptr[%0d]:0x%0x\n",i,*(key_ptr+i));
//printf("enc:%0d\n",enc);

EVP_CIPHER_CTX *ctx;
ctx = EVP_CIPHER_CTX_new();
EVP_CipherInit_ex(ctx, EVP_aes_128_ecb(), NULL, key_ptr, NULL, enc);
EVP_CipherUpdate(ctx, out_ptr, &out_len, in_ptr, in_len);
//EVP_CipherFinal_ex(ctx, out_ptr, &out_len);
EVP_CIPHER_CTX_free(ctx);

//printf("in_len:%0d\n",in_len);
//printf("out_len:%0d\n",out_len);
//for(i=0;i<out_len;i++) printf("out_ptr[%0d]:0x%0x\n",i,*(out_ptr+i));

}

#endif

