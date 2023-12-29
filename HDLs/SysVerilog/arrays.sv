//static arrays
module s_array
    bit [7:0] data;

    intial begin
        data = 8'hA2;

        for(int i = 0; i < $size(data); i++) begin
            $display("data[%0d]: %b", i, data[i]);
        end
    end

endmodule