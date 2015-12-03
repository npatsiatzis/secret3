module vgacontroller_tb();

reg reset, clk;
wire VGA_RED,VGA_GREEN,VGA_BLUE;
wire VGA_HSYNC,VGA_VSYNC;

vgacontroller VGA(reset,clk, VGA_RED, VGA_GREEN, VGA_BLUE, VGA_HSYNC, VGA_VSYNC);

initial
begin
clk = 1'b0;
reset = 1'b1;
#100 reset = 1'b0;
end

always
begin
#10 clk = !clk ;
end

endmodule
