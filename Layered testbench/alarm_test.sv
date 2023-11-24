program alarm_test(alarm_intf intf);
alarm_env env;
initial begin
env = new(intf);
env.gen.repeat_count = 200;
env.run();
end
endprogram
