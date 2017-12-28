#ifndef __REF_COMMON_C_
#define __REF_COMMON_C_
#include <ref_common.h>

BIGNUM* svOpenArrayHandle2BN(const svOpenArrayHandle sv_open_array_handle) {
    int success;
    BIGNUM *out = NULL;
    unsigned char *in_handle = (unsigned char*)svGetArrayPtr(sv_open_array_handle);
    if(in_handle == NULL) {
        printf("in_handle is NULL\n");
    }
    else {
        printf("in_handle is not NULL\n");
    }
    success=BN_hex2bn(&out, in_handle);
    printf("success is %0d\n", success);
    if(success) {
        print_BN(out);
    }
    return out; 
}

void print_BN(const BIGNUM *bignum_handle) {
    int i;
    for(i = 0; i < bignum_handle->dmax; i++) { 
        printf("d[%0d] is %0x\n", *(bignum_handle->d+1));
    }
    printf("top is %d\n", bignum_handle->top);
    printf("dmax is %d\n", bignum_handle->dmax);
    printf("neg is %d\n", bignum_handle->neg);
    printf("flags is %d\n", bignum_handle->flags);
}

#endif
