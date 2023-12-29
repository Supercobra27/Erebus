module tb

    typedef enum {TRUE, FALSE} tf;

    initial begin
        tf ans;
        ans = TRUE;
        ans = FALSE;
    end
    $monitor("ans: %s" ans.name());
endmodule