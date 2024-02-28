module enhanced_lut5(
    input wire clk,
    input wire reset,
    input wire serial_data,
    input wire start_load,
    input wire [4:0] in,
    output wire out
);

    wire lut_out;
    lut5 my_lut5(
        .clk(clk),
        .serial_data(serial_data),
        .start_load(start_load),
        .in(in),
        .out(lut_out)
    );

    reg ff_out;
    always @(posedge clk or posedge reset) begin
        if (reset)
            ff_out <= 0;
        else
            ff_out <= lut_out;
    end

    assign out = ff_out;

endmodule
