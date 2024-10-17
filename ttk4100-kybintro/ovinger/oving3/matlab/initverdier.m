J = 15;
m = 200;
k = 100;
k_2 = 5;
k_3 = 1;
k_4 = 1;

theta_0 = 0;
del = -5;
u = 5;


%set_param([oppg3d '/Constant'], del, 10)
set_param(['oppg3d' '/u'], 'Value', num2str(5))
set_param(['oppg3d' '/del'], 'Value', num2str(-5))

out = sim(model)

hold on
plot(out.x.Time, out.x.Data)
%plot(out.z.Time, out.x.Data)
hold off


