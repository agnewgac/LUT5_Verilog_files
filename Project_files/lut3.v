module lut3(
    input wire [2:0] in,
    input wire [7:0] lut_contents_init,
    input wire load,
    output wire out

);
reg [7:0] lut_contents = 8'b00000000;

always@ (posedge load) //only happens when load is high, 
begin 
lut_contents <= lut_contents_init;
end


assign out = lut_contents[in];
endmodule