/* A test bench to test the functionality of
 * a CPU Module.
 *
 * Author: Bradley Gathers
*/
module cpu_tb();

	// I/O and Parameters
	reg rst, clk; 

	
	// Initial Setup
	initial begin
		rst = 1'h0;
		clk = 1'h0;
	end
	
	cpu DUT(.rst(rst), .clk(clk));
	
	always #50 clk = !clk;
	
	// Test
	initial begin
		$display("Starting simulation! :)");
		rst = 1'h1;
		#100;
		rst = 1'h0;
		#5000
		
		$display("Done simulation! :)");
		#100 $stop;
	end
endmodule