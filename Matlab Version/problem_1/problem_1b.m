% original data
x1 = [-250, -200, -100, 0, 100, 300];
y1 = [0.0163, 0.318, 0.699, 0.870, 0.941, 1.04];

% import all the necessary data obtained from previous calculation
% derivatives from problem 1b computation using newton finite dirference
d1 = [0.006034, 0.0038099999999999996, 0.0017100000000000004, 0.0007099999999999995, 0.0004950000000000004];
d2 = [-1.4826666666666672e-05, -1.0499999999999998e-05, -5.000000000000005e-06, -7.166666666666635e-07];
d3 = [1.7306666666666695e-08, 1.833333333333331e-08, 1.0708333333333353e-08];
d4 = [2.9333333333331838e-12, -1.5249999999999912e-11];
d5 = -3.3060606060605626e-14;

% lagrange coefficients from problem 1a
lagrange_coeff = [-4.516017316017316e-14, 2.12e-12, -5.825e-12, 5.8e-12, -2.24047619047619e-12, 1.575757575757576e-13];

% lagrange polynomial calculation
n = length(x1);
syms x_sym
y_lagrange = 0; % <<< Initialize before use!

for i = 1:n
    % Build the numerator of the basis polynomial L_i(x)
    numerator = 1;
    for j = 1:n
        if i ~= j
            numerator = numerator * (x_sym - x1(j));
        end
    end
    % Add the term to the polynomial
    y_lagrange = y_lagrange + lagrange_coeff(i) * numerator;
end
disp(y_lagrange);

% newton polynomial calculation. please write the newton polynomial here
syms x_sym
x0 = x1(1);

% Define Newton coefficients
b0 = y1(1);
b1 = d1(1);
b2 = d2(1);
b3 = d3(1);
b4 = d4(1);
b5 = d5;

% Construct Newton Polynomial
term1 = b1 * (x_sym - x1(1));
term2 = b2 * (x_sym - x1(1)) * (x_sym - x1(2));
term3 = b3 * (x_sym - x1(1)) * (x_sym - x1(2)) * (x_sym - x1(3));
term4 = b4 * (x_sym - x1(1)) * (x_sym - x1(2)) * (x_sym - x1(3)) * (x_sym - x1(4));
term5 = b5 * (x_sym - x1(1)) * (x_sym - x1(2)) * (x_sym - x1(3)) * (x_sym - x1(4)) * (x_sym - x1(5));

% Final Newton Polynomial
y_newton = b0 + term1 + term2 + term3 + term4 + term5;
disp(y_newton)

% Convert symbolic expressions to functions
f_lagrange = matlabFunction(y_lagrange);
f_newton = matlabFunction(y_newton);

% Generate smooth x values
x_vals = linspace(min(x1), max(x1), 1000);
y_lag_vals = f_lagrange(x_vals);
y_new_vals = f_newton(x_vals);

% --- Plotting ---
figure;
plot(x1, y1, 'ko', 'MarkerFaceColor', 'k', 'DisplayName', 'Original Data');
hold on;
plot(x_vals, y_lag_vals, 'r-', 'LineWidth', 2, 'DisplayName', 'Lagrange Polynomial');
plot(x_vals, y_new_vals, 'b--', 'LineWidth', 2, 'DisplayName', 'Newton Polynomial');
xlabel('x');
ylabel('f(x)');
title('Interpolation Comparison');
legend('Location', 'best');
grid on;