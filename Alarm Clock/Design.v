module Alarm_clock(
    input clk,
    input reset,
    input enable,
    input load_time,
    input alarm_toggle,
    input alarm_stop,
    input load_alarm,
    input [7:0] hh_load,
    input [7:0] mm_load,
    input [7:0] ss_load,
    input pm_load,
    output reg alarm_on,
    output reg pm,      // Changed from wire to reg
    output [7:0] hh, // Changed from wire to reg
    output [7:0] mm, // Changed from wire to reg
    output [7:0] ss  // Changed from wire to reg
);
    // Internal wires
    wire [1:0] ena;
    wire [7:0] hh_alarm, mm_alarm, ss_alarm;
    reg pm_alarm;
    reg [4:0] tmp_1s=0;
    reg clk_1s=0;
    // Instantiate count_60, count_60_10, and count_12 modules
    count_60 ssc(enable, clk_1s, reset, ss, ss_load, load_time, load_alarm, ss_alarm, ena[0]);
    count_60 mmc(ena[0], clk_1s, reset, mm, mm_load, load_time, load_alarm, mm_alarm, ena[1]);
    count_12 hhc(ena[1], clk_1s, reset, hh, hh_load, load_time, load_alarm, hh_alarm);
    // Update outputs at every positive edge of clk_1s
    always @(posedge clk_1s) begin
        if (reset) begin
            pm <= 0;
        end
        else if (load_time) begin
            pm <= pm_load;    
        end
        else if (load_alarm) begin
            pm_alarm <= pm_load;
        end
        if ((ss[3:0] == 4'h9) && (ss[7:4] == 4'h5) && (mm[3:0] == 4'h9) &&
            (mm[7:4] == 4'h5) && (hh[3:0] == 4'h1) && (hh[7:4] == 4'h1) && ena) begin
            pm <= ~pm;
        end
    end

    // Clock division logic
    always @(posedge clk) begin
            tmp_1s <= tmp_1s + 1;
            if (tmp_1s <= 5) begin 
                clk_1s <= 0;
            end
            else if (tmp_1s >= 10) begin
                clk_1s <= 1;
                tmp_1s <= 1;
            end
            else begin
                clk_1s <= 1;
            end
    end

    // Alarm control logic
    always @(posedge clk_1s) begin
        if (reset) begin
            alarm_on <= 1'b0;
        end
        if ({hh_alarm, mm_alarm, ss_alarm, pm_alarm} == {hh, mm, ss, pm}) begin
            if (alarm_toggle) begin
                alarm_on <= 1'b1;
            end
        end
        if (alarm_stop) begin
            alarm_on <= 1'b0;
        end
    end
endmodule
module count_60(
    input en,
    input clk,
    input reset,
    output reg [7:0] q,
    input [7:0] load_q,
    input load_time,
    input load_alarm,
    output reg [7:0] alarm_q,
    output nxten
);
    wire ena;
    assign ena = ((q[3:0] == 4'h9) ? 1 : 0) && en;
    assign nxten = ((q[3:0] == 4'h9) ? 1 : 0) && ((q[7:4] == 4'h5) ? 1 : 0) && ena;
    always @(posedge clk) begin
        if (reset) begin
            q[3:0] <= 4'h0;
        end
        else if (en) begin
            if (q[3:0] == 4'h9) begin
                q[3:0] <= 4'h0;
            end
            else begin
                q[3:0] <= q[3:0] + 1'b1;
            end
        end
        if (load_time) begin
            q[3:0] <= load_q[3:0];    
        end
        if (load_alarm) begin
            alarm_q[3:0] <= load_q[3:0];
        end
    end
    always @(posedge clk) begin
        if (reset) begin
            q[7:4] <= 4'h0;
        end
        else if (ena) begin
            if ((q[7:4] == 4'h5) && (q[3:0] == 4'h9)) begin
                q[7:4] <= 4'h0;
            end
            else begin
                q[7:4] <= q[7:4] + 1'b1;
            end
        end
        if (load_time) begin
            q[7:4] <= load_q[7:4];    
        end
        if (load_alarm) begin
            alarm_q[7:4] <= load_q[7:4];
        end
    end
endmodule
module count_12(
    input en,
    input clk,
    input reset,
    output reg [7:0] q,
    input [7:0] load_q,
    input load_time,
    input load_alarm,
    output reg [7:0] alarm_q
);
    wire ena;
    assign ena = ((q[3:0] == 4'h9 || (q[3:0] == 4'h2 && q[7:4] == 4'h1)) ? 1 : 0) && en;
    always @(posedge clk) begin
        if (reset) begin
            q[3:0] <= 4'h2;
        end
        else if (en) begin
            if ((q[3:0] == 4'h2) && (q[7:4] == 4'h1)) begin
                q[3:0] <= 4'h1;
            end
            else if (q[3:0] == 4'h9) begin
                q[3:0] <= 4'h0;
            end
            else begin
                q[3:0] <= q[3:0] + 1'b1;
            end
        end
        if (load_time) begin
            q[3:0] <= load_q[3:0];    
        end
        if (load_alarm) begin
            alarm_q[3:0] <= load_q[3:0];
        end
    end
    always @(posedge clk) begin
        if (reset) begin
            q[7:4] <= 4'h1;
        end
        else if (ena) begin
            if ((q[7:4] == 4'h1) && (q[3:0] == 4'h2)) begin
                q[7:4] <= 4'h0;
            end
            else begin
                q[7:4] <= q[7:4] + 1;
            end
        end
        if (load_time) begin
            q[7:4] <= load_q[7:4];    
        end
        if (load_alarm) begin
            alarm_q[7:4] <= load_q[7:4];
        end
    end
endmodule

