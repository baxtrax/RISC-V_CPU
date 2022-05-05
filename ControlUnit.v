/* A Control Unit Module that can
 * be used along with a Datapath module
 * to make a CPU.
 *
 * Author: Bradley Gathers
*/

//ALUSRC
// 0 is IMM value
// 1 is B Value

//WB
// 0 Bypass RAM
// 1 Result from RAM

//PCSRC
// 0 Branch
// 1 Next
module ControlUnit(rst, clk, instr, regRW, ALUsrc, immsrc, ALUop, status, mRW, wb, pcsrc);

	// I/O and Parameters
	input rst, clk;
	input [31:0] instr;
	input [3:0] status;
	output reg regRW, ALUsrc, mRW, wb, pcsrc;
	output reg [1:0] immsrc;
	output reg [4:0] ALUop;
	
	always @(*) begin
		//Opcode (instruction type) switch case
		case(instr[6:0])
			7'b0110011: begin // R Type
				case(instr[14:12])
					3'b000: begin // Add/Sub
						if (instr[31:25] == 7'b0000000) begin // Add
							$display("R-Type Add");
							regRW  = 1'b1;
							ALUsrc = 1'b1;
							mRW    = 1'b0;
							wb     = 1'b0;
							pcsrc  = 1'b1;
							immsrc = 2'b00;
							ALUop  = 5'b00000;
						end
						else begin // Sub
							$display("R-Type Sub");
							regRW  = 1'b1;
							ALUsrc = 1'b1;
							mRW    = 1'b0;
							wb     = 1'b0;
							pcsrc  = 1'b1;
							immsrc = 2'b00;
							ALUop  = 5'b00001;
						end
					end
					3'b001: begin // Shift Left
						$display("R-Type Shift Left");
						regRW  = 1'b1;
						ALUsrc = 1'b1;
						mRW    = 1'b0;
						wb     = 1'b0;
						pcsrc  = 1'b1;
						immsrc = 2'b00;
						ALUop  = 5'b00110;
					end
					3'b100: begin // XOR
						$display("R-Type XOR");
						regRW  = 1'b1;
						ALUsrc = 1'b1;
						mRW    = 1'b0;
						wb     = 1'b0;
						pcsrc  = 1'b1;
						immsrc = 2'b00;
						ALUop  = 5'b00010;
					end
					3'b101: begin // Shift Right
						$display("R-Type Shift Right");
						regRW  = 1'b1;
						ALUsrc = 1'b1;
						mRW    = 1'b0;
						wb     = 1'b0;
						pcsrc  = 1'b1;
						immsrc = 2'b00;
						ALUop  = 5'b00111;
					end
					3'b110: begin // OR
						$display("R-Type OR");
						regRW  = 1'b1;
						ALUsrc = 1'b1;
						mRW    = 1'b0;
						wb     = 1'b0;
						pcsrc  = 1'b1;
						immsrc = 2'b00;
						ALUop  = 5'b00100;
					end
					3'b111: begin //AND
						$display("R-Type AND");
						regRW  = 1'b1;
						ALUsrc = 1'b1;
						mRW    = 1'b0;
						wb     = 1'b0;
						pcsrc  = 1'b1;
						immsrc = 2'b00;
						ALUop  = 5'b00011;
					end
				endcase
			end
			7'b0010011: begin // I Type
				case(instr[14:12])
					3'b000: begin// ADD Imm
						$display("I-Type Add Imm");
						regRW  = 1'b1;
						ALUsrc = 1'b0;
						mRW    = 1'b0;
						wb     = 1'b0;
						pcsrc  = 1'b1;
						immsrc = 2'b00;
						ALUop  = 5'b00000;
					end
					3'b001: begin// Shift Left Imm
						$display("I-Type Shift Left Imm");
						regRW  = 1'b1;
						ALUsrc = 1'b0;
						mRW    = 1'b0;
						wb     = 1'b0;
						pcsrc  = 1'b1;
						immsrc = 2'b00;
						ALUop  = 5'b00110;
					end
					3'b100: begin// XOR Imm
						$display("I-Type XOR Imm");
						regRW  = 1'b1;
						ALUsrc = 1'b0;
						mRW    = 1'b0;
						wb     = 1'b0;
						pcsrc  = 1'b1;
						immsrc = 2'b00;
						ALUop  = 5'b00010;
					end
					3'b101: begin// Shift Right Imm
						$display("I-Type Shift Right Imm");
						regRW  = 1'b1;
						ALUsrc = 1'b0;
						mRW    = 1'b0;
						wb     = 1'b0;
						pcsrc  = 1'b1;
						immsrc = 2'b00;
						ALUop  = 5'b00111;
					end
					3'b110: begin// OR Imm
						$display("I-Type OR Imm");
						regRW  = 1'b1;
						ALUsrc = 1'b0;
						mRW    = 1'b0;
						wb     = 1'b0;
						pcsrc  = 1'b1;
						immsrc = 2'b00;
						ALUop  = 5'b00100;
					end
					3'b111: begin// AND Imm
						$display("I-Type AND Imm");
						regRW  = 1'b1;
						ALUsrc = 1'b0;
						mRW    = 1'b0;
						wb     = 1'b0;
						pcsrc  = 1'b1;
						immsrc = 2'b00;
						ALUop  = 5'b00011;
					end
				endcase
			end
			7'b0000011: begin // Load Type (I-type variant)
				if (instr[14:12] == 3'b010) begin // LW
						$display("I-Type Load");
						regRW  = 1'b1;
						ALUsrc = 1'b0;
						mRW    = 1'b0;
						wb     = 1'b1;
						pcsrc  = 1'b1;
						immsrc = 2'b00;
						ALUop  = 5'b00000;
				end
			end
			7'b0100011: begin // S-Type
				if (instr[14:12] == 3'b010) begin // SW
						$display("S-Type Store");
						regRW  = 1'b0;
						ALUsrc = 1'b0;
						mRW    = 1'b1;
						wb     = 1'b0;
						pcsrc  = 1'b1;
						immsrc = 2'b01;
						ALUop  = 5'b00000;
				end
			end
			7'b1100011: begin // B-Type
				case(instr[14:12])
					7'b000: begin // BEQ
						$display("B-Type Branch Equal");
						regRW  = 1'b0;
						ALUsrc = 1'b1;
						mRW    = 1'b0;
						wb     = 1'b0;
						immsrc = 2'b10;
						ALUop  = 5'b00001;
						if (status[0] == 1'b1) pcsrc = 1'b0;
						else pcsrc = 1'b1;
					end
					7'b001: begin // BNE
						$display("B-Type Branch Not Equal");
						regRW  = 1'b0;
						ALUsrc = 1'b1;
						mRW    = 1'b0;
						wb     = 1'b0;
						immsrc = 2'b10;
						ALUop  = 5'b00001;
						if (status[0] == 1'b0) pcsrc = 1'b0;
						else pcsrc = 1'b1;
					end
				endcase
			end
		endcase
	end
endmodule