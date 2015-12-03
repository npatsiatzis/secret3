module vgacontroller(reset,clk, VGA_RED, VGA_GREEN, VGA_BLUE, VGA_HSYNC, VGA_VSYNC);

input reset, clk;
output VGA_RED,VGA_GREEN,VGA_BLUE;
output VGA_HSYNC,VGA_VSYNC;

wire [6:0]haddr,vaddr;


vram VirtualMemory(clk,reset,haddr,vaddr,VGA_RED,VGA_GREEN,VGA_BLUE);
horizontal HSYNC(clk,reset,haddr,VGA_HSYNC);
vertical VSYNC(clk,reset,vaddr,VGA_VSYNC);


endmodule
