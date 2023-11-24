module AlaramSystem(clk,reset_n,arm,trigger , disarmed,armed,triggered);
input clk,reset_n,arm,trigger;
output reg disarmed,armed,triggered;
  // to declare the datatype
  typedef enum {Disarmed, Armed, Triggered} states ;
    
  //to initilise current state
  states state ;
  always@(posedge clk) begin
    //if reset_no is off then reset happen
    if(!reset_n) begin
      state <= Disarmed;
    end
    else begin  // to set the current state based on inputs given
      if(arm) begin
        if(trigger) begin
          state <= Triggered;
        end
        else state <= Armed;
      end
    end
    
    //setting the outputs based on current state
    case(state) 
      Disarmed: begin
        disarmed <= 1;
        armed <= 0;
        triggered <= 0;
      end
      Armed: begin
        disarmed <= 0;
        armed <= 1;
        triggered <= 0;
      end
      Triggered: begin
        disarmed <= 0;
        armed <= 1;
        triggered <= 1;
      end
      default: begin
        disarmed <= 1;
        armed <= 0;
        triggered <= 0;
      end
    endcase
    
   
  end
endmodule
