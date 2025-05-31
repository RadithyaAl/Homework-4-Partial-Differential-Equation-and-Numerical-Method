x1 = [-250, -200, -100, 0, 100, 300]
y1 = [0.0163, 0.318, 0.699, 0.870, 0.941, 1.04]

# newton method


# df/dx = df/x2-x1
def first_derivative(x1,y1): # from x1[0] to x1[len(firstderivatives) - 1]
    firstderivatives = []
    for i in range(len(x1) - 1):
        derivative = (y1[i+1] - y1[i]) / (x1[i+1] - x1[i])
        firstderivatives.append(derivative)

    
    return firstderivatives

first_derivatives = first_derivative(x1,y1)
print(first_derivatives)


# dxnya adalah suku ke2-suku ke 0
def second_derivative (first_derivatives, x1):
    secondderivatives = []
    for i in range(len(first_derivatives) - 1):
        derivative = (first_derivatives[i+1]-first_derivatives[i]) / (x1[i+2] - x1[i]) 
        secondderivatives.append(derivative)
    return secondderivatives


second_derivatives = second_derivative(first_derivatives, x1)
print(second_derivatives)

def third_derivative(second_derivatives, x1):
    thirdderivatives = []
    for i in range(len(second_derivatives)-1):
        derivative = (second_derivatives[i+1]-second_derivatives[i]) / (x1[i+3] - x1[i])
        thirdderivatives.append(derivative)
    return thirdderivatives


third_derivatives = third_derivative(second_derivatives, x1)
print(third_derivatives)

def fourth_derivative(third_derivatives, x1):
    fourthderivatives = []
    for i in range(len(third_derivatives)-1):
        derivative = (third_derivatives[i+1]-third_derivatives[i]) / (x1[i+4] - x1[i])
        fourthderivatives.append(derivative)
    return fourthderivatives

fourth_derivatives = fourth_derivative(third_derivatives, x1)
print(fourth_derivatives)

def fifth_derivative(fourth_derivatives, x1):
    fifthderivatives = []
    for i in range(len(fourth_derivatives) - 1):
        derivative = (fourth_derivatives[i+1]-fourth_derivatives[i]) / (x1[i+5] - x1[i])
        fifthderivatives.append(derivative)
    return fifthderivatives

fifth_derivatives = fifth_derivative(fourth_derivatives, x1)
print(fifth_derivatives)

"""
okay. that we got all the five derivation, though its kind of useles if it's used for general purpose module wkwkwk
b0 must be f(0), which is the first data on the table
b1 is the 1st index of first_derivatives
b2 is the 1st index of second_derivatives
b3 is the 1st index of third_derivatives
and so on....
"""




