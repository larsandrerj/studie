import numpy as np
import matplotlib.pyplot as plt

def f(sigma, mu, x): 
    return ( 1 / ( np.sqrt(2 * np.pi) * sigma)) * np.exp( ( - (x - mu)**2 ) / (2 * (sigma ** 2)))

def main():
    data = np.genfromtxt('oppg0.csv', delimiter=',')

    data = data[:,1].astype(int)

    mu = np.mean(data)

    print(mu)

    sigma = np.std(data)

    print(sigma)

    N = np.size(data)

    print(N)

    x = np.linspace(np.min(data), np.max(data), 1000)

    y = N * f(sigma, mu, x)

    plt.plot(x, y)
    plt.grid()
    plt.show()
    



main()