import numpy as np

def middle(f, a, b, n): 
    h = (b - a) / n
    sum = 0

    for i in range(n):
        sum += f(a + (i - 1)*h + h/2) * h 

    return sum

def trapes(f, a, b, n):
    h = (b - a) / n
    sum = 0

    for i in range(n):
        sum += ((f(a + (i - 1)*h) + f(a + i * h)) / 2) * h

    return sum

def normal_distribution(x):
    return np.exp(-(x**2) / 2) / np.sqrt(2 * np.pi)

def main():
    a = 0
    b = 1
    n = 10000000

    print(middle(normal_distribution, a, b, n))
    print(trapes(normal_distribution, a, b ,n))


main()






    