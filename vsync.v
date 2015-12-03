module vertical(clk,reset,vaddr,vsync);

input clk,reset;
output reg [6:0] vaddr;
reg[1:0] state;
reg [2:0] divide_counter; // divider
reg[19:0] counter;
output  vsync;

always@(posedge clk )
begin
	if(reset)begin
		counter = 20'b0;
	end
	
	else begin
		if(counter == 20'b1100_1011_1000_0011_1111)begin
			counter = 20'b0;
		end
		else begin
			counter = counter +1'b1;
		end
	end
	
	
end

assign vsync = (counter < 20'b0000_0000_1100_1000_0000) ?0:1;

always@(counter)
begin
	if(reset)begin
		state = 00;  //B
		divide_counter = 3'b0;
		vaddr = 7'b0;
	end
	else begin
		case(counter)
			20'b1100_0111_1001_1100_0000: 
				begin
					if(divide_counter == 3'b101)begin
						divide_counter = 3'b0;
						vaddr = vaddr + 1'b1;
					end
						else begin
							divide_counter = divide_counter + 1'b1;
						end
				end
			
		endcase	
		
		
	end
	
end



endmodule