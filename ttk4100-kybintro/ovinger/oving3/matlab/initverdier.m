J = 15;
m = 200;
k = 100;
k_2 = 5;
k_3 = 1;
k_4 = 1;

theta_0 = 0;
del = -5;
u = 5;


% Number of iterations for the loop
num_iterations = 5; % Adjust as needed

% Prepare a figure for plotting
figure;
hold on;

for i = 1:num_iterations
    % Set parameters
    set_param(['oppg3d' '/u'], 'Value', num2str(u));
    %set_param(['oppg3d' '/del'], 'Value', num2str(del));
    
    % Simulate the model
    out = sim('oppg3d'); % Make sure the model name is correct

    % Plot the results
    %plot(out.x.Time, out.x.Data, 'DisplayName', ['u = ' num2str(u) ', del = ' num2str(del)]);
    plot(out.x.Time, out.x.Data, 'DisplayName', ['u = ' num2str(u)]);
    %plot(out.z.Time, out.z.Data, 'DisplayName', ['u = ' num2str(u) ', del = ' num2str(del)]);
    
    % Update the values for the next iteration
    u = u + 2;
    %del = del - 2;
    %theta_0 = theta_0 +2 
end

hold off;
xlabel('t');
ylabel('x(t)');
legend show; % Display legend for clarity
title('theta_0 og del konst, u øker');



