import numpy as np
import matplotlib.pyplot as plt

# Set parameters
h = 0.01
x = np.arange(0, 5 + h, h)
N = len(x)

# Initialize y1 (y) and y2 (y') arrays
y1 = np.zeros(N)
y2 = np.zeros(N)

# Initial conditions
y1[0] = 4
y2[0] = 0

# System of ODEs:
# y1' = y2
# y2' = -0.6*y2 - 8*y1

for n in range(N - 1):
    # Evaluate derivatives at current step
    f1 = y2[n]
    f2 = -0.6 * y2[n] - 8 * y1[n]

    # Predictor step (Euler)
    y1_p = y1[n] + h * f1
    y2_p = y2[n] + h * f2

    # Evaluate derivatives at predicted point
    f1_p = y2_p
    f2_p = -0.6 * y2_p - 8 * y1_p

    # Corrector step (Heun)
    y1[n+1] = y1[n] + (h / 2) * (f1 + f1_p)
    y2[n+1] = y2[n] + (h / 2) * (f2 + f2_p)



# the results is in y1.
x_mod = [0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0]
y_mod = []
for i in range(len(x_mod)):
    if i % 2 != 0 :
        y_mod.append('nan')
    else: # trigger when i/2 == 0
        y_mod.append(y1[i//2]) # assign i = 0, 1, 2, 3, 4, 5 because y1 index is only up to 5
  

# Display results

print(x_mod)
print(y_mod)

# Plot the solution
plt.plot(x, y1, '-o', linewidth=2, markersize=6, label="Heun (h=1)")
plt.grid(True)
plt.xlabel("x")
plt.ylabel("y(x)")
plt.title("Solution of ODE using Predictor-Corrector Method (Heun)")
plt.legend(loc='best')
plt.show()
