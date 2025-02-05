#include "mastermind.h"

// BEGIN: 4
//Oppgave 4a til 4j løses her forutenom 4e og 4f
//playMastermind(){}
void playMastermind()
{
    constexpr int size = 4;
    constexpr int letters = 6;
    constexpr int totalTries = 10;

    
    bool weGaming = true;

    while(weGaming)
    {
        string code = randomizeString(size, 'A' + (letters - 1), 'A');

        int tries = 0;
        while (tries <= totalTries)
        {
            string guess = readInputToString(size, 'A' + (letters - 1), 'A');

            int amountcAp = checkCharactersAndPosition(code, guess);
            int amountc = checkCharacters(code, guess);

            std::cout << "Riktige bokstaver: " << amountc << std::endl;
            std::cout << "Riktige bokstaver på riktig plass: " << amountcAp << std::endl;

            if (amountcAp == size)
            {
                std::cout << "du vant" << std::endl;
                tries = totalTries;
            } 
            else if (tries = totalTries)
            {
                std::cout << "gg" << std::endl;
            }
            else
            {
                tries++;
            }
        }

        std::cout << "ny runde? [Y/n]" << std::endl;

        string input;
        cin >> input;
        if (input == "n") weGaming = false;

    }


}
// END: 4

// BEGIN: 4e
///*returverdi*/ checkCharactersAndPosition(/*param 1: code, param 2: guess*/) {}
int checkCharactersAndPosition(string code, string guess)
{
    int amount = 0;
    for (int i = 0; i < code.length(); i++)
    {
        if (code[i] == guess[i]) amount++;
    }

    return amount;
}
// END: 4e

// BEGIN: 4f
///*returverdi*/ checkCharacters(/*param 1: code, param 2: guess*/) {}
int checkCharacters(string code, string guess)
{
    int amount = 0;
    for (char c : code)
    {
        amount += countChar(guess, c);
    }

    return amount;
}
// END: 4f
