x_val = 200;
y_lagrange = subs(y_lagrange, x_sym, x_val);
disp(double(y_lagrange));
y_newton = subs(y_newton, x_sym, x_val);
disp(double(y_newton))

x_val = 400;
y_lagrange = subs(y_lagrange, x_sym, x_val);
disp(double(y_lagrange));
y_newton = subs(y_newton, x_sym, x_val);
disp(double(y_newton))