module tb_alarm_top;
bit clk;
bit reset_n;
alarm_intf intf(clk,reset_n);
alarm_test test(intf);
AlaramSystem dut(.clk(intf.clk),
.reset_n(intf.reset_n),
. arm (intf.arm),
.trigger(intf.trigger),
.disarmed(intf.disarmed),
.armed(intf.armed),
.triggered(intf.triggered)
);
always #5 clk = ~clk;
always #2 reset_n = ~reset_n;

  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule

