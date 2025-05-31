import math

def the_function(x):
    Y = math.exp(-x) / x
    return Y

integration_range = [1, 100]
N = [10, 20, 40, 100, 1000]
trapezoidal_values = [0 for i in range(len(N))]

# trapezoidal rule
for i in range(len(N)):
    partition_width = (integration_range[1] - integration_range[0]) / N[i]
    integration_position = integration_range[0]
    total_area = 0
    area = 0
    for j in range(N[i]):
        # the equation is 0.5(b-a)(f(b) - f(a)) where b-a is partition width
        area = 0.5 * partition_width * (the_function(integration_position + partition_width) + the_function(integration_position))
        total_area += area 
        integration_position += partition_width
    trapezoidal_values[i] = total_area

# okay. i guess i have done with trapezoidal method. the results are in the trapezoidal_values arrays    
print(trapezoidal_values)


# simpson 1/3 rule
"""
simpson formula is I = partition_width * (f(x0) + 4f(x1) + f(x2)) / 6 where x1 is midway in partition width
"""

simpson13_value = [0 for i in range(len(N))]

for i in range(len(N)):
    partition_width = (integration_range[1] - integration_range[0]) / N[i]
    integration_position = integration_range[0]
    total_area = 0
    area = 0
    for j in range(N[i]):
        area = partition_width * (the_function(integration_position) + 4*the_function(integration_position + (partition_width/2)) + the_function(integration_position+ partition_width)) * (1/6)
        total_area += area
        integration_position += partition_width
    simpson13_value[i] = total_area



# okey the simpson is also done wkwkwkwkwk
print(simpson13_value)


"""
simpson 3/8 rule
"""
simpson38_value = [0 for i in range(len(N))]

for i in range(len(N)):
    partition_width = (integration_range[1] - integration_range[0]) / N[i]
    integration_position = integration_range[0]
    oneforth_width = 0.25 * partition_width
    threeforth_width = 0.75 * partition_width
    total_area = 0
    area = 0
    for j in range(N[i]):
        area = partition_width * (the_function(integration_position) + 3*the_function(integration_position + oneforth_width) + 3*the_function(integration_position+threeforth_width) + the_function(integration_position+ partition_width)) * (1/8)
        total_area += area
        integration_position += partition_width
    simpson38_value[i] = total_area


print(simpson38_value)



# well. is all done? time to convert it to matlab. please chatgpt. 

