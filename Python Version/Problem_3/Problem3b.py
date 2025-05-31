"""
Program to solve ODE of y'' + 0.6*y' + 8y = 0
Let y' = Y
Then y'' = -0.6 * Y - 8 * y
With initial conditions y(0) = 4, y'(0) = 0
"""

# Initial conditions
nonderivative = 4  # y
first_derivative = 0  # y'
h = 0.05  # here, its kind of weird if we set h = 0.5 however. for accuracu, set h to be smaller than 0.01
lower_limit = 0
upper_limit = 5
interval = round((upper_limit - lower_limit) / h)


absis = [lower_limit]
nonderivatives = [nonderivative]


def calculate_taylor(nonderivative, first_derivative):
    first_der_eq = -0.6 * first_derivative - 8 * nonderivative
    nonderivative = nonderivative + h * first_derivative
    first_derivative = first_derivative + first_der_eq * h
    return nonderivative, first_derivative

# Main loop
for i in range(interval):
    nonderivative, first_derivative = calculate_taylor(nonderivative, first_derivative)
    nonderivatives.append(nonderivative)
    absis.append(absis[-1] + h)

print("x:", absis)
print("y:", nonderivatives)



import matplotlib.pyplot as plt

plt.plot(absis, nonderivatives, marker='o')
plt.xlabel("x")
plt.ylabel("y")
plt.title("Euler Method for y'' + 0.6y' + 8y = 0")
plt.grid(True)
plt.show()
