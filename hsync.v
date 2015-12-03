module horizontal(clk,reset,haddr,hsync);

input clk,reset;
output reg [6:0] haddr;
reg[1:0] state;
reg [2:0] divide_counter; // divider
reg[10:0] counter;
output  hsync;


always@(posedge clk)
begin
	if(reset)begin
		counter = 11'b0;
	end
	
	else begin
		if(counter == 11'b110_0011_1111)begin
			counter = 11'b0;
		end
		else begin
			counter = counter +1'b1;
		end
	end
	
	
end

assign hsync = (counter < 11'b000_1100_0000) ? 0 : 1; 

always@(counter)
begin
	if(reset)begin
		state = 00;  //B
		divide_counter = 3'b0;
		haddr = 7'b0;
	end
	else begin
		case(counter)
			11'b001_0010_0000: 
			begin
					if(divide_counter == 3'b101)begin
						divide_counter = 3'b0;
						haddr = haddr + 1'b1;
					end
					else begin
						divide_counter = divide_counter + 1'b1;
					end
			end
			
		endcase	
		
		
	end
	
end



endmodule