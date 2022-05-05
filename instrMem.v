/* A Instruction Memory Module.
 * Has ROM that has Instruction stored. Also
 * decodes instruction into its components.
 *
 * Author: Bradley Gathers
*/
module instrMem(readAdrs, rd, rs1, rs2, instr);

	// I/O and Parameters
	input [6:0] readAdrs;
	output [4:0] rd;
	output [4:0] rs1;
	output [4:0] rs2;
	output [31:0] instr;
	
	// Connection between ROM and Instruction Decoder
	wire [31:0] instrToDecode;
	
	// Initilize ROM
	rom32x32 rom(.data_out(instrToDecode), .adrs(readAdrs), .cs(1'h0));
	
	// Decode Instruction
	assign rd = instrToDecode[11:7];
	assign rs1 = instrToDecode[19:15];
	assign rs2 = instrToDecode[24:20];
	assign instr = instrToDecode;

endmodule

/* A 32x32-bit ROM Module.
 * The Chipselect needs to be low to activate memory.
 *
 * Author: Bradley Gathers
 * Date: 3/23/2022
*/
module rom32x32(data_out, adrs, cs);

	// I/O and Parameters
	input cs; // Enable / Disable data lines
	input [6:0] adrs;
	output reg [31:0] data_out;
	reg [7:0] mem[127:0];
	
	always @(*) begin                                                             //#                |         rs2   rs1   fc3 rd    Opcode  |
		if (!cs) begin                                                             //#  | Data        | Binary                                |Instruction
			mem[0]   = 8'h00; mem[1]   = 8'h60; mem[2]   = 8'h01; mem[3]   = 8'h93; //   | 00 60 01 93 | 0000000 00110 00000 000 00011 0010011 | addi x3,x0,6
			mem[4]   = 8'h00; mem[5]   = 8'h40; mem[6]   = 8'h02; mem[7]   = 8'h13; //1  | 00 40 02 13 | 0000000 00100 00000 000 00100 0010011 | addi x4,x0,4
			mem[8]   = 8'h00; mem[9]   = 8'h32; mem[10]  = 8'h02; mem[11]  = 8'h33; //2  | 00 32 02 33 | 0000000 00011 00100 000 00101 0110011 | add x5, x4, x3
			mem[12]  = 8'h00; mem[13]  = 8'h40; mem[14]  = 8'h20; mem[15]  = 8'h23; //3  | 00 40 20 23 | 0000000 00101 00000 010 00000 0100011 | sw x5, 0(x0)
			mem[16]  = 8'h00; mem[17]  = 8'h00; mem[18]  = 8'h22; mem[19]  = 8'h83; //4  | 00 00 22 83 | 0000000 00000 00000 010 00110 0000011 | lw x6, 0(x0)
			mem[20]  = 8'h00; mem[21]  = 8'h52; mem[22]  = 8'h00; mem[23]  = 8'h63; //5  | 00 52 00 63 | 0000000 00110 00101 000 00000 1100011 | beq x5, x6, 8
			mem[24]  = 8'h00; mem[25]  = 8'h00; mem[26]  = 8'h00; mem[27]  = 8'h00; //6  | 00 00 00 00 | 
			mem[28]  = 8'h00; mem[29]  = 8'h00; mem[30]  = 8'h00; mem[31]  = 8'h00; //7  | 00 00 00 00 |
			mem[32]  = 8'h00; mem[33]  = 8'h00; mem[34]  = 8'h00; mem[35]  = 8'h00; //8  | 00 00 00 00 |
			mem[36]  = 8'h00; mem[37]  = 8'h00; mem[38]  = 8'h00; mem[39]  = 8'h00; //9  | 00 00 00 00 |
			mem[40]  = 8'h00; mem[41]  = 8'h00; mem[42]  = 8'h00; mem[43]  = 8'h00; //10 | 00 00 00 00 |
			mem[44]  = 8'h00; mem[45]  = 8'h00; mem[46]  = 8'h00; mem[47]  = 8'h00; //11 | 00 00 00 00 |
			mem[48]  = 8'h00; mem[49]  = 8'h00; mem[50]  = 8'h00; mem[51]  = 8'h00; //12 | 00 00 00 00 |
			mem[52]  = 8'h00; mem[53]  = 8'h00; mem[54]  = 8'h00; mem[55]  = 8'h00; //13 | 00 00 00 00 |
			mem[56]  = 8'h00; mem[57]  = 8'h00; mem[58]  = 8'h00; mem[59]  = 8'h00; //14 | 00 00 00 00 |
			mem[60]  = 8'h00; mem[61]  = 8'h00; mem[62]  = 8'h00; mem[63]  = 8'h00; //15 | 00 00 00 00 |
			mem[64]  = 8'h00; mem[65]  = 8'h00; mem[66]  = 8'h00; mem[67]  = 8'h00; //16 | 00 00 00 00 | 
			mem[68]  = 8'h00; mem[69]  = 8'h00; mem[70]  = 8'h00; mem[71]  = 8'h00; //17 | 00 00 00 00 | 
			mem[72]  = 8'h00; mem[73]  = 8'h00; mem[74]  = 8'h00; mem[75]  = 8'h00; //18 | 00 00 00 00 |
			mem[76]  = 8'h00; mem[77]  = 8'h00; mem[78]  = 8'h00; mem[79]  = 8'h00; //19 | 00 00 00 00 |
			mem[80]  = 8'h00; mem[81]  = 8'h00; mem[82]  = 8'h00; mem[83]  = 8'h00; //20 | 00 00 00 00 |
			mem[84]  = 8'h00; mem[85]  = 8'h00; mem[86]  = 8'h00; mem[87]  = 8'h00; //21 | 00 00 00 00 |
			mem[88]  = 8'h00; mem[89]  = 8'h00; mem[90]  = 8'h00; mem[91]  = 8'h00; //22 | 00 00 00 00 |
			mem[92]  = 8'h00; mem[93]  = 8'h00; mem[94]  = 8'h00; mem[95]  = 8'h00; //23 | 00 00 00 00 |
			mem[96]  = 8'h00; mem[97]  = 8'h00; mem[98]  = 8'h00; mem[99]  = 8'h00; //24 | 00 00 00 00 |
			mem[100] = 8'h00; mem[101] = 8'h00; mem[102] = 8'h00; mem[103] = 8'h00; //25 | 00 00 00 00 |
			mem[104] = 8'h00; mem[105] = 8'h00; mem[106] = 8'h00; mem[107] = 8'h00; //26 | 00 00 00 00 |
			mem[108] = 8'h00; mem[109] = 8'h00; mem[110] = 8'h00; mem[111] = 8'h00; //27 | 00 00 00 00 |
			mem[112] = 8'h00; mem[113] = 8'h00; mem[114] = 8'h00; mem[115] = 8'h00; //28 | 00 00 00 00 |
			mem[116] = 8'h00; mem[117] = 8'h00; mem[118] = 8'h00; mem[119] = 8'h00; //29 | 00 00 00 00 |
			mem[120] = 8'h00; mem[121] = 8'h00; mem[122] = 8'h00; mem[123] = 8'h00; //30 | 00 00 00 00 |
			mem[124] = 8'h00; mem[125] = 8'h00; mem[126] = 8'h00; mem[127] = 8'h00; //31 | 00 00 00 00 |
			data_out = {mem[adrs], mem[adrs+1], mem[adrs+2], mem[adrs+3]};
		end
	end
	// 00 60 01 93 | 0000000 00110 00000 000 00011 0010011 | addi x3,x0,6
// 00 40 02 13 | 0000000 00100 00000 000 00100 0010011 | addi x4,x0,4
// 00 32 02 33 | 0000000 00011 00100 000 00100 0110011 | add x4, x4, x3
// 00 40 20 23 | 0000000 00100 00000 010 00000 0100011 | sw x4, 0(x0)
// 00 00 22 83 | 0000000 00000 00000 010 00101 0000011 | lw x5, 0(x0)
// 00 52 00 63 | 0000000 00101 00100 000 00000 1100011 | beq x4, x5, 8

endmodule