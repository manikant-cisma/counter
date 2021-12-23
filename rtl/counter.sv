
module counter(input clk, rst, updown,
            output[3:0] q);

    reg [3:0] cnt;

    always @(posedge clk or posedge rst)
        begin
            if (rst)
                cnt <= 4'h0;
            else if(~updown)
                cnt <= cnt + 4'd1;
            else
                cnt <= cnt - 4'd1;
        end 

    assign q = cnt;

endmodule

