import numpy as np
import matplotlib.pyplot as plt

# funksjon for fart v(t)
def v(t):
    return 5 * (1 - np.exp((-1 / 2 ) * t) )

t_start = 0
t_stop = 15
steps = t_stop + 1

t_values = np.linspace(t_start, t_stop, steps)


v_values = np.zeros(len(t_values))

for i in range(len(t_values)):
    v_values[i] = v(i)

print(v_values)

