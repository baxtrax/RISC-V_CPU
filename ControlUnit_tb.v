//             |         rs2   rs1   fc3 rd    Opcode  |
// Data        | Binary                                |Instruction
// 00 60 01 93 | 0000000 00110 00000 000 00011 0010011 | addi x3,x0,6
// 00 40 02 13 | 0000000 00100 00000 000 00100 0010011 | addi x4,x0,4
// 00 32 02 33 | 0000000 00011 00100 000 00100 0110011 | add x4, x4, x3
// 00 40 20 23 | 0000000 00100 00000 010 00000 0100011 | sw x4, 0(x0)
// 00 00 22 83 | 0000000 00000 00000 010 00101 0000011 | lw x5, 0(x0)
// 00 52 00 63 | 0000000 00101 00100 000 00000 1100011 | beq x4, x5, 8

/* A test bench to test the functionality of
 * the 32-bit Control Unit Module.
 *
 * Author: Bradley Gathers
*/
module ControlUnit_tb();
	//rst, clk, instr, regRW, ALUsrc, immsrc, ALUop, status, mRW, wb, pcsrc
	// I/O and Parameters
	reg rst, clk;
	wire regRW, ALUsrc, mRW, wb, pcsrc;
	wire [1:0] immsrc;
	wire [4:0] ALUop;
	reg [31:0] instr;
	reg [3:0] status;
	
		// Initial Setup
	initial begin
		rst = 1'b0;
		clk = 1'b0;
	end
	
	always #5 clk = !clk;
	
	// Initialize the DUT
	ControlUnit DUT(.rst(rst), 
					 .clk(clk), 
					 .instr(instr), 
					 .regRW(regRW), 
					 .ALUsrc(ALUsrc), 
					 .immsrc(immsrc), 
					 .ALUop(ALUop), 
					 .status(status), 
					 .mRW(mRW), 
					 .wb(wb), 
					 .pcsrc(pcsrc));
					 

	// Initial Setup
	initial begin
	
		instr = 32'h00600193;
		rst = 1'b1;
		#10;
		rst = 1'b0;
		@(posedge clk) instr = 32'h00400213;
		@(posedge clk) instr = 32'h00320233;
		@(posedge clk) instr = 32'h00402023;
		@(posedge clk) instr = 32'h00002283;
		@(posedge clk) instr = 32'h00520063;
		
		#100 $stop;
	end
endmodule