module HelloWorld #(parameter string MSG = "Hello World!");
    initial begin
        $display("%s",MSG);
    end
endmodule