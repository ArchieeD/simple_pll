% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % YOUR PARAMETERS HERE
% Kvco = 2*pi*3.4e9; % in rad/s/V, not Hz/V!
% Kp = 4.7e-3;
% Ki = 13.336e3;
% % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% % fixed parameters
% Vdd = 1.8;
% Ndiv = 10;
% tau_filt = 15.9e-9;
% 
% % form the loop function
% s = tf('s');
% LF = Kvco * (1/Ndiv) * (1/s) * (Vdd/pi) * (1/(1+tau_filt*s)) * (Kp + (Ki/s));
% 
% % plot the phase margin
% margin(LF);

clc; clear; close all;
syms Kp Ki;  % Define symbolic variables

% Given parameters
%Kvco = 2 * pi * 3.4e9;  % rad/s/V
Kvco = 2.4869e9; %post_layout
Vdd = 1.8;
Ndiv = 10;
tau_filt = 15.9e-9;
wc = 1e6 * 2 * pi;

eq1 = (Kvco / Ndiv) * (Vdd / pi) * sqrt((Kp*wc)^2 + (Ki)^2) / (wc^2 * sqrt(1 + (wc * tau_filt)^2)) == 1;
eq2 = atan((Kp * wc)/Ki) - 180*(pi/180) - atan(wc * tau_filt) == -120 * (pi/180); % Convert degrees to radians


sol = vpasolve([eq1, eq2], [Kp, Ki]);
Kp_val = double(sol.Kp);
Ki_val = double(sol.Ki);

fprintf('Solved Kp: %.5f\n', Kp_val);
fprintf('Solved Ki: %.5f\n', Ki_val);

s = tf('s');
LF = Kvco * (1/Ndiv) * (1/s) * (Vdd/pi) * (1/(1+tau_filt*s)) * (Kp_val + (Ki_val/s));

% Plot phase margin
margin(LF);

