module vending(
    input clk,
    input rst,
    input [4:0] in,
    input [4:0] extra_cash,
    input [1:0]choice,
    
    output reg[4:0]change,
    output reg howrah,manikaran,esplanade
    );
    //the states are defined as follows
    parameter [1:0]zero=2'b00;
    parameter [1:0]ten=2'b01;
    parameter [1:0]fifteen=2'b10;
    parameter [1:0]twenty=2'b11;
    
    //the choices are as follows:
    parameter [1:0]sel_howrah=2'b01;
    parameter [1:0]sel_manikaran=2'b10;
    parameter [1:0]sel_esplanade=2'b11;
    
    //the denominations are as follows:
    parameter [4:0]m_10=5'd10;
    parameter [4:0]m_15=5'd15;
    parameter [4:0]m_25=5'd25;
    
    reg [2:0]c_s,n_s;
    initial
    begin
      c_s <= zero;
      n_s <= zero;
     end
    always @(posedge clk)
     
        if(rst) begin
         c_s <=0;
          n_s<=0;
          end
        else begin
           c_s=n_s;
           case(c_s)
             zero: if(in==m_10 && choice==sel_howrah)
                     n_s<= ten;
                
                   else if( in==m_15 && choice==sel_manikaran)
                     n_s<= fifteen;
                 
                   else if( in==m_25 && choice==sel_esplanade)
                     n_s<= twenty;
                     
              ten: if(in==m_10 && choice==sel_howrah)
                     n_s<= ten;
                
                   else if( in==m_15 && choice==sel_manikaran)
                     n_s<= fifteen;
                 
                   else if( in==m_25 && choice==sel_esplanade)
                     n_s<= twenty;
             fifteen: if(in==m_10 && choice==sel_howrah)
                     n_s<= ten;
                
                   else if( in==m_15 && choice==sel_manikaran)
                     n_s<= fifteen;
                 
                   else if( in==m_25 && choice==sel_esplanade)
                     n_s<= twenty;
              
             twenty: if(in==m_10 && choice==sel_howrah)
                     n_s<= ten;
                
                   else if( in==m_15 && choice==sel_manikaran)
                     n_s<= fifteen;
                 
                   else if( in==m_25 && choice==sel_esplanade)
                     n_s<= twenty;
                     
               default: n_s<= zero;
               
endcase
end
 always @(posedge clk)
     begin
          
        howrah <= 1'b0;
        manikaran <= 1'b0;
        esplanade <= 1'b0;

         case(c_s)
           zero:begin
                  howrah<=1'b0;
                  manikaran<=1'b0;
                  esplanade<=1'b0;
                  change=in; 
                  end 
            ten: begin
                if(in==m_10)
                 begin
                   howrah<=1'b1;
                   manikaran<=1'b0;
                   esplanade<=1'b0;
                   change=in-10; 
                  end 
                    
               else if( in==m_15)
                  begin
                   howrah<=1'b1;
                   manikaran<=1'b0;
                   esplanade<=1'b0;
                   change=in-10; 
                  end 
                 
                else if( in==m_25)
                  begin
                   howrah<=1'b1;
                   manikaran<=1'b0;
                   esplanade<=1'b0;
                   change=in-10; 
                  end 
                end      
              
              fifteen: begin
                if(in==m_10)
                 begin
                   howrah<=1'b0;
                   manikaran<=1'b0;
                   esplanade<=1'b0;
                   
                   if(extra_cash==m_10)
                     begin
                       howrah<=1'b0;
                       manikaran<=1'b1;
                      esplanade<=1'b0;
                      change=in-5;
                     end 
                     else change=5'd10;
                  end 
                    
               else if( in==m_15)
                  begin
                   howrah<=1'b0;
                   manikaran<=1'b1;
                   esplanade<=1'b0;
                   change=in-10; 
                  end 
                 
                else if( in==m_25)
                  begin
                   howrah<=1'b0;
                   manikaran<=1'b1;
                   esplanade<=1'b0;
                   change=in-10; 
                  end 
                end      
               twenty: begin
                if(in==m_10)
                 begin
                   howrah<=1'b0;
                   manikaran<=1'b0;
                   esplanade<=1'b0;
                   
                   if(extra_cash==m_10)
                     begin
                       howrah<=1'b0;
                       manikaran<=1'b0;
                       esplanade<=1'b1;
                      
                     end 
                     else change=5'd10;
                  end 
                    
               else if( in==m_15)
                  begin
                   howrah<=1'b0;
                   manikaran<=1'b0;
                   esplanade<=1'b0;
                   
                     if(extra_cash==m_10)
                     begin
                       howrah<=1'b0;
                       manikaran<=1'b0;
                       esplanade<=1'b1;
                       change=5'd5;
                      
                     end 
                     else change=5'd15;
                      
                  end 
                 
                else if( in==m_25)
                  begin
                   howrah<=1'b0;
                   manikaran<=1'b0;
                   esplanade<=1'b1;
                   change=in-20; 
                  end
                 end
                  default: begin
                     howrah<=1'b0;
                       manikaran<=1'b0;
                       esplanade<=1'b0;
                       change=5'd0;
                      end
                     endcase
                     end
        endmodule
