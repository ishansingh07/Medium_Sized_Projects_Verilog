module Game_of_Life_tb;

parameter CLOCK_PERIOD = 10; // Clock period in simulation time units
// Inputs
reg clk;                  // Clock input
reg load;                 // Load input for loading initial state
reg [255:0] data;    // Initial state input (16x16 grid)

// Outputs
wire [255:0] q;   // Output representing the current state (16x16 grid)

// Instantiate the Game_Of_Life module
Game_of_Life dut (
    .clk(clk),
    .load(load),
    .data(data),
    .grid(q)
);

// Clock generation
always #((CLOCK_PERIOD)/2) clk = ~clk; // Generate a 50% duty cycle clock

// Testbench behavior
initial begin
    $dumpfile("gofl.vcd");
    $dumpvars(0,Game_of_Life_tb);
    clk=0;
    // Initialize the grid with some initial state (glider pattern)
    data = 256'h00ba0a0300010000;
    // Load initial state
    load = 1;
    #10 load = 0;

    
    #300 $finish;
end
integer i,j;
always@(posedge clk) begin
    // Print the current state of the grid
    $display("Time Step: %0t", $time);
    for(i=0; i<16; i++) begin
        $write("| ");
        for(j=0; j<16; j++) begin
            if (q[i * 16 + j] == 1)
                $write("1 ");
            else
                $write("0 ");
        end
        $display("|");
    end
    $display("__________________________________");
end
endmodule
