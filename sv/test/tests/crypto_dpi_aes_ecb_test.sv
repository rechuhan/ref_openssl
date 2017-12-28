`ifndef __CRYPTO_DPI_ECB_TEST_SV__
`define __CRYPTO_DPI_ECB_TEST_SV__
class crypto_dpi_aes_ecb_test extends crypto_dpi_test_case;
   function new(string name="aes_ecb_test");
      super.new(name);
   endfunction

   `define PLAINTEXT 128'h00112233445566778899aabbccddeeff
   `define KEY 128'h000102030405060708090a0b0c0d0e0f
   //`define PLAINTEXT 128'h1872ac8cd4aacc64eb4bfaf952a097e8
   //`define KEY 128'h99862f7881fb7803798e4774d022dc8d

   virtual function bit do_test();
      bit [127:0] plaintext = `PLAINTEXT;
      bit [127:0] key = `KEY;
      bit [127:0] encrypt_ciphertext = 0;
      bit [127:0] decrypto_plaintext = 0;


      int unsigned plaintext_byte[]=new[4];
      int unsigned key_byte[]=new[4];
      int unsigned encrypt_buf[],encrypt_buf_temp[];
      int unsigned decrypt_buf[],decrypt_buf_temp[];

      $display("crypto_dpi_aes_ecb_test: plaintext is 128'h%h", plaintext);
      $display("crypto_dpi_aes_ecb_test: key is 128'h%h", key);

      convert_128to32(plaintext_byte, plaintext);
      convert_128to32(key_byte, key);

      //foreach(plaintext_byte[i]) begin
      //   $display("crypto_dpi_aes_ecb_test: plaintext_byte[%0d] is %h",i, plaintext_byte[i]);
      //end
      //foreach(key_byte[i]) begin
      //   $display("crypto_dpi_aes_ecb_test: key_byte[%0d] is %h",i, key_byte[i]);
      //end
      crypto_dpi_aes_ecb_crypto_func(plaintext_byte, encrypt_buf, 128, key_byte, 1);//encrypt
      //foreach(encrypt_buf[i]) begin
      //   $display("crypto_dpi_aes_ecb_test: encrypt_buf[%0d] is %h",i, encrypt_buf[i]);
      //end

      encrypt_buf_temp = encrypt_buf;
      convert_32to128(encrypt_ciphertext, encrypt_buf_temp);
      $display("crypto_dpi_aes_ecb_test: encrypt_ciphertext is 128'h%h", encrypt_ciphertext);

      crypto_dpi_aes_ecb_crypto_func(encrypt_buf, decrypt_buf, 128, key_byte, 0);//decrypt
      //foreach(decrypt_buf[i]) begin
      //   $display("crypto_dpi_aes_ecb_test: decrypt_buf[%0d] is %h",i, decrypt_buf[i]);
      //end

      decrypt_buf_temp = decrypt_buf;
      convert_32to128(decrypto_plaintext, decrypt_buf_temp);
      $display("crypto_dpi_aes_ecb_test: decrypto_plaintext is 128'h%h", decrypto_plaintext);

      return 1;
   endfunction

   function void convert_128to32(ref int unsigned out[], input bit [127:0] in);
      bit [31:0] temp = 0;
      for(int i = 0; i <= 3; i++) begin
         for(int j = 0; j <= 3; j++) begin
            temp = temp >> 8;
            temp[31:24] = in[127:120];
            in = in << 8;
         end
         out[i] = temp;
      end
   endfunction

   function void convert_32to128(output bit [127:0] out, ref int unsigned in[]);
      bit [31:0] temp = 0;
      for(int i = 0; i <= 3; i++) begin
         for(int j = 0; j <= 3; j++) begin
            temp = temp << 8;
            temp[7:0] = in[i][7:0];
            in[i] = in[i] >> 8;
         end
         out = out << 32;
         out[31:0] = temp;
      end
   endfunction
endclass
`endif
