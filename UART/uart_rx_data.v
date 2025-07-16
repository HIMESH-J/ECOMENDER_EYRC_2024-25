module uart_rx_data(input [7:0]rx_msg,
                    input rx_complete,
                     output reg ready);
							
reg [2:0]state ;
							
parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100,S5=3'b101;
							
always @(rx_msg or state)
begin
case(state)
  
   S0:begin if(rx_msg==8'b01010011 && rx_complete==1'b1) state<=S1;ready=1'b0;end //S
	S1:begin if(rx_msg==8'b01010100 && rx_complete==1'b1) state<=S2;end //T
	S2:begin if(rx_msg==8'b01000001 && rx_complete==1'b1) state<=S3;end //A
	S3:begin if(rx_msg==8'b01010010 && rx_complete==1'b1) state<=S4;end //R
	S4:begin if(rx_msg==8'b01010100 && rx_complete==1'b1) state<=S5;end //T
	S5:ready=1;
	default :state<=S0;
	
	endcase






end
endmodule
