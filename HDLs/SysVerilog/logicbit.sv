//Author: Ryan Silverberg
//Guided from: https://www.chipverify.com/systemverilog/systemverilog-data-types-logic-bit

/*
Logic is considered a 4 state type that can happen both procedurally and continous
In comparison a reg type can only be driven (changed) in procedural statements like always and initial
while the other datatype of wire can only be done continously in assign statmenets

It can be 0, 1, X, or Z

*/

module tb;
    logic [3:0] my_data;
    logic en;

    initial begin
        $display ("my_data=0x%0h en=%0b");
        my_data = 4'hB;
        $display ("my_data=0x%0h en=%0b");
        #1;
        $display ("my_data=0x%0h en=%0b");
    end
    assign en = my_data[0];
endmodule

/*
In comparsion a bit is just simply a 0 or a 1
*/

module tb2
    bit a;
    bit [3:0] b;
    initial begin
        a = 1;
        b = 4'hF;
        b = 16'h481a; //this would be truncated because it is too big

    end

    initial
        $monitor("a=%0d",a); //monitor checks when something is updated

endmodule