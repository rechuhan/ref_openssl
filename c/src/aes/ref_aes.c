#ifndef __RES_AES_C__
#define __RES_AES_C__
#include <ref_aes.h>

void aes_ecb_crypto_buf(const svOpenArrayHandle in_buf, svOpenArrayHandle out_buf, const int bits, const svOpenArrayHandle key_buf, const int mode) {
    AES_KEY aes;
    unsigned char *in_buf_c = (unsigned char*)svGetArrayPtr(in_buf);
    unsigned char *out_buf_c = (unsigned char*)svGetArrayPtr(out_buf);
    unsigned char *key_buf_c = (unsigned char*)svGetArrayPtr(key_buf);
    int len = svSizeOfArray(in_buf);
    unsigned char *out = (unsigned char*)malloc(AES_BLOCK_SIZE);

    if(mode == AES_ENCRYPT) {
        AES_set_encrypt_key(key_buf_c, bits, &aes);
    }
    else {
        AES_set_decrypt_key(key_buf_c, bits, &aes);
    }

    while(len) {
        memset(out, 0, sizeof(out));
        AES_ecb_encrypt(in_buf_c, out, &aes, mode);
        memcpy(out_buf_c, out, AES_BLOCK_SIZE);
        len -= AES_BLOCK_SIZE;
        in_buf_c += AES_BLOCK_SIZE;
        out_buf_c += AES_BLOCK_SIZE;
    }
}

#endif
