%INIT
m = 100; %masse
h = 5; %høyde
d = 0.4; %diameter
g = 9.81; %tyngdekraft

%REFERANSER
r = [0 0 2000]; %referanseverdi
ref_theta = 0; %referanseverdi for vinkel

%REGULATORPARAMETERE
xy_k_p = 400; % 400
xy_k_i = 20 ; % 20
xy_k_d = 800; % 800
xy_u_max = 100; % max pådrag !!

z_k_p = 1; % 1
z_k_i = 1 / 80; % 1 / 80
z_k_d = 15; % 15
z_u_max = 8000; %FINN REALISTISK TALL F = 8000N fra propulse :)

t_k_p = 0;
t_k_i = 0;
t_k_d = 0;


x_ddot = [0 0 0]; %Startakselerasjon på 0 i x og y retning

theta = 0; %startvinkel

% LUFTMOTSTANDGREIER
ro = 1.2923; %Lufttrykk ved 0*C 
C_d = 0.5; %Dragcoefficient for en kjegle
A = pi * (d / 2) ^ 2; %Tversnittsareal for raketten oppover aka sirkel  

k_l = (1/2) * ro * C_d * A; %luftmotstandkonstant

% FORSTYRRELSE
vind_sample_time = 100; % 10
vind_varians = 30;
C_d_side = 1.2;
A_side = d*h + d*d/2; %areal på siden: rektangel + trekant (nese: høyde=diameter)

k_l_side = (1/2) * ro * C_d_side * A_side;


%% simulering

T = 1000;
dt = 0.01;

UT = sim('rakett_sim.slx');

t = UT.tout;

x = UT.x.Data;
y = UT.y.Data;
z = UT.z.Data;

%% plot

for i=0:dt:T
    plot3(x,y,z); grid on;
    xlim([-10 10]); ylim([-10 10]); zlim([0 2000])
    drawnow
    pause(dt)
end

%for i=0:dt:T
%    plot3(x,y*0,z); grid on;
%    xlim([-200 200]); ylim([-200 200]);
%    drawnow
%
%     pause(dt)
%end
