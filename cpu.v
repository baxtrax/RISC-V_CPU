/* A CPU.
 * Computes a set of instructions automatically.
 *
 * Author: Bradley Gathers
*/
module cpu(rst, clk);

	// I/O and Parameters
	input rst, clk;

	wire [31:0]instr; 
	wire regRW; 
	wire ALUsrc; 
	wire [1:0]immsrc; 
	wire [4:0]ALUop; 
	wire [3:0]status; 
	wire mRW; 
	wire wb;
	wire pcsrc;
	
	ControlUnit u1(.rst(rst), 
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
	
	datapath u2(.rst(rst), 
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
								

endmodule