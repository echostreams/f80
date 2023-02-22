`timescale 1ns/1ps

module top_tb();

reg clk100;
wire [7:0] debug_disp;
wire [7:0] debug_sig;

wire simphy_source_valid;
//input simphy_source_ready;
wire [7:0] simphy_source_data;
//input simphy_sink_valid;
wire simphy_sink_ready;
//input [7:0] simphy_sink_data

initial begin
	clk100 = 1'b1;
	//$dumpfile("tb.vcd");
	//$dumpvars(0, top_tb);
	//#1000000;
	//$finish;
end

always #10 clk100 = ~clk100;

top dut (
	.clk100(clk100),
        .cpu_reset(1'b0),
        .user_led(),
        .user_led_1(),
        .user_led_2(),
        .user_led_3(),
        .rgb_led_r(),
        .rgb_led_g(),
        .rgb_led_b(),
        .rgb_led_r_1(),
        .rgb_led_g_1(),
        .rgb_led_b_1(),
        .rgb_led_r_2(),
        .rgb_led_g_2(),
        .rgb_led_b_2(),
        .rgb_led_r_3(),
        .rgb_led_g_3(),
        .rgb_led_b_3(),
        .serial_tx(),
        .serial_rx(),
        .user_btn(),
        .user_btn_1(),
        .user_btn_2(),
        .user_btn_3(),
        .user_sw(),
        .user_sw_1(),
        .user_sw_2(),
        .user_sw_3(),
        .debug_0(debug_sig[0]),
        .debug_1(debug_sig[1]),
        .debug_2(debug_sig[2]),
        .debug_3(debug_sig[3]),
        .debug_4(debug_sig[4]),
        .debug_5(debug_sig[5]),
        .debug_6(debug_sig[6]),
        .debug_7(debug_sig[7]),
        .debug_disp(debug_disp),

	.simphy_source_valid(simphy_source_valid),
	//input simphy_source_ready,
	.simphy_source_data(simphy_source_data),
	//input simphy_sink_valid,
	.simphy_sink_ready(simphy_sink_ready)
	//input [7:0] simphy_sink_data

);

always @(posedge clk100) begin
	//$display("%x %x", debug_disp, debug_sig);
	if (dut.tx_ready == 1'b1) begin
		$write("%c", dut.tx_data);
		//$display("%x", simphy_source_data);
	end
end

/*
parameter STDIN = 32'h8000_0000;
integer console_in;

always @(negedge clk100) begin
	if (!$feof(STDIN)) begin
		console_in = $fgetc(STDIN);
		$write("%c", console_in);
	end
	else
		$finish;
end
*/

endmodule
