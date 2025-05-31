# lagrange formula

x1 = [-250, -200, -100, 0, 100, 300]
y1 = [0.0163, 0.318, 0.699, 0.870, 0.941, 1.04]


denominators = []
for i in range(len(x1)):
    denominator = 1 
    for j in range(len(x1)):
        if i != j:
            denominator *= (x1[i] - x1[j])

    denominators.append(denominator)


print(denominators)
lagrange_coefficients = []

for i in range(len(denominators)):
    koef = y1[i] / denominators[i]
    lagrange_coefficients.append(koef)

print(lagrange_coefficients)








