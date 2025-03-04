`timescale 1s/1fs

module filter #(
    parameter real tau = 50e-9
) (
    input real in
);
    real lastt = 0.0, lasty = 0.0, lastin = 0.0;
    real dt, exp_factor;

    function real out();
        dt = $realtime - lastt;  // Compute elapsed time
        exp_factor = $exp(-dt / tau);
        return exp_factor * lasty + (1 - exp_factor) * lastin;
    endfunction

    always @(in) begin
        lasty = out();
        lastin = in;
        lastt = $realtime;
    end
endmodule
