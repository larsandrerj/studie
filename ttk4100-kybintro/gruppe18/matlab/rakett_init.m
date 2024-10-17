%INIT
m = 100; %masse
h = 5; %høyde
d = 0.4; %diameter
g = 9.81; %tyngdekraft

r = [0 5000]; %referanseverdi

x_ddot = [0 0]; %Startakselerasjon på 0 i x og y retning

theta = 0; %startvinkel

% LUFTMOTSTANDGREIER
ro = 1.2923; %Lufttrykk ved 0*C 
C_d = 0.5; %Dragcoefficient for en kjegle
A = pi * (d / 2) ^ 2; %Tversnittsareal for raketten oppover aka sirkel  

k_l = (1/2) * ro * C_d * A; %luftmotstandkonstant



