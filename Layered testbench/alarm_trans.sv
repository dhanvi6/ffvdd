class alarm_trans;
rand bit arm;
rand bit trigger;
bit disarmed;
bit armed;
bit triggered;
function void display();
$display(" ");
$display("\t arm = %0b, \t trigger = %0b, \t disarmed = %0b, \t armed = %0b, \t triggered = %0b", arm,trigger,disarmed,armed,triggered);
$display(" ");

endfunction
endclass

