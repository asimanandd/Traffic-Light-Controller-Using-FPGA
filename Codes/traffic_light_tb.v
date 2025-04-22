module traffic_light_tb;
    reg clk, rst;
    wire [2:0] light_N, light_E, light_S, light_W;
    wire [3:0] wait_time; // Output for waiting time

    // Instantiate the Traffic Light Controller
    traffic_light dut (
        .clk(clk), 
        .rst(rst), 
        .light_N(light_N), 
        .light_E(light_E), 
        .light_S(light_S), 
        .light_W(light_W),
        .wait_time(wait_time) // Connect wait time output
    );

    initial begin
        clk = 1'b0;
        forever #10 clk = ~clk; // Clock period of 20 time units
    end

    initial begin
        rst = 1; // Assert reset
        #15 rst = 0; // Release reset after some time
        #200; // Run the simulation for longer
        $finish; // End the simulation
    end

    initial begin
        $monitor("Time: %0t | light_N: %b | light_E: %b | light_S: %b | light_W: %b | wait_time: %d", 
                 $time, light_N, light_E, light_S, light_W, wait_time);
    end
endmodule

