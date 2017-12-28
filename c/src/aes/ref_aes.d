ref_aes.o ref_aes.d: ref_aes.c \
 /home/zhaiweifeng/ref_openssl/c//src/aes/include/ref_aes.h \
 /home/zhaiweifeng/ref_openssl/c//openssl/build/include/openssl/aes.h \
 /home/zhaiweifeng/ref_openssl/c//openssl/build/include/openssl/opensslconf.h \
 /home/zhaiweifeng/ref_openssl/c//openssl/openssl-1.0.2n/crypto/aes/aes_locl.h \
 /home/zhaiweifeng/ref_openssl/c//openssl/build/include/openssl/e_os2.h \
 /home/zhaiweifeng/eda_tools/synopsys/I-2014.03/include/svdpi.h
	 gcc -g -I /home/zhaiweifeng/ref_openssl/c//openssl/build/include/openssl -I /home/zhaiweifeng/ref_openssl/c//openssl/build/include -I /home/zhaiweifeng/eda_tools/synopsys/I-2014.03/include -I /home/zhaiweifeng/ref_openssl/c//openssl/openssl-1.0.2n/include -I /home/zhaiweifeng/ref_openssl/c//openssl/openssl-1.0.2n/crypto/include -I /home/zhaiweifeng/ref_openssl/c//openssl/openssl-1.0.2n/crypto/bn -I /home/zhaiweifeng/ref_openssl/c//openssl/openssl-1.0.2n/crypto/mode -I /home/zhaiweifeng/ref_openssl/c//openssl/openssl-1.0.2n -I /home/zhaiweifeng/ref_openssl/c//src/aes/include -I /home/zhaiweifeng/ref_openssl/c//openssl/openssl-1.0.2n/crypto/aes  -fPIC -c $< -o $*.o
