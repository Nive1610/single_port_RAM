// single port ram
module ram #(parameter data_width=32,
             parameter addr_width=6,
             parameter depth = 64)
  (input clk,rstn,en,wr_rd,input [addr_width-1:0]addr,input [data_width-1:0]data_in,output reg output_en,output reg [data_width-1:0]data_out);
  
  reg [data_width-1:0] mem [depth-1:0]; //memory declaration
  integer i;
  always @(posedge clk) begin
    if(en) begin
      if(!rstn)  begin //active-low reset
        output_en<=0;
        data_out<=0;
         for (i=0;i<depth;i=i+1) begin
          mem[i]<=0;
         end
        end
      else begin
        if(wr_rd) begin //write operation
          mem[addr]<=data_in;
          end 
        else begin //read operation
          data_out<=mem[addr];
          output_en<=1'b1;#5;
          output_en<=1'b0;
          
          
      end
    end
   end
   
  end
endmodule
