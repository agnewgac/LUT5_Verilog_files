module lut5(
    input wire clk,                  
    input wire serial_data,
    input wire start_load,
    input wire [4:0] in,
    output wire out
);

reg [31:0] lut_contents = 32'b0;      
reg [4:0] bit_counter = 0;          //loaded bits counter
reg loading = 0;                      //flag 


//loads LUT 
always @(posedge clk) begin
    if (start_load && !loading) //flag to load
    begin
        loading <= 1;
        bit_counter <= 0;
    end 
    else if (loading) //after loading 
    begin
        if (bit_counter < 32)
        begin
            lut_contents <= {lut_contents[30:0], serial_data};
            bit_counter <= bit_counter + 1;
        end
        if (bit_counter == 31)
        begin
            loading <= 0;
        end
    end
end

assign out = lut_contents[in];

endmodule
