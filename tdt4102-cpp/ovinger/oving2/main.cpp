//handout oving 2

#include "std_lib_facilities.h"
#include "AnimationWindow.h"


void inputAndPrintInteger() {
    // BEGIN: 1b
    std::cout << "Skriv inn et tall: \n";
    int input;
    cin >> input;

    std::cout << "Du skrev: " << input << "\n";
    // END: 1b
}

int inputInteger() {
    // BEGIN: 1c
    std::cout << "Skriv inn et tall: \n";
    int input;
    cin >> input;

    return input;
    // END: 1c
}

void printSumOfInputIntegers() {
    // BEGIN: 1d
    int num1 = inputInteger();
    int num2 = inputInteger();

    int sum = num1 + num2;
    std::cout << "Summen av tallene: " << sum << "\n";
    // END: 1d
}

bool isOdd(int n) {
    // BEGIN: 1f
    return n % 2 != 0;
    // END: 1f
}

void inputIntegersAndPrintSum() {
    // BEGIN: 2a
    int iterations = inputInteger();
    int sum = 0;
    for (int i = 0; i < iterations; i++)
    {
        sum += inputInteger();
    }
    
    std::cout << "Sum: " << sum << "\n";
    // END: 2a
}

void inputIntegersAndPrintSumUntilStopped() {
    // BEGIN: 2b
    int input;
    int sum = 0;
    do
    {
        input = inputInteger();
        sum += input;
    } while (input != 0);

    std::cout << "Sum: " << sum << "\n";
    
    // END: 2b
}

double inputDouble() {
    // BEGIN: 2d

    std::cout << "Skriv inn et tall: \n";
    double input;
    cin >> input;
    return input;

    // END: 2d
}

void convertNOKtoEUR() {
    // BEGIN: 2e
    bool validInput = false;

    do
    {
        double nok = inputDouble();
        
        if (nok < 0)
        {
            std::cout << "Ikke gyldig, skriv inn et positivt tall \n";
        } 
        else
        {
            validInput = true;
            
            double euro = nok / 10.5;

            std::cout << std::setprecision(2) << std::fixed;

            std::cout << euro << std::endl;
        }
    } while (!validInput);
    

    // END: 2e
}

void printMultiplicationTable() {
    // BEGIN: 2g
    int row = inputInteger();
    int col = inputInteger();

    for (int i = 0; i < row; i++)
    {
        for (int j = 0; j < col; j++)
        {
            std::cout << std::setw(5);
            std::cout << i + j;
        }
        std::cout << std::endl;
    }
    // END: 2g
}

double discriminant(double a, double b, double c) {
    // BEGIN: 3a
    return pow(b, 2) - 4 * a * c;
    // END: 3a
}

void printRealRoots(double a, double b, double c) {
    // BEGIN: 3b
    double disc = discriminant(a, b, c);
    double x_1;
    double x_2;

    if (disc == 0)
    {
        x_1 = (-b) / (2 * a);
        std::cout << x_1 << std::endl;
    }
    else if (disc > 0)
    {
        x_1 = (-b + sqrt(disc)) / (2 * a);
        x_2 = (-b - sqrt(disc)) / (2 * a);
        std::cout << x_1 << std::endl;
        std::cout << x_2 << std::endl;
    }

    // END: 3b
}

void solveQuadraticEquations() {
    // BEGIN: 3c
    double a = inputDouble();
    double b = inputDouble();
    double c = inputDouble();

    printRealRoots(a, b, c);
    // END: 3c
}

void pythagoras() {
    // BEGIN: 4a
    // Alle deloppgaver i 4 skal løses her
    AnimationWindow win{100, 100, 800, 800, "Pythagoras"};

    win.wait_for_close();
    int x = 400;
    int y = 400;

    Point point1{x, y};
    Point point2{x + 40, y};
    Point point3{x, y + 30};

    
    win.draw_triangle(point1, point2, point3, Color::red);

    win.draw_quad(point1, Point{x, y - 40}, Point{x + 40, y - 40}, point2, Color::blue);
    win.draw_quad(point2, Point{x + 40 + 30, y + 40}, Point{x + 30, y + 30 + 40}, point3, Color::green);
    win.draw_quad(point3, Point{x - 30, y + 30}, Point{x - 30, y}, point1, Color::yellow);
    // END: 4a
}

vector<int> calculateBalance(int amount, int rate, int years) {
    // BEGIN: 5a
    std::vector<int> saldo;
    for (int i = 0; i < years; i++)
    {
        double bruh = static_cast<double>(amount) * pow((1 + rate/100), i + 1);
        saldo.push_back(static_cast<int>(round(bruh)));
    }
    return saldo;
    // END: 5a
}

void printBalance(vector<int> balanceVec) {
    // BEGIN: 5b
    std::cout << std::setw(5);
    std::cout << "År";
    std::cout << std::setw(5);
    std::cout << "Saldo";

    for (int i = 0; i < balanceVec.size(); i++)
    {
        std::cout << std::setw(5);
        std::cout << i + 1;
        std::cout << std::setw(5);
        std::cout << balanceVec[i];
    }
    // END: 5b
}

int main() {
    // Oppgave 1a
    int input = 1;
    do 
    {
        std::cout 
            << "Velg funksjon: \n" 
            << "0) Avslutt \n"
            << "1) Summer to tall \n"
            << "2) Summer flere tall \n"
            << "3) Konverter NOK til EURO. \n"
            << "4) Løs annengradslikning. \n"
            << "Angi valg (0-4): "
            << std::endl;

        cin >> input;

        int yeahyeah;

        switch (input)
        {
            case 0:
                std::cout << "Avslutter programmet" << std::endl;
                break;

            case 1:
                printSumOfInputIntegers();
                break;

            case 2:
                inputIntegersAndPrintSumUntilStopped();
                break;

            case 3:
                convertNOKtoEUR();
                break;

            case 4: 
                solveQuadraticEquations();
                break;

            default:
                std::cout << "Ikke gyldig valg" << std::endl;
                break;
        }
    }
    while (input != 0);

    // Her kan du teste funksjonene dine ved hjelp av menysystem som beskrevet. 
    // NB: Denne delen av koden blir IKKE automatisk rettet.
    return 0;
}
