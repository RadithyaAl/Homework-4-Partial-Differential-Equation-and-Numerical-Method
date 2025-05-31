year = [1718, 1767, 1774, 1775, 1792, 1816, 1828, 1834, 1878, 1906];
efficiency = [0.5, 0.8, 1.4, 2.7, 4.5, 7.5, 12.0, 17.0, 17.2, 23.0];
type = ["Newcomen", "Smeaton", "smeaton", "Watt", "Watt", "Woolf compound", "Improved Cornish", "Improved Cornish", "Corliss compound", "Triple expansion"];

x = year;
y = efficiency;

n = length(x);

sum_x = sum(x);
sum_y = sum(y);
sum_xy = sum(x .* y); % this means multply each element x with each coresponding y.
sum_x2 = sum(x.^2);


a1 = (n * sum_xy - sum_x * sum_y) / (n * sum_x2 - sum_x^2);
a0 = mean(y) - a1 * mean(x);

disp(a0);
disp(a1);

% Create regression line for plotting
x_fit = linspace(min(x), max(x), 100);
y_linear = a0 + a1 * x_fit;

% quadratic
% quadratic regression can be done by completing matrix
% general form y = a0 + a1*x + a2*x^2 + error
% n*a0 + sum(x)*a1 + sum(x^2)*a2 = sum(y)
% sum(x)*a0 + sum(x^2)*a1 + sum(x^3)*a2 = sum(xy)
% sum(x^2)*a0 + sum(x^3)*a1 + sum(x^4)*a2 = sum(x^2 * y)


% add some necessary sum
sum_x3 = sum(x.^3);
sum_x4 = sum(x.^4);
sum_x2y = sum((x.^2) .* y);

% left hand side of the matrix
A = [n       sum_x    sum_x2;
     sum_x   sum_x2   sum_x3;
     sum_x2  sum_x3   sum_x4];

% right hand side of the equation
b = [sum_y; sum_xy; sum_x2y];

coeffs2 = A \ b;
a0_q = coeffs2(1);
a1_q = coeffs2(2);
a2_q = coeffs2(3);


y_quad = a0_q + a1_q * x_fit + a2_q * x_fit.^2;



% cubic regression

sum_x5 = sum(x.^5);
sum_x6 = sum(x.^6);
sum_x3y = sum((x.^3) .* y);

A3 = [n        sum_x    sum_x2   sum_x3;
      sum_x    sum_x2   sum_x3   sum_x4;
      sum_x2   sum_x3   sum_x4   sum_x5;
      sum_x3   sum_x4   sum_x5   sum_x6];

b3 = [sum_y; sum_xy; sum_x2y; sum_x3y];

coeffs3 = A3 \ b3;
a0_c = coeffs3(1);
a1_c = coeffs3(2);
a2_c = coeffs3(3);
a3_c = coeffs3(4);

% Cubic Fit
y_cubic = a0_c + a1_c * x_fit + a2_c * x_fit.^2 + a3_c * x_fit.^3;


%% --- Plot Em All ---
figure;
plot(x, y, 'g.', 'MarkerSize', 20); hold on;
plot(x_fit, y_linear, 'r-.', 'LineWidth', 2);    
plot(x_fit, y_quad, 'b--', 'LineWidth', 2);     
plot(x_fit, y_cubic, 'k-', 'LineWidth', 2);   

grid on;
xlabel('Year');
ylabel('Efficiency (%)');
title('Well');
legend('Data Points', 'Linear Fit', 'Quadratic Fit', 'Cubic Fit', 'Location', 'NorthWest');
hold off;



% standard deviation calculation


y_pred_linear = a0 + a1 * x;
y_pred_quad = a0_q + a1_q * x + a2_q * x.^2;
y_pred_cubic = a0_c + a1_c * x + a2_c * x.^2 + a3_c * x.^3;


residuals_linear = y - y_pred_linear;
residuals_quad = y - y_pred_quad;
residuals_cubic = y - y_pred_cubic;


n = length(x);
p_linear = 2; % y know
p_quad = 3;
p_cubic = 4;

% Standard deviation of residuals (standard error of estimate)
std_linear = sqrt(sum(residuals_linear.^2) / (n - p_linear));
std_quad = sqrt(sum(residuals_quad.^2) / (n - p_quad));
std_cubic = sqrt(sum(residuals_cubic.^2) / (n - p_cubic));

disp(std_linear)
disp(std_quad)
disp(std_cubic)
