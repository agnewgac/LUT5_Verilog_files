module lut3_tb;

reg [2:0] inputs;
reg [7:0] lut_contents_init;
reg load;
wire outee;

lut3 my_lut3 (
    .in(inputs),
    .lut_contents_init(lut_contents_init),
    .load(load),
    .out(outee)
);

initial begin
    $dumpfile("lut3_tb.vcd");
    $dumpvars(0, lut3_tb);

    //initialise values
    //lut_contents_init = 8'b10101010; 
    lut_contents_init = 8'b11011100;
    load = 1'b1; #10; 
    load = 1'b0; 

    inputs = 3'b000; #10;
    $display("Input: %b, Output: %b", inputs, outee);
    inputs = 3'b001; #10;
    $display("Input: %b, Output: %b", inputs, outee);
    inputs = 3'b010; #10;
    $display("Input: %b, Output: %b", inputs, outee);
    inputs = 3'b011; #10;
    $display("Input: %b, Output: %b", inputs, outee);
    inputs = 3'b100; #10;
    $display("Input: %b, Output: %b", inputs, outee);
    inputs = 3'b101; #10;
    $display("Input: %b, Output: %b", inputs, outee);
    inputs = 3'b110; #10;
    $display("Input: %b, Output: %b", inputs, outee);
    inputs = 3'b111; #10;
    $display("Input: %b, Output: %b", inputs, outee);

    $display("test complete");
end

endmodule
