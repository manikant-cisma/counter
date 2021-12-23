module counter_tb();

    reg clk, rst, updown;
    wire [3:0] q;

    covergroup cg @(posedge clk);
      cover_q : coverpoint q;
    endgroup
    cg u_cg = new;

    // Instantiate DUT.
    counter dut(clk, rst, updown, q);

    initial begin
        rst = 1;
        updown = 0;
        #12;

        rst = 0;
        #150;

        updown=1;
        #1000;

        $finish;
    end

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("time=%0t, clk=%b, rst=%b, updown=%b, q=0x%0h", $time, clk, rst, updown, q);
    end

endmodule 

