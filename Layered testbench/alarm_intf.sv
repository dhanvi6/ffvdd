interface alarm_intf(input logic clk,reset_n);
logic arm;
logic trigger;

logic  disarmed;
logic armed;
logic triggered;

clocking bfm_cb @(posedge clk);
default input #1 output #1;
output arm;
output trigger;
input disarmed;
input armed;
input triggered;
endclocking

clocking monitor_cb @(posedge clk);
default input #1 output #1;
input arm;
input trigger;
input disarmed;
input armed;
input triggered;
endclocking
modport BFM (clocking bfm_cb, input clk,reset_n);
modport MONITOR (clocking monitor_cb, input clk, reset_n);
endinterface

