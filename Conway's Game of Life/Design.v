module Game_of_Life(
    input clk,
    input load,                         // Allows user to load data into the 16x16 grid
    input [255:0] data,                 // data to be loaded
    output [255:0] grid ); 
    reg [3:0] counter;  
    reg [323:0] extended_grid;            // represents a 18x18 grid required to satisfy the condition for a toroid surface
    reg [255:0] next_grid;
    always @(posedge clk) begin
        if(load)
        	grid <= data;
        else 
          grid <= next_grid;
    end
    always@(*) begin
        extended_grid[17:0] = {grid[240], grid[255:240], grid[255]};
        extended_grid[323:306] = {grid[0], grid[15:0], grid[15]};
        for(int i=1;i<17;i++) begin
            extended_grid[i*18+:18] = {grid[(i-1)*16], grid[(i-1)*16+:16], grid[i*16-1]};
        end
        for(int i=1;i<17;i++) begin
            for(int j=1;j<17;j++) begin
                counter = extended_grid[18*i+j-1] + extended_grid[18*i+j+1] + extended_grid[18*(i-1)+j-1]
                + extended_grid[18*(i-1)+j] + extended_grid[18*(i-1)+j+1] + extended_grid[18*(i+1)+j-1]
                + extended_grid[18*(i+1)+j] + extended_grid[18*(i+1)+j+1];
                case(counter)
                    2:next_grid[16*(i-1)+j-1] <= grid[16*(i-1)+j-1];
                    3:next_grid[16*(i-1)+j-1] <= 1;
                    default:next_grid[16*(i-1)+j-1] <= 0;
                endcase
            end
        end
    end
endmodule
