J = 15;
m = 200;
k = 100;
k_2 = 5;
k_3 = 1;
k_4 = 1;

theta_0 = 0;
del = -5;
u = 5;

sim("oppg3d.slx")

plot(out.x_t.Time, out.x_t.Data)


%for i = 1:numRuns

 %   del = del * i

  %  sim("oppg3d.slx")

   % plot(out.x_t.Time, out.x_t.Data)
  %  hold on
    %plot(out.z_t.Time, out.z_t.Data)
    %x_t_results(i) = out.x_t.Data
    %z_t_results(i) = out.z_t.Data
%end

%hold off
