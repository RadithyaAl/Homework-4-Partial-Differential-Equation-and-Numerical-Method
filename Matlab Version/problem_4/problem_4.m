% this code is originally written in python by me. but ChatGPT converted it into
% MATLAB. I've also attached the original python code on this homework
format long
% Define the function
the_function = @(x) exp(-x) ./ x;

integration_range = [1, 100];
N = [10, 20, 40, 100, 1000];

trapezoidal_values = zeros(1, length(N));

% Trapezoidal Rule
for i = 1:length(N)
    partition_width = (integration_range(2) - integration_range(1)) / N(i);
    integration_position = integration_range(1);
    total_area = 0;
    for j = 1:N(i)
        % Trapezoidal formula: 0.5*(b-a)*(f(b) + f(a))
        a = integration_position;
        b = integration_position + partition_width;
        area = 0.5 * partition_width * (the_function(a) + the_function(b));
        total_area = total_area + area;
        integration_position = integration_position + partition_width;
    end
    trapezoidal_values(i) = total_area;
end

% Display trapezoidal values
disp('Trapezoidal Method Results:')
disp(trapezoidal_values)


% Simpson 1/3 Rule
simpson13_value = zeros(1, length(N));

for i = 1:length(N)
    partition_width = (integration_range(2) - integration_range(1)) / N(i);
    integration_position = integration_range(1);
    total_area = 0;
    for j = 1:N(i)
        x0 = integration_position;
        x1 = integration_position + partition_width / 2;
        x2 = integration_position + partition_width;
        area = partition_width * (the_function(x0) + 4 * the_function(x1) + the_function(x2)) / 6;
        total_area = total_area + area;
        integration_position = integration_position + partition_width;
    end
    simpson13_value(i) = total_area;
end

% Display Simpson 1/3 values
disp('Simpson 1/3 Method Results:')
disp(simpson13_value)


% Simpson 3/8 Rule
simpson38_value = zeros(1, length(N));

for i = 1:length(N)
    partition_width = (integration_range(2) - integration_range(1)) / N(i);
    integration_position = integration_range(1);
    oneforth_width = 0.25 * partition_width;
    threeforth_width = 0.75 * partition_width;
    total_area = 0;
    for j = 1:N(i)
        x0 = integration_position;
        x1 = integration_position + oneforth_width;
        x2 = integration_position + threeforth_width;
        x3 = integration_position + partition_width;
        area = partition_width * (the_function(x0) + 3 * the_function(x1) + 3 * the_function(x2) + the_function(x3)) / 8;
        total_area = total_area + area;
        integration_position = integration_position + partition_width;
    end
    simpson38_value(i) = total_area;
end

% Display Simpson 3/8 values
disp('Simpson 3/8 Method Results:')
disp(simpson38_value)


% Plotting the integration results
figure;
plot(N, trapezoidal_values, '-o', 'LineWidth', 2);
hold on;
plot(N, simpson13_value, '-s', 'LineWidth', 2);
plot(N, simpson38_value, '-^', 'LineWidth', 2);
hold off;

xlabel('Number of Partitions (N)');
ylabel('Approximated Integral Value');
title('Comparison of Numerical Integration Methods');
legend('Trapezoidal Rule', 'Simpson 1/3 Rule', 'Simpson 3/8 Rule');
xlim([-200, 1100]);
ylim([0, 2.3]);

grid on;
