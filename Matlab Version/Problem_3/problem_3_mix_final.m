% Given data
x = [0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0];

Euler_method = [4, 4.0, -4.0, -17.6, -19.12, 15.016000000000009, 77.15120000000002, 90.61384000000001, -54.26471200000003, -336.9073784000001, -426.2278208800001];
RK2_method = [4, 0.0, -5.779999999999999, 1.4738999999999995, 7.9762555, -4.163730652499997, -10.4639378811125, 8.68489495254618, 12.905742025308287, -15.84063742288284, -14.609434683735353];
RK4_method = [4.0, 1.0366666666666666, -2.427559569444445, -1.5571059083153358, 1.153883433742514, 1.4810149819151406, -0.2934816741803563, -1.1319238485945702, -0.18528624936464821, 0.724147919109534, 0.37820603488114213];
Predictor_corrector = [4.0, NaN, -12.0, NaN, 20.32, NaN, 39.70560000000002, NaN, -543.047552, NaN, 2923.33987584];

% Calculate analytical solution
y_analytical = exp(-0.3 .* x) .* (4 .* cos(sqrt(791)/10 .* x) + (12 / sqrt(791)) .* sin(sqrt(791)/10 .* x));

% Plotting
figure;
plot(x, Euler_method, '-o', 'DisplayName', 'Euler Method');
hold on;
plot(x, RK2_method, '-s', 'DisplayName', 'RK2 Method');
plot(x, RK4_method, '-^', 'DisplayName', 'RK4 Method');

% For Predictor-Corrector: only plot valid (non-NaN) values
x_pc = x(~isnan(Predictor_corrector));
y_pc = Predictor_corrector(~isnan(Predictor_corrector));
plot(x_pc, y_pc, '-d', 'DisplayName', 'Predictor-Corrector');

% Analytical solution
plot(x, y_analytical, '-k', 'LineWidth', 1.5, 'DisplayName', 'Analytical');

% Labels and display
xlabel('x');
ylabel('y');
title('Comparison of Numerical Methods with Analytical Solution');
legend('Location', 'best');
grid on;
axis([-1 6 -600 3000]);  % Adjusted axis limits
