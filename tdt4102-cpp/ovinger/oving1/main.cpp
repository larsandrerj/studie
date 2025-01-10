// Øving 1
// Oversettelse fra Python til C++
#include "std_lib_facilities.h"

int maxOfTwo(int a, int b)  
{
    // BEGIN: 2a
    if (a > b) 
    {
        cout << "A is greater than B" << endl;
        return a;
    } else 
    {
        cout << "B is greater than A" << endl;
        return b;
    }
    // END: 2a
}

int fibonacci(int n)
{
    // BEGIN: 2c
    int a = 0;
    int b = 1;
    cout << "Fibonacci numbers:" << endl;

    for (int i = 1; i < n + 1; i++)
    {
        cout << i << ", " << b << endl;
        int temp = b;
        b += a;
        a = temp;
    }

    cout << "----" << endl;
    return b;
    // END: 2c
}

int squareNumberSum(int number)
{
    // BEGIN: 2d
    int totalSum = 0;

    for (int i = 0; i < number + 1; i++)
    {
        totalSum += i * i;
        cout << i * i << endl;
    }

    cout << totalSum << endl;

    return totalSum;
    // END: 2d
}

void triangleNumbersBelow(int number)
{
    // BEGIN: 2e
    int acc = 1;
    int num = 2;

    cout << "Triangle numbers below " << number << ":" << "sep=" << endl;

    while (acc < number)
    {
        cout << acc << endl;
        acc += number;
        number += 1;
    }
    cout << acc << endl;

    // END: 2e
}

bool isPrime(int number)
{
    // BEGIN: 2f
    for (int i = 2; i < number; i++)
    {
        if (number % i == 0)
        {
            return false;
        }
    }
    return true;
    // END: 2f
}

void naivePrimeNumberSearch(int maxNumber)
{
    // BEGIN: 2g
    for (int i = 2; i < maxNumber; i++)
    {
        if (isPrime(i))
        {
            cout << i << " is a prime" << endl;
        }
    }
    // END: 2g 
}

void inputAndPrintNameAndAge(){
    // BEGIN: 2h
    string name = "";
    int age = 0;
    cout << "Skriv inn ett navn: " << endl;
    cin >> name;

    cout << "Skriv inn alderen til " << name << ": " << endl;
    cin >> age;

    cout << name << " er " << age << " år gammel." << endl;
    // END: 2h
}

int main()
{
    // BEGIN: 2b
    cout << "Oppgave a)" << endl;
    cout << maxOfTwo(5, 6) << endl;
    // END: 2b

	return 0;
}
