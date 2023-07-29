`timescale 1ms/1us // Set timescale to nanoseconds and picoseconds
module Alarm_clock_tb;

// Inputs
reg clk;           // Clock input
reg reset = 0;         // Reset input
reg enable = 1;        // Enable input (can be set to 1 for normal operation)
reg load_time;     // Load time input (set to 1 to load time values)
reg alarm_toggle = 1;  // Alarm toggle input (set to 1 to toggle alarm on/off)
reg alarm_stop = 0;    // Alarm stop input (set to 1 to stop alarm)
reg load_alarm ;    // Load alarm input (set to 1 to load alarm time values)
reg [7:0] hh_load = 8'b00001000; // Load hours value (e.g., 08)
reg [7:0] mm_load = 8'b00110010; // Load minutes value (e.g., 32)
reg [7:0] ss_load = 8'b00000010; // Load seconds value (e.g., 02)
reg pm_load = 0;        // Load PM value (set to 1 for PM, 0 for AM)

// Outputs
wire pm;               // PM output
wire [7:0] hh;         // Hours output
wire [7:0] mm;         // Minutes output
wire [7:0] ss;         // Seconds output
wire alarm_on;   // Indicates whether alarm is on/off

// Instantiate the DUT (Device Under Test)
Alarm_clock dut (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .load_time(load_time),
    .alarm_on(alarm_on),
    .alarm_toggle(alarm_toggle),
    .alarm_stop(alarm_stop),
    .load_alarm(load_alarm),
    .hh_load(hh_load),
    .mm_load(mm_load),
    .ss_load(ss_load),
    .pm_load(pm_load),
    .pm(pm),
    .hh(hh),
    .mm(mm),
    .ss(ss)
);

// Clock generation
always #50 clk = ~clk; // Generate a 50% duty cycle clock

// Testbench behavior
initial begin
    $dumpfile("alarm_clk.vcd");
    $dumpvars(0, Alarm_clock_tb);
    clk = 0;
    // Reset the DUT
    reset = 1;
    #1000;
    reset = 0;

    // Simulate loading the alarm time values
    load_alarm = 1;
    #1000;
    load_alarm = 0;

    // Simulate loading the time values
    hh_load = 8'b00001000;
    mm_load = 8'b00110001;
    ss_load = 8'b01011000;
    load_time = 1;
    #1000;
    load_time = 0;
    #1000
    alarm_toggle = 1;
    #5000

    // Simulate stopping the alarm
    alarm_stop = 1;
    #2000;
    alarm_stop = 0;
    #1000;
    $finish;
end

always @(*) begin
    $display("Time Step: %0t, Clock : %d%d:%d%d:%d%d %02s, Alarm: %b", $time, hh[7:4], hh[3:0], mm[7:4], mm[3:0], ss[7:4], ss[3:0], (pm) ? "PM" : "AM",alarm_on);
end

endmodule
