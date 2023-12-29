module tb

    string test = "Hello World";

    intial begin

        $display ("%s",test);

        foreach(test[i]) begin
            $display ("%s", test[i]);
        end

    end

//if we wanted to do it in bits, each char is 1 byte eg. reg [11*8-1:0] = "Hello World"
endmodule