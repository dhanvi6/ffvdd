class alarm_bfm;
virtual alarm_intf intf;
mailbox gen2bfm;
int no_transactions;
function new(virtual alarm_intf intf,mailbox gen2bfm);
this.intf = intf;
this.gen2bfm = gen2bfm;
endfunction
task reset;

wait(intf.reset_n);
$display("Reset Initiated");
intf.bfm_cb.arm <= 0;
intf.bfm_cb.trigger <= 0;
wait(!intf.reset_n);
$display("Reset finished");
endtask



task main;
forever begin
alarm_trans trans;
gen2bfm.get(trans);
$display("Transaction No. = %0d", no_transactions);
intf.bfm_cb.arm <= trans.arm;
intf.bfm_cb.trigger <= trans.trigger;
repeat(2)@(posedge intf.clk);
trans.triggered = intf.bfm_cb.triggered;
trans.disarmed = intf.bfm_cb.disarmed;
trans.armed = intf.bfm_cb.armed;
trans.display();
no_transactions++;
end
endtask
endclass

