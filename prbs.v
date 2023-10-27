`define OUTLENGTH 8

module PRBS (input Clock_G, Clock_M,Reset,output lock, bit_error);

wire [`OUTLENGTH-1:0]  	LFSR_w;

PRBS_Gen Gen(
	Clock_G,
	Reset,
	LFSR_w
	);

PRBS_Monitor Mon(
	Clock_M,
	Reset,
	LFSR_w,
	lock,
	bit_error
	);

endmodule

