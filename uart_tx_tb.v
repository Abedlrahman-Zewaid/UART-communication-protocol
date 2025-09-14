`timescale 1ns / 1ps

module uart_tx_tb();

reg clock , rst , send ;
reg [1:0] buad_rate ; 
reg [7:0] data_in ;
reg [1:0] parity_type ;
reg stop_bits ;
reg data_length ;

wire data_out ;
wire p_parity_out ;
wire tx_done , tx_active ;

 uart_tx  TB (.clock(clock),
              .rst(rst),
              .send(send),
              .buad_rate(buad_rate),
              .data_in(data_in),
              .parity_type(parity_type),
              .stop_bits(stop_bits),
              .data_length(data_length),
              .data_out(data_out),
              .p_parity_out(p_parity_out),
              .tx_done(tx_done),
              .tx_active(tx_active) );



always begin
clock = 0 ;  #10 ; //(period / 2)
clock = 1 ;  #10 ; //(period / 2)
end

initial begin
     rst = 0 ; send = 0 ;
#10  rst = 1 ;   
#10  parity_type = 2'b00 ; stop_bits = 0 ;
     data_length = 0 ;
     data_in = 8'b1001_0101 ;
     buad_rate = 2'b00 ;
#208330  send = 1 ;
#208330  send = 0 ;
#624990 ;

#75120 ;
 parity_type = 2'b11 ; stop_bits = 0 ;
     data_length = 0 ;
     data_in = 8'b1111_0101 ;
     buad_rate = 2'b01 ;     
#108690  send = 1 ;
#108690  send = 0 ;

 parity_type = 2'b01 ; stop_bits = 0 ;
     data_length = 0 ;
     data_in = 8'b1110_0111 ;
     buad_rate = 2'b01 ;
#217380
  send = 1 ;
#108690  send = 0 ;

#326070 ;
 parity_type = 2'b10 ; stop_bits = 1 ;
     data_length = 0 ;
     data_in = 8'b1100_0111 ;
     buad_rate = 2'b10 ;
#104160  send = 1 ;
#52080  send = 0 ;
     
#156240 ;
 parity_type = 2'b01 ; stop_bits = 1 ;
     data_length = 1 ;
     data_in = 8'b1111_0101 ;
     buad_rate = 2'b11 ;
#50080  send = 1 ;
#25040  send = 0 ;


     
#326070 ; $stop ;  

end
endmodule
