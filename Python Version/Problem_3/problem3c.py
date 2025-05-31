# Define the system of equations in terms of x
def f1(x, y1, y2):
    return y2

def f2(x, y1, y2):
    return -0.6 * y2 - 8 * y1

# Initial conditions
x0 = 0
y1 = 4      # y(0)
y2 = 0      # y'(0)
h = 0.05
x_end = 5

# Storage for results
x_values = [x0]
y1_values = [y1]
y2_values = [y2]

# Number of steps
n_steps = int((x_end - x0) / h)

# Runge-Kutta 2nd Order Method
for i in range(n_steps):
    x = x_values[-1]
    
    # k1 values
    k1_1 = h * f1(x, y1, y2)
    k1_2 = h * f2(x, y1, y2)

    # k2 values (midpoint)
    k2_1 = h * f1(x + h/2, y1 + k1_1/2, y2 + k1_2/2)
    k2_2 = h * f2(x + h/2, y1 + k1_1/2, y2 + k1_2/2)

    # Update y1 and y2
    y1 = y1 + k2_1
    y2 = y2 + k2_2
    x = x + h

    # Store the values
    x_values.append(x)
    y1_values.append(y1)
    y2_values.append(y2)

print(x_values)
print(y1_values)

import matplotlib.pyplot as plt

plt.plot(x_values, y1_values, marker='o')
plt.xlabel("x")
plt.ylabel("y")
plt.grid(True)
plt.show()