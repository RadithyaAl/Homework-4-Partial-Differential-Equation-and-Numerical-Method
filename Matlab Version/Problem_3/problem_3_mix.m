format long
clear; clc;

% Parameters
h = 0.05;
x = 0:h:5;
N = length(x);

% Initial conditions
y0 = 4;
dy0 = 0;

%% 1. Euler's Method (Taylor 1st Order Approximation)
y_euler = zeros(1, N);
dy_euler = zeros(1, N);
y_euler(1) = y0;
dy_euler(1) = dy0;

for i = 1:N-1
    ddy = -0.6 * dy_euler(i) - 8 * y_euler(i);
    y_euler(i+1) = y_euler(i) + h * dy_euler(i);
    dy_euler(i+1) = dy_euler(i) + h * ddy;
end

%% 2. Runge-Kutta 2nd Order (Midpoint Method)
y_rk2 = zeros(1, N);
dy_rk2 = zeros(1, N);
y_rk2(1) = y0;
dy_rk2(1) = dy0;

for i = 1:N-1
    f1 = dy_rk2(i);
    f2 = -0.6 * dy_rk2(i) - 8 * y_rk2(i);
    
    k1_1 = h * f1;
    k1_2 = h * f2;
    
    k2_1 = h * (dy_rk2(i) + k1_2/2);
    k2_2 = h * (-0.6*(dy_rk2(i) + k1_2/2) - 8*(y_rk2(i) + k1_1/2));
    
    y_rk2(i+1) = y_rk2(i) + k2_1;
    dy_rk2(i+1) = dy_rk2(i) + k2_2;
end

%% 3. Runge-Kutta 4th Order Method
y_rk4 = zeros(1, N);
dy_rk4 = zeros(1, N);
y_rk4(1) = y0;
dy_rk4(1) = dy0;

for i = 1:N-1
    y1 = y_rk4(i);
    y2 = dy_rk4(i);

    k1_1 = h * y2;
    k1_2 = h * (-0.6*y2 - 8*y1);

    k2_1 = h * (y2 + k1_2/2);
    k2_2 = h * (-0.6*(y2 + k1_2/2) - 8*(y1 + k1_1/2));

    k3_1 = h * (y2 + k2_2/2);
    k3_2 = h * (-0.6*(y2 + k2_2/2) - 8*(y1 + k2_1/2));

    k4_1 = h * (y2 + k3_2);
    k4_2 = h * (-0.6*(y2 + k3_2) - 8*(y1 + k3_1));

    y_rk4(i+1) = y1 + (k1_1 + 2*k2_1 + 2*k3_1 + k4_1)/6;
    dy_rk4(i+1) = y2 + (k1_2 + 2*k2_2 + 2*k3_2 + k4_2)/6;
end

%% 4. Predictor-Corrector (Heun's Method)
y_heun = zeros(1, N);
dy_heun = zeros(1, N);
y_heun(1) = y0;
dy_heun(1) = dy0;

h_heun = h;  % Use consistent step size
for i = 1:N-1
    f1 = dy_heun(i);
    f2 = -0.6 * dy_heun(i) - 8 * y_heun(i);
    
    y1_pred = y_heun(i) + h_heun * f1;
    dy1_pred = dy_heun(i) + h_heun * f2;
    
    f1_pred = dy1_pred;
    f2_pred = -0.6 * dy1_pred - 8 * y1_pred;
    
    y_heun(i+1) = y_heun(i) + (h_heun/2)*(f1 + f1_pred);
    dy_heun(i+1) = dy_heun(i) + (h_heun/2)*(f2 + f2_pred);
end

%% Analytical Solution
x_dense = 0:0.01:5;
omega = sqrt(791)/10;
y_analytical = exp(-0.3 .* x_dense) .* (4 .* cos(omega .* x_dense) + (12 / sqrt(791)) .* sin(omega .* x_dense));

%% Plot All Results
figure;
plot(x, y_euler, '-o', 'LineWidth', 1.5); hold on;
plot(x, y_rk2, '-s', 'LineWidth', 1.5);
plot(x, y_rk4, '-^', 'LineWidth', 1.5);
plot(x, y_heun, '-d', 'LineWidth', 1.5);
plot(x_dense, y_analytical, '-k', 'LineWidth', 2); % Analytical curve in black

xlabel('x');
ylabel('y(x)');
title('Comparison of Numerical Methods for ODE: y'''' + 0.6y'' + 8y = 0');
legend('Euler (Taylor)', 'RK2', 'RK4', 'Heun (Predictor-Corrector)', 'Analytical', 'Location', 'best');
grid on;
axis([-1 6 -4 5]);
