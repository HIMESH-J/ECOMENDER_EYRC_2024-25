
// pipeline registers -> execute | memory stage

module pl_reg_em (
    input             clk,
    input             RegWriteE,
    input [1:0]       ResultSrcE,
    input             MemWriteE,
    input [31:0]      ALUResultE,
    input [31:0]      WriteDataE,
    input [4:0]       RdE,
    input [31:0]      PCPlus4E,
	 input[2:0]        funct3E,
	 input[31:0]       PCE,
	 input [31:0]      lAuiPCE,
    output reg        RegWriteM,
    output reg[1:0]   ResultSrcM,
    output reg        MemWriteM,
    output reg[31:0]  ALUResultM,
    output reg[31:0]  WriteDataM,
    output reg[4:0]   RdM,
    output reg[31:0]  PCPlus4M,
	 output reg[2:0]   funct3M,
	 output reg[31:0]  PCM,
	 output reg[31:0]  lAuiPCM
	 
    );

initial begin
    {RegWriteM,ResultSrcM,MemWriteM,ALUResultM,WriteDataM,RdM,PCPlus4M,funct3M,PCM,lAuiPCM}<=0;
end

always @(posedge clk) begin
    {RegWriteM,ResultSrcM,MemWriteM,ALUResultM,WriteDataM,RdM,PCPlus4M,funct3M,PCM,lAuiPCM}<={RegWriteE,ResultSrcE,MemWriteE,ALUResultE,WriteDataE,RdE,PCPlus4E,funct3E,PCE,lAuiPCE};      
end

endmodule
