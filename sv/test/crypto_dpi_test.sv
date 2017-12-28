`ifndef __CRYPTO_DPI_TEST_SV__
`define __CRYPTO_DPI_TEST_SV__
program crypto_dpi_test;

   import crypto_dpi_pkg::*;

   virtual class crypto_dpi_test_case;
      string name;
      bit failed;
      function new(string name="");
         this.name = name;
      endfunction

      function bit test(ref int pass_cnt, ref int fail_cnt);
         if($test$plusargs(this.name) || $test$plusargs("all")) begin
            if(this.do_test()) begin
               pass_cnt++;
            end
            else begin
               fail_cnt++;
               this.failed = 1;
            end
         end
         return 0;
      endfunction

      pure virtual function bit do_test();
   endclass

   `include "crypto_dpi_tests.svh"

   initial begin
      int pass_cnt;
      int fail_cnt;
      crypto_dpi_test_case test_case[$];
      crypto_dpi_aes_ecb_test aes_ecb_test=new();
      crypto_dpi_evp_test evp_test=new();
      test_case.push_back(aes_ecb_test);
      test_case.push_back(evp_test);
      foreach(test_case[i]) begin
         test_case[i].test(pass_cnt, fail_cnt);
      end
   
      $display("PASS:%0d", pass_cnt);
      $display("FAIL:%0d", fail_cnt);
      foreach(test_case[i]) begin
         if(test_case[i].failed) begin
            $display("\t %s failed!", test_case[i].name);
         end
      end
   end

endprogram
`endif
