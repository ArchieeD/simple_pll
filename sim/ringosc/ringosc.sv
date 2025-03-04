`timescale 1s/1fs

module ringosc (
    input real vdd,
    output var logic out
);
    // YOUR IMPLEMENTATION HERE
    real Avco = 3.4e9;
    real bvco = -3.9e9;
    real fvco;
    real t;
    always @(out) begin
        fvco = (Avco * vdd + bvco);
        if (fvco < 0.5e9) fvco = 0.5e9;
        else if (fvco > 2e9) fvco = 2e9;
        t = 1 / fvco;
    end

    always begin
        out = 1;
        #(t / 2);
        out = 0;
        #(t / 2); 
    end
endmodule
