class alarm_cov;
alarm_trans trans = new();
covergroup cov_inst;
option.per_instance = 1;
ST:coverpoint trans.arm {bins arm = {0,1};}
I: coverpoint trans.trigger {bins trigger = {0,1};}
RY: coverpoint trans.disarmed {bins disarmed = {0,1};}
DT: coverpoint trans.armed {bins armed = {0,1};}
F: coverpoint trans.triggered {bins triggered = {0,1};}
endgroup
function new();
cov_inst = new;
endfunction
task main;
cov_inst. sample();
endtask
endclass

