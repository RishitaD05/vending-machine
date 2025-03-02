module testbench_vending;
    reg clk=1'b1;
    reg rst=1'b0;
    reg [4:0] in;
    reg [4:0] extra_cash;
    reg [1:0]choice;
    
    wire[4:0]change;
    wire howrah,manikaran,esplanade;
  
  vending inst1(
   .clk(clk),
   .rst(rst),
   .in(in),
   .extra_cash(extra_cash),
   .choice(choice),
   .change(change),
   .howrah(howrah),
   .manikaran(manikaran),
   .esplanade(esplanade)
   
  );
  
  always 
  #5 clk= ~clk;
  
  initial begin
  
  $dumpfile("vending.vcd");
  $dumpvars(0,testbench_vending);
  
  #10 in=5'd0;
  #30 in=5'd5; choice=2'b01;
  #30 in=5'd5; choice=2'b10;
  #30 in=5'd10; choice=2'b10;
  #30 in=5'd20; choice=2'b10;
  #30 in=5'd20; choice=2'b11;  
  #30 in=5'd5; choice=2'b10;  
  #30 extra_cash=5'd10; 
  #20 extra_cash=5'd0;
  #30 in=5'd10; choice=2'b01;
  #30 in=5'd20; choice=2'b10;
    
   
   end
   
    
endmodule
