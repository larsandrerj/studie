import numpy as np
import matplotlib.pyplot as plt



t=np.linspace(-2*np.pi,2*np.pi,3500)

x=np.zeros(3500)
for n in range(1,5):
    x=x+2*(-1)**(n+1)*np.sin(n*t)/n

plt.plot(t,x)
plt.savefig('sagtann-reell.png')
