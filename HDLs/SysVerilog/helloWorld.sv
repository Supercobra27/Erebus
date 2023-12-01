class Hello; //object

int Hello; //variable

function HelloFunc; //function
    Hello = 0;
    
endfunction

task automatic HelloTask; //kind of like a function? Look into this
    $display("Task executed: Hello = %0d", Hello);    
endtask

endclass;




module HelloWorld; //Modules make up the forefront of sysv and v it seems
    initial begin
        Hello h;
        h new;
        h.HelloTask;
    end
endmodule