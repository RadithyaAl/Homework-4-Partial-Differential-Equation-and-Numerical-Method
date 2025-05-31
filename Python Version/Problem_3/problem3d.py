import numpy as np
import matplotlib.pyplot as plt

# System of ODEs
def f1(x, y1, y2):
    return y2

def f2(x, y1, y2):
    return -0.6 * y2 - 8 * y1

# Initial conditions
x0 = 0
y1_0 = 4
y2_0 = 0
h = 0.05
x_end = 5

# Prepare arrays
N = int((x_end - x0) / h) + 1
x_values = np.linspace(x0, x_end, N)
y1_values = np.zeros(N)
y2_values = np.zeros(N)

# Set initial values
y1_values[0] = y1_0
y2_values[0] = y2_0

# Runge-Kutta 4th order loop
for i in range(N - 1):
    x = x_values[i]
    y1 = y1_values[i]
    y2 = y2_values[i]

    # Compute RK4 coefficients
    k1_1 = h * f1(x, y1, y2)
    k1_2 = h * f2(x, y1, y2)

    k2_1 = h * f1(x + h/2, y1 + k1_1/2, y2 + k1_2/2)
    k2_2 = h * f2(x + h/2, y1 + k1_1/2, y2 + k1_2/2)

    k3_1 = h * f1(x + h/2, y1 + k2_1/2, y2 + k2_2/2)
    k3_2 = h * f2(x + h/2, y1 + k2_1/2, y2 + k2_2/2)

    k4_1 = h * f1(x + h, y1 + k3_1, y2 + k3_2)
    k4_2 = h * f2(x + h, y1 + k3_1, y2 + k3_2)

    # Update solutions
    y1_values[i+1] = y1 + (k1_1 + 2*k2_1 + 2*k3_1 + k4_1) / 6
    y2_values[i+1] = y2 + (k1_2 + 2*k2_2 + 2*k3_2 + k4_2) / 6

xs = x_values.tolist()
ys = y1_values.tolist()

print(xs)
print(ys)

# Plotting
plt.plot(x_values, y1_values, label='y(x)')
# plt.plot(x_values, y2_values, label="y'(x)")
plt.xlabel('x')
plt.ylabel('Solution')
plt.title('Solution of ODE using RK4')
plt.legend()
plt.grid(True)
plt.show()
